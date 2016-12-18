require_relative( '../db/sql_runner' )

class Animal
  
  attr_reader(:id)
  attr_accessor( :name, :type, :breed, :bio, :rating, :image )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @bio = options['bio']
    @rating = options['rating']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO animals (
      name, type, breed, bio, rating, image
    ) VALUES (
      '#{ @name }', '#{@type}', '#{ @breed }', '#{@bio}', '#{@rating}', '#{@image}'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM animals"
    results = SqlRunner.run( sql )
    return results.map { |hash| Animal.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM animals WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Animal.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM animals"
    SqlRunner.run( sql )
  end

end