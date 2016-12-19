require_relative( '../db/sql_runner' )

class Adoption

  attr_reader( :id)
  attr_reader( :animal_id, :owner_id )

  def initialize( options )
    @id = nil || options['id'].to_i
    @animal_id = options['animal_id']
    @owner_id = options['owner_id']
  end

  def save()
    sql = "INSERT INTO adoptions (
      animal_id, owner_id
    ) VALUES (
      '#{ @animal_id }',#{ @owner_id }
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM adoptions"
    results = SqlRunner.run( sql )
    return results.map { |hash| Adoption.new( hash ) }
  end


  def animal
    sql = "SELECT * FROM animals an
          INNER JOIN adoptions ad
          ON ad.animal_id = an.id
          WHERE an.id = #{@animal_id}"
    results = SqlRunner.run( sql )
    return Animal.new( results.first )
  end

  def owner
    sql = "SELECT * FROM owners o
          INNER JOIN adoptions ad
          ON ad.owner_id = o.id
          WHERE o.id = #{@owner_id}"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def self.find( id )
    sql = "SELECT * FROM adoptions WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Adoption.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM adoptions"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM adoptions where id = #{id}"
    SqlRunner.run( sql )
  end



  def self.update( options )
    sql = "
          UPDATE adoptions SET
          animal_id='#{options['animal_id']}',
          owner_id ='#{options['owner_id']}'
          WHERE id='#{options['id']}'
          "
    SqlRunner.run( sql )
  end

end