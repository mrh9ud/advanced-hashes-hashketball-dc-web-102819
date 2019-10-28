require "pry"

def game_hash
  {
    :home => {  :team_name => "Brooklyn Nets", 
                :colors => ['Black','White'], 
                :players => [
                  {:player_name => 'Alan Anderson', 
                   :number => 0, 
                   :shoe => 16, 
                   :points => 22, 
                   :rebounds => 12, 
                   :assists => 12, 
                   :steals => 3, 
                   :blocks => 1, 
                   :slam_dunks => 1 
                  },
                  {:player_name => 'Reggie Evans', 
                   :number => 30, 
                   :shoe => 14, 
                   :points => 12, 
                   :rebounds => 12, 
                   :assists => 12, 
                   :steals => 12, 
                   :blocks => 12, 
                   :slam_dunks => 7 
                  },
                  {:player_name => 'Brook Lopez', 
                   :number => 11, 
                   :shoe => 17, 
                   :points => 17, 
                   :rebounds => 19, 
                   :assists => 10, 
                   :steals => 3, 
                   :blocks => 1, 
                   :slam_dunks => 15 
                  },
                  {:player_name => 'Mason Plumlee', 
                   :number => 1, 
                   :shoe => 19, 
                   :points => 26, 
                   :rebounds => 11, 
                   :assists => 6, 
                   :steals => 3, 
                   :blocks => 8, 
                   :slam_dunks => 5 
                  },
                  {:player_name => 'Jason Terry', 
                   :number => 31, 
                   :shoe => 15, 
                   :points => 19, 
                   :rebounds => 2, 
                   :assists => 2, 
                   :steals => 4, 
                   :blocks => 11, 
                   :slam_dunks => 1 
                  }]
              },  
    :away => {  :team_name => "Charlotte Hornets", 
                :colors => ['Turquoise','Purple'], 
                :players => [
                  {:player_name => 'Jeff Adrien', 
                   :number => 4, 
                   :shoe => 18, 
                   :points => 10, 
                   :rebounds => 1, 
                   :assists => 1, 
                   :steals => 2, 
                   :blocks => 7, 
                   :slam_dunks => 2 
                  },
                  {:player_name => 'Bismack Biyombo', 
                   :number => 0, 
                   :shoe => 16, 
                   :points => 12, 
                   :rebounds => 4, 
                   :assists => 7, 
                   :steals => 22, 
                   :blocks => 15, 
                   :slam_dunks => 10  
                  },
                  {:player_name => 'DeSagna Diop', 
                   :number => 2, 
                   :shoe => 14, 
                   :points => 24, 
                   :rebounds => 12, 
                   :assists => 12, 
                   :steals => 4, 
                   :blocks => 5, 
                   :slam_dunks => 5 
                  },
                  {:player_name => 'Ben Gordon', 
                   :number => 8, 
                   :shoe => 15, 
                   :points => 33, 
                   :rebounds => 3, 
                   :assists => 2, 
                   :steals => 1, 
                   :blocks => 1, 
                   :slam_dunks => 0 
                  },
                  {:player_name => 'Kemba Walker', 
                   :number => 33, 
                   :shoe => 15, 
                   :points => 6, 
                   :rebounds => 12, 
                   :assists => 12, 
                   :steals => 7, 
                   :blocks => 5, 
                   :slam_dunks => 12 
                  }]
              }
  }
end

def num_points_scored(players_name)
  game_hash.each do |location, team|
    team.each do |team_descrip, team_info|
      if team_descrip == :players
        team_info.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end
        end  
      end
    end
  end
end

def shoe_size(players_name)
  game_hash.each do |location, team|
    team.each do |team_descrip, team_info|
      if team_descrip == :players
        team_info.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end
        end  
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      return team[:colors]
    end
  end    
end

def team_names
  game_hash.map do |location, team|
    p team[:team_name]
  end
end

def player_numbers(team_name)
  array = []
  game_hash.each do |location, team|
    if team[:team_name] == team_name
      team.each do |k, v|
        if k == :players
          v.each do |each_player|
            array.push(each_player[:number])
          end
        end
      end
    end
  end
  p array
end

def player_stats(players_name)
  hash = {}
  game_hash.each do |location, team|
    team.each do |k, v|
      if k == :players
        v.each do |each_player|
          if each_player[:player_name] == players_name
            hash = each_player.delete_if do |key, value|
              key == :player_name
            end
          end  
        end
      end
    end
  end
  p hash
end

def big_shoe_rebounds
  max_shoe = 0
  rebounds = 0
  game_hash.each do |location, team|
    team[:players].each do |each_player|
      size = each_player[:shoe]
      if size > max_shoe
        max_shoe = size
        rebounds = each_player[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  max_points = 0
  best_player = ''
  game_hash.each do |location, team|
    team[:players].each do |player|
      points = player[:points]
      if points > max_points
        max_points = points
        best_player = player[:player_name]
      end
    end
  end
  best_player
end

def winning_team
  total_points = 0
  win_team = ''
  game_hash.each do |home_away, keys|
    team_points = 0
    team_name = game_hash[home_away][:team_name]
    keys[:players].each do |player|
      points = player[:points]
      team_points += points
    end
    win_team, total_points = team_name, team_points if team_points > total_points
  end
  return win_team
end


def player_with_longest_name
  longest = ''
  longest_length = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      name_length = player[:player_name].length
      longest, longest_length = player[:player_name], name_length if name_length > longest_length
    end
  end
  return longest
end

def long_name_steals_a_ton?
  steals_most = ''
  most_steals = 0
  game_hash.each do |home_away, keys|
    keys[:players].each do |player|
      steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
    end
  end
  return true if steals_most == player_with_longest_name
end
