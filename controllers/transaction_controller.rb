require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require_relative('../models/tag.rb')
require('pry-byebug')
also_reload('../models/*')

# index
# index is basically built from account_controller

# new
get '/transactions/new/:id' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  @accounts = Account.all()
  @acc_id = params['id'].to_i
  erb(:"transactions/new")
end


# create
post '/transactions' do
  @new_transaction = Transaction.new(params)
  @new_transaction.save()
  redirect to '/accounts'
end


# show



# edit



# update



#delete
