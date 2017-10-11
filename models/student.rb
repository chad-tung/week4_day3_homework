require_relative "../db/sql_runner"

class Student

    attr_accessor :first_name, :last_name, :house, :age
    attr_reader :id

    def initialize(options)
        @first_name = options['first_name']
        @last_name = options['last_name']
        @house = options['house']
        @age = options['age'].to_i
        @id = options['id'].to_i if options['id']
    end

    def save()
        sql = "INSERT INTO students (first_name, last_name, house, age) VALUES ($1, $2, $3, $4) RETURNING id;"
        values = [@first_name, @last_name, @house, @age]
        @id = SqlRunner.run(sql, values).first['id'].to_i
    end

    def self.delete_all()
        sql = 'DELETE FROM students;'
        values = []
        SqlRunner.run(sql, values)
    end

    def update()
        sql = 'UPDATE students SET (first_name, last_name, house, age) VALUES ($1, $2, $3, $4) WHERE id = $5;'
        values = [@first_name, @last_name, @house, @age, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = 'DELETE FROM students WHERE id = $1;'
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = 'SELECT * FROM students;'
        values = []
        students = SqlRunner.run(sql, values)
        return students.map { |student| Student.new(student) }
    end

    def self.find(id)
        sql = 'SELECT * FROM students WHERE id = $1'
        values = [id]
        student = SqlRunner.run(sql, values).first()
        return Student.new(student)
    end

end
