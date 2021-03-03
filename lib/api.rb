class Api

    @@api_key = "1"
    @@url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"  

    def self.get_cocktail_by_name
        response = HTTParty.get(@@url)
        cocktail_hash = {cocktail_hash = {name: response["drinks"][0]["strDrink"], glass: response["drinks”][0][“strGlass"], instructions: response["drinks"][0]["strInstructions"]}
        Cocktail.new(cocktail_hash)
    end

end