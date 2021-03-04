class Api
    
    def self.get_cocktails_by_name(input)
        url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=#{input}"
        response = HTTParty.get(url)["drinks"] #array
        return nil if response == nil
        response.each{|cocktail| Cocktail.new(cocktail)}
    end

end