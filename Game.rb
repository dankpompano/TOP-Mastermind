require_relative './Board'
require_relative './Computer'

class Game
  board = Board.new
  comp = Computer.new
  white_pegs = 0
  black_pegs = 0
  comp_code = comp.comp_code
  
  pegs = Array.new(10, pegs_map = {black: 0, white: 0})
  
  def initialize
    @rounds = 0
  end

  def play_game
    until (@rounds == 10 || check_win == true)
      play_round(board, make_guess)
    end
  end

  def play_round(board, guess)
    puts "Enter in four digits (1-6) to crack the code...
    \n White-correct number. Black-correct number and placement.
    \n You have 9 attempts
    \n You are on attempt: #{@rounds}"
    code = gets.chomp
    valid = update_board(@rounds, code)

    if valid
      update_pegs(@rounds, code, comp_code)
      ++@rounds
    else
      
    end

  end

  def make_guess
    
  end

  def check_win() #check if the black pegs hash ever reachs 4 that is a win
    return false
  end

  def prompt_player
    
  end

  def update_pegs(round, player_code, comp_code)
    player_code.each_with_index do |number, index|
      #black pegs
      if player_code[index] == comp_code[index]
        pegs[round][:black] += 1 
      elsif (player_code[index].count()) && (player_code[index] != comp_code[index]) #need to check whether a digit of the player code ever appears in the comp code, while also not being in the same index to prevent over counting
        pegs[round][:white] += 1
      end
      true
    end
    false
  end
end