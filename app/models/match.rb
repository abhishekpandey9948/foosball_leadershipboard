class Match < ApplicationRecord

  before_save :set_teams_score
  before_save :set_players_score

  belongs_to :team1, foreign_key: "team1_id", class_name: "Team"
  belongs_to :team2, foreign_key: "team2_id", class_name: "Team"

  attr_accessor :team1_score, :team2_score

  def winner_team
    return team1 if self.team1_winner?
    return team2
  end

  def loser_team
    return team2 if self.team1_winner?
    return team1
  end

  private

  def set_teams_score
    begin
      winner_team = self.winner_team
      winner_team.score = winner_team.score + 10
      winner_team.save!

      loser_team = self.loser_team
      loser_team.score = loser_team.score + 10
      loser_team.save!
    rescue Exception => e
      self.errors.add("Could not update teams score")
      raise ActiveRecord::Rollback.new
    end
  end

  def set_players_score
    begin
      self.winner_team.players.each{|player| player.score = player.score.to_i + 10
      player.save!}
      self.loser_team.players.each{|player| player.score = player.score.to_i - 5
      player.save!}
    rescue Exception => e
      self.errors.add("Could not update players score")
      raise ActiveRecord::Rollback.new
    end
  end

end