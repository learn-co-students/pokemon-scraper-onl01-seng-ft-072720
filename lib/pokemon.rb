class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(name:, type:, id: , db:)
        @name = name
        @type = type
        @id = id
        @db = db
    end

    def self.save(name, type , db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL
        
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon 
        WHERE id = ?
        SQL

        result = db.execute(sql, id)[0]
        Pokemon.new(name: result[1], type: result[2], id: result[0], db: db) 
    
    end
end
