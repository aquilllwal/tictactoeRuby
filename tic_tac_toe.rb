require './exception_for_tictactoe.rb'
require 'rollbar'

Rollbar.configure do |config|
  config.access_token = 'ff49f2d4a07d4f7781c2fccb6b29e259'
end

class Board < NoSuchMoves
    def initialize
      @grid = [
        ["tl", "tc", "tr"],
        ["ml", "mc", "mr"],
        ["bl", "bc", "br"]
      ]
      @top_row = "| | | |"
      @mid_row = "| | | |"
      @bot_row = "| | | |"
  
      @instructions = ["|tl|tc|tr|", "|ml|mc|mr|", "|bl|bc|br|"]
    end
  
    def show
      puts @top_row
      puts @mid_row
      puts @bot_row
    end

    def check_ties
      (0..6).none? {|i| @top_row[i] == " "} and (0..6).none? {|i| @mid_row[i] == " "} and (0..6).none? {|i| @bot_row[i] == " "}
    end
  
    def show_instructions
      puts "tic tac toe"
      puts "type the following for making the moves"
      puts @instructions, ""
    end
  
    def check(a, b, player)
      @grid[a][b] == player
    end
  
    def move(position, player)

      case position
      when "tl"
        @grid[0][0] = player
        @top_row[1] = player
      when "tc"
        @grid[0][1] = player
        @top_row[3] = player
      when "tr"
        @grid[0][2] = player
        @top_row[5] = player
      when "ml"
        @grid[1][0] = player
        @mid_row[1] = player
      when "mc"
        @grid[1][1] = player
        @mid_row[3] = player
      when "mr"
        @grid[1][2] = player
        @mid_row[5] = player
      when "bl"
        @grid[2][0] = player
        @bot_row[1] = player
      when "bc"
        @grid[2][1] = player
        @bot_row[3] = player
      when "br"
        @grid[2][2] = player
        @bot_row[5] = player 
      else
        begin
          raise NoSuchMoves.new("No such move available: #{position}")
        rescue NoSuchMoves => e
          Rollbar.error(e)
          p e.message
        end
      end
    end
  
    def win(player)
        (0..2).all? { |i| check(0, i, player) } || 
        (0..2).all? { |i| check(1, i, player) } || 
        (0..2).all? { |i| check(2, i, player) } ||
        (0..2).all? { |i| check(i, 0, player) } ||
        (0..2).all? { |i| check(i, 1, player) } ||
        (0..2).all? { |i| check(i, 2, player) } ||
        (0..2).all? { |i| check(i, i, player) } ||
        (0..2).all? { |i| check(i, 2 - i, player) }
    end
  
  end
  
  
  #driver code
  game = Board.new
  player = ["x", "o"]
  
  game.show_instructions
  
  flag = false #to check if its a tie or victory
  
  loop do
    puts "It's Player #{player[0]}'s turn."
    input = gets.chomp
    game.move input, player[0]
    game.show
    break if (game.win player[0])
    if(game.check_ties)
        flag = true
        break 
    end
    player[0], player[1] = player[1], player[0]
  end
#   p game.check_ties
  
  if(flag)
    puts "It's a tie"
  else
    puts "Congrats Player #{player[0]}, you have won!"
  end
