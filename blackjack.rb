# BlaclJack Procedural Game Written By Pradeep Gupta
# Version 1.0.0

# Method to calculate Total
def calculate_total(cards) 
  # [['H', '3'], ['S', 'Q'], ... ]
  arr = cards.map{|e| e[1] }

  total = 0
  arr.each do |value|
    if value == "A"
      total += 11
    elsif value.to_i == 0 # J, Q, K
      total += 10
    else
      total += value.to_i
    end
  end

  #correct for Aces
  arr.select{|e| e == "A"}.count.times do
    total -= 10 if total > 21
  end

  total
end

# Start Of Game
puts "Welcome to Blackjack!"

suits = ['H', 'D', 'S', 'C']
cards = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

deck = suits.product(cards)
deck.shuffle!

# Deal Cards

mycards = []
dealercards = []

mycards << deck.pop
dealercards << deck.pop
mycards << deck.pop
dealercards << deck.pop

dealertotal = calculate_total(dealercards)
mytotal = calculate_total(mycards)

# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{mytotal}"

# Check for existing points 

if mytotal == 21
  puts "you win"
  exit
end

if dealertotal == 21
	puts " Dealer win"
  exit
end

# Player Turn
while mytotal < 21

  puts "What would you like to do? 1) hit 2) stay"
  hit_or_stay = gets.chomp.downcase

                 
  if hit_or_stay == "hit"
    
    new_card = deck.pop
    puts "Dealing card to player: #{new_card}"
    mycards << new_card
    mytotal = calculate_total(mycards)
    puts "# My news card is #{mycards} and New total is: #{mytotal}"
           
    if mytotal == 21
      puts " you got BlackJack and Dealer lost the game!"
      exit
           
    elsif mytotal > 21
      puts " you loose the game and dealer win the game!"
      exit

    else mytotal < 21
      next
    end
           
  else hit_or_stay == "stay"
    puts "your points are: #{mytotal} and now dealer's turn.."
    break
  end
end

# Dealer Turn
while dealertotal < 17
 
  puts "Now Dealers turn.."
  puts "Press hit to proceed the game.."
  hit_or_stay = gets.chomp.downcase
  puts " Dealer press hit "

  if hit_or_stay == "hit"
          
    new_card = deck.pop
    puts "Dealing new card for dealer: #{new_card}"
    dealercards << new_card
    dealertotal = calculate_total(dealercards)
            
    puts "Dealers new card is #{dealercards} and new points are : #{dealertotal}"

    if dealertotal == 21
      puts "Sorry, dealer hit blackjack. You lose."
      exit
    elsif dealertotal > 21
      puts "Congratulations, dealer busted! You win!"
      exit
    end
            
  else
    puts " please press correct hit word"
    next
  end
end

# Comparison of both dealer and players points
comparison = dealertotal <=> mytotal
              
if comparison == -1.to_i
  puts "You win"
  exit
                
elsif comparison == 0.to_i
  puts " Tie"
  exit
                
else comparison == 1.to_i
  if dealertotal > 21
    puts " Dealer bust and you win"
    exit
  else
    puts "Dealer win and you bust"
    exit
  end
end

exit