class Roster < ActiveRecord::Base
  belongs_to :team
  belongs_to :player
  belongs_to :position
end
