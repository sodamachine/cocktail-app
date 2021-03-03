class Cli

    def welcome
        puts "Welcome to the cocktail cli app!"
        prompt_for_cocktail
    end

    def prompt_for_cocktail
        puts "Please enter the name of a cocktail you'd like to learn more about."
        input = gets.strip
        new_cocktail = Api.get_cocktail_by_name(input)
        self.cocktail_options(new_cocktail)
    end

    def cocktail_options(cocktail)
        puts "Choose from the following list for more details about #{cocktail.name}s."
        puts "1. Proper glass"
        puts "2. Ingredients"
        puts "3. Instructions"
        self.user_selection(cocktail)
    end

    def user_selection(cocktail)
        input = gets.strip
        if input == "1" || input.include?("Proper") || input.include?("proper") || input.include?("Glass") || input.include?("glass")
            puts "The proper glass for #{cocktail.name}s is a #{cocktail.glass}."
        elsif input == "2" || input.include?("Ingredients") || input.include?("ingredients")
            puts "The ingredients necessary to make a #{cocktail.name} include: #{}."
        elsif input == "3" || input.include?("Instructions") || input.include?("instructions")
            puts "Instructions to make a #{cocktail.name} are as follows: #{cocktail.instructions}."
        else 
            puts "Your selection was invalid."
            self.cocktail_options(cocktail)
        end
    end 

end