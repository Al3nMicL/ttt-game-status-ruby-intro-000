# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# example board
board = ["O", " ", "X", "O", " ", "X", "O", " ", " "]
# Define your WIN_COMBINATIONS constant
=begin
 # Board visual
 0 | 1 | 2
 3 | 4 | 5
 6 | 7 | 8
=end
WIN_COMBINATIONS = [
  [0,1,2], # Top horizontal
  [3,4,5], # Middle horizontal
  [6,7,8], # Bottom horizontal
  [0,3,6], # Left vertical
  [1,4,7], # Middle vertical
  [2,5,8], # Right vertical
  [0,4,8], # \ diagonal
  [2,4,6] # / diagonal
]

# see >> https://stackoverflow.com/a/13660352
@positions = Proc.new { |board, letter| board.each_index.select{|i| board[i] == letter} }

def won?(board)
  pos_X = @positions[board, "X"]
  pos_O = @positions[board, "O"]

  WIN_COMBINATIONS.each do |combo|
    if pos_X == combo
        p pos_X
    elsif pos_O == combo
        p  pos_O
    else
      nil
    end
  end
end

won?(board)
