require_relative "part2"
require "test/unit"

class TestRpsGame < Test::Unit::TestCase
  
  def test_too_few_players
    assert_raise WrongNumberOfPlayersError do 
      rps_game_winner([["Niels", "S"]]) 
     end
  end
  
  def test_too_many_players
    assert_raise WrongNumberOfPlayersError do
      rps_game_winner([["Niels", "S"], ["Ruby", "P"], ["PHP", "P"]])
    end
  end
  
  def test_unknown_strategy
    assert_raise NoSuchStrategyError do
      rps_game_winner [["Niels", "S"], ["Ruby", "x"]]
    end
  end
  
  def test_game_first_player_wins
    assert_equal ["Niels", "S"], rps_game_winner([["Niels", "S"], ["Ruby", "P"]])
  end
  
  def test_game_second_player_wins
    assert_equal ["Ruby", "P"], rps_game_winner([["Niels", "R"], ["Ruby", "P"]])
  end
  
  def test_short_tournament
    tournament_data = [ 
       [ ["Allen", "S"], ["Omer", "P"] ],
       [ ["David E.", "R"], ["Richard X.", "P"] ]
     ];
     
     assert_equal ["Allen", "S"], rps_tournament_winner(tournament_data)
  end
  
  def test_example_tournament
    tournament_data = [
       [ ["Armando", "P"], ["Dave", "S"] ],
       [ ["Richard", "R"],  ["Michael", "S"] ],
     ],
     [ 
       [ ["Allen", "S"], ["Omer", "P"] ],
       [ ["David E.", "R"], ["Richard X.", "P"] ]
     ]
    
    assert_equal ["Richard", "R"], rps_tournament_winner(tournament_data)
  end
  
  def test_large__tournament
    tournament_data = [
    [
       [ ["Armando", "P"], ["Dave", "S"] ],
       [ ["Richard", "R"],  ["Michael", "S"] ],
     ],
     [ 
       [ ["Allen", "S"], ["Omer", "P"] ],
       [ ["David E.", "R"], ["Richard X.", "P"] ] 
     ]
    ], 
    [
        [
       [ ["A", "P"], ["B", "S"] ],
       [ ["C", "R"],  ["D", "S"] ], 
     ],
     [ 
       [ ["D", "S"], ["E", "R"] ],
       [ ["F.", "R"], ["G", "P"] ] 
     ]
    ]
    
    assert_equal ["G", "P"], rps_tournament_winner(tournament_data)
  end
end