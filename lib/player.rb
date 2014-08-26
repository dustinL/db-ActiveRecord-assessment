class Player < ActiveRecord::Base
  belongs_to :team
  belongs_to :position
  has_one :roster

  validates :name, :presence => true, :length => { :maximum => 20}
  validates :depth_rank, :presence => true, numericality: { only_integer: true }

  scope :find_starters, -> { where(:depth_rank => 1) }

end
