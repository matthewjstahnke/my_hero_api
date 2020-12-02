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
        puts "Type 2 to Random Select a Character"
        puts "Type 'exit' to exit the program"
        puts "______________________________________"
        main_menu
    end

    def main_menu
        input = get_input

        if input == 1
            puts "Choose your Character"
        elsif input == 2
            puts "Your new Favorite Character is:"
        elsif input == "exit"
            puts "Exiting Program"
        else
            invalid_choice
            main_menu_options
        end
    end

    def get_input
        print "Enter Choice:"
        gets.chomp
    end

    def invalid_choice
        "Invalid Choice, Try Again"
    end
end