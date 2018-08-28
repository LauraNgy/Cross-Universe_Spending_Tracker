require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')
also_reload('../models/*')

# index
get '/accounts' do
  @accounts = Account.all()
  erb (:"accounts/index")
end

# new
get '/accounts/new' do
  erb (:"accounts/new")
end

# create
post '/accounts' do
  @new_account = Account.new(params)
  @new_account.save()
  redirect to '/accounts'
end

# edit
get '/accounts/:id/edit' do
  @account = Account.find(params['id'].to_i)
  erb (:"accounts/edit")
end

# show
get '/accounts/:id' do
  @account = Account.find(params['id'].to_i)
  @transactions = Transaction.all_by_account_id(params['id'].to_i)
  @total = Transaction.total(@account)
  erb (:"transactions/index")
end

# update
post '/accounts/:id' do
  @account = Account.new(params)
  @account.update()
  redirect to '/accounts'
end

# delete
post '/accounts/:id/delete' do
  @account = Account.find(params['id'].to_i)
  Account.delete(@account.id)
  redirect to '/accounts'
end
