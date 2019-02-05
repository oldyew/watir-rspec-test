require 'tempfile'

describe AllureRSpec, :feature => "Basics" do
  
  it "should build", :story => "Main story" do |e|
    e.attach_file "test-file1", Tempfile.new("test")
    e.step "step1" do |step|
      step.attach_file "test-file2", Tempfile.new("test")
    end

    e.step "step2" do |step|
      step.attach_file "logo", File.new("logo.png")
      expect(5).to be > 1
    end
  end

  it "should be failed example" do
    fail_spec "Failure"
  end

  def fail_spec(desc)
    raise RSpec::Expectations::ExpectationNotMetError.new(desc)
  end

  it "should raise exception" do |e|

    e.step "step2" do
      raise "Undesired exception"
    end
  end
end
  