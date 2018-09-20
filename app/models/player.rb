class Player < ApplicationRecord
  self.table_name = "player"

  before_create :set_status

  ACTIVE = 1
  INACTIVE = 0

  private

  def set_status
    self.status = ACTIVE
  end

end