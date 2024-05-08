def mission3
    puts "You have recieved another message, but this time from the aliens. To read the message you have to use Caesar chipher -3 to decrypt it: 'zh kdyh brxu dqvzhu'"
    user_input = gets.chomp
    if user_input == "we have your answer"
        puts "That's correct"
    else
        puts "Try again, here's some help:"
        puts "abcdefghijklmnopqrstuvwxyz"
        user_input = gets.chomp
        if user_input == "we have your answer"
            puts "That's correct"
        else
            puts "Try again... last try"
            user_input = gets.chomp
            if user_input == "we have your answer"
                puts "That's correct"
            else 
                dead
            end
        end
    end
end

mission3