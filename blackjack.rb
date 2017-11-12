user_add_up = 0
croupier_add_up = 0
user_won = false
user_lost = false
initial_money = 50
card = ""

def which_card(number)
  #Assign card from value
  card = ''
    if number == 13
      card = 'K'
      elsif number == 12
      card = 'Q'
      elsif number == 11
      card = 'J'
      elsif number == 1
      card = 'A'
    else
      card = number.to_s
    end
    return card
end

def points(number, addition)
  points = 0
  total_score = number + addition
    if (number >= 11)
      points = 11
      elsif (number == 1)&&(total_score <= 21)
        points = 11
          elsif(number == 1)&&(total_score > 21)
          points = 1
        else
        points = number
    end
  return points
end

#Loop that prompts the user to bet
loop do
puts 'New Black Jack game. You have $' + initial_money.to_s + '. Place your bet!'
this_bet = gets.chomp!.to_i
  if this_bet > initial_money
    puts "You cannot bet with money you don't have, this is a Casino, not the government"
    next
      if this_bet < 1
        puts 'Minimum bet is $1'
      next
      end
  end
    #Loop that asks user to draw cards or stay with their cards
    loop do
      puts "Draw (d) or stay (s)"
      user_input = gets.chomp!
      
      if (user_input != 'd')&&((user_input != 's'))
        puts 'Invalid. Enter "d" or "m"'
        next
      end
      
      #Add up 
      if user_input == 'd'
         user_card = rand(1..13)
         
        user_random = points(user_card, user_add_up)
        card = which_card(user_card)
        
        #add up points
        user_add_up += user_random
        if user_add_up > 21
          puts 'You passed 21 by drawing '+ card + ' and adding '+ user_add_up.to_s + ' points'
          user_lost = true
          user_won = false
          break
        else
          puts 'You drew ' + card + '. You add-up ' + user_add_up.to_s + " points."
          next
        end
      else #if selection was 's'
        break
      end
      
    end
    
    #If user didn't loose while withdrawing then it's the croupiers turn
    if (user_lost == false)
    #Croupier turn
    puts 'Croupiers turn'
      loop do
      puts "press d to draw"
      draw = gets.chomp!
        if draw == 'd'
          # Evaluate if add up is bigger than user's
            if croupier_add_up > 21 #evaluate if it's bigger than 21
              puts 'The croupier passed 21'
              user_won = true
              break
            end
            
            #random number for Croupier
            croupier_card = rand(1..13)
            croupier_random = points(croupier_card, croupier_add_up)
            card = which_card(croupier_card)
            
            croupier_add_up += croupier_random
            if croupier_add_up > 21
              puts 'Croupier drew '+ card +' and passed 21'
              user_won = true
              user_lost = false
              break
            elsif croupier_add_up > user_add_up
              puts 'Croupier beats player with ' + croupier_add_up.to_s + ' points.'
              user_won = false
              user_lost = true
              break
            elsif (croupier_add_up == 21) && (user_add_up == 21)
              'Croupier drew ' + card
              user_won = false
              user_lost = false
              break
                else
                  puts 'Croupier drew ' + card + '. He adds-up ' + croupier_add_up.to_s + " points."
                  next
            end
            
      
        elsif draw != 'd'
          puts 'Invalid. Enter "d"'
          next
        end
      end
    
    end
    
    
    #Conditionals that communicate the results of the game
    if user_lost == true
      puts 'The house wins!'
      initial_money -= this_bet
    elsif user_lost = false && user_won == false
      puts "Both drew with 21!"
    else
       puts 'Player wins!'
       initial_money += this_bet
    end

#Conditional that ends the game if the player is out of money
if initial_money <= 0
puts 'You ran out of money to bet'
break
end

#Reset variables
user_add_up = 0
croupier_add_up = 0
user_won = false
user_lost = false
card = ""

end #End global loop
