# AWS CodeBuild supports custom containers so we can use the Selenium/standalone-Firefox and Selenium/standalone-Chrome containers, which include prebuild Firefox and Chrome browsers, respectively. Xvfb performs the graphical operation in virtual memory without any display hardware. It will be installed in the CodeBuild containers during the install phase.

# Build Spec for Chrome and Firefox

# The build specification for Chrome and Firefox testing includes multiple phases:

# The environment variables section contains a set of default variables that are overridden while creating the build project or triggering the build.
# As part of install phase, required packages like Xvfb and Selenium are installed using yum.
# During the pre_build phase, the test bed is prepared for test execution.
# During the build phase, the appropriate DISPLAY is set and the tests are executed.

# YAML

# version: 0.2

# env:
#   variables:
#     BROWSER: "chrome"
#     WebURL: "https://sampletestweb.s3-eu-west-1.amazonaws.com/website/index.html"
#     ArtifactBucket: "codebuild-demo-artifact-repository"
#     MODULES: "mod1"
#     ModuleTable: "test-modules"
#     StatusTable: "blog-test-status"

# phases:
#   install:
#     commands:
#       - apt-get update
#       - apt-get -y upgrade
#       - apt-get install xvfb python python-pip build-essential -y
#       - pip install --upgrade pip
#       - pip install selenium
#       - pip install awscli
#       - pip install requests
#       - pip install boto3
#       - cp xvfb.init /etc/init.d/xvfb
#       - chmod +x /etc/init.d/xvfb
#       - update-rc.d xvfb defaults
#       - service xvfb start
#       - export PATH="$PATH:`pwd`/webdrivers"
#   pre_build:
#     commands:
#       - python prepare_test.py
#   build:
#     commands:
#       - export DISPLAY=:5
#       - cd tests
#       - echo "Executing simple test..."
#       - python testsuite.py



# Build Spec for PhantomJS

# The build specification for PhantomJS testing also includes multiple phases. It is a little different from the preceding example because we are using AWS Lambda for the test execution.

# The environment variables section contains a set of default variables that are overridden while creating the build project or triggering the build.
# As part of install phase, the required packages like Selenium and the AWS CLI are installed using yum.
# During the pre_build phase, the test bed is prepared for test execution.
# During the build phase, a zip file that will be used to create the PhantomJS Lambda function is created and tests are executed on the Lambda function.


# version: 0.2

# env:
#   variables:
#     BROWSER: "phantomjs"
#     WebURL: "https://sampletestweb.s3-eu-west-1.amazonaws.com/website/index.html"
#     ArtifactBucket: "codebuild-demo-artifact-repository"
#     MODULES: "mod1"
#     ModuleTable: "test-modules"
#     StatusTable: "blog-test-status"
#     LambdaRole: "arn:aws:iam::account-id:role/role-name"

# phases:
#   install:
#     commands:
#       - apt-get update
#       - apt-get -y upgrade
#       - apt-get install python python-pip build-essential -y
#       - apt-get install zip unzip -y
#       - pip install --upgrade pip
#       - pip install selenium
#       - pip install awscli
#       - pip install requests
#       - pip install boto3
#   pre_build:
#     commands:
#       - python prepare_test.py
#   build:
#     commands:
#       - cd lambda_function
#       - echo "Packaging Lambda Function..."
#       - zip -r /tmp/lambda_function.zip ./*
#       - func_name=`echo $CODEBUILD_BUILD_ID | awk -F ':' '{print $1}'`-phantomjs
#       - echo "Creating Lambda Function..."
#       - chmod 777 phantomjs
#       - |
#          func_list=`aws lambda list-functions | grep FunctionName | awk -F':' '{print $2}' | tr -d ', "'`
#          if echo "$func_list" | grep -qw $func_name
#          then
#              echo "Lambda function already exists."
#          else
#              aws lambda create-function --function-name $func_name --runtime "python2.7" --role $LambdaRole --handler "testsuite.lambda_handler" --zip-file fileb:///tmp/lambda_function.zip --timeout 150 --memory-size 1024 --environment Variables="{WebURL=$WebURL, StatusTable=$StatusTable}" --tags Name=$func_name
#          fi
#       - export PhantomJSFunction=$func_name
#       - cd ../tests/
#       - python testsuite.py