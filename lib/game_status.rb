# require 'pry'
# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# example board
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

@count_letter = lambda do |arr, letter| 
  true if arr.count(letter) === 3
end

def won?(board)
  win_combo = nil
  WIN_COMBINATIONS.each do |combo|
    positions = [ board[combo[0]], board[combo[1]], board[combo[2]] ]
    if @count_letter[positions, "O"]
       win_combo = combo
    elsif @count_letter[positions, "X"]
       win_combo = combo
    else
      nil
    end
  end
  return win_combo
end

# binding.pry
won?(board)
