class Position < ActiveRecord::Base
  has_many :players
  has_many :rosters
  before_save :downcase_title

  private

  def downcase_title
    self.title = self.title.downcase
  end

end
