class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"
    db.execute(sql, name, type)
  end
  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id=?"
    array = db.execute(sql, id).flatten
    Pokemon.new(id: array[0], name: array[1], type: array[2], hp: array[3], db: db)
    # binding.pry
  end
end
