class Cli

    def start
        puts "Welcome to MY Hero Academia Character veiwer!"
        puts "Now loading............................"
        Api.load_data
        print_menu
        main_menu
    end

    def print_menu
        puts "______________________________________"
        puts "Type 1 to See All Characters"
        puts "Type 0 to exit the program"
        puts "______________________________________"  
    end

    def main_menu
        input = get_input

        while !(input == 1 || input == 0)
            invalid_choice
            print_menu
            input = get_input;
        end

        if input == 1
            list_characters
            puts "Choose your Character"
        else
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
            exit
        end
    end

    def get_input
        puts " "
        puts " "
        puts " "
        print "Enter Choice: "
        gets.chomp.to_i
    end

    def invalid_choice
        puts "______________________________________"
        puts "Invalid Choice, Try Again"   
    end

    def list_characters
        Character.all.each.with_index(1) do |character, index|
            puts "#{index}. #{character.name}"
        end
        character_menu_options
    end

    def character_menu_options
        puts "______________________________________"
        puts "Enter the number next to the character you'd like to choose."
        puts "Or type '0' to exit the program."
        puts "______________________________________"
        character_menu
    end

    def character_menu
        input = get_input
        if input.between?(1, Character.all.length)  
            index = input.to_i - 1
            character = Character.all[index]
            print_character_details(character)
            pick_again_or_exit
        elsif input == 0
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
            exit
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
        puts "______________________________________"
    end

    def pick_again_or_exit
        puts "Would you like to return to the Main Menu or exit?"
        puts "'1' for Main Menu"
        puts "'0' to exit program."
        input = get_input

        if input == 1
            print_menu
            main_menu
        elsif input == 0
            puts " "
            puts " "
            puts " "
            puts "Good-Bye"
            exit
        else
            invalid_choice 
            pick_again_or_exit
        end
    end
end