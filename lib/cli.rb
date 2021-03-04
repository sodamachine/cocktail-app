class Cli

    def welcome
        puts "Welcome to the cocktail cli app!"
        prompt_for_cocktail
    end

    def prompt_for_cocktail
        puts "Please enter the name of a cocktail you'd like to learn more about."
        input = gets.strip
        Api.get_cocktails_by_name(input)
        self.cocktail_options
    end

    def cocktail_options
        puts "Choose a cocktail: Enter the number that corresponds with the cocktail for more details."
        Cocktail.all.each.with_index(1) do |cocktail, i|
            puts "#{i}. #{cocktail.strDrink}"
        end
        self.user_selects_cocktail
    end

    def user_selects_cocktail
        input = gets.strip.to_i
        cocktail = Cocktail.all[input-1]
        self.info_options(cocktail)
    end

    def info_options(cocktail)
        puts "FYI: Select what information you'd like to find out about the #{cocktail.strDrink}."
        puts "1. Glass"
        puts "2. Category"
        puts "2. Instructions"
        self.user_selects_info(cocktail)
    end

    def user_selects_info(cocktail)
        input = gets.strip
        a = ["1. Glass", "1", "Glass", "glass"]
        b = ["2. Category", "2", "Category", "category"]
        c = ["3. Instructions", "3", "Instructions", "instructions"]
        if a.include?(input)
            puts "The proper glass for a #{cocktail.strDrink} is a #{cocktail.strGlass}."
        elsif b.include?(input)
            puts "The #{cocktail.strDrink} is part of the #{cocktail.strCategory} category."
        elsif c.include?(input)
            puts "Instructions to make a #{cocktail.strDrink} are as follows: #{cocktail.strInstructions}."
        else 
            puts "Your selection was invalid."
            self.prompt_for_cocktail
        end
    end

end