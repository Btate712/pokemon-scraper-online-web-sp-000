class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def initialize(arguments)
    arguments.each { |key, value| self.send(("#{key}="), value) }
    @@all << self
  end

  def self.save(name, type, db)
    self.new({:name => name, :type => type, :db => db})
    runner = SQLRunner.new(db)
    runner.execute("INSERT INTO db (name, type) VALUES (?, ?)", [name, type])
  end

end
