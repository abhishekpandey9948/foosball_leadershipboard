module Services
  class MatchService

    def create_match match
      begin
        validate match
        save_in_db match
      rescue => e
        return e.message
      end
      respond
    end

    def validate match
      exception_msg = ''
      exception_msg += "Name not be blank" if match['name'].blank?
      exception_msg += "\nTeam1 not be blank" if match['team1_id'].blank?
      exception_msg += "\nTeam2 not be blank" if match['team2_id'].blank?
      exception_msg += "\nTeams must be different" if match['team1_id'] == match['team2_id']
      exception_msg += "\nInvalid scores" if (match['team1_score'].blank? or match['team2_score'].blank?) or !(/\A\d+\z/.match(match['team1_score']) or /\A\d+\z/.match(match['team2_score'])) or (match['team1_score'].to_i == match['team2_score'].to_i)
      raise ActionController::BadRequest.new, exception_msg if exception_msg.present?
    end

    def save_in_db match
      matchdb = Match.new

      matchdb.name = match['name']
      matchdb.team1_id = match['team1_id']
      matchdb.team2_id = match['team2_id']
      matchdb.team1_winner = match['team1_score'].to_i > match['team2_score'].to_i
      matchdb.winner_up_points = (match['team1_score'].to_i - match['team2_score'].to_i).abs
      raise ActionController::BadRequest.new, "Error while saving team :(" unless matchdb.save
    end

    def respond
      return "Match created :)"
    end
  end
end




