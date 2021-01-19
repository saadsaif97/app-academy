# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
   def span
      return nil if self.length.zero?
      self.max - self.min
   end

   def average
      return nil if self.length.zero?
      (self.map(&:to_f).sum / self.length).to_f
   end

   def median
      return nil if self.length.zero?
      oddMid = (self.length/2)
      evenFirst = (self.length/2) -1
      evenSecond = (self.length/2)
      self.length.even? ? self.sort[evenFirst..evenSecond].average : self.sort[oddMid]
   end

   def counts
      counts = Hash.new(0)
      self.each { |el| counts[el]+=1 }
      return counts
   end

   def my_count(num)
      counter = 0
      self.each { |el| el==num ? counter+=1 : nil }
      counter
   end
   
   def my_index(num)
      (0...self.length).each do |index|
         if (self[index] == num)
            return index
         end
      end
      return nil
   end

   def my_uniq
      already_seen = []
      self.each { |el| !already_seen.include?(el) ? already_seen << el : nil }
      already_seen
   end

   def my_transpose
      transposed = []
      self.each_with_index do |el1, i|
         row = []
            self.each_with_index do |el2, j|
               row << self[j][i]
            end
         transpose << row
      end
      transpose
   end

end

p [ [00,01,02], [10,11,12], [20,21,22] ].my_transpose
# [ [00,10,20], [01,11,21], [02,12,22] ]

# p [1,2,3,4].median
# p [1,2,3,4,5].median