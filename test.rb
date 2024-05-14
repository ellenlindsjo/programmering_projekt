def grab_item(item)
    if File.readlines("programmering_projekt/inventory.txt").length <= 4 && !File.readlines("programmering_projekt/inventory.txt").include?(item + "\n")
        File.open("programmering_projekt/inventory.txt", "a"){|f| f.write(item,"\n")}
    else
        puts "Your inventory is full."
    end
end
grab_item("halloj")