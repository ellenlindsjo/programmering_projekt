#variables
$day = 0


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
        puts "As the rocket takes off, you think back on the mission you were given. The survival of humanity is in your hands."
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

def action_verb(prompt)
    arr = prompt.split
    $verb = arr[0]
    if $verb == "walk"
        return "walk"
    elsif $verb == "drop"
        return "drop"
    elsif $verb == "grab"
        return "grab"
    else 
        #fel input
    end
end

def action_noun(prompt)
    arr = prompt.split
    $noun = arr[arr.length-1]
    if $noun == "bedroom"
        return "bedroom"
    elsif 
end

def grab_item(item)
    f = File.open('inventory.txt', 'a')
    f.write('item')
    f.close 
end

def drop_item(item)

end

def walk_to(destination)
    $room = destination
end

def listener
    if gets.chomp == 'eat'
        eat()
    end
    if gets.chomp == 'sleep'
        good_night()
    end
    if gets.chomp == 'q'
        exit
    end

end

update do 
    listener
    if $day==0
        intro
    elsif $day==1

    elsif $day==2

    elsif $day==3
        
    elsif $day==4
        
    elsif $day==5
        
    elsif $day==6
        
    elsif $day==7

    end
end

#hjälpfunktioner