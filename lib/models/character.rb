class Character
    attr_accessor :name, :alias, :quirk, :affiliation, :hair 

    @@all = []
    
    def initialize(data)
        self.name = data["name"]
        self.alias = data["alias"]
        self.quirk = data["quirk"]
        self.affiliation = data["affiliation"]
        self.hair = data["hair"]
        @@all << self
    end

    def self.all
        @@all.first(100)
    end
end