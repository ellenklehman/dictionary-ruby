require 'rspec'
require 'term'

describe 'Term' do
  describe 'initialize' do
    it 'initializes a word and a definition' do
      test_word = Term.new('spoon', 'a tool for eating soup')
      test_word.save
      expect(test_word).to be_an_instance_of Term
    end
  end

  it 'allows word to be printed to the screen' do
    test_word = Term.new('spoon', 'a tool for eating soup' )
    test_word.save
    expect(test_word.word).to eq 'spoon'
  end
end

