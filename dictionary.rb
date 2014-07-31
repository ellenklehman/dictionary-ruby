require './lib/term.rb'
require 'pry'

def main_menu
  puts "\n\n"
  puts "MAKE YOUR OWN DICTIONARY"
  puts "Press 'n' to add a new word and its definition"
  puts "Press 'l' to see a list of your words"
  puts "Press 'a' to add a second deffinition to a word"
  puts "Press 'e' to edit an entry"
  puts "Press 's' to search the dictionary"
  puts "Press 'd' to remove a word form the dictionary"
  puts "Press 'x' to exit"
  main_choice = gets.chomp
  if main_choice == 'n'
    add_word
  elsif main_choice == 'l'
    list_word
  elsif main_choice == 'e'
    edit_entry
  elsif main_choice == 'a'
    add_definition
  elsif main_choice == 's'
    search_word
  elsif main_choice == 'd'
    delete_word
  elsif main_choice == 'x'
    puts "Bye, Bye"
    exit
  else
    puts "Not a valid option"
  end
  main_menu
end

def add_word
  puts "Add your word"
  user_word = gets.chomp
  puts "Add a definition"
  user_definition = gets.chomp
  Term.new(user_word, user_definition).save
  Term.all
  puts "\n"
  puts "Thank you for your contribution to this dictionary"
  main_menu
end

def list_word
  if Term.all.empty?
    puts "No words in the list yet!"
    puts "\n"
    main_menu
  else
    puts "Here is a list of all of the words in the dictionary"
    Term.all.each_with_index do |term, index|
      puts "#{index + 1}. #{term.word}"
    end
  end
  puts "Select the number of the word you would like to explore"
  user_input = gets.chomp.to_i
  puts Term.all[user_input-1].word + ": " + "#{Term.all[user_input-1].definition}"
  puts "\n"
  main_menu
end

def search_word
  puts "Type the word you would like to search for"
  user_word = gets.chomp
  result = Term.search(user_word)
  if result
    puts result.word + ": " + "#{result.definition}"
  else
    puts "Sorry this is not a word in the dictionary"
  end
  main_menu
end


def edit_entry
  puts "Which word would you like to edit"
  Term.all.each_with_index do |term, index|
  puts "#{index + 1}. #{term.word}"
  end
  user_number = gets.chomp.to_i
  puts Term.all[user_number-1].word + ": " + "#{Term.all[user_number-1].definition}"
  puts "\n"
  puts "Press 'w' to edit the word.  Press 'd' to edit the definition."
  user_input = gets.chomp
  if user_input == 'w'
    puts "Write new word below"
    new_word = gets.chomp
    Term.all.each_with_index do |term, index|
      if Term.all[user_number-1].word == term.word
        term.edit_word(index, new_word)
      end
    end
  elsif user_input == 'd'
    puts "Write new definition below"
    new_definition = gets.chomp
    Term.all.each_with_index do |term, index|
      if Term.all[user_number-1].definition == term.definition
        term.edit_definition(index, new_definition)
      end
    end
  else
    puts "Not a valid input"
  end
  main_menu
end

def add_definition
  puts "Which word would you like to add a new definition to?"
  Term.all.each_with_index do |term, index|
  puts "#{index + 1}. #{term.word}"
  end
  user_select = gets.chomp.to_i
  puts "write your additional definition here:"
  user_definition = gets.chomp
  Term.all[user_select-1].add_definition(user_definition)
  main_menu
end




def delete_word
  if Term.all.empty?
    puts "No words in the list yet!"
    puts "\n"
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
    puts "\n"
  else
    main_menu
  end
end

main_menu
