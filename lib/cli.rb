class Cli

    def welcome
        puts "Welcome to the cocktail cli app!"
        prompt_for_cocktail #call method on instance (implied: self.prompt_for_ingredient)
    end

    def prompt_for_cocktail
        puts "Please enter the name of a cocktail you'd like to learn more about."
        input = gets.strip #rid of potential inputted white space
        #do something with the ingredient
        Api.get_cocktail_by_name
    end
    
end