class Pokemon
  attr_accessor :name, :type, :id, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db: db)
    end
    results[0]
  end

end
