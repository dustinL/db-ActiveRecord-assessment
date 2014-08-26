class Position < ActiveRecord::Base
  has_many :players
  has_many :rosters
end
