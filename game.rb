#variables
$day = 0
$health = 100
$problems_solved = []
$game_started = true
$times_slept = 0
$times_eaten = 0
$opened_instructions = false

def intro
    i=10
    while i>=0
        puts "#{i}..."
        i-=1
        sleep 0.01 #egentligen 1
    end
    puts "LIFTOFF!"
    sleep 1
    puts "Welcome to 'game'!"
    puts "press 'enter' to continue or 'q' and 'enter' to quit the game"
    continue = gets.chomp
    if continue == ""
        puts "Enter your name:"
        $name = gets.chomp
        puts "As the rocket takes off, you think back on the mission you were given. The survival of humanity is in your hands..."
        sleep(2)
        puts "Move around the spaceship using words like 'walk', 'grab', 'drop'. The first word is the verb and the last verb is the object affected." 
        sleep(2)
        puts "For example: 'walk bedroom' and 'walk to the bedroom' will take you to the bedroom. 'grab pen' adds 'pen' to your inventory. 'drop pen' removes 'pen' from your inventory."
        sleep(2)
        puts "Enter 'open inventory' to open inventory"
    elsif continue == "q"
        $game_started = false
        exit
    end
end


def open_inventory
    puts File.readlines("inventory.txt")
end

def action_verb(prompt)
    arr = prompt.split
    verb = arr[0]
    if verb == "walk"
        return "walk"
    elsif verb == "drop"
        return "drop"
    elsif verb == "grab"
        return "grab"
    elsif verb == "read"
        return "read"
    elsif verb == "write"
        return "write"
    elsif verb == "show"
        return "show"
    elsif verb == "open"
        return "open"
    else 
        #fel input
    end
end

#Vi måste lägga in alla items som vi använder här i
def action_noun(prompt)
    arr = prompt.split
    noun = arr[arr.length-1]
    if noun == "bedroom"
        return "bedroom"
    elsif noun == "kitchen"
        return "kitchen"
    elsif noun == "bathroom"
        return "bathroom"
    elsif noun == "controlroom"
        return "controlroom"
    elsif noun == "livingroom"
        return "livingroom"
    elsif noun == "map"
        return "map"
    elsif noun == "diary"
        return "diary"
    elsif noun == "instructions"
        return "instructions"
    else
        #fel input
    end
end

def grab_item(item)
    File.open("programmering_projekt/inventory.txt", "a"){|f| f.write(item)}
end

def drop_item(item)
    item2 = item + "\n"
    a = File.readlines('programmering_projekt/inventory.txt')
    a.delete(item)
    a.delete(item2)
    File.open("programmering_projekt/inventory.txt", "w+") do |f|
        a.each { |element| f.puts(element) }
    end
end

def write_diary
    puts "What do you want to write?"
    prompt = gets.chomp
    File.open("programmering_projekt/diary.txt", "a"){|f| f.write(prompt,"\n")}
end

def rooms(destination)
    $room = destination
    if $room == "bedroom"    
        puts "You are in the bedroom. Here you have your bed and your diary."
    elsif $room == "kitchen"
        puts "You are in the kitchen. Here you can find your food supply."
    elsif $room == "livingroom"
        puts "You are in the living room."
    elsif $room == "controlroom"
        puts "You are in the control room. Here you can control the ship, as well as receiving and sending messages. "
    elsif $room == "bathroom"
        puts "You are in the bathroom. Here you can find your medicine supply."
    end
end

def good_night
    puts "Zzz"
    sleep(0.3)
    puts "Zzz"
    sleep(0.3)
    puts "Zzz"
    sleep(0.3)
    $day += 1
    $times_slept += 1
    puts "Good morning!!"
    puts "Day #{$day}"
end

def eat
    puts "Nom nom..."
    sleep(3)
    puts "Yum!"
    sleep(2)
    $health = 100
    $times_eaten += 1
end

def read_map
   puts File.read('programmering_projekt/map.txt')
end

def read_diary
    puts File.read('programmering_projekt/diary.txt')
end

def show_inventory
    puts File.read('programmering_projekt/inventory.txt')
end

def open_instructions
    puts File.read('programmering_projekt/instructions.txt')
end

#funktioner för uppdrag

#ställ in kurs
#svårare elvation 
#kanske kolla rum
def mission1
    puts "The first thing you notice as you leave the atmosphere is a message from earth: “Dear #{$name}, make sure to set the right course for the spaceship by entering the right answer to this equation: 2x + 3 = 7”"
    user_input = gets.chomp
    if user_input == "2"
        $course = true
        $course_value = 2
    else
        $course = false
        $course_value = user_input.to_i
    end
    puts "You have succesfully set a course for the spaceship."
end

#äta
def mission2
    puts "*Growl*... You must be hungry after the trip to outer space, go to the kitchen and eat something!"
    while $times_eaten == 0
        p "waiting"
        listener
    end
end

#dekryptera meddelande från aliens
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
                puts "Oh no! The aliens are mad and sent a missil right at your spaceship!"
                puts "*KABOOM*"
                dead
            end
        end
    end
end

#fixa strömmen
def mission4
    puts "You're waking up to complete darkness. The power has gone out!"
    sleep(0.3)
    puts "To turn it back on, head to the controlroom"
    listener
    if $room == "controlroom"
        puts "It looks like the blue cable is broken"
        puts "Open the instruction book to find out how to fix it"
        listener
        while $opened_instructions == false
            listener
        end
        user_input = gets.chomp
        while user_input != "3J8JKO"
            puts "Wrong! Try again"
            user_input = gets.chomp
        end
        puts "Nice! The power is back on"
    else
        #fel room
    end
    
end

#trasig antenn
def mission5
    puts "Oh no! A meteor has hit your antenna and destroyed your message signal."
    puts "To fix the antenna you have to take a space walk."
    puts "Go to the living room to access the tools needed for the mission"
    while $room != "livingroom"
        listener
    end
    


end

#om fel kurs på dag 1
def extra_mission1
    puts "Another day, another message from earth: 'It seams like the course you set was wrong! Fortunetly you get another chance by answering this equation: (x^2)^(1/2) = 4'"
    user_input = gets.chomp
    if user_input == "4"
        $course_retry = true
        $course_retry_value = 4
    else
        $course_retry = false
        $course_retry_value = user_input.to_i
    end
end

def dead
    puts "You died."
    puts "to restart..." #fixa sen
    $game_started = false
    exit
end

def listener
    user_input = gets.chomp
    if user_input == 'eat'
        if $room == "kitchen"
            eat
        else
            puts "You have to be in the kitchen to eat"
        end
    elsif user_input == 'sleep'
        if $room == "bedroom"
            good_night
        else
            puts "You have to be in the bedroom to sleep"
        end
    elsif user_input.split.length > 1
        verb = action_verb(user_input)
        noun = action_noun(user_input)
        if verb == "walk"
            rooms(noun)
        elsif verb == "drop"
            drop_item(noun)
        elsif verb == "grab"
            grab_item(noun)
        elsif verb == "write"
            write_diary
        elsif verb == "read"
            if noun == "map"
                read_map
            elsif noun == "diary"
                read_diary
            end
        elsif verb == "show"
            show_inventory
        elsif verb == "open"
            open_instructions
            $opened_instructions = true
        end
    elsif user_input == 'q'
        exit
    end

end


while $game_started = true
    p "in the whle llop"
    if $day==0
        intro
        listener
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 0
            p "waiting"
            listener
        end
    elsif $day==1
        mission1
        listener
        mission2
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 1
            p "waiting"
            listener
        end
    elsif $day==2
        mission3
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 1
            p "waiting"
            listener
        end
        mission4
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 2
            p "waiting"
            listener
        end
    elsif $day==3
        if $course == false
            extra_mission1
        end
        mission5
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 2
            p "waiting"
            listener
        end
        mission6
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 3
            p "waiting"
            listener
        end
    elsif $day==4
        mission7
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 1
            p "waiting"
            listener
        end
        mission8
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 4
            p "waiting"
            listener
        end
    elsif $day==5
        mission9
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 1
            p "waiting"
            listener
        end
        mission10
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 5
            p "waiting"
            listener
        end
    elsif $day==6
        mission11
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 1
            p "waiting"
            listener
        end
        mission12
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 6
            p "waiting"
            listener
        end
    elsif $day==7
        mission13
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 1
            p "waiting"
            listener
        end
        mission14
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 6
            p "waiting, last day"
            listener
        end
    end
    listener
end

