class Transaction

  attr_accessor :id, :amount, :merchant_id, :tag_id, :description, :account_id, :transaction_date

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @amount = params['amount'].to_f
    @merchant_id = params['merchant_id'].to_i
    @tag_id = params['tag_id'].to_i
    @description = params['description']
    @account_id = params['account_id'].to_i
    @transaction_date = params['transaction_date']
  end

  def save()
    sql = "
      INSERT INTO transactions
        (amount, merchant_id, tag_id, description, account_id, transaction_date)
      VALUES
        ($1, $2, $3, $4, $5, $6)
      RETURNING id
    "
    values = [@amount, @merchant_id, @tag_id, @description, @account_id, @transaction_date]
    results = SqlRunner.run(sql, values)[0]
    @id = results['id'].to_i
  end

  def update()
    sql = "
      UPDATE transactions
      SET
        (amount, merchant_id, tag_id, description, account_id, transaction_date)
        =
        ($1, $2, $3, $4, $5, $6)
      WHERE
        id = $7
    "
    values = [@amount, @merchant_id, @tag_id, @description, @account_id, @transaction_date, @id]
    SqlRunner.run(sql, values)
  end

  def merchant()
    sql = "
      SELECT * FROM merchants
      WHERE
        id = $1
    "
    values = [@merchant_id]
    if @merchant_id != 0
      merchant = SqlRunner.run(sql, values)[0]
      result = Merchant.new(merchant)
    else result = nil
    end
    return result
  end

  def set_merchant_to_null()
    sql = "
      UPDATE transactions
      SET
        merchant_id = NULL
      WHERE
        id = $1
    "
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def set_tag_to_null()
    sql = "
      UPDATE transactions
      SET
        tag_id = NULL
      WHERE
        id = $1
    "
    values = [@id]
    SqlRunner.run(sql, values)
    end

  def tag()
    sql = "
      SELECT * FROM tags
      WHERE
        id = $1
    "
    values = [@tag_id]
    if @tag_id != 0
      tag = SqlRunner.run(sql, values)[0]
      result = Tag.new(tag)
    else result = nil
    end
    return result
  end

  def self.all_by_account_id(id)
    sql = "
      SELECT * FROM transactions
      WHERE
        account_id = $1
    "
    values = [id]
    transactions = SqlRunner.run(sql, values)
    result = Transaction.map_items(transactions)
    return result
  end

  def self.sort_by(params, transactions)
    keys = params.keys()
    keys.each {|key|
      case key
      when 'amount'
        transactions.sort!{|transaction1, transaction2|
          transaction1.amount <=> transaction2.amount}
      when 'description'
        transactions.sort!{|transaction1, transaction2|
          transaction1.description <=> transaction2.description}
      when 'transaction_date'
        transactions.sort!{|transaction1, transaction2|
          transaction2.transaction_date <=> transaction1.transaction_date}
      when 'merchant_id'
        transactions.sort!{|transaction1, transaction2|
          transaction1.merchant <=> transaction2.merchant}
      when 'tag_id'
        transactions.sort!{|transaction1, transaction2|
          transaction1.tag <=> transaction2.tag}
      end
    }
    return transactions
  end

  def self.delete_merchant(merchant)
    transactions = Transaction.all()
    transactions.each { |transaction|
      if transaction.merchant_id == merchant.id
        transaction.set_merchant_to_null()
      end
    }
    Merchant.delete(merchant.id)
  end

  def self.delete_tag(tag)
    transactions = Transaction.all()
    transactions.each { |transaction|
      if transaction.tag_id == tag.id
        transaction.set_tag_to_null()
      end
    }
    Tag.delete(tag.id)
  end

  def self.total(account)
    sql = "
      SELECT SUM(amount) FROM transactions
      WHERE
        account_id = $1
    "
    values = [account.id]
    result = SqlRunner.run(sql, values)
    return result[0]['sum'].to_f
  end

  def self.all()
    sql = "
      SELECT * FROM transactions
    "
    transactions = SqlRunner.run(sql)
    return self.map_items(transactions)
  end

  def self.find(id)
    sql = "
      SELECT * FROM transactions
      WHERE id = $1
    "
    values = [id]
    transaction = SqlRunner.run(sql, values)[0]
    return Transaction.new(transaction)
  end

  def self.map_items(transaction_data)
    result = transaction_data.map {|transaction| Transaction.new(transaction)}
    return result
  end

  def self.delete(id)
    sql = "
      DELETE FROM transactions
      WHERE id = $1
    "
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "
      DELETE FROM transactions
    "
    SqlRunner.run(sql)
  end

end
