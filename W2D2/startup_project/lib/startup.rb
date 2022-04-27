require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(second_startup)
        self.funding > second_startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "title is invalid"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        money_topay = @salaries[employee.title]

        if @funding >= money_topay
            employee.pay(money_topay)
            @funding -= money_topay
        else
            raise "not enough money"
        end
    end

    def payday
        @employees.each do|employee|
            self.pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum / @employees.length * 1.0
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(third_startup)
        @funding += third_startup.funding
        
        third_startup.salaries.each do |title, salary|
            if !@salaries.has_key?(title)
                @salaries[title] = salary
            end
        end
        @employees += third_startup.employees
        third_startup.close()
    end

end
