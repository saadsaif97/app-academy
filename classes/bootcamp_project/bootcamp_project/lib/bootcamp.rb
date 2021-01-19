require("byebug")
class Bootcamp

   def initialize(name,slogan,student_capacity)
      @name = name
      @slogan = slogan
      @student_capacity = student_capacity
      @teachers = []
      @students = []
      @grades = Hash.new { |hash,k| hash[k] = [] }
   end

   # getters
   def name
      @name
   end

   def slogan
      @slogan
   end

   def teachers
      @teachers
   end

   def students
      @students
   end

   # methods
   def hire(teacher)
      @teachers << teacher
   end

   def enroll(student)
      if (@students.length < @student_capacity)
         @students << student
         return true
      elsif (@students.length == @student_capacity)
         return false
      end
   end

   def enrolled?(student)
      @students.map(&:downcase).include? student.downcase
   end

   def student_to_teacher_ratio
      (@students.length / @teachers.length).round
   end

   def add_grade(student,grade)
      if (self.enrolled?(student))
         @grades[student] << grade
         return true
      else
         return false
      end
   end

   def num_grades(student)
      self.enrolled?(student) ? @grades[student].length : "Student is not enrolled in the bootcamp"
   end

   def average_grade(student)
      if (!self.enrolled?(student) || self.num_grades(student).zero?)
         nil
      elsif (self.enrolled?(student))
         (@grades[student].sum / @grades[student].length).round
      end
   end

end

codecademy = Bootcamp.new("codecademy","Everyone can learn",6)

codecademy.hire("Ali")
codecademy.hire("Nouman")
codecademy.hire("Haris")

codecademy.enroll("student 1")
codecademy.enroll("student 2")

codecademy.add_grade("Student 1",90)
codecademy.add_grade("Student 1",80)

p codecademy
p codecademy.average_grade("Student 1")
p codecademy.num_grades("Student 1")
