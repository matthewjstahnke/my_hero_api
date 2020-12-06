class Character
    attr_accessor :id, :name, :alias, :quirk, :affiliation, :hair, :description

    @@all = []
    
    def initialize(data)
        self.id = data["id"]
        self.name = data["name"]
        self.alias = data["alias"]
        self.quirk = data["quirk"]
        self.affiliation = data["affiliation"]
        self.hair = data["hair"]
        self.description = data["description"]
        @@all << self
    end

    def self.all
        @@all.first(100)
    end
end