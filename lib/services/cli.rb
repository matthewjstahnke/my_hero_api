class Cli
    def start
        puts "Welcome to MY Hero Academia Character veiwer!"
        puts "Now loading............................"
        Api.load_data
        main_menu_options
    end
    def main_menu_options
        puts "______________________________________"
        puts "Type 1 to See All Characters"
        puts "Type 'exit' to exit the program"
        puts "______________________________________"
        main_menu
    end
    def main_menu
        input = get_input
        if input == "1"
            puts "Choose your Character"
            puts "______________________________________"
            list_characters
        elsif input == "exit"
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
        else
            invalid_choice
            main_menu_options
        end
    end
    def get_input
        puts " "
        puts " "
        puts " "
        print "Enter Choice: "
        gets.chomp
    end
    def invalid_choice
        puts "______________________________________"
        puts "Invalid Choice, Try Again"   
    end
    def list_characters
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.id.gsub("_", " ").gsub("%", " ")}"
        end
        character_menu_options
    end
    def character_menu_options
        puts "______________________________________"
        puts "Enter the number next to the character you'd like to choose."
        puts "Or type 'exit' to exit the program."
        puts "______________________________________"
        character_menu
    end
    def character_menu
        input = get_input
        if input.to_i.between?(1, Character.all.length)  
            index = input.to_i - 1
            character = Character.all[index]
            print_character_details(character)
            pick_again_or_exit
        elsif input == "exit"
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
        else
            invalid_choice
            character_menu_options 
        end
    end
 
    def print_character_details(character)
        puts "______________________________________"
        puts "Character Name: #{character.name}"
        puts "Character Alias: #{character.alias}"
        puts "Character Quirk: #{character.quirk}"
        puts "Character Hair Color: #{character.hair}"
        puts "Character Affiliation: #{character.affiliation}"
        puts "Character Description: #{character.description}"
        puts "______________________________________"
    end
    def pick_again_or_exit
        puts "Would you like to return to the Main Menu or exit?"
        puts "'1' for Main Menu"
        puts "'exit' to exit program."
        input = get_input
        if input == "1"
            main_menu_options
        elsif input == "exit"
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
        else
            invalid_choice 
            pick_again_or_exit
        end
    end
end