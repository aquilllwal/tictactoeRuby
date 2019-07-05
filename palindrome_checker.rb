puts "enter any number"
n = gets.chomp
nn = n.to_i

def check_palindrome(val)
    r = 0
    tmp = val
    while(tmp != 0)
        i = tmp%10
        r = r*10 + i
        tmp /= 10
    end
    r == val
end

if(check_palindrome(nn))
    puts "palindrome"
else
    puts "not a palindrome"
end
