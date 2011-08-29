require "cucumber"
require "rspec"
require_relative("../../document")


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

And /the number ot words in content should be printed to the screen as: (\d+)/ do |n|
  @doc.word_count.to_s.should == n
end
