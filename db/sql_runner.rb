require 'pg'

class SqlRunner
    def self.run(sql, values)
        db = PG.connect({dbname: 'hogwarts', host: 'localhost'})
        db.prepare('query', sql)
        result = db.exec_prepared('query', values)
        db.close()
        return result
    end
end
