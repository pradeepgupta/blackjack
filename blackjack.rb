# Interactive command line blackjack game


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

@dealertotal = calculate_total(dealercards)
@mytotal = calculate_total(mycards)

# Show Cards

puts "Dealer has: #{dealercards[0]} and #{dealercards[1]}, for a total of #{@dealertotal}"
puts "You have: #{mycards[0]} and #{mycards[1]}, for a total of: #{@mytotal}"

if @mytotal == 21
	puts "you win"
end

if @dealertotal == 21
	puts " Dealer win"
end

until @mytotal == 21 || @dealertotal == 21  # For My Turn

   if @mytotal > 21
		puts "You lost the game"
		break

	 elsif @mytotal == 21
		puts "You win the game"
		break

	 elsif @mytotal < 21
		                    puts "What would you like to do? 1) hit 2) stay"
                        hit_or_stay = gets.chomp
                 
                 if hit_or_stay == "hit"
                    mynewcards = []
        	          mynewcards << deck.pop
        	          @mytotal += calculate_total(mynewcards)
                    puts "#{@mytotal}"
        	 
        	            if @mytotal == 21
        	 	             puts " you win"
        	 	             break
        	 
        	           elsif @mytotal > 21
        	 	            puts " you loose"
        	 	            break
                      else @mytotal < 21
                        puts
                      end
        	 
        	        else 
                    puts "your points are: #{@mytotal}"
                    break
                end
                
    else
        puts ""
        break
	 end
end
@mytotal

until (@mytotal == 21 || @dealertotal == 21)  # for dealer
 
  puts "Now Dealers turn"
  puts " Dealer you should hit until you got 17, Now Press Hit"
        hit_or_stay = gets.chomp.downcase

        if hit_or_stay == "hit"
          
            
            newdealercards = []
            newdealercards << deck.pop
            @dealertotal += calculate_total(newdealercards)
            
            puts "#Dealers points are :{@dealertotal}"
            comparison = @dealertotal <=> @mytotal
              
              if comparison == -1.to_i
                puts "You win"
                
                elsif comparison == 0.to_i
                   puts " Tie"
                
              else comparison == 1.to_i
                 if @dealertotal > 21
                   puts " Dealer bust and you win"
                 else
                  puts "Dealer win"
                end
              end
            
        else
            puts " please press correct hit word"
        end
     break 
end
