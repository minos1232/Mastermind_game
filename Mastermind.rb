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

  def play
    puts color_choices
  end
end
game = Mastermind.new
game.play
