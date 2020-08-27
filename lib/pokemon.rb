class Pokemon

attr_accessor :id, :name, :type, :db

def initialize(id:, name:, type:, db:)
    @id = id 
    @name = name
    @type = type
    @db = db
end

def self.save(name, type, db)
 
sql = "

INSERT INTO pokemon (name, type)
VALUES (?, ?)
"
# binding.pry
db.execute(sql, name, type)

@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]

end



def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL
 
    db.execute(sql, id).map do |row|
       # binding.pry
      new_from_db(row, db)
    end.first
  end



  def self.new_from_db(row, db)

    new_song = self.new(id: row[0], name: row[1], type: row[2], db: db)
    # self.new is the same as running Song.new
    #binding.pry
    #new_song.id = row[0]
    #new_song.name =  row[1]
    #new_song.type = row[2]
    #new_song  # return the newly created instance
  end







end