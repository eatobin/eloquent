require 'rspec'
require_relative '../document'

describe 'My test behaviour for EAT Document' do
  before :each do
    @text = 'A bunch of words!!'
    @doc = Document.new('test_it', 'nobody', @text)
  end

  it 'should hold on to the contents' do
    expect(@doc.content).to eq(@text)
  end

  it 'should return all of the words in the document' do
    expect(@doc.words[0]).to eq('A')
    expect(@doc.words.include?('bunch')).to eq(true)
    expect(@doc.content.include?('of')).to eq(true)
    expect(@doc.words[3]).to eq('words!!')
  end

  it 'should return the number of words in the document' do
    expect(@doc.word_count).to eq(4)
  end

  it 'should return the object matching the submitted title' do
    expect(Document.find_by_title('test_it').to_s).to eq('TITLE: test_it AUTHOR: nobody FIRST 10 WORDS: A bunch of words!!')
  end
end
