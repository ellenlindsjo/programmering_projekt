def grab_item(item)
    File.open("programmering_projekt/inventory.txt", "a"){|f| f.write(item)}
end


item = "tabort"
item2 = "fesk"

#grab_item(item)
#grab_item(item2)
#drop_item(item)

def write_diary
    puts "What do you want to write?"
    prompt = gets.chomp
    File.open("programmering_projekt/diary.txt", "a"){|f| f.write(prompt,"\n")}
end

write_diary
