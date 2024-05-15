#variables
$day = 0
$game_started = true
$times_slept = 0
$times_eaten = 0
$opened_instructions = false
$correct_course = 2
$hungry = false
$tired = false

def intro
    i=10
    while i>=0
        puts "#{i}..."
        i-=1
        sleep 1 
    end
    puts "LIFTOFF!"
    sleep 1
    puts "\nWelcome to Elstellara's Cosmic Adventure!"
    continue = 0
    while continue != "" && continue != "q"
        puts "\nPress 'enter' to continue or 'q' and 'enter' to quit the game"
        continue = gets.chomp
    end
    if continue == ""
        puts "Enter your name:"
        $name = gets.chomp
        puts "\nAs the rocket takes off, you think back on the mission you were given.\nThe survival of humanity is in your hands..." 
        sleep(3)
        puts "\nMove around the spaceship using words like 'walk', 'grab', 'drop."
        puts "The first word is the verb and the last verb is the object affected." 
        sleep(3)
        puts "\nFor example: "
        sleep(1)
        puts "\n'walk bedroom' and 'walk to the bedroom' will take you to the bedroom." 
        sleep(1)
        puts "\n'grab waterbottle' adds 'waterbottle' to your inventory. "
        sleep(1)
        puts "\n'drop waterbottle' removes 'waterbottle' from your inventory."
        sleep(1)
        puts "\n'show inventory' to show inventory." 
        sleep(1)
        puts "\n'open instruction' to read the instruction book." 
        sleep(1)
        puts "\n'write diary' to write in your diary." 
        sleep(1)
        puts "\n'read diary' to read your diary." 
        sleep(1)
        puts "\n'sleep' to sleep."
        sleep(1)
        puts "\n'eat' to eat."
        sleep(1)
        puts "\nLet's continue!"
    elsif continue == "q"
        $game_started = false
        exit
    end
end

#Beskrivning: Den här funktionen tar in en string och gör om den till en array. Sedan jämförs första elementet i arrayen med olika strings. Om den matchar något av alternativen så returneras den strängen. Annars skrivs text ut. 
#Argument: String - det är en user-input från listener. 
#Return: String - Om något returneras är det det första ordet i argumentet. Om det ordet inte matchar något i if-satsen returneras ingenting. 
#Exempel: action_verb("walk bedroom") --> "walk"
#       action_noun("go room") ger ingen return.
#       action_noun("2") ger ingen return, men i samband med resten av koden kommer man inte att komma till den här funktionen med det argumentet då det endast är ett ord. 
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
        if verb == ""
            puts "The first word is not an action you can use. Please write a valid verb and make sure it's the first word."
        else
            puts "#{verb} is not an action you can use. Please write a valid verb and make sure it's the first word."
        end
    end
end

#Beskrivning: Den här funktionen tar in en string och gör om den till en array. Sedan jämförs sista elementet i arrayen med olika strings. Om den matchar något av alternativen så returneras den strängen. Annars skrivs text ut. 
#Argument: String - det är en user-input från funktionen listener. 
#Return: String - Om något returneras är det det sista ordet i argumentet. Om det ordet inte matchar något i if-satsen returneras ingenting. 
#Exempel: action_noun("walk bedroom") --> "bedroom"
#       action_noun("go room") ger ingen return.
#       action_noun("2") ger ingen return, men i samband med resten av koden kommer man inte att komma till den här funktionen med det argumentet då det endast är ett ord. 
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
    elsif noun == "chewinggum"
        return "chewinggum"
    elsif noun == "waterbottle"
        return "waterbottle"
    elsif noun == "inventory"
        return "inventory"
    else
        puts "#{noun} is not an item or a room. Please write a valid noun and make sure it's the last word."
    end
end

#Beskrivning: Funktionen tar in en sträng från användaren och lägger till strängen till textfilen inventory.txt på en ny rad om filen har maximalt fyra rader med text och det ordet inte redan finns. Annars skriver den ut en string skriver den ut text. 
#Argument: String - En string som består av ett ord som har fått genom en listener från användaren som har skrivit in en sträng med flera ord. Argumentet är sista ordet i den strängen.
#Exempel: grab_item("screwdriver") gör att ordet screwdriver läggs till på en ny rad i inventory.txt
#       grab_item("soccer ball") gör att frasen soccer ball läggs till på en ny rad i inventory.txt men kan inte hända på grund av resten av koden. Det kommer bara vara ett ord.
def grab_item(item)
    if File.readlines("programmering_projekt/inventory.txt").length <= 4 && !File.readlines("programmering_projekt/inventory.txt").include?(item + "\n")
        File.open("programmering_projekt/inventory.txt", "a"){|f| f.write(item,"\n")}
    elsif File.readlines("programmering_projekt/inventory.txt").length >= 4
        puts "Your inventory is full."
    else
        puts "You already have this item in your inventory. "
    end
end

#Beskrivning: Funktionen tar in en sträng som den konkatenerar med en annan sträng. Den tar bort två strängar från textfilen inventory.txt om de finns med. 
#Argument: String - I samband med resten av programmet är det sista ordet av en sträng som skickats in av användaren. 
#Exempel: drop_item("screwdriver") Om screwdriver finns med i inventory.txt på en egen rad tas den raden bort. Annars händer ingenting. 
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

#Beskrivning: Funktionen tar in en sträng som argument och tilldelar en variabel den strängen. Sedan avgör en if-sats vilken sträng som skrivs ut. 
#Argument: String - Det är en sträng från en input-loop. I samband med resten av programmet finns det endast fem alternativ på argument.
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

#Beskrivning: Funktionen inkrementerar två globala variabler med ett och sätter en annan global variabel till true. Den skriver också ut strängar. Den tar inga argument och den gör ingen return. 
def good_night
    puts "Zzz"
    sleep(2)
    puts "Zzz"
    sleep(3)
    puts "Zzz"
    sleep(2)
    $day += 1
    $times_slept += 1
    $tired = false
    puts "Good morning!!"
    puts "Day #{$day}"
end

#Beskrivning: Funktionen inkrementerar en global variabel med ett och tilldelar en global variabel boolean false. Den skriver även ut strängar. Den tar inga argument och har inga returns.
def eat
    puts "Nom nom..."
    sleep(1.5)
    puts "Yum!"
    sleep(1.5)
    $times_eaten += 1
    $hungry = false
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
#Beskrivning: Den här funktionen har en input-loop där den sparar värdet (omvandlat till en integer) som en global variabel. 
def mission1
    puts "\nThe first thing you notice as you leave the atmosphere is a message from earth:" 
    sleep(4)
    puts "\nDear #{$name}, make sure to set the right course for the spaceship by entering the right answer to this equation:"
    sleep(2)
    puts "\n 2x + 3 = 7\n"
    user_input = gets.chomp
    while user_input.to_i.to_s != user_input
        puts "\nPlease write a number, integer or float.\n"
        user_input = gets.chomp
    end
    if user_input == "2"
        $course = true
        $course_value = 2
    else
        $course = false
        $course_value = user_input.to_i
    end
    sleep(0.5)
    puts "\nYou have succesfully set a course for the spaceship.\n"
end

#äta
#Beskrivning: Funktionen tilldelar en global variabel boolean true och sedan anropar den funktionen listener den tills den globala variabeln inte längre har värdet av integern 0, för då ändras blir jämförelsen för while-loopen falsk. 
def mission2
    puts "\n*Growl*... You must be hungry after the trip to outer space, go to the kitchen and eat something!\n"
    $hungry = true
    while $times_eaten == 0
        listener
    end
end

#dekryptera meddelande från aliens
def mission3
    puts "\nYou have recieved another message, but this time from the aliens."
    sleep(2)
    puts "To read the message you have to use Caesar chipher -3 to decrypt it: \n\nzh kdyh brxu dqvzhu\n"
    user_input = gets.chomp
    if user_input == "we have your answer"
        puts "\nThat's correct\n"
    else
        puts "\nTry again, here's some help:\n"
        puts "\nabcdefghijklmnopqrstuvwxyz\n"
        user_input = gets.chomp
        if user_input == "we have your answer"
            puts "\nThat's correct!\n"
        else
            puts "\nTry again... last try\n"
            user_input = gets.chomp
            if user_input == "we have your answer"
                puts "\nThat's correct!\n"
            else 
                puts "\nOh no! The aliens are mad and sent a missil right at your spaceship!\n"
                sleep(1)
                puts "*KABOOM*"
                dead
            end
        end
    end
    sleep(2)
end

#fixa strömmen
def mission4
    puts "\nWhen you were eating the room fell into complete darkness. The power has gone out!"
    sleep(2)
    puts "To turn it back on, head to the controlroom.\n"
    listener
    while $room != "controlroom"
        puts "You're in the wrong room. Go to the controlroom\n"
        listener
    end
    puts "\nIt looks like the blue cable is broken"
    sleep(2)
    puts "\nOpen the instruction book to find out how to fix it\n"
    listener
    while $opened_instructions == false
        listener
    end
    times_wrong = 0
    user_input = gets.chomp
    while user_input != "3J8JKO"
        puts "\nWrong! Try again\n"
        times_wrong += 1
        user_input = gets.chomp
    end
    $opened_instructions = false
    if times_wrong >= 3
        puts "\nHmm... The power still isn't on. Maybe check the other rooms for other broken cables.\n"            
        while $room != "livingroom"
            listener
        end
        puts "\nThere seems to be a broken cable in here as well. You need to fix it.\n"
        puts "\nIt is not the same colour as the cable in the controlroom. You need to check the instruction book again.\n"
        while $opened_instructions == false
            listener
        end
        user_input = gets.chomp
        while user_input != "903KH6"
            puts "\nWrong! Try again\n"
            user_input = gets.chomp
        end
    end
    puts "\nNice! The power is back on\n"
    
    
end

#trasig antenn
def mission5
    puts "\nOh no! A meteor has hit your antenna and destroyed your message signal.\n"
    sleep(2)
    puts "\nTo fix the antenna you have to take a space walk.\n"
    sleep(2)
    puts "\nGo to the living room to access the tools needed for the mission\n"
    while $room != "livingroom"
        listener
    end
    puts "\nYou need a code to unlock the toolbox.\n"
    $opened_instructions = false
    while !$opened_instructions
        listener
    end
    user_input = gets.chomp
    while user_input != "8595"
        user_input = gets.chomp
    end
    puts "\nHere's the toolbox:\n"
    puts "\nHammer"
    puts "Screwdriver" #behövs
    puts "Crowbar"
    puts "Rubberduck"
    puts "Saw"
    puts "Banana"
    puts "Spaghetti" #behövs
    puts "Ducttape" #behövs
    puts "Catfood"
    sleep(5)
    puts "\nYou can pick up five things to put in your inventory. \nWhen you have everything you need, write 'close' to close the toolbox\n"
    $close = false
    while !$close
        listener
    end
    puts "Go to the controlroom to begin your spacewalk\n"
    while $room != "controlroom"
        listener
    end
    puts "\nWhile in the controlroom, you put on your spacesuit and prepare yourself for the mission. \nThen you start making your way towards the top of the spaceship, \nas the endless darkness surrounds you."
    sleep(3)
    puts "\nThere are a few loose screws at the bottom of the antenna. Which tool from the toolbox would be appropriate to use?"
    user_input = gets.chomp
    while user_input != "screwdriver"
        puts "Wrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while !inventory_arr.include?("screwdriver\n")
        not_in_inventory = true
        puts "\nYou don't have a screwdriver, you should go and get it.\n"
        while $room != "livingroom"
            listener
        end
        listener
        inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    end
    if not_in_inventory
        puts "\nYou put your spacesuit back on and head outside."
        sleep(1)
        puts "Now maybe you have the right tool.\n"
        user_input = gets.chomp
        while user_input != "screwdriver"
            puts "\nWrong item\n"
            user_input = gets.chomp
        end
    end
    not_in_inventory = false
    puts "\nGood work!\n"
    sleep(2)
    puts "\nHowever, the top of the antenna seems to be broken as well... \nmaybe you have something that could replace it?\n"
    user_input = gets.chomp
    while user_input != "spaghetti"
        puts "Wrong item\n"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("spaghetti\n") == false
        not_in_inventory = true
        puts "\nYou don't have the spaghetti, you should go and get it.\n"
        while $room != "livingroom"
            listener
        end
        listener
        inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    end
    if not_in_inventory
        puts "You put your spacesuit back on and head outside.\n"
        puts "Now maybe you have the right tool.\n"
        user_input = gets.chomp
        while user_input != "spaghetti"
            puts "\nWrong item\n"
            user_input = gets.chomp
        end
    end
    not_in_inventory = false
    puts "\nWho knew spaghetti could be so useful?\n"
    sleep(2)
    puts "\nNow you need something to attach it with.\n"
    user_input = gets.chomp
    while user_input != "ducttape"
        puts "\nWrong item\n"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("ducttape\n") == false
        not_in_inventory = true
        puts "\nYou don't have ducttape, you should go and get it.\n"
        while $room != "livingroom"
            listener
        end
        listener
        inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    end
    if not_in_inventory
        puts "\nYou put your spacesuit back on and head outside.\n"
        puts "\nNow maybe you have the right item.\n"
        user_input = gets.chomp
        while user_input != "ducttape"
            puts "\nWrong item\n"
            user_input = gets.chomp
        end
    end
    sleep(2)
    puts "\n*beep beep*"
    sleep(1)
    puts "\nThe antenna is now working again!\n"
    sleep(2)
end

#Beskrivning: Funktionen innehåller en while-loop som använder den globala variabeln "room" och anropar funktionen "listener". Den har även en while-loop som jämför variabeln "user_input" med användarens input. 
#Argument: Funktionen tar inte in några argument
#Return: Funktionern retunerar inget
def mission6
    puts "\nThere's a new message from the aliens! Hurry to the control room to view it.\n"
    while $room != "controlroom"
        listener
    end
    puts "\nI'm not alive, but I can grow."
    sleep(1)
    puts "I don't have lungs, but I need air."
    sleep(1)
    puts "I don't have a mouth, but water kills me."
    sleep(1)
    puts "\nWhat am I?"
    sleep(0.5)
    puts "\nYou have three tries\n"
    user_input = gets.chomp
    i = 0
    while user_input != "fire" && i<=2
        if i==0
            puts "Wrong answer, two tries left\n"
        elsif i==1
            puts "Wrong answer, one try left\n"
        end
        if i==0
            puts "Hint: It's important for survival.\n"
        elsif i==1
            puts "Hint: The answer is one of the four elements.\n"
        elsif i==2
            puts "\n*PEW PEW*\n"
            puts "You failed and the aliens shot laser at your spaceship\n"
            dead
        end
        user_input = gets.chomp
        i+=1
    end
    puts "Fire! That's correct!\n"
end 

def mission7
    puts "\nOuch! You accidently cut your arm on a rusty nail sticking out out the wall.\n"
    puts "You'll probably need a band-aid. Where are those again?\n"
    while $room != "bathroom"
        listener
    end
    puts "\nFirst, to make sure the cut is clean you wash your arm.\n"
    sleep(1)
    puts "\nNow hurry to grab a band-aid from the medicine cabinet before the cut gets infected!\n"
    start = Time.now
    user_input = gets.chomp
    while user_input != "open cabinet"
        puts "\nYou might have to open the cabinet first."
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 30
        puts "\nYou were too slow and the cut got infected.\n"
        dead
    end
    puts "\nPhew, that was close..\n"
    sleep(1)
    puts "\nNow quick! Grab the band-aid\n"
    start = Time.now
    user_input = gets.chomp
    while user_input != "grab band-aid"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 30
        puts "\nYou were too slow and the cut got infected.\n"
        dead
    end
    puts "Great!"
    sleep(1)
    puts "You managed to avoid getting tetanus!\n"
end

def mission8
    times_hit = 0
    puts "Suddenly you feel the spaceship starting to shake...\n"
    sleep(2)
    puts "\n*BONK*"
    sleep(1)
    puts "\nWhat was that?"
    sleep(1)
    puts "\n*BONK BONK*"
    sleep(1)
    puts "\nIT'S A METEOR RAIN!"
    sleep(1)
    puts "\nYou have to manually steer the ship to avoid getting hit!\n"
    while $room != "controlroom"
        listener
    end
    puts "The meteors are coming from different directions.\n"
    sleep(1)
    puts "\nWhen from north, steer south, and vice versa"
    puts "\nWhen from east, steer west, and vice versa"
    sleep(5)
    #meteor 1
    puts "\neast"
    start = Time.now
    user_input = gets.chomp
    while user_input != "west"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end

    #meteor 2
    sleep(3)
    puts "north"
    start = Time.now
    user_input = gets.chomp
    while user_input != "south"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 3
    sleep(6)
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 4
    sleep(2)
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 5
    sleep(3)
    puts "west"
    start = Time.now
    user_input = gets.chomp
    while user_input != "east"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    sleep(2)
    puts "\nGood job! You made it through the meteor rain."
    if times_hit > 0
        $hit = true
    end
end

def mission9
    puts "\nSince you were hit by the meteors it seems like something is broken. Go look for it."
    while $room != "kitchen"
        listener
    end
    puts "\nThere's a weirdly-shaped hole in the wall and your food is flying out into space."
    sleep(2)
    puts "\nIs there something that you can plug the hole with?"
    user_input = gets.chomp
    while user_input != "rubberduck"
        puts "\nWrong item"
        user_input = gets.chomp
    end
    inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    while inventory_arr.include?("rubberduck\n") == false
        not_in_inventory = true
        puts "\nYou don't have a rubberduck, you should go and get it."
        while $room != "livingroom"
            listener
        end
        listener
        inventory_arr = File.readlines('programmering_projekt/inventory.txt')
    end
    if not_in_inventory
        puts "\nNow maybe you have the right item. Go back and test it."
        while $room != "kitchen"
            listener
        end
        user_input = gets.chomp
        while user_input != "rubberduck"
            puts "\nWrong item"
            user_input = gets.chomp
        end
    end
    sleep(1)
    puts "\nPerfect fit! Who knew the rubberduck would save the day?"
end

def mission10
    puts "\nThe aliens wants to test your knowledge and have sent some questions for you. \nWrite your answers in numbers."
    while $room != "controlroom"
        listener
    end
    sleep(1)
    puts "\nQuestion 1: What is the value of π (pi) rounded to two decimal places?"
    user_input = gets.chomp
    if user_input != "3.14"
        dead
    else
        puts "\nCorrect!"
    end
    sleep(2)
    puts "\nQuestion 2: What is the square root of 144?"
    user_input = gets.chomp
    if user_input != "12"
        dead
    else
        puts "\nCorrect!"
    end

    if $hit
        sleep(2)
        puts "\nQuestion 3: What is the sum of the interior angles of a rectangle?"
        user_input = gets.chomp
        if user_input != "360"
            dead
        else
            puts "\nCorrect!"
        end
        sleep(2)
        puts "\nQuestion 4: solve for x '(x-3)^2=0'"
        user_input = gets.chomp
        if user_input != "3"
            dead
        else
            puts "\nCorrect!"
        end
    end
    sleep(1)
    puts "\nThe aliens are happy with your knowledge!"
end

def mission11
    puts "You're starting to feel a little bit dizzy."
    sleep(2)
    puts "\nIt seems like the oxygen level is unusually low."
    while $room != "controlroom"
        listener
    end
    puts "The primary oxygen tank has almost run out and needs to be replaced."
    sleep(1)
    puts "\nBehind it is the spare one. \nPlug out the empty one and put them in the new tank."
    sleep(1)
    puts "There are three color coded cables that have to be plugged in in alphabetical order."
    sleep(1)
    puts "\nThe color labels have been all mixed up."
    puts "\ngrapeyinnvoko"
    sleep(1)
    puts "\nChoose which cables to re-plug (written with a space between each word):"
    user_input = gets.chomp
    i = 0
    while user_input != "navy orange pink" && i<=3
        user_input = gets.chomp
        i+=1
        if i==3
            puts "\nThe oxygen ran out..."
            dead
        end
    end
    sleep(1)
    puts "\nYou take a deep breath. The tanks have successfully been switched."
end

def mission12
    times_hit = 0
    puts "*BONK BONK*"
    sleep(1)
    puts "\nNot again!"
    puts "A new meteor rain is approaching. Prepare to steer the ship away from them!"
    while $room != "controlroom"
        listener
    end
    #meteor 1
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 2
    puts "west"
    start = Time.now
    user_input = gets.chomp
    while user_input != "east"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 3
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 4
    puts "east"
    start = Time.now
    user_input = gets.chomp
    while user_input != "west"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    #meteor 5
    puts "south"
    start = Time.now
    user_input = gets.chomp
    while user_input != "north"
        user_input = gets.chomp
    end
    stop = Time.now
    if stop-start > 10
        puts "\n*BONK*"
        sleep(0.5)
        puts "You got hit!"
        sleep(1)
        puts "Try to avoid that\n"
        times_hit +=1  
    end
    if times_hit >= 3
        puts "\nOh no! Too many meteors have damaged the ship!"
        sleep(2)
        puts "\n*KABOOM*"
        sleep(1)
        dead
    end
    if times_hit > 0
        $hit = true
    end
    puts "\nNice! You made it through another meteor rain."
    sleep(1)
    puts "\nHopefully, it was the last one."
end

def mission13
    puts "\nYou look outside the window and see a huge sphere before you."
    sleep(2)
    puts "\nWow, that must be the aliens' planet!"
    sleep(2)
    puts "\nYou have gotten a new message from the aliens."
    while $room != "controlroom"
        listener
    end
    puts "\nWe see that you are nearby now and can see our planet."
    sleep(2)
    puts "\nWhich one of the primary- or their complementary colours is our planet?"
    $color = gets.chomp
    puts "Okay..."
end

#om fel kurs
def extra_mission
    puts "Another day, another message from earth: \nIt seams like the course you set was wrong!"
    sleep(1) 
    puts "\nFortunately you get another chance by answering this equation: (x^2)^(1/2) = 4"
    user_input = gets.chomp
    if user_input == "4"
        $course_retry = true
        $course_retry_value = 4
    else
        $course_retry = false
        $course_retry_value = user_input.to_i
    end
    puts "Nice! You set the course."
end

def miss_planet
    puts "\nYou drift closer and closer to the aliens' planet, but."
    sleep(3)
    puts "\nSuddenly you realize that you set the wrong course all those days ago, and that now you won't be able to get to the aliens."
    sleep(3)
    puts "\nWhat a waste of time..."
    sleep(3)
    puts "\nYou drift off into complete darkness..."
    sleep(3)
    puts "\nAfter a few days the food runs out..."
    sleep(3)
    puts "\nSome hours after that there's no more oxygen left..."
    dead
end

def black_hole
    puts "\nThis doesn't feel right..."
    sleep(2)
    puts "\nIt almost feels like the spaceship is being pulled towards something"
    sleep(3)
    puts "\nOH NO! It's a black ho-"
    dead
end

def arrive
    puts "\nThe spaceship turns slightly as you can see the planet getting closer and closer."
    sleep(3)
    puts "\nYou have gone into orbit and start preparing to enter the atmosphere."
    sleep(3)
    puts "\n*ROAROOOMMMM!*"
    sleep(2)
    puts "\nThere's fire outside the windows as velocity increases."
    sleep(3)
    puts "\n*WHOOOOOSSHH!*"
    sleep(2)
    puts "\nThe #{$color} surface is approaching rapidly and you begin to wonder what you'll actually find down there."
    sleep(3)
    puts "\nIf you make the landing, that is."
    sleep(2)
    puts "\n*BEEP BEEP*"
    sleep(2)
    puts "\nVarious warning sounds and lights are on, but now there's nothing left do to but hope."
    if $color == "red" || $color == "yellow" || $color == "blue"
        puts "\nYes! You managed to dock on the new planet."
        sleep(3)
        puts "\nYou get ready to present yourself to the aliens."
        sleep(3)
        puts "\nYou walk out of your spaceship and go up to the aliens."
        sleep(3)
        puts "\n'Hello, I'm from planet Earth' you say."
        sleep(3)
        puts "\nBut the aliens don't respond directly..."
        sleep(3)
        puts "\nAnd they don't look very kind..."
        sleep(3)
        puts "\nAll of a sudden they grab ahold of you and drag you away from your ship!"
        sleep(3)
        puts "\nYou struggle, realising that the aliens never wanted to help you."
        sleep(3)
        puts "\nThey were only out to hurt you!"
        sleep(3)
        puts "\nAs they throw you into a cell you think about how humanity could ever be so gullible."
        dead
    elsif $color == "green"
        puts "\nYou brace for landing, waiting for the ship to slow down."
        sleep(3)
        puts "\nBut the ship is not slowing down..."
        sleep(3)
        puts "\nIt really should have slowed down by now..."
        sleep(3)
        puts "\nCRASH!!!"
        dead
    elsif $color == "orange" || $color == "purple"
        puts "\nYes! You managed to dock on the new planet."
        sleep(3)
        puts "\nYou get ready to present yourself to the aliens."
        sleep(3)
        puts "\nYou walk out of your spaceship and go up to the aliens."
        sleep(3)
        puts "\n'Hello, I'm from planet Earth' you say."
        sleep(3)
        puts "\n'Hello, we are so excited to meet you!' an alien responded warmly."
        sleep(3)
        puts "\nYou were led to a modern office and exchange knowledge that can save both the aliens and humans."
        sleep(3)
        puts "\nTHE END"
        sleep(2)
        puts "\nCredits:"
        sleep(1)
        puts "\nEllen, Stella, Klara (2B)"
    end     
end

def dead
    sleep(1)
    puts "You died."
    sleep(2)
    puts "Credits:"
    puts "Ellen, Stella, Klara (2B)"
    $game_started = false
    exit
end


def listener
    user_input = gets.chomp
    if user_input == 'eat'
        if $hungry
            if $room == "kitchen"
                eat
            else
                puts "You have to be in the kitchen to eat"
            end
        else
            puts "You can only eat when you are hungry. Otherwise you will run out of food."
        end
    elsif user_input == 'sleep'
        if $tired
            if $room == "bedroom"
                good_night
            else
                puts "You have to be in the bedroom to sleep"
            end
        else
            puts "You can only sleep when you are tired."
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
            if noun == "diary"
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
                puts "You cannot open this item. You can only open instructions."
            end
        end
    elsif user_input == "close"
        $close = true
    elsif user_input == 'q'
        exit
    end
end


while $game_started == true
    if $day==0
        intro
        listener
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 0
            listener
        end
    elsif $day==1
        mission1
        listener
        mission2
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 1
            listener
        end
    elsif $day==2
        mission3
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        $hungry = true
        while $times_eaten == 1
            listener
        end
        mission4
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 2
            listener
        end
    elsif $day==3
        if $course == false
            extra_mission
        end
        mission5
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        $hungry = true
        while $times_eaten == 2
            listener
        end
        mission6
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 3
            listener
        end
    elsif $day==4
        mission7
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        $hungry = true
        while $times_eaten == 3
            listener
        end
        mission8
        if $hit 
            mission9
        end
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 4
            listener
        end
    elsif $day==5
        mission10
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        $hungry = true
        while $times_eaten == 4
            listener
        end
        mission11
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 5
            listener
        end
    elsif $day==6
        if $hit
            mission12
        end
        puts "*Growl*... You must be hungry, go to the kitchen and eat something!"
        $hungry = true
        while $times_eaten == 5
            listener
        end
        mission13
        puts "You're beginning to feel sleepy. Head to the bedroom to sleep."
        $tired = true
        while $times_slept == 6
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