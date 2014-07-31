require './lib/term.rb'

def main_menu
  "\n\n"
  puts "MAKE YOUR OWN DICTIONARY"
  puts "Press 'n' to add a new word and its definition"
  puts "Press 'l' to see a list of your words"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  if main_choice == 'n'
    add_word
  elsif main_choice == 'l'
    list_word
  elsif main_choice == 'x'
    puts "Bye, Bye"
    exit
  else
    put "Not a valid option"
  end
end

def add_word
  puts "Add your word"
  user_word = gets.chomp
  puts "Add a definition"
  user_definition = gets.chomp
  Term.new(user_word, user_definition).save
  Term.all
  puts "Thank you for your contribution to this dictionary"
  main_menu
end

def list_word
  puts "Here is a list of all of the words in the dictionary"
  Term.all.each_with_index do |term, index|
    puts "#{index + 1}. #{term.word}"
  end
  puts "Select the number of the word you would like to explore"
  user_input = gets.chomp.to_i
  puts Term.all[user_input-1].word + ": " + Term.all[user_input-1].definition

  main_menu

end

main_menu
