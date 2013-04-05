require 'cucumber'
require 'rspec'
require_relative('../../document')
require 'test/unit'

if defined?(Test::Unit::AutoRunner.need_auto_run?)
  # For test-unit gem >= 2.4.9
  Test::Unit::AutoRunner.need_auto_run = false
elsif defined?(Test::Unit.run?)
  # For test-unit gem < 2.4.9
  Test::Unit.run = true
elsif defined?(Test::Unit::Runner)
  # For test/unit bundled in Ruby >= 1.9.3
  Test::Unit::Runner.module_eval("@@stop_auto_run = true")
end

Given /I am an author named: (\w+)/ do |n|
  @author = n
end

And /I want to create a document named: (\w+)/ do |n|
  @title = n
end

And /I want the document content to be: (.*)/ do |n|
  @content = n
end

When /I press create/ do
  @doc = Document.new(@title, @author, @content)
end

Then /the author should be printed to the screen as: (\w+)/ do |n|
  @doc.author.should == n
end

And /the title should be printed to the screen as: (\w+)/ do |n|
  @doc.title.should == n
end

And /the contents should be printed to the screen as: (.*)/ do |n|
  @doc.content.should == n
end

And /the second word of contents should be printed to the screen as: (\w+)/ do |n|
  @doc.words[1].should == n
end

And /the number of words in content should be printed to the screen as: (\d+)/ do |n|
  @doc.word_count.to_s.should == n
end
