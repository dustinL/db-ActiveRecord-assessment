require 'active_record'
require 'rspec'
require 'shoulda-matchers'

require 'team'
require 'player'
require 'roster'
require 'position'

ActiveRecord::Base.establish_connection(YAML::load(File.open('./db/config.yml'))['test'])

RSpec.configure do |config|
  config.after(:each) do
    Team.all.each {|team| team.destroy}
    Player.all.each {|player| player.destroy}
    Roster.all.each {|roster| roster.destroy}
    Position.all.each {|position| position.destroy}
  end
end
