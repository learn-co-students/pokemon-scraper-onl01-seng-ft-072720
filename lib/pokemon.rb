class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO db (name, type)
    VALUES (?,?,?)
    SQL
    db.execute(sql, name, type)
    self.id = db[:conn].execute("SELECT last_insert_rowid() FROM pokemon")
  end

  def self.find(id)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL
    db.execute(sql, self.id).map do |instance|
        Pokemon.new_from_db(instance)
    end

  end
