class Team < ApplicationRecord
  self.table_name = "team"

  before_create :set_status
  has_many :matches
  belongs_to :player1, foreign_key: "player1_id", class_name: "Player"
  belongs_to :player2, foreign_key: "player2_id", class_name: "Player"

  ACTIVE = 1
  INACTIVE = 0

  def players
    [player1, player2]
  end

  def self.find_team_by_players player1_id, player2_id
    Team.where('(player1_id = ? and player2_id = ?) or (player1_id = ? and player2_id = ?)',player1_id, player2_id, player2_id, player1_id)
  end
  private

  def set_status
    self.status = ACTIVE
  end

end