#Mastermind game  
class Mastermind
  attr_accessor :game_colors , :color_choices, :colors_guess
  def initialize
    @game_colors = ['red','blue','green','purple','yellow','orange']
    @color_choices= Array.new
    @colors_guess= Array.new
    for i in 0...4 do
      color_choices[i] = game_colors.sample
    end
  end

  def player_guess
    #colors_guess = Array.new
    for i in 1...5 do 
      puts "guess color number #{i}"
      while true
        guess = gets.chomp
        if game_colors.any?(guess)  #verify if the color you guessed exists and correct
          colors_guess[i-1] = guess
          break
        else
          puts "invalid color! try again."
        end
      end 
    end
  end

  def winner_checker
    colors_checker = color_choices.dup
    correct_guess = 0
    half_correct_guess = 0 #correct color but wrong position
    for i in 0...4
      if colors_guess[i] == colors_checker[i]
        correct_guess += 1
        colors_checker[i] ='checked'
      end
    end
    for i in 0...4
      for j in 0...4
        if colors_guess[i] == colors_checker[j]
            half_correct_guess += 1
            colors_checker[j] = 'checked'
        end
      end
    end
    puts "you have #{correct_guess} correct in right position and #{half_correct_guess} correct but in a wrong position"
  end
 def play
   player_guess
   winner_checker
 end
end

game = Mastermind.new
game.play
