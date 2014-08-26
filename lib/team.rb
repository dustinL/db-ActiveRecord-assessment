class Team < ActiveRecord::Base
  has_many :players
  has_one :roster

end
