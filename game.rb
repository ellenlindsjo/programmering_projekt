#variables
$day = 0
$problems_solved = [] #ska vi använda?
$game_started = true
$times_slept = 0
$times_eaten = 0
$opened_instructions = false
$correct_course = 2

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
    continue = 0
    while continue != "" && continue != "q"
        puts "press 'enter' to continue or 'q' and 'enter' to quit the game"
        continue = gets.chomp
    end
    if continue == ""
        puts "Enter your name:"
        $name = gets.chomp
        puts "As the rocket takes off, you think back on the mission you were given. The survival of humanity is in your hands..."
        sleep(2)
        puts "Move around the spaceship using words like 'walk', 'grab', 'drop'. The first word is the verb and the last verb is the object affected." 
        sleep(2)
        puts "For example: 'walk bedroom' and 'walk to the bedroom' will take you to the bedroom. 'grab pen' adds 'pen' to your inventory. 'drop pen' removes 'pen' from your inventory."
        sleep(2)
        puts "Enter 'show inventory' to show inventory"
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
        puts "#{verb} is not an action you can use. Please write a valid verb and make sure it's the first word."
    end
end

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
    elsif noun == "hammer"
        return "hammer"
    elsif noun == "screwdriver"
        return "screwdriver"
    elsif noun == "crowbar"
        return "crowbar"
    elsif noun == "rubberduck"
        return "rubberduck"
    elsif noun == "saw"
        return "saw"
    elsif noun == "banana"
        return "banana"
    elsif noun == "spaghetti"
        return "spaghetti"
    elsif noun == "ducttape"
        return "ducttape"
    elsif noun == "catfood"
        return "catfood"
    else
        puts "#{noun} is not an item you can use. Please write a valid noun and make sure it's the last word."
    end
end

def grab_item(item)
    if File.readlines("programmering_projekt/inventory.txt").length <= 7
        File.open("programmering_projekt/inventory.txt", "a"){|f| f.write(item,"\n")}
    else
        puts "Your inventory is full."
    end
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
    else 
        puts "#{$room} is not a room that you can walk to."
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
    sleep(2)
    puts "Yum!"
    sleep(2)
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
    $opened_instructions = true
end

#funktioner för uppdrag

#ställ in kurs
#svårare elvation 
#kanske kolla rum
def mission1
    puts "The first thing you notice as you leave the atmosphere is a message from earth: “Dear #{$name}, make sure to set the right course for the spaceship by entering the right answer to this equation: 2x + 3 = 7”"
    user_input = gets.chomp
    while user_input.to_i.to_s != user_input
        puts "Please write a number, integer or float."
        user_input = gets.chomp
    end
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
    puts "When you were eating the room fell into complete darkness. The power has gone out!"
    sleep(0.3)
    puts "To turn it back on, head to the controlroom"
    listener
    while $room != "controlroom"
        puts "You're in the wrong room. Go to the controlroom"
        listener
    end
    puts "It looks like the blue cable is broken"
    puts "Open the instruction book to find out how to fix it"
    listener
    while $opened_instructions == false
        listener
    end
    times_wrong = 0
    user_input = gets.chomp
    while user_input != "3J8JKO"
        puts "Wrong! Try again"
        times_wrong += 1
        user_input = gets.chomp
    end
    $opened_instructions = false
    if times_wrong >= 3
        puts "Hmm... The power still isn't on. Maybe check the other rooms for other broken cables."            while $room != "livingroom"
        listener
    end
    puts "There seems to be a broken cable in here as well. You need to fix it."
    puts "It is not the same colour as the cable in the controlroom. You need to check the instruction book again."
    while $opened_instructions == false
        listener
    end
    user_input = gets.chomp
    while user_input != "903KH6"
        puts "Wrong! Try again"
        user_input = gets.chomp
    end
    puts "Nice! The power is back on"
    
    
end

#trasig antenn
def mission5
    puts "Oh no! A meteor has hit your antenna and destroyed your message signal."
    puts "To fix the antenna you have to take a space walk."
    puts "Go to the living room to access the tools needed for the mission"
    while $room != "livingroom"
        listener
    end
    puts "You need a code to unlock the toolbox."
    listener
    user_input = gets.chomp
    while user_input != "8595"
        user_input = gets.chomp
    end
    puts "Here's the toolbox:"
    puts "Hammer"
    puts "Screwdriver" #behövs
    puts "Crowbar"
    puts "Rubberduck"
    puts "Saw"
    puts "Banana"
    puts "Spaghetti" #behövs
    puts "Ducttape" #behövs
    puts "Catfood"
    puts "You can pick up five things to put in your inventory. When you have everything you need, write 'close' to close the toolbox"
    listener
    listener
    listener
    listener
    listener
    puts "Your inventory is full!"
    user_input = gets.chomp
    while user_input != "close"
        user_input = gets.chomp
    end
    puts "Go to the controlroom to begin your spacewalk"
    while $room != "controlroom"
        listener
    end
    puts "While in the controlroom, you put on your spacesuit and prepare yourself for the mission. Then you start making your way towards the top of the spaceship, as the endless darkness surrounds you."
    puts "There are a few loose screws at the bottom of the antenna. Use the appropriate tool to fix it"
    user_input = gets.chomp
    while user_input != "screwdriver"
        puts "Wrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while !inventory_arr.include?('screwdriver\n')
        not_in_inventory = true
        puts "You don't have a screwdriver, you should go and get it."
        while $room != "livingroom"
            listener
        end
        listener
    end
    if not_in_inventory
        puts "You put your spacesuit back on and head outside."
        puts "Now maybe you have the right tool."
        user_input = gets.chomp
        while user_input != "screwdriver"
            puts "Wrong item"
            user_input = gets.chomp
        end
    end
    not_in_inventory = false
    puts "Good work!"
    puts "However, the top of the antenna seems to be broken as well... maybe you have something that could replace it?"
    user_input = gets.chomp
    while user_input != "spaghetti"
        puts "Wrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("spaghetti\n") == false
        not_in_inventory = true
        puts "You don't have the spaghetti, you should go and get it."
        while $room != "livingroom"
            listener
        end
        listener
    end
    if not_in_inventory
        puts "You put your spacesuit back on and head outside."
        puts "Now maybe you have the right tool."
        user_input = gets.chomp
        while user_input != "spaghetti"
            puts "Wrong item"
            user_input = gets.chomp
        end
    end
    not_in_inventory = false
    puts "Who knew spaghetti could be so useful?"
    puts "Now you need something to attach it with."
    user_input = gets.chomp
    while user_input != "ducttape"
        puts "Wrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("ducttape\n") == false
        not_in_inventory = true
        puts "You don't have ducttape, you should go and get it."
        while $room != "livingroom"
            listener
        end
        listener
    end
    if not_in_inventory
        puts "You put your spacesuit back on and head outside."
        puts "Now maybe you have the right item."
        user_input = gets.chomp
        while user_input != "ducttape"
            puts "Wrong item"
            user_input = gets.chomp
        end
    end
    puts "*beep beep*"
    puts "The antenna is now working again!"
end

def mission6
    puts "There's a new message from the aliens! Hurry to the control room to view it."
    while $room != "controlroom"
        listener
    end
    puts "I'm not alive, but I can grow. I don't have lungs, but I need air. I don't have a mouth, but water kills me. What am I?"
    puts "You have three tries"
    user_input = gets.chomp
    i = 0
    while user_input != "fire" && i<=3
        if i==1
            puts "Wrong answer, two tries left"
        elsif i==2
            puts "Wrong answer, one try left"
        end
        user_input = gets.chomp
        if i==1
            puts "Hint: It's important for survival."
        elsif i==2
            puts "Hint: The answer is one of the four elements."
        elsif i==3
            puts "*PEW PEW*"
            puts "You failed and the aliens shot laser at your spaceship"
            dead
        end
        i+=1
    end
    puts "Fire! That's correct!"
end

def mission7
    puts "Ouch! You accidently cut your arm on a rusty nail sticking out out the wall."
    puts "You'll probably need a band-aid. Where are those again?"
    while $room != "bathroom"
        listener
    end
    puts "First, to make sure the cut is clean you wash your arm."
    puts "Now hurry to grab a band-aid from the medicine cabinet before the cut gets infected!"
    start = Time.now
    user_input = gets.chomp
    while user_input != "open cabinet"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 30
        puts "You were too slow and the cut got infected."
        dead
    end
    puts "Phew, that was close.."
    puts "Now quick! Grab the band-aid"
    start = Time.now
    user_input = gets.chomp
    while user_input != "grab band-aid"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 30
        puts "You were too slow and the cut got infected."
        dead
    end
    puts "Great!"
    puts "You managed to avoid getting tetanus!"
end

def mission8
    times_hit = 0
    puts "Suddenly you feel the spaceship starting to shake..."
    puts "*BONK*"
    puts "What was that?"
    puts "*BONK BONK*"
    puts "IT'S A METEOR RAIN!"
    puts "You have to manually steer the ship to avoid getting hit!"
    while $room != "controlroom"
        listener
    end
    puts "The meteors are coming from different directions."
    puts "When from north, steer south, and vice versa"
    puts "When from east, steer west, and vice versa"
    sleep(5)
    #meteor 1
    puts "east"
    start = Time.now
    user_input = gets.chomp
    while user_input != "west"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 2
    puts "north"
    start = Time.now
    user_input = gets.chomp
    while user_input != "south"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 3
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 4
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end

    #meteor 5
    puts "west"
    while user_input != "east"
        start = Time.now
        user_input = gets.chomp 
        stop = Time.now
        if stop-start > 5
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    puts "Good job! You made it through the meteor rain."
    if times_hit > 0
        $hit = true
    end
end

def mission9
    puts "Since you were hit by the meteors it seems like something is broken. Go look for it."
    while $room != "kitchen"
        listener
    end
    puts "There's a weirdly-shaped hole in the wall and your food is flying out into space."
    puts "Is there something that you can plug the hole with?"
    user_input = gets.chomp
    while user_input != "rubberduck"
        puts "Wrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("rubberduck\n") == false
        not_in_inventory = true
        puts "You don't have a rubberduck, you should go and get it."
        while $room != "livingroom"
            listener
        end
        listener
    end
    if not_in_inventory
        puts "Now maybe you have the right item. Go back and test it."
        while $room != "kitchen"
            listenerr
        end
        user_input = gets.chomp
        while user_input != "rubberduck"
            puts "Wrong item"
            user_input = gets.chomp
        end
    end
    puts "Perfect fit! Who knew the rubberduck would save the day?"
end

def mission10
    puts "The aliens wants to test your knowledge and have sent some questions for you. Write your answers in numbers."
    while $room != "controlroom"
        listener
    end
    puts "Question 1: What is the value of π (pi) rounded to two decimal places?"
    user_input = gets.chomp
    if user_input != "3.14"
        dead
    else
        puts "Correct!"
    end
    puts "Question 2: What is the square root of 144?"
    user_input = gets.chomp
    if user_input != "12"
        dead
    else
        puts "Correct!"
    end

    if $hit
        puts "Question 3: What is the sum of the interior angles of a rectangle?"
        user_input = gets.chomp
        if user_input != "360"
            dead
        else
            puts "Correct!"
        end
        puts "Question 4: solve for x '(x-3)^2=0'"
        user_input = gets.chomp
        if user_input != "3"
            dead
        else
            puts "Correct!"
        end
    end
    puts "The aliens are happy with your knowledge!"
end

def mission11
    puts "You're starting to feel a little bit dizzy."
    puts "It seems like the oxygen level is unusually low."
    while $room != "controlroom"
        listener
    end
    puts "The primary oxygen tank has almost run out and needs to be replaced."
    puts  "Behind it is the spare one. Plug out the empty one and put them in the new tank."
    puts "There are three color coded cables that have to be plugged in in alphabetical order."
    puts "The color labels have been all mixed up."
    puts "'grapeyinnvoko'"
    puts "Choose which cables to re-plug (written with a space between each word):"
    user_input = gets.chomp
    i = 0
    while user_input != "navy orange pink" && i<=3
        user_input = gets.chomp
        i+=1
        if i==3
            puts "The oxygen ran out..."
            dead
        end
    end
    puts "You take a deep breath. The tanks have successfully been switched."
end

def mission12
    puts "*BONK BONK*"
    puts "Not again!"
    puts "A new meteor rain is approaching. Prepare to steer the ship away from them!"
    while $room != "controlroom"
        listener
    end
    #meteor 1
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 2
    puts "west"
    start = Time.now
    user_input = gets.chomp
    while user_input != "east"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 3
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        stop = Time.now
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    #meteor 4
    puts "east"
    start = Time.now
    user_input = gets.chomp
    while user_input != "west"
        if stop-start > 10
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end

    #meteor 5
    puts "south"
    while user_input != "north"
        start = Time.now
        user_input = gets.chomp stop = Time.now
        if stop-start > 5
            puts "*BONK*"
            puts "You got hit!"
            puts "Try to avoid that"
            times_hit +=1  
        end
        if times_hit >= 3
            puts "Oh no! To many meteors have damaged the ship!"
            puts "*KABOOM*"
            dead
        end
        user_input = gets.chomp
        start = Time.now
    end
    puts "Nice! You made it through another meteor rain."
    puts "Hopefully, it was the last one."
end

def mission13 
    puts "You look outside the window and see a huge sphere before you."
    puts "Wow, that must be the aliens' planet!"
    puts "You have gotten a new message from the aliens."
    while $room != controlroom
        listener
    end
    puts "We see that you are nearby now and can see our planet."
    puts "Which one of the primary- or their complementary colours is our planet?"
    $color = gets.chomp
    puts "Okay..."
end

#om fel kurs
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

def miss_planet
    puts "You drift closer and closer to the aliens' planet, but."
    puts "Suddenly you realize that you set the wrong course alll those days ago, and that now you won't be able to get to the aliens."
    puts "What a waste of time..."
    puts "You drift off into complete darkness..."
    puts "After a few days the food runs out..."
    puts "Some hours after that there's no more oxygen left..."
    dead
end

def black_hole
    puts "This doesn't feel right...It almost feels like the spaceship is being pulled towards something"
    puts "OH NO! It's a black ho-"
    dead
end

def arrive
    puts "The spaceship turns slightly as you can see the planet getting closer and closer."
    puts "You have gone into orbit and start preparing to enter the atmosphere."
    puts "*ROAROOOMMMM!*"
    puts "There's fire outside the windows as velocity increases."
    puts "*WHOOOOOSSHH!*"
    puts "The #{$color} surface is approaching rapidly and you begin to wonder what you'll actually find down there."
    puts "If you make the landing, that is."
    puts "*BEEP BEEP*"
    puts "Various warning sounds and lights are on, but now there's nothing left do to but hope."
    if $color == "red" || $color == "yellow" || $color == "blue"
        puts "Yes! You managed to dock on the new planet."
        puts "You get ready to present yourself to the aliens."
        puts "You walk out of your spaceship and go up to the aliens."
        puts "'Hello, I'm from planet Earth' you say."
        puts "But the aliens don't respond directly..."
        puts "And they don't look very kind..."
        puts "All of a sudden they grab ahold of you and drag you away from your ship!"
        puts "You struggle, realising that the aliens never wanted to help you."
        puts "They were only out to hurt you!"
        puts "As they throw you into a cell you think about how humanity could ever be so gullible."
        dead
    elsif $color == "green"
        puts "You brace for landing, waiting for the ship to slow down."
        puts "But the ship is not slowing down..."
        puts "It really should have slowed down by now..."
        puts "CRASH!!!"
        dead
    elsif $color == "orange" || $color == "purple"
        puts "Yes! You managed to dock on the new planet."
        puts "You get ready to present yourself to the aliens."
        puts "You walk out of your spaceship and go up to the aliens."
        puts "'Hello, I'm from planet Earth' you say."
        puts "'Hello, we are so excited to meet you!' an alien responded warmly."
        puts "You were led to a modern office and exchange knowledge that can save both the aliens and humans."
        puts "THE END"
        puts "Credits:"
        puts "Ellen, Stella, Klara (2B)"
    end     
end

def dead
    puts "You died."
    puts "Credits:"
    puts "Ellen, Stella, Klara (2B)"
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
            if noun == diary
                write_diary
            else 
                puts "You cannot write in #{noun}. You can only write in diary."
            end
        elsif verb == "read"
            if noun == "map"
                read_map
            elsif noun == "diary"
                read_diary
            else
                puts "You cannot read #{noun}. You can only read the map or diary."
            end
        elsif verb == "show"
            if noun == "inventory"
                show_inventory
            else
                puts "You cannot show #{noun}. You can only show inventory."
            end
        elsif verb == "open"
            if noun == "instructions"
                open_instructions
                $opened_instructions = true
            else
                puts "You cannot open #{noun}. You can only open instructions."
            end
        end
    elsif user_input == 'q'
        exit
    end
end


while $game_started == true
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
        while $times_eaten == 3
            p "waiting"
            listener
        end
        mission8
        if $hit 
            mission9
        end
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 4
            p "waiting"
            listener
        end
    elsif $day==5
        mission10
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 4
            p "waiting"
            listener
        end
        mission11
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 5
            p "waiting"
            listener
        end
    elsif $day==6
        if $hit
            mission12
        else
            mission13
        end
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        while $times_eaten == 5
            p "waiting"
            listener
        end
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        while $times_slept == 6
            p "waiting"
            listener
        end
    elsif $day==7
        puts "When you wake up, you realize that it's the last day of your trip. Soon you'll be meeting the aliens."
        if $course == false
            if ($course_value-$correct_course).abs < 10
                miss_planet
            else
                black_hole
            end
        else
            arrive
        end
    end
    listener
end