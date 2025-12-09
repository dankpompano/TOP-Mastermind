class Board
  ROWS = 10
  COLS = 4
  PEGS = Array.new(4, nil) #black and white pegs


  def initialize
    @board = Array.new(ROWS) {Array.new(COLS, " ")} #2d array
    # @board = Array.new(ROWS, " ")
  end

  def display
    puts ""
  end

  def update_board (row, code)
    # @board[row][code]
    @board[row] = code.to_s.chars.map(&:to_i) #splits our number into digits [1234] -> [1,2,3,4]
    return true
  end

  def get_board_code(row, code)
    return @board
  end
end