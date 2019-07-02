@x = 1
@o = -1
@palyer = x
@flag = false
@board = [[0,0,0],
         [0,0,0],
         [0,0,0]]

def put_sign(a, b)
    if(a < 0 || a > 2 || b < 0 || b > 2)
        puts "Invalid position"
        return;
    end
    if(@board[a][b] != 0)
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
        @flag = false
    elsif judge(o)
        puts "O wins...!"
        @flag = false
    else
        if(!@flag)
            puts "its a tie"
        end
    end
end

# judge(x,board)

loop do
    a = gets.chomp
    b = gets.chomp
    put_sign(a.to_i, b.to_i)
    if(@flag)
        break
    end
end