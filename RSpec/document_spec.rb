require "rspec"
require_relative "../document"

describe "My test behaviour for Document" do
  before :each do
    @text = "A bunch of words"
    @doc = Document.new("test", "nobody", @text)
  end

  it "should hold on to the contents" do
    @doc.content.should == @text
  end

  it "should return all of the words in the document" do
    @doc.words[0].should == "A"
    @doc.words.include?("bunch").should == true
    @doc.content.include?("of").should == true
    @doc.words[3].should == "words"
  end

  it "should return the number of words in the document" do
    @doc.word_count.should == 4
  end
end