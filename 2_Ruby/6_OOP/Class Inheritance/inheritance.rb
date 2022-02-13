class Employee
    attr_reader :salary, :name
    
    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        bonus = @salary * multiplier
        puts bonus
    end
end

class Manager < Employee
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees
    end

    def employee_salary_sum
        sum = 0
        @employees.each do |employee|
            if employee.is_a?(Manager)
                sum += employee.employee_salary_sum + employee.salary
            else
                sum += employee.salary
            end
        end
        sum
    end

    def bonus(multiplier)
        employees_salary = self.employee_salary_sum
        bonus = employees_salary * multiplier
        puts bonus
    end
end

shawna = Employee.new("shawna", "ta", 12000, "darren")
david = Employee.new("david", "ta", 10000, "darren")
darren = Manager.new("darren", "ta manager", 78000, "ned", [shawna, david])
ned = Manager.new("ned", "founder", 1000000, nil, [darren])

ned.bonus(5) # => 500_000
darren.bonus(4) # => 88_000
david.bonus(3) # => 30_000