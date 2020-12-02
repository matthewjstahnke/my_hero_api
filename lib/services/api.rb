class Api
     
    def self.base_url
        "https://myheroacademiaapi.com/api"
    end

    def self.load_data
      load_characters
    end 

    def self.load_characters
        characters = []
        response = RestClient.get(base_url + '/character?occupation=Student')
        data = JSON.parse(response.body)
        data["results"].each do |character_data|
    end


end