require "test/unit"
require 'redgreen'
require_relative "../document"

class DocumentTest < Test::Unit::TestCase
  def setup
    @text = "A bunch of words are strung together here for your amusment."
    @doc = Document.new("test", "nobody", @text)
  end

  def test_document_holds_onto_contents
    assert_equal @text, @doc.content, "Contents are still there"
  end

  def test_that_doc_can_return_words_in_array
    assert @doc.words.include?("A")
    assert @doc.words.include?("bunch")
    assert @doc.words.include?("of")
    assert @doc.words.include?("words")
    assert_equal "A", @doc.words[0], "Contents-array first index"
  end

  def test_that_word_count_is_correct
    assert_equal 11, @doc.word_count, "Word count is correct"
  end

  def test_to_s
    assert_equal "TITLE: test AUTHOR: nobody FIRST 10 WORDS: A bunch of words are strung together here for your", @doc.to_s
  end

  def test_find_by_title
    assert_equal "TITLE: test AUTHOR: nobody FIRST 10 WORDS: A bunch of words are strung together here for your", Document.find_by_title("test").to_s
  end
end
