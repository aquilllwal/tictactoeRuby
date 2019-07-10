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




# class Greeting
#     def self.hello
#       'hello world!'
#     end
  
#     def self.eigenclass
#       class << self
#         def inside
#             "inside"
#         end
#       end
#     end
# end

# p Greeting.new
# p Greeting.instance_methods.include?(false)
# p Greeting.eigenclass
# p Greeting.eigenclass
# p Greeting.inside

class Doctor
    ["rhinoplasty", "checkup", "interpretive_dance"].each do |action|
        define_method("perform_#{action}") do |argument|
              "performing #{action.gsub('_', ' ')} on #{argument}"
        end
    end
  end

  doc = Doctor.new
puts doc.perform_rhinoplasty("nose")
puts doc.perform_checkup("throat")
puts doc.perform_interpretive_dance("in da club")