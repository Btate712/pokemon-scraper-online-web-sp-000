class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(arguments)
    arguments.each { |key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    values = db.execute("SELECT id, name, type FROM pokemon WHERE id = #{id}")
    arguments = { id=>values[0], name=>values[1], type=>values[2] }
    self.new(arguments)
  end
end
