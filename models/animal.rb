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
    @rating = options['rating'].to_i
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO animals (
      name, type, breed, bio, rating, image
    ) VALUES (
      '#{@name}', '#{@type}', '#{@breed}', '#{@bio}', '#{@rating}', '#{@image}'
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


  def self.update( options )
    sql = "
          UPDATE animals SET
          name='#{options['name']}',
          type='#{options['type']}',
          breed='#{options['breed']}',
          bio='#{options['bio']}',
          rating ='#{options['rating']}',
          image ='#{options['image']}'
          WHERE id='#{options['id']}'
          "
    SqlRunner.run( sql )
  end

  def self.destroy( id )
    sql = "DELETE FROM animals WHERE id=#{id}"
    SqlRunner.run( sql )
  end

  # def owner
  #   sql = "SELECT * FROM owners o
  #         INNER JOIN adoptions ad
  #         ON ad.owner_id = o.id
  #         WHERE o.id = #{@owner_id}"
  #   results = SqlRunner.run( sql )
  #   return Owner.new( results.first )
  # end

end