#variables
$day = 0
$health = 100
$problems_solved = []

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
        puts "Move around the spaceship using words like 'walk', 'grab', 'drop'. The first word is the verb and the last verb is the object affected. For example: 'walk bedroom' and 'walk to the bedroom' will take you to the bedroom. 'grab pen' adds 'pen' to your inventory. 'drop pen' removes 'pen' from your inventory."
        puts "Enter 'i' to open inventory"
        $day += 1
    elsif continue == "q"
        exit
    end
end


def main
    
end

def open_inventory
    File.readlines("inventory.txt")
end

#Ibland har vi $verb och ibland verb, samma sak med noun
def action_verb(prompt)
    arr = prompt.split
    $verb = arr[0]
    if $verb == "walk"
        return "walk"
    elsif $verb == "drop"
        return "drop"
    elsif $verb == "grab"
        return "grab"
    elsif $verb == "read"
        return "read"
    elsif $verb == "write"
        return "write"
    elsif $verb == "show"
        return "show"
    else 
        #fel input
    end
end

#Vi måste lägga in alla items som vi använder här i
def action_noun(prompt)
    arr = prompt.split
    $noun = arr[arr.length-1]
    if $noun == "bedroom"
        return "bedroom"
    elsif $noun == "kitchen"
        return "kitchen"
    elsif $noun == "bathroom"
        return "bathroom"
    elsif $noun == "controlroom"
        return "controlroom"
    elsif $noun == "livingroom"
        return "livingroom"
    elsif $noun == "map"
        return "map"
    elsif $noun == "diary"
        return "diary"
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
    sleep(3)
    puts "Zzz"
    sleep(3)
    puts "Zzz"
    sleep(3)
    $day += 1
    puts "Good morning!!"
end

def eat
    puts "Nom nom..."
    sleep(3)
    puts "Yum!"
    sleep(2)
    $health = 100
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
        end
    elsif user_input == 'q'
        exit
    end

end


update do 
    listener
    if $day==0
        intro
        listener
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
    elsif $day==1
        #Problem1
        
        #Problem2
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
    elsif $day==2
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."

    elsif $day==3
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
        
    elsif $day==4
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
        
    elsif $day==5
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
        
    elsif $day==6
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
        
    elsif $day==7
        puts "You’re beginning to feel sleepy. Head to the bedroom to sleep."
    end
end
