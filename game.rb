require './modules/board.rb'
class Game
    include Board
      #driver code
    def start
    player = ["x", "o"]
    
    show_instructions
    
    flag = false #to check if its a tie or victory
    
    loop do
        puts "It's Player #{player[0]}'s turn."
        input = gets.chomp
        move input, player[0]
        show
        break if (win player[0])
        if(check_ties)
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
    end
end

Game.new.start