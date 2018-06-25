class Employee
  
  def initialize(name, title, salary, boss=nil)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end 
  
  def bonus(multiplier)
    bonus = salary * multiplier
  end
  
  attr_reader :salary 
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees = [])
    @employees = employees
    super(name, title, salary, boss)
  end
  
  def bonus(multiplier)
    bonus = 0
    self.employees.each do |employee|
      bonus += employee.salary
    end
    bonus *= multiplier
  end 
  
  # private
  attr_reader :employees
end  


if $PROGRAM_NAME == __FILE__
  terry = Manager.new("terry", "bigboss", 1_000, nil, [mark = Employee.new("mark", "slave", 1, terry)])
end
