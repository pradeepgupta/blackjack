clubs = [["Jacks","11"],["Queens","12"], ["Kings", "13"],[" Aces","11","1"],["2","3","4","5","6","7","8","9","10"]]
diamonds =[["Jacks","11"],["Queens","12"], ["Kings", "13"],[" Aces","11","1"],["2","3","4","5","6","7","8","9","10"]]
hearts = [["Jacks","11"],["Queens","12"], ["Kings", "13"],[" Aces","11","1"],["2","3","4","5","6","7","8","9","10"]]
spades = [["Jacks","11"],["Queens","12"], ["Kings", "13"],[" Aces","11","1"],["2","3","4","5","6","7","8","9","10"]]

cards = [clubs,diamonds,hearts,spades]
random = rand(cards.length)

puts "What is Player name?"
name1 = gets.chomp

puts "#{name1} Please Hit to draw your two cards"
puts "Press Hit to play the game"
puts "Press quit to quit the game"

response = gets.chomp.downcase

while response == "hit"

puts "Your Cards:" + random

end