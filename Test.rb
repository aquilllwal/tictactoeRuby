require 'byebug'
class Test
    attr_accessor :x, :o, :flag, :board, :player, :empty
    
    def initialize
        @x = 1
        @o = -1
        @flag = false
        @board = [[0,0,0],
                [0,0,0],
                [0,0,0]]
        @player = x
        @empty = 0
    end

    def put_sign(a, b)
        if(a < 0 || a > 2 || b < 0 || b > 2)
            puts "Invalid position"
            return
        end
        if(@board[a][b] != empty)
            puts "Board position accoupied"
            return
        end
        @board[a][b] = @player
        @player = -@player
    end
    
    def judge(player)
        if((@board[0][0] + @board[0][1] + @board[0][2] == player*3) ||
            (@board[1][0] + @board[1][1] + @board[1][2] == player*3) ||
            (@board[2][0] + @board[2][1] + @board[2][2] == player*3) ||
            (@board[0][0] + @board[1][0] + @board[2][0] == player*3) ||
            (@board[0][1] + @board[1][1] + @board[2][1] == player*3) ||
            (@board[0][2] + @board[1][2] + @board[2][2] == player*3) ||
            (@board[0][0] + @board[1][1] + @board[2][2] == player*3) ||
            (@board[2][0] + @board[1][1] + @board[0][2] == player*3))
            return true
        else
            return false
        end
    end
    # puts judge(x)
    def winner
        if judge(x)
            puts "X wins...!"
            @flag = true
        elsif judge(o)
            puts "O wins...!"
            @flag = true
        else
            if(!@flag)
                puts "its a tie"
            end
        end
    end

    def display
        for m in (0...3) do
            for j in (0...3) do
                print board[m][j]
            end
            puts
        end
    end
end

play = Test.new
loop do
    puts play.player == play.x ? "Player X turn" : "Player O turn"
    puts "Enter x and y co-ordinates"
    a = gets.chomp
    b = gets.chomp
    play.put_sign(a.to_i, b.to_i)
    puts play.display
    play.winner
    if(play.flag)
        break
    end
end
