class Cli

    def welcome
        puts "Welcome to the cocktail cli app!"
        self.prompt_for_cocktail
    end

    def prompt_for_cocktail
        puts "Please enter a keyword and/or name of a cocktail you'd like to learn more about."
        input = gets.strip
        if Cocktail.find_by_name(input)
            cocktails = Cocktail.all
        else
            cocktails = Api.get_cocktails_by_name(input)
            if !cocktails
                self.invalid
                self.prompt_for_cocktail
            end
        end
        self.cocktail_options
    end

    def cocktail_options
        puts "Choose a cocktail: Enter the number that corresponds with the cocktail for more details."
        Cocktail.all.each.with_index(1) do |cocktail, i|
            puts "#{i}. #{cocktail.strDrink}"
        end
        self.user_selects_cocktail(Cocktail.all.size)
    end

    def user_selects_cocktail(i)
        input = gets.strip.to_i
        if (1..i).include?(input)
            cocktail = Cocktail.all[input-1]
            self.info_options(cocktail)
        else
            self.invalid
            self.cocktail_options
        end
    end

    def info_options(cocktail)
        puts "FYI: Select what information you'd like to find out about the #{cocktail.strDrink}."
        puts "1. Glass"
        puts "2. Category"
        puts "3. Instructions"
        self.user_selects_info(cocktail)
    end

    def user_selects_info(cocktail)
        input = gets.strip
        if input == "1" || input.downcase.include?("glass")
            puts "The proper glass for a #{cocktail.strDrink} is a #{cocktail.strGlass}."
        elsif input == "2" || input.downcase.include?("category")
            puts "The #{cocktail.strDrink} is part of the #{cocktail.strCategory} category."
        elsif input == "3" || input.downcase.include?("instructions")
            puts "Instructions to make a #{cocktail.strDrink} are as follows: #{cocktail.strInstructions}."
        else 
            self.invalid
        end
        self.more_options(cocktail)
    end

    def invalid
        puts "Your selection was invalid."
    end

    def more_options(cocktail)
        puts "Type 'back' to return to the list of options for the #{cocktail.strDrink}."
        puts "Type 'more' to see the other cocktails from your search results."
        puts "Type 'new' if you'd like to search for a new cocktail."
        puts "Type 'exit' to exit the application."
        self.user_selects_option(cocktail)
    end

    def user_selects_option(cocktail)
        input = gets.strip
        if input.downcase == "back"
            self.info_options(cocktail)
        elsif input.downcase == "more"
            self.cocktail_options
        elsif input.downcase == "new"
            self.prompt_for_cocktail
        else
            puts "Goodbye!"
            return
        end
    end
end