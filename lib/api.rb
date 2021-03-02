class Api

    @@api_key = "1"
    @@url = "https://www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita"  

    def self.get_cocktail_by_name
        response = HTTParty.get(@@url)
    end

end