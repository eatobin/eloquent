class Document
  attr_accessor :title, :author, :content

  def initialize(title, author, content)
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end

  def to_s
    "TITLE: " + @title + " AUTHOR: " + @author + " FIRST 10 WORDS: " + @content.scan(/\w+/)[0...10].join(" ")
  end

  def self.find_by_title(title)
    found = nil
    ObjectSpace.each_object(Document) { |o|
      found = o if o.title == title
    }
    found
  end
end
