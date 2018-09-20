module Services
  class PlayerService

    def create_player player
      begin
      validate player
      save_in_db player
      rescue => e
        return e.message
      end
      respond
    end

    def validate player
      exception_message=''
      exception_message += "Name not be blank" if player['name'].blank?
      exception_message += "\nInvalid Employee Id" if player['employee_id'].blank? or !/\A\d+\z/.match(player['employee_id'])
      raise ActionController::BadRequest.new, exception_message if exception_message.present?
    end

    def save_in_db player
      raise ActionController::BadRequest.new, "Error while saving player :(" unless Player.create({name: player['name'], employee_id: player['employee_id']})
    end

    def respond
      return "Player created :)"
    end

  end
end




