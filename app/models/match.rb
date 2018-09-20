class Match < ApplicationRecord
  self.table_name = "match"

  before_save :set_players_score

  belongs_to :team1, foreign_key: "team1_id", class_name: "Team"
  belongs_to :team2, foreign_key: "team2_id", class_name: "Team"

  attr_accessor :team1_score, :team2_score

  ACTIVE = 1
  INACTIVE = 0

  def winner_team
    return team1 if self.team1_winner?
    return team2
  end

  def loser_team
    return team2 if self.team1_winner?
    return team1
  end

  private

  def set_players_score
    self.winner_team.players.each{|player| player.score = player.score.to_i + 10
    player.save}
    self.loser_team.players.each{|player| player.score = player.score.to_i - 5
    player.save}
  end

end