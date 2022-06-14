# Write your code below game_hash
require './hashketball.rb'
require "pry"

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# returns an array of objects (of each player) 
# [ {player_name: "", number: 1, shoe:15, ...}, {}, {} ]
def all_players
  game_hash[:home][:players] + game_hash[:away][:players] #concat works too game_hash[:home][:players].concat(game_hash[:away][:players])
end


# iterate through hash
# game_hash { home: { team_name: "", colors: [], players: [ {}, {}, {} ] }, away: { } }
# returns { player_name: "DeSagna Diop", number: 2, shoe: 14, ... }
def player_stats(player_name)
  game_hash.each do |home_away, team_hash|
    team_hash[:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash
      end
    end
  end
end

# if block, using all_players [ {player_name: "", number: 1, shoe:15, ...}, {}, {} ]
#  def player_stats(player_name)
#   all_players.find do |player|
#   if player[:player_name] == player_name
#     player
#   end
# end
# end

# one line, using all_players [ {player_name: "", number: 1, shoe:15, ...}, {}, {} ]
# def player_stats(player_name)
#   all_players.find {|player| player[:player_name] == player_name}
# end


# def num_points_scored(player_name)
#   player = player_stats(player_name) #returns us the data object for one player. Pass in the player_name from our parameter
#   player[:points]
# end

# iterate through hash
def num_points_scored(player_name)
  game_hash.each do |home_away, team_hash|
    team_hash[:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash[:points]
      end
    end
  end
end


# def shoe_size(player_name)
#   player = player_stats(player_name) # our parameter and the method we are calling parameter have to match
#   player[:shoe]
# end

# iterate thru hash
def shoe_size(player_name)
  game_hash.each do |home_away, team_hash|
    team_hash[:players].each do |player_hash|
      if player_name == player_hash[:player_name]
        return player_hash[:shoe]
      end
    end
  end
end


# iterating thru hash
def team_colors(team_name)
  game_hash.each do |home_away, team_hash|
    if team_name == team_hash[:team_name]
      return team_hash[:colors]
    end
  end
end

# helper function to get team
# def home_away(team_name)
#   team = game_hash.find do |home_or_away, data|
#     data[:team_name] == team_name
#   end
#   team[1] #return only the value from .find
#  end

# def team_colors(team_name)
#  team = home_away(team_name)
#  team[:colors]
# end


# def team_names
#   game_hash.map do |home_away, data|
#     data[:team_name]
#   end
# end

# this also works
def team_names
  [game_hash[:home][:team_name], game_hash[:home][:team_name]]
end


# iterate thru hash
def player_numbers(team_name)
  game_hash.each do |home_away, team_hash|
    if team_hash[:team_name] == team_name
    return team_hash[:players].map { |player| player[:number]} #must have the return keyword
    end
  end
end

# using helper function
# def player_numbers(team_name)
#   team = home_away(team_name) #to get the team
#   team[:players].map do |player| 
#   player[:number]
#   end
# end


# use .max_by without helper function
def big_shoe_rebounds
  player = all_players.max_by {|player| player[:shoe]}
  player[:rebounds]
end

#def big_shoe_rebounds
#   all_players.max_by {|player| player[:shoe]}[:rebounds]
# end



# use .max without helper function
# def big_shoe_rebounds
#   player = all_players.max do |player1, player2|
#     player1[:shoe] <=> player2[:shoe]
#     end
#   player[:rebounds]
# end


# helper function using .max_by to find player with biggest shoe size
# def big_shoe_player
#   all_players.max_by do |player|
#   player[:shoe]
#   end
# end

# helper function using .max to find player with biggest shoe size
# .max takes in 2 parameters
# def big_shoe_player
#   all_players.max do |player1, player2|
#   player1[:shoe] <=> player2[:shoe]
#   end
# end

# def big_shoe_rebounds
#   big_shoe_player[:rebounds]
# end



