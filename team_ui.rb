require 'active_record'
require './lib/team'
require './lib/player'
require './lib/position'

require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu

  system("clear")
  loop do
    puts "***Team Almanac***\n"
    puts "[1] - Add Team"
    puts "[2] - View Teams"
    puts "\n"

    puts "{--Players--}"
    puts "[3] - Add Player"
    puts "[4] - View Players"
    puts "[5] - View Starting Players"
    puts "\n"

    puts "[6] - Add Position"
    puts "[7] - View a Roster"
    puts "\n"

    puts "[x] - Exit"
    menu_choice = gets.chomp
    if menu_choice == '1'
      add_team
    elsif menu_choice == '2'
      view_teams
    elsif menu_choice == '3'
      add_player
    elsif menu_choice == '4'
      view_players
    elsif menu_choice == '5'
      view_starters
    elsif menu_choice == '6'
      add_position
    elsif menu_choice == '7'
      view_roster
    elsif menu_choice == 'x'
      puts "See you later, alligator."
      exit
    else
      puts "Please input a valid entry."
    end
  end
end

def add_team
  puts "\nWhat team would you like to add?\n"
  user_team = gets.chomp
  new_team = Team.create({name: user_team})
  puts "#{new_team.name} has been created."
  puts "\n"
end

def view_teams
  puts "Here are the existing teams:"
  puts "[id] --- Name"
  puts "-----------------------------"
  Team.all.each {|team| puts "[#{team.id}] - #{team.name}" }
  puts "\n"
end

def add_player
  puts "Please enter the new player's name: "
  player_name = gets.chomp
  puts "\n"
  puts "Associate the player with a team by selecting an ID."
  view_teams
  team_choice = gets.chomp.to_i
  puts "\n"
  puts "Select a position ID for the player (if none, press 'x' to return to main menu to create new positions):"
  puts "[id] -- Position"
  puts "------------------"
  Position.all.each {|position| puts "[#{position.id}] -- #{position.title}" }
  puts "\n"
  position_input = gets.chomp
  if position_input == 'x'
    main_menu
  else
    position_input.to_i
    puts "Give the player a rank on the depth chart (1 = 1st string):\n"
  end
  depth_ranking = gets.chomp.to_i
  puts "\n"
  new_player = Player.create({:name => player_name, :team_id => team_choice, :position_id => position_input, :depth_rank => depth_ranking})
  sleep(1)
  puts "#{new_player.name} has been created!"
  puts "\n"
end

def view_players
  puts "All current players:"
  puts "[Team #] -- Name ---- (Position ID)"
  puts "---------------------------------------"
  Player.all.each {|player| puts "[#{player.team_id}] ----- #{player.name} - (#{player.position_id})" }
  puts "\n"
end

def view_roster
  view_teams
  puts "\nSelect a team by ID to view their roster: "
  team_choice = gets.chomp.to_i
  team_roster = Team.find(team_choice)
  system("clear")
  puts "#{team_roster.name}"
  puts "Player - Depth Chart Rank - Position ID"
  puts "----------------------------------------"
  team_roster.players.each do |player|
    puts "#{player.name} - #{player.depth_rank} - #{player.position_id}"
  end
    puts "\n"
end

def add_position
  puts "\nEnter the new position name: "
  pos_input = gets.chomp
  new_position = Position.create({:title => pos_input})
  puts "\n'#{new_position.title}' position has been created."
  puts "\n"
end

def view_starters
  puts "Players who start for their team listed below:"
  puts "[Team #] -- Name ---- (Position ID)"
  Player.find_starters.each { |starter| puts "[#{starter.team_id}] ----- #{starter.name} - (#{starter.position_id})" }
  puts "\n"
end

main_menu
