require 'byebug'
# teams = {
#     "india" => {
#         "kohli" => "batsman",
#         "dhoni" => "wiki/batsman",
#         "rohit" => "batsman",
#         "pandya" => "allrounder",
#         "bumrah" => "bowler"
#     },
#     "australia" => {
#         "gilchrist" => "wiki",
#         "mcgrath" => "bowler",
#         "ponting" => "batsman",
#         "clark" => "bowler"
#     }
# }

# teams.each do |team, players|
#     p team
#     players.each do |player, role|
#         p "#{player} plays as #{role}"
#     end
#     puts
# end

# class Xyz
#     attr_accessor :name
#     def change_name
#         @name += " Hussain"
#     end

#     def check_yield(&block)
#         block.call(4,5)
#     end
# end

# a = Xyz.new
# a.name = "Aquil"
# a.change_name
# p a.name
# a.check_yield { |x,y| puts x+y 







def display
    board = [[0,0,0],
                [0,0,0],
                [0,0,0]]
    s = ""
    flag = false
    for i in (0...3) do 
        byebug
        for j in (0...3) do
            byebug
            case board[i][j]
            when 1 
                s.concat " X "
                break
            when -1 
                s.concat " O "
                break
            when 0 
                s.concat " "
                flag = true
                break
            end
            if j < 2
                s.concat "|"
            end		
        end
        if i < 2
            s.concat "\n-----------\n" 
        end
    end
    return s
end

display
