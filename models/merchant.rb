require_relative('../db/sql_runner')

class Merchant

  attr_accessor :id, :name

  def initialize(params)
    @id = params['id'].to_i if params['id']
    @name = params['name']
  end


end
