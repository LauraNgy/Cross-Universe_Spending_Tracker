require_relative('../db/sql_runner')

class Merchant

  attr_accessor :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end

  def save()
    sql = "
      INSERT INTO
        merchants
        (name)
      VALUES
        ($1)
      RETURNING
        id
    "
    values = [@name]
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def update()
    sql = "
      UPDATE merchants
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
      SELECT *
      FROM
        merchants
    "
    merchants = SqlRunner.run(sql)
    result = self.map_items(merchants)
    return  result
  end

  def self.find(id)
    sql = "
      SELECT * FROM
        merchants
      WHERE
        id = $1
    "
    values = [id]
    merchant = SqlRunner.run(sql, values)[0]
    return Merchant.new(merchant)
  end

  def self.map_items(merchant_data)
    return merchant_data.map{ |merchant| Merchant.new(merchant)}
  end

  def self.delete(id)
    sql = "
      DELETE FROM merchants
      WHERE
        id = $1
    "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "
      DELETE FROM merchants
    "
    SqlRunner.run(sql)
  end

end
