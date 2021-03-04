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
        selection = Cocktail.all[input-1]
        self.info_options(selection)
    end

    def info_options(selection)
        puts "FYI: Select what information you'd like to find out about a #{selection.strDrink}."
        puts "1. Proper glass"
        puts "2. Ingredients"
        puts "3. Instructions"
        self.user_selection(cocktail)
    end

    def user_selection(cocktail)
        input = gets.strip
        a = ["1. Proper glass", "1", "Proper", "proper", "Glass", "glass"]
        b = ["2. Ingredients", "2", "Ingredients", "ingredients"]
        c = ["3. Instructions", "3", "Instructions", "instructions"]
        if a.include?(input)
            puts "The proper glass for #{cocktail.name}s is a #{cocktail.glass}."
        elsif b.include?(input)
            puts "The ingredients necessary to make a #{cocktail.name} include: #{}."
        elsif c.include?(input)
            puts "Instructions to make a #{cocktail.name} are as follows: #{cocktail.instructions}."
        else 
            puts "Your selection was invalid."
            self.cocktail_options(cocktail)
        end
    end

end