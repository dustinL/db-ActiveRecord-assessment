require 'active_record'
require './lib/team'
require './lib/player'
require './lib/position'
require './lib/roster'

require 'pry'

database_configurations = YAML::load(File.open('./db/config.yml'))
development_configuration = database_configurations['development']
ActiveRecord::Base.establish_connection(development_configuration)

def main_menu

  system("clear")
  loop do
    puts "***Team Almanac***\n"
    puts "[1] - Add Team"
    puts "[2] - View Teams\n"
    puts "\n"

    puts "{--Players--}"
    puts "[3] - Add Player"
    puts "[4] - View Players"
    puts "[5] - Delete Player"
    puts "\n"

    puts "{--Positions--}"
    puts "[6] - Add Position"
    puts "[7] - Delete Position"
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
      delete_player
    elsif menu_choice == '6'
      add_position
    elsif menu_choice == '7'
      delete_position
    elsif menu_choice == 'x'
      puts "See you later."
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
  puts "#{new_team.name} has been created.\n"
end

def view_teams
  puts "Here are the existing teams:"
  puts "[id] ----- [Name]"
  puts "-----------------------------"
  Team.all.each {|team| puts "#{team.id} -- #{team.name}" }
  puts "\n"
end

main_menu
