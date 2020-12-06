class Api   
    def self.base_url
        "https://myheroacademiaapi.com/api"
    end

    def self.load_data
      load_characters
    end 

    def self.load_characters
        page_number = 1

        until page_number == 17 do
            
            response = RestClient.get(base_url + "/character?page=#{page_number}")
            data = JSON.parse(response.body)
            data["result"].each do |character_data|
                Character.new(character_data)
            end
            page_number += 1
        end
    end
end