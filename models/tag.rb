require_relative('../db/sql_runner')

class Tag

  attr_reader :id, :name

  def initialize(object)
    @id = object['id'].to_i if object['id']
    @name = object['name']
  end



  def self.delete_all()
    sql = "
      DELETE FROM tags
    "
    SqlRunner.run(sql)
  end

end
