class Transaction

  attr_accessor :id, :amount, :merchant_id, :tag_id, :description, :currency, :transaction_date

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount'].to_i
    @merchant_id = params['merchant_id'].to_i
    @tag_id = params['tag_id'].to_i
    @description = params['description']
    @currency = params['currency']
    @transaction_date = params['transaction_date']
  end

end
