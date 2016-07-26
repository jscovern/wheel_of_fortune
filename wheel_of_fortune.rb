class WheelOfFortune
  def initialize (hash)
    p "Happy coding!"
    @theme = hash[:theme]
    @phrase = hash[:phrase]
    @guesses = []
    @phrase_with_guesses = []
  end

  attr_reader :theme

  def to_s
    @phrase_with_guesses = []
    guess_iterator = 0
    char_found = false
    if @guesses.length === 0
      for phrase_iterator in 0..@phrase.length - 1 do
        if @phrase[phrase_iterator] == " "
          @phrase_with_guesses.push(" ")
        else
          @phrase_with_guesses.push("_")
        end
      end
    else
      for phrase_iterator in 0..@phrase.length - 1 do
        char_found = false
        guess_iterator = 0
        while guess_iterator < @guesses.length && !char_found do
          if @phrase[phrase_iterator] == " "
            @phrase_with_guesses.push(" ")
            char_found = true
          elsif  @phrase[phrase_iterator].downcase === @guesses[guess_iterator].downcase
            @phrase_with_guesses.push(@phrase[phrase_iterator])
            char_found = true
          elsif guess_iterator === @guesses.length - 1
            @phrase_with_guesses.push("_")
            char_found = true
          end
          guess_iterator+=1
        end
      end
    end
    return @phrase_with_guesses.join("")
  end

  def can_i_have?(input)
    character_iterator = 0
    char_found = false
    @guesses.push(input)
    while character_iterator < @phrase.length && !char_found do
      if @phrase[character_iterator].downcase == input.downcase
        char_found = true
        return true
      end
      character_iterator+=1
    end
    return false
  end

  def game_over?
    correct_counter = 0
    phrase_length = 0
    for i in 0..@phrase.length-1 do
      if @phrase[i] != " "
        phrase_length += 1
        @guesses.each do |guess|
          if @phrase[i].downcase == guess.downcase
            correct_counter += 1
          end
        end
      end
    end
    return correct_counter >= phrase_length
  end

  def guesses
    @guesses
  end
end


# Checks to see if we executed this file from the command-line
# e.g. `ruby simple_jepordy.rb`
if __FILE__ == $0

  # DRIVER CODE
  j = WheelOfFortune.new( {theme: "card games", phrase: "Go fish"} )
  j.can_i_have?("g")
  j.can_i_have?("o")
  j.can_i_have?("f")
  j.can_i_have?("i")
  j.can_i_have?("s")
  j.can_i_have?("h")
  puts j.to_s
  puts "Go fish"
  puts "checking if should be done #{j.to_s == 'Go fish'}"
  puts "checking if game is over #{j.game_over?}"
  p j
  puts j # calls j.to_s

end
