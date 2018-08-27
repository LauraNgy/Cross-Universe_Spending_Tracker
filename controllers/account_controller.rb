require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')
also_reload('../models/*')

get '/accounts' do
  @accounts = Account.all()
  erb (:"accounts/index")
end

get '/accounts/:id' do
  @account = Account.find(params['id'].to_i)
  @transactions = Transaction.all()
  erb (:"transactions/index")
end
