require_relative './Board'
require_relative './Computer'

class Game
  # board = Board.new
  # comp = Computer.new
  # comp_code = comp.comp_code
  
  # pegs = Array.new(10, pegs_map = {black: 0, white: 0})
  
  def initialize
    @rounds = 1
  end

  def play_game
    board = Board.new
    comp = Computer.new
    comp_code = comp.generate_code
    comp_code = 1234 #TESTING DELETE ME LATER
    pegs = Array.new(10, pegs_map = {black: 0, white: 0})
    
    # until (@rounds == 10 || check_win(pegs, @round))
    play_round(board, pegs, @rounds, comp_code)
    # end
  end

  def play_round(board, pegs_hash, round, comp_code)
    puts "Enter in four digits (1-6) to crack the code...
    \n White: correct number. Black: correct number and placement.
    \n You have 9 attempts
    \n You are on attempt: #{@rounds}"
    code = gets.chomp
    valid = board.update_board(@rounds, code)

    if valid
      update_pegs( pegs_hash, @rounds, code, comp_code)
      ++@rounds
      # puts comp_code
      # puts pegs_hash.flatten
      puts "valid"
    else
      puts "error"
    end

  end

  def check_win(pegs_hash, round) #check if the black pegs hash ever reachs 4 that is a win
    if pegs_hash[round][:black] == 4
      return true
    end
    return false
  end

  def update_pegs(pegs_hash, round, player_code, comp_code)
    player_code = player_code.to_i.digits.reverse #converts to string then puts it in an array 
    comp_code = comp_code.to_i.digits.reverse
    # puts player_code.class
    # puts comp_code.class
    # puts player_code.flatten
    player_code.each_with_index do |number, index|
      #black pegs
      # puts player_code + 010101
      # puts comp_code + 101010
      if player_code[index] == comp_code[index]
        pegs_hash[round][:black] += 1
      #white pegs
      elsif (player_code.count{ |num| }) # && (player_code[index] != comp_code[index]) #need to check whether a digit of the player code ever appears in the comp code, while also not being in the same index to prevent over counting
        pegs_hash[round][:white] += 1
        puts pegs_hash.flatten
      end
      true
    end
    false
  end
end