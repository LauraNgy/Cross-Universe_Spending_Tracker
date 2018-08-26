require_relative('../db/sql_runner')

class Account

  attr_accessor :id, :holder, :currency_type, :budget, :balance

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @holder = params['holder']
    @currency_type = params['currency_type']
    @budget = params['budget'].to_i
    @balance = params['balance'].to_i
  end

  def save()
    sql = "
      INSERT INTO accounts
        (holder, currency_type, budget, balance)
      VALUES
        ($1, $2, $3, $4)
      RETURNING id
    "
    values = [@holder, @currency_type, @budget, @balance]
    results = SqlRunner.run(sql, values)
    @id = results[0]['id'].to_i
  end

  def update()
    sql = "
      UPDATE accounts
      SET
        (holder, currency_type, budget, balance)
        =
        ($1, $2, $3, $4)
      WHERE
        id = $5
    "
    values = [@holder, @currency_type, @budget, @balance, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "
    SELECT * FROM accounts
    "
    tags= SqlRunner.run(sql)
    return self.map_items(tags)
  end

  def self.map_items(account_data)
    result = account_data.map {|account| Account.new(account)}
    return result
  end

  def self.delete(id)
    sql = "
      DELETE FROM accounts
      WHERE
        id = $1
    "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "
      DELETE FROM accounts
    "
    SqlRunner.run(sql)
  end

end
