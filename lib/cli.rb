class Cli

    def welcome
        puts "Welcome to the cocktail cli app!"
        prompt_for_ingredient #call method on instance (implied: self.prompt_for_ingredient)
    end

    def prompt_for_ingredient
        puts "Please enter a cocktail ingredient."
        input = gets.strip #rid of potential inputted white space
        #do something with the ingredient
        binding.pry
    end


end