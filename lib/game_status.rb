# require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# example boards
# board = [" ", " ", " ", " ", " ", " ", " ", " ", " "] 
board = ["X", "O", "X", "O", "X", "O", "X", "X", "O"] 

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

def full?(board)
  board.detect { |i| i == " " || nil} ? false : true
end

def won?(board)

@count_letter = lambda do |arr, letter| 
  true if arr.count(letter) === 3
end

  if !board.empty? && board.all? { |pos| pos == " " || pos == nil} #https://stackoverflow.com/a/16663549
    return false

  else

    WIN_COMBINATIONS.each do |combo|
      positions = [ board[combo[0]], board[combo[1]], board[combo[2]] ]
      if @count_letter[positions, "O"] 
        return combo
      elsif @count_letter[positions, "X"] 
        return combo
      else
        false
      end
    end

  end

end

# binding.pry
won?(board)
