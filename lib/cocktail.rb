class Cocktail
    attr_accessor :strDrink, :strGlass, :strCategory, :strInstructions

    @@all = []

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find_by_name(input)
        self.all.find do |cocktail|
            cocktail.strDrink.downcase.include?(input.downcase)
        end
    end

end
