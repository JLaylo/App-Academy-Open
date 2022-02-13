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
        salaries.has_key?(title)
    end

    def > (startup)
        self.funding > startup.funding
    end

    def hire(name, title)
        if valid_title?(title)
            new_hire = Employee.new(name, title)
            employees << new_hire
        else
            raise "invalid title"
        end
    end

    def size
        employees.length   
    end

    def pay_employee(employee)
        pay_amt = salaries[employee.title]
        if funding >= pay_amt
            employee.pay(pay_amt)
            @funding -= pay_amt
        else
            raise "not enough funding"
        end
    end

    def payday
        employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        sum = 0
        employees.each { |employee| sum += salaries[employee.title] }
        sum / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        @employees += startup.employees
        
        startup.salaries.each do |k,v|
            if !salaries.has_key?(k)
                @salaries[k] = v
            end
        end

        startup.close
    end
end
