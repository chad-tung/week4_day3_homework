require_relative '../db/sql_runner'

class House

    attr_accessor :name, :logo
    attr_reader :id
    
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @logo = options['logo']
    end

    def save()
        sql = "INSERT INTO houses (name, logo) VALUES ($1, $2) RETURNING id;"
        values = [@name, @logo]
        @id = SqlRunner.run(sql, values).first()['id'].to_i
    end

    def update()
        sql = "UPDATE houses SET (name, logo) VALUES ($1, $2) WHERE id = $3;"
        values = [@name, @logo, @id]
        SqlRunner.run(sql, values)
    end

    def self.delete_all()
        sql = "DELETE FROM houses;"
        values = []
        SqlRunner.run(sql, values)
    end

    def self.all()
        sql = "SELECT * FROM houses;"
        values = []
        results = SqlRunner.run(sql, values)
        return results.map { |house| House.new(house) }
    end

    def self.find(id)
        sql = "SELECT * FROM houses WHERE id = $1;"
        values = [id]
        result = SqlRunner.run(sql, values).first()
        return House.new(result)
    end

end
