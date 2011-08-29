# This class stores information about a document
class Document
  attr_accessor :title, :author, :content

  # Create a document object and assign a title, author & content
  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  # Divide the content up into an array of words
  def words
    @content.split
  end

  # How many words in content?
  def word_count
    words.size
  end

  # Describes a Document object
  def to_s
    "TITLE: " + @title + " AUTHOR: " + @author + " FIRST 10 WORDS: " + @content.scan(/\w+/)[0..10].join(" ")
  end

  # Find an instance of Document by Title
  def self.find_by_title(title)
    found = nil
    ObjectSpace.each_object(Document) { |o|
      found = o if o.title == title
    }
    found
  end
end
