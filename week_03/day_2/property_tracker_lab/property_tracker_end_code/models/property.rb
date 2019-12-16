require('PG')

class Property

  attr_reader :id
  attr_accessor :address, :value, :bedrooms, :build

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @address = options['address']
    @value = options['value'].to_i
    @bedrooms = options['bedrooms'].to_i
    @build = options["build"]
  end

  def save() # CREATE
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "INSERT INTO properties
    (
      address,
      value,
      bedrooms,
      build
    )
    VALUES
    (
      $1,$2,$3,$4
    )
    RETURNING id"
    values = [@address, @value, @bedrooms, @build]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"]
    db.close()
  end

  def update() # UPDATE
    db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
    sql = "
    UPDATE properties SET (
      address,
      value,
      bedroooms,
      build
      ) =
      (
        $1, $2, $3, $4
      )
      WHERE id = $5"
      values = [@address, @value, @bedrooms, @build, @id]
      db.prepare("update", sql)
      db.exec_prepared("update", values)
      db.close()
    end

    def delete() # DELETE
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "DELETE FROM properties
      WHERE id = $1"
      values = [@id]
      db.prepare("delete", sql)
      db.exec_prepared("delete", values)
      db.close()
    end

    def Property.all() # READ
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "SELECT * FROM properties"
      db.prepare("all", sql)
      results = db.exec_prepared("all")
      db.close()
      properties = results.map {|property_hash| Property.new(property_hash)}
      return properties
    end

    def Property.find(id) # READ
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "SELECT * FROM properties WHERE id = $1"
      values = [id]
      db.prepare("find", sql)
      results_array = db.exec_prepared("find", values)
      db.close()
      property_hash = results_array[0]
      found_property = Property.new(property_hash)
      return found_property
    end

    def Property.find_by_address(address)
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "SELECT * from properties WHERE address = $1"
      values = [address]
      db.prepare("find_by_address", sql)
      results_array = db.exec_prepared("find_by_address", values)
      db.close()

      if results_array.ntuples == 0
        return nil
      end

      property_hash = results_array[0]
      found_property = Property.new(property_hash)
      return found_property

    end

    def Property.delete_all() # DELETE
      db = PG.connect({dbname: 'property_tracker', host: 'localhost'})
      sql = "DELETE FROM properties"
      db.prepare("delete_all", sql)
      db.exec_prepared("delete_all")
      db.close()
    end

  end
