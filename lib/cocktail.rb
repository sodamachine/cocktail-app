class Cocktail
    attr_accessor :name, :glass, :instructions

    def initialize(hash)
        hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
    end

end
