module Services
  class TeamService

    def create_team team
      begin
        validate team
        save_in_db team
      rescue => e
        return e.message
      end
      respond
    end

    def validate team
      exception_msg = ''
      exception_msg += "Name not be blank" if team['name'].blank?
      exception_msg += "\nPlayer1 not be blank" if team['player1_id'].blank?
      exception_msg += "\nPlayer2 not be blank" if team['player2_id'].blank?
      exception_msg += "\nPlayers must be different" if team['player1_id'] == team['player2_id']
      exception_msg += "\nAlready team exist for these players" if Team.find_team_by_players( team['player1_id'], team['player2_id']).present?
      raise ActionController::BadRequest.new, exception_msg if exception_msg.present?
    end

    def save_in_db team
      raise ActionController::BadRequest.new, "Error while saving team :(" unless Team.create({name: team['name'], player1_id: team['player1_id'], player2_id: team['player2_id']})
    end

    def respond
      return "Team created :)"
    end

    def self.show_teams
      Team.joins('inner join match on match.team1_id = team.id or match.team2_id = team.id').select('team.id,team.name,
        (((match.team1_id = team.id and match.team1_winner = true) or (match.team2_id = team.id and match.team1_winner = false))::Integer * 10 -
        ((match.team1_id = team.id and match.team1_winner = false) or (match.team2_id = team.id and match.team1_winner = true))::Integer * 5) as score').
          where('team.status = 1').group('match.team1_id, match.team2_id').order('(((match.team1_id = team.id and match.team1_winner = true) or (match.team2_id = team.id and match.team1_winner = false))::Integer * 10 -
        ((match.team1_id = team.id and match.team1_winner = false) or (match.team2_id = team.id and match.team1_winner = true))::Integer * 5)')
    end

  end
end




