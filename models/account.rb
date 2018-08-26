class Account

  attr_accessor :id, :holder, :currency_type, :budget, :balance

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @holder = params['holder']
    @currency_type = params['currency_type']
    @budget = params['budget'].to_i
    @balance = params['balance'].to_i
  end

end
