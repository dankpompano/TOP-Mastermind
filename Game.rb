require_relative './Board'
require_relative './Computer'

class Game
  def initialize
    @rounds = 1
  end

  def play_game
    board = Board.new
    comp = Computer.new
    comp_code = comp.generate_code
    # comp_code = 1234 #TESTING DELETE ME LATER
    pegs = Array.new(11) {{black: 0, white: 0}}
    
    while (@rounds != 10)
      play_round(board, pegs, @rounds, comp_code)
      break if check_win(pegs, @rounds)
      @rounds += 1
      puts "You lost, try again..."
    end
  end

  def play_round(board, pegs_hash, round, comp_code)
    puts "Enter in four digits (1-6) to crack the code...
    \n White: correct number. Black: correct number and placement.
    \n Black Pegs: #{pegs_hash[@rounds - 1][:black]}    White Pegs: #{pegs_hash[@rounds - 1][:white]}
    \n You have 9 attempts
    \n You are on attempt: #{round}
    \n\n\n"
    code = gets.chomp
    trim = code[0..3]
    valid = board.update_board(round, trim)

    if valid
      update_pegs(pegs_hash, round, code, comp_code)
      # puts comp_code
      # puts pegs_hash.flatten
      # puts "valid"
    end

  end

  def check_win(pegs_hash, round) #check if the black pegs hash ever reachs 4 that is a win
    if pegs_hash[round][:black] == 4
      puts "Congrats! You won!"
      return true
    end
    return false
  end

  def update_pegs(pegs_hash, round, player_code, comp_code)
    pegs_hash[round][:black] = 0
    pegs_hash[round][:white] = 0
    player_code = player_code.to_i.digits.reverse #converts to string then puts it in an array 
    comp_code = comp_code.to_i.digits.reverse
    
    unmatched_player = []
    unmatched_comp = []

    player_code.each_with_index do |number, index|
      #black pegs
      if player_code[index] == comp_code[index]
        pegs_hash[round][:black] += 1
      else
        unmatched_player << player_code[index]
        unmatched_comp << comp_code[index]
      end
      
    end

    #count white pegs
    unmatched_player.each do |number|
      if unmatched_comp.include?(number)
        pegs_hash[round][:white] += 1
        unmatched_comp.delete_at(unmatched_comp.index(number)) #prevents over counting
      end
    end
    
  end
end