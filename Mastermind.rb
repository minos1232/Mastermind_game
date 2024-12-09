#Mastermind game  
class Mastermind
  attr_accessor :game_colors , :color_choices
  def initialize
    @game_colors = ['red','blue','green','purple','yellow','orange']
    @color_choices= Array.new 
    for i in 0...4 do
      color_choices[i] = game_colors.sample
    end
  end

  def player_guess
    colors_guess = Array.new
    for i in 1...5 do 
      puts "guess color number #{i}"
      while true
        guess = gets.chomp
        if game_colors.any?(guess)  #verify if the color you guessed exists and correct
          colors_guess [i-1] = guess
          break
        else
          puts "invalid color! try again."
        end
      end 
    end
  end
end

game = Mastermind.new
game.player_guess
