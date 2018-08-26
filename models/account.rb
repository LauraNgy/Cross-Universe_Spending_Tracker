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

end
