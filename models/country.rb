require_relative('../db/sql_runner')

class Country
  attr_accessor :name, :continent, :visited
  attr_reader :id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @continent = options['continent']
    @visited = options['visited']
  end

  def save
    sql = "INSERT INTO countries
    (
      name,
      continent,
      visited
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id;"

    values = [@name, @continent, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def update()
    sql = "UPDATE countries
    SET
    (
      name,
      continent,
      visited
    ) =
    (
      $1, $2, $3
    )
    WHERE id = $4"
    values = [@name, @continent, @visited, @id]
    SqlRunner.run(sql, values)
  end


  def self.find(id)
    sql = "SELECT * FROM countries
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
  end

  def delete()
    binding.pry
    sql = "DELETE FROM countries
    WHERE id = $1"
    values = [@id]
    SqlRunner.run( sql, values )
  end

  def self.all()
    sql = "SELECT * FROM countries"
    results = SqlRunner.run( sql )
    return results.map { |hash| Country.new( hash ) }
  end

  def self.delete_all()
    sql = "DELETE FROM countries"
    SqlRunner.run(sql)
  end

end
