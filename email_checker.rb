def regex_check(email)
    email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
end

def email_check(email)
    puts "following are\/is the valid email from the given list"
    email.map do |val|
        puts val if regex_check(val)
    end
end

email = []
puts "enter the number of email"
n = gets.to_i
if(n != 0 && n.class == Integer)
    for x in 0...n
        email << gets.chomp
    end
    email_check(email)
else
    puts "please put valid entry"
end


