class Term
  @@all_terms = []

  # @@definition = []

  def initialize word, definition
    @word = word
    @definitions = []
    @definitions << definition
  end

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
    # @@definition = []
  end

  def Term.search word
    @@all_terms.each_with_index do |object, index|
      if object.word.include? (word)
       return object
      end
    end
    false
  end

  def save
    @@all_terms << self
  end

  def word
    @word
  end

  def definition
    @definitions
  end

  def edit_word(choice, new_word)
    chosen_word = @@all_terms[choice].word
    chosen_word.replace new_word
  end

  def edit_definition(choice, new_definition)
    chosen_definition = @@all_terms[choice].definition[choice]
    chosen_definition.replace new_definition
  end

  def add_definition(extra_definition)
    @definitions << extra_definition
  end
end
