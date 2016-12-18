require_relative( '../db/sql_runner' )

class Owner
  attr_reader(:id)
  attr_accessor( :name, :contact_number, :ideal_type )

  def initialize( options )
    @id = nil || options['id'].to_i
    @name = options['name']
    @contact_number = options['contact_number']
    @ideal_type = options['ideal_type']
  end

  def save()
    sql = "INSERT INTO owners (
      name, contact_number, ideal_type
    ) VALUES (
      '#{ @name }', '#{@contact_number}', '#{ @ideal_type }'
    ) RETURNING *"
    results = SqlRunner.run(sql)
    @id = results.first()['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM owners"
    results = SqlRunner.run( sql )
    return results.map { |hash| Owner.new( hash ) }
  end

  def self.find( id )
    sql = "SELECT * FROM owners WHERE id=#{id}"
    results = SqlRunner.run( sql )
    return Owner.new( results.first )
  end

  def self.delete_all
    sql = "DELETE FROM owners"
    SqlRunner.run( sql )
  end

end