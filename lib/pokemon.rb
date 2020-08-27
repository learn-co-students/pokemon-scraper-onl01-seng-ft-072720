require 'pry'
class Pokemon
  attr_accessor  :id, :name, :type, :db 

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL 
    INSERT INTO Pokemon (name, type) VALUES (?,?);
    SQL
    
    db.execute(sql,name,type)
  end 
  
  def self.find(id, db)
     
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = ?;
    SQL
    
    found_poke = db.execute(sql,id).flatten 
    Pokemon.new(id: found_poke[0], name: found_poke[1], type: found_poke[2], db: db )
  end 


end
