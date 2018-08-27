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
