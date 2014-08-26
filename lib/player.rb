class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position
  has_one :roster

  validates :name, :presence => true, :length => { :maximum => 20}

  scope :find_starters, -> { where(:depth_rank => 1) }

end
