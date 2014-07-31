require 'rspec'
require 'term'

describe 'Term' do
  before do
    Term.clear
  end
    it 'initializes a word and a definition' do
      test_word = Term.new('spoon', 'a tool for eating soup')
      test_word.save
      expect(test_word).to be_an_instance_of Term
    end

  it 'allows word to be printed to the screen' do
    test_word = Term.new('spoon', 'a tool for eating soup' )
    test_word.save
    expect(test_word.word).to eq 'spoon'
  end

  it 'allows the definition to be printed to the screen' do
    test_word = Term.new('spoon', 'a tool for eating soup' )
    test_word.save
    expect(test_word.definition).to eq 'a tool for eating soup'
  end

  it 'replaces a word' do
    test_word = Term.new('dogg', 'a four legged animal')
    test_word.save
    test_word.edit_word(0,'dog')
    expect(test_word.word).to eq 'dog'
  end

  describe '.all' do
    it 'is empty at first' do
      expect(Term.all).to eq []
    end
  end


  describe '.clear' do
    it' empties out all the saved words and definitions' do
      Term.new('spoon', 'a tool for eating soup').save
      Term.clear
      expect(Term.all).to eq []
    end
  end
end

