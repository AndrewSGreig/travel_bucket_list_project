
class Destination
  attr_accessor :name, :visited, :type, :country_id
  attr_reader :id

  def initialize(options)
    @name = options['name']
    @country_id = options['country_id'].to_i
    @type = options['type']
    @visited = options['visited']
    @id = options['id'].to_i
  end

  def save
    sql = "INSERT INTO destinations(
    name, country_id, type, visited
  )
  VALUES(
    $1, $2, $3, $4
  )
  RETURNING id;"
  values = [@name, @country_id, @type, @visited]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update
  sql = "UPDATE destinations
  SET
  (
    name,
    country_id,
    type,
    visited
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @country_id, @type, @visited, @id]
    SqlRunner.run(sql, values)
  end

  def self.getMostRecentlyPlannedDests(numOfResultsWanted)
    sql = "SELECT * FROM destinations WHERE visited = false ORDER BY id DESC LIMIT $1;"
    values = [numOfResultsWanted]
    results = SqlRunner.run(sql, values)

    return results.map { |hash| Destination.new( hash )}

  end

  def self.getMostRecentlyVisitedDests(numOfResultsWanted)
    sql = "SELECT * FROM destinations WHERE visited ORDER BY id DESC LIMIT $1;"
    values = [numOfResultsWanted]
    results = SqlRunner.run(sql, values)

    return results.map { |hash| Destination.new( hash )}

  end

  def self.dests_visited()
    sql = "SELECT * FROM destinations WHERE visited;"
    results = SqlRunner.run(sql)
    visited_hash = results.map { |hash| Destination.new( hash ) }
    return visited_hash
  end

  def self.dests_planned()
    sql = "SELECT * FROM destinations WHERE visited=false;"
    results = SqlRunner.run(sql)
    planned_hash = results.map { |hash| Destination.new( hash ) }
    return planned_hash
  end

  def country
    sql = "SELECT * FROM countries WHERE id = $1"
    values = [@country_id]
    results = SqlRunner.run(sql, values)
    return Country.new(results.first)
  end

  def self.find(id)
    sql = "SELECT * FROM destinations
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    destination = Destination.new(result)
    return destination
  end

  def self.find_by_dest_name(name)
    sql = "SELECT * FROM destinations WHERE name=$1"
    values = [name]
    result = SqlRunner.run(sql, values)
    destination = Destination.new(result)
    return destination
  end

  def delete()
    sql = "DELETE FROM destinations
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM destinations;"
    results = SqlRunner.run( sql )
    return results.map { |hash| Destination.new( hash ) }
  end

  def self.delete_all()
    sql = "DELETE FROM destinations"
    SqlRunner.run(sql)
  end

end
