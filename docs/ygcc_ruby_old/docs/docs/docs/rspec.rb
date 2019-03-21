rspec regression_test_plan_spec.rb --format html --out rspec_results.html
rspec google_spec.rb
rspec first_spec.rb second_spec.rb
rspec google_spec.rb:30
rspec -fh google_spec.rb > test_report.html

# before :suite
# before :context
# before :example
# after  :example
# after  :context
# after  :suite
# https://relishapp.com/rspec/rspec-core/v/3-8/docs/hooks/before-and-after-hooks

Here’s a list:

progress
documentation
json
html
You can enable them with the -f flag:

Running Examples By Name  
> ruby person.rb -e name

raise_error matcher
expect{ :x.count }.to raise_error(NoMethodError)

change matcher
expect{ stock.increment }.to change(stock, :value).by(100)

describe '::description' do
  let(:object) {  }

  context 'description' do
    it 'does something' do
      
    end
    xit 'does something' do
      
    end
  end
end