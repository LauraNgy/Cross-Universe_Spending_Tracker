require_relative('../db/sql_runner')

class Account

  attr_accessor :id, :holder, :currency, :budget

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @holder = params['holder']
    @currency = params['currency']
    @budget = params['budget'].to_f
  end

  def save()
    sql = "
      INSERT INTO accounts
        (holder, currency, budget)
      VALUES
        ($1, $2, $3)
      RETURNING id
    "
    values = [@holder, @currency, @budget]
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def update()
    sql = "
      UPDATE accounts
      SET
        (holder, currency, budget)
        =
        ($1, $2, $3)
      WHERE
        id = $4
    "
    values = [@holder, @currency, @budget, @id]
    SqlRunner.run(sql, values)
  end

  def get_total_transactions()
    sql = "
      SELECT amount FROM transactions
      WHERE
        transactions.currency_type = $1
    "
    values = [@currency]
    results = SqlRunner.run(sql, values)
    return results.reduce(0.0) {|total, result| total += result['amount'].to_f}
  end

  def self.all()
    sql = "
    SELECT * FROM accounts
    "
    tags= SqlRunner.run(sql)
    return self.map_items(tags)
  end

  def self.find(id)
    sql = "
      SELECT * FROM accounts
      WHERE
        id = $1
    "
    values = [id]
    account = SqlRunner.run(sql, values)[0]
    result = Account.new(account)
    return result
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
