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
    end
    
end