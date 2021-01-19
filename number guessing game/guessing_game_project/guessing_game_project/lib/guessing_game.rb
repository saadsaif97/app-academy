class GuessingGame
   def initialize(min,max)
      @secret_num = rand(min...max)
      @num_attempts = 0
      @game_over = false
   end

   def game_over?
      @game_over
   end

   def num_attempts
      @num_attempts
   end

   def check_num(num)
      @num_attempts+=1

      if num < @secret_num
         puts "Too small"
      elsif num > @secret_num
         puts "Too big"
      elsif num == @secret_num
         @game_over = true
      end
   end

   def ask_user
      print "Enter a number: "
      self.check_num(gets.chomp.to_i)
   end

end
