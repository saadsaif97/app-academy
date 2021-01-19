class Hangman
  attr_reader :secret_word ,:guess_word, :attempted_chars, :remaining_incorrect_guesses

  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    (DICTIONARY).sample
  end
  
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
    @game_over = false
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    return [] if !@secret_word.include?(char)
    matching_indices = []
    @secret_word.each_char.with_index { |el,i| char == el ? matching_indices << i : nil }
    matching_indices
  end

  def fill_indices(char,indices_array)
    indices_array.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)

    if self.already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char

    matching_indices = self.get_matching_indices(char)
    if matching_indices.empty?
      @remaining_incorrect_guesses -= 1
    else
      self.fill_indices(char, matching_indices)
    end

    true
  end

  def ask_user_for_guess
    print "Enter a char: "
    entered_char = gets.chomp
    try_guess(entered_char)
  end

  def win?
    if @guess_word.join == @secret_word
      puts "YOU WIN"
      return true
    else
      return false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "YOU LOSE"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      puts "The secret word was: " + @secret_word
      return true
    else
      return false
    end
  end

end
