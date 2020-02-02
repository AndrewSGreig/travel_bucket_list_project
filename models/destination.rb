
class Destination
  attr_accessor :name, :visited, :type, :country_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @country_id = options['country_id'].to_i
    @type = options['type']
    @visited = options['visited']
  end

  def save
    sql = "INSERT INTO destinations(
    name, country_id, type, visited
    )
    VALUES(
      $1, $2, $3, $4
      )
    RETURNING id"
    values = [@name, @country_id, @type, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete(id)
    sql = "DELETE FROM destinations
    WHERE id = $1"
    values = [id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    binding.pry
    sql = "SELECT * FROM destinations;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Destination.new( hash ) }
  end

  def self.delete_all()
    sql = "DELETE FROM destinations"
    SqlRunner.run(sql)
  end

end
