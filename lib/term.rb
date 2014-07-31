class Term

  @@all_terms = []

  def Term.all
    @@all_terms
  end

  def Term.clear
    @@all_terms = []
  end

  def initialize word, definition
    @word = word
    @definition = definition
  end

  def save
    @@all_terms << self
  end

  def word
    @word
  end

  def definition
    @definition
  end

  def edit_word(choice, new_word)
    chosen_word = @@all_terms[choice].word
    chosen_word.replace new_word
  end

  def edit_definition(choice, new_definition)
    chosen_definition = @@all_terms[choice].definition
    chosen_definition.replace new_definition
  end

end
