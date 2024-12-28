#Mastermind game
class Mastermind
  attr_accessor :game_colors , :color_choices, :colors_guess
  def initialize(choice)
    @game_colors = ['red','blue','green','purple','yellow','orange']
    @color_choices= Array.new
    @colors_guess= Array.new
    if choice == 1
      @color_choices = guesser_start
    else
      @color_choices = creator_start
    end
  end

  def player_guess
    for i in 1...5 do 
      puts "guess color number #{i}"
      while true
        guess = gets.chomp
        if @game_colors.any?(guess)  #verify if the color you guessed exists and correct
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
    @correct_guess = 0
    half_correct_guess = 0 #correct color but wrong position
    for i in 0...4
      if colors_guess[i] == colors_checker[i]
        @correct_guess += 1
        colors_checker[i] ='checked'
      end
    end
    for i in 0...4
      for j in 0...4
        if @colors_guess[i] == colors_checker[j]
            half_correct_guess += 1
            colors_checker[j] = 'checked'
        end
      end
    end
    puts "you have #{@correct_guess} correct in right position and #{half_correct_guess} correct but in a wrong position"
  end

  def winner?
    winner_checker
    if @correct_guess == 4   
      return true
    else
      return false
    end
  end

  def play
    guess_number = 0
    while guess_number <= 12
      guess_number += 1
      puts "guess number #{guess_number} :"
      player_guess
      if winner?
        puts "you won in #{guess_number} guesses, you are a mastermind!"
        break
      end
    end
    if guess_number > 12
      puts "you used all your guess chances, you lost\nThis was the answer"
      puts color_choices
    end
  end

  private
  def guesser_start
    guesser_array = []
    for i in 0...4 do
      guesser_array[i] = game_colors.sample
    end
    return guesser_array
  end

  def creator_start
  loop do
    puts"enter the 4 colors the computer has to guess,here is an example: red green blue purple"
    creation= gets.chomp.split
      if creation.size == 4 && creation.all? { |word| @game_colors.include?(word)}
        return creation
      else
        puts "Error!"
      end
    end
  end
end

puts "Hello!\nif you want be the guesser enter 1\nif you want to be the creator enter 2"
choice = nil
loop do
  choice = gets.chomp.to_i
  if choice == 1 || choice == 2
    break
  else
    puts "Error! Enter 1 if you want be the guesser enter and 2 if you want to be the creator"
  end
end
game = Mastermind.new(choice)
game.play