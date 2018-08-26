require_relative('../db/sql_runner')

class Tag

  attr_accessor :id, :name

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
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def update()
    sql = "
      UPDATE tags
      SET
        name = $1
      WHERE
        id = $2
    "
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "
    SELECT * FROM tags
    "
    tags= SqlRunner.run(sql)
    return self.map_items(tags)
  end

  def self.find(id)
    sql = "
      SELECT * FROM tags
      WHERE
        id = $1
    "
    values = [id]
    tag = SqlRunner.run(sql, values)[0]
    result = Tag.new(tag)
    return result
  end

  def self.delete(id)
    sql = "
      DELETE FROM tags
      WHERE
        id = $1
    "
    values = [id]
    SqlRunner.run(sql, values)
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
