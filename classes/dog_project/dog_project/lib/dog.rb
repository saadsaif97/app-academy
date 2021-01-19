class Dog
   def initialize(name,breed,age,bark,favorite_foods)
      @name = name
      @breed = breed
      @age = age
      @bark = bark
      @favorite_foods = favorite_foods 
   end

   # getters
   def name
      @name
   end

   def breed
      @breed
   end

   def age
      @age
   end

   def bark
      @age <= 3 ? @bark.downcase : @bark.upcase
   end

   def favorite_foods
      @favorite_foods
   end

   # setters
   def age=(num)
      @age = num
   end

   # instance methods
   def favorite_food?(food)
      @favorite_foods.map(&:downcase).include? food.downcase
   end
end
