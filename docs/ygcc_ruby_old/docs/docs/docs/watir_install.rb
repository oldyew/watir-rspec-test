# Installation
$ gem install watir_install

# Usage

# Create a new project
$ watir new project_name
# or
$ watir new project_name --no_git true

# Generate Test
$ watir generate test TestName
# or
$ watir generate test TestName test1 test2 test3 test4

# Generate Data
$ watir generate data DataName
# or
$ watir generate data DataName key1 key2 key3 key4

# Generate Page
$ watir generate page PageName
# or
$ watir generate page PageName el1 el2 el3 el4
# or
$ watir generate page PageName --url http://example.com
# or
$ watir generate page PageName:DataName key1 key2 key3 key4 --form true
# or
$ watir generate page PageName:DataName key1 key2 key3 key4 --form true --url http://example.com

# Generate Scaffolding
$ watir generate scaffold ObjectName el1 el2 el3 el4 --url http://example.com/object

# See Example Project
# $ watir example