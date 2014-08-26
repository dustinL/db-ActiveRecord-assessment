require 'spec_helper'

describe Player do
  it { should belong_to :team }
  it { should belong_to :position }
  it { should have_one :roster }

  describe '.find_starters' do
    it 'should return all players with a depth_rank of 1' do
      test_player1 = Player.create(:name => 'One', :depth_rank => 1)
      test_player2 = Player.create(:name => 'Two', :depth_rank => 1)
      test_player3 = Player.create(:name => 'Three', :depth_rank => 1)
      test_player4 = Player.create(:name => 'Four', :depth_rank => 3)
      expect(Player.find_starters).to eq [test_player1, test_player2, test_player3]
    end
  end

end
