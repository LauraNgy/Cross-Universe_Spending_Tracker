require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "
      INSERT INTO tags
      (name)
      VALUES
      ($1)
      RETURNING id
    "
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def self.all()
    sql = "
    SELECT * FROM tags
    "
    tags= SqlRunner.run(sql)
    return self.map_items(tags)
  end

  def self.map_items(tag_data)
    result = tag_data.map {|tag| Tag.new(tag)}
    return result
  end

  def self.delete_all()
    sql = "
      DELETE FROM tags
    "
    SqlRunner.run(sql)
  end

end
