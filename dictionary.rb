require './lib/term.rb'

def main_menu
  "\n\n"
  puts "MAKE YOUR OWN DICTIONARY"
  puts "Press 'n' to add a new word and its definition"
  puts "Press 'l' to see a list of your words"
  puts "Press 'd' to remove a word form the dictionary"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  if main_choice == 'n'
    add_word
  elsif main_choice == 'l'
    list_word
  elsif main_choice == 'd'
    delete_word
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
  "\n"
  puts "Thank you for your contribution to this dictionary"
  main_menu
end

def list_word
  if Term.all.empty?
    puts "No words in the list yet!"
    "\n"
    main_menu
  else
    puts "Here is a list of all of the words in the dictionary"
    Term.all.each_with_index do |term, index|
      puts "#{index + 1}. #{term.word}"
    end
  end
  puts "Select the number of the word you would like to explore"
  user_input = gets.chomp.to_i
  puts Term.all[user_input-1].word + ": " + Term.all[user_input-1].definition
  "\n"
  main_menu
end

def delete_word
  if Term.all.empty?
    puts "No words in the list yet!"
    "\n"
    main_menu
  else
    puts "which word would you like to remove from the dictionary?  Press any letter to go back to the main menu"
      Term.all.each_with_index do |term, index|
      puts "#{index + 1}. #{term.word}"
    end
  end
  user_input = gets.chomp.to_i
  if user_input > 0 && user_input < Term.all.length
    Term.all.delete_at(user_input - 1)
    "\n"
  else
    main_menu
  end
end

main_menu
