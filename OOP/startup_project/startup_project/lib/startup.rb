require "employee"

class Startup
   attr_reader :name, :salaries, :employees, :funding

   def initialize(name,funding,salaries = { 'title' => 'salaries' })
      @name = name
      @funding = funding
      @salaries = salaries
      @employees = []
   end

   # methods

   def valid_title?(title)
      @salaries.has_key?(title) ? true : false
   end

   def >(startup)
      self.funding > startup.funding
   end

   def hire(employee_name,title)
      raise "Not valid title" if !self.valid_title?(title)

      @employees << Employee.new(employee_name,title)
   end

   def size
      @employees.length
   end

   def pay_employee(employee)
      amount = self.salaries[employee.title]
      raise "Don't have sufficient funds to pay the employee" if @funding < amount

      employee.pay(amount)
      @funding -= amount
   end

   def payday
      @employees.each { |employee| self.pay_employee(employee) }
   end

   def average_salary
      total_salary_amount = 0
      @employees.each { |employee| total_salary_amount += self.salaries[employee.title] }
      total_salary_amount/@employees.length
   end

   def close
      @employees = []
      @funding = 0
   end

   def acquire(startup)
      @funding += startup.funding
      # @salaries.merge(startup.salaries) { |key, old, new| old }
      startup.salaries.each do |title,amount|
         if !@salaries.has_key?(title)
            @salaries[title] = amount
         end
      end
      @employees = [*self.employees, *startup.employees]
      startup.close
   end
end
