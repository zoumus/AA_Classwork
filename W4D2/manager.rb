require_relative "employee.rb"
class Manager < Employee

    attr_accessor :employees, :salary
    
    
    def initialize(name, title, salary, boss=nil)
        super
        @employees = []
    end

    def bonus(multiplier)
        # return self.salary if self.is_a?(Employee)
       
        total_salary = 0
        self.employees.each do |emp|
            if emp.is_a?(Manager)
                total_salary += emp.bonus(multiplier) + emp.salary
            else
                total_salary += emp.salary
            end
        end
        total_salary * multiplier
    end
end

manager1 = Manager.new("bob", "boss", 1000000, nil)
manager2 = Manager.new("bob", "boss", 1000000, manager1)
employee1= Employee.new("asriel", "emp", 10000, manager1)
employee2= Employee.new("jeff", "emp", 10000, manager1)
employee3= Employee.new("gordy", "emp", 10000, manager1)
employee4= Employee.new("jimmer", "emp", 10000, manager1)
employee5= Employee.new("jimmer", "emp", 10000, manager2)
manager1.employees = [manager2, employee1, employee2, employee3, employee4]
manager2.employees = [employee5]
p manager1.bonus(5)

# employee1 = Employee.new()
# employee1.is_a?(Manager)