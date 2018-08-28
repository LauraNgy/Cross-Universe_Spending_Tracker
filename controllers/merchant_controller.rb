require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require('pry-byebug')
also_reload('../models/*')

# index
get '/merchants' do
  @merchants = Merchant.all()
  erb (:"merchants/index")
end

# new
get '/merchants/new' do
  erb (:"merchants/new")
end

# create
post '/merchants' do
  @new_merchant = Merchant.new(params)
  @new_merchant.save()
  redirect to '/done'
end

# show
get '/merchants/:id' do
  @merchant = Merchant.find(params['id'].to_i)
  erb (:"merchants/show")
end

# edit
get '/merchants/:id/edit' do
  erb (:"merchants/edit")
end

# update
post '/merchants/:id' do

end

# delete
post '/merchants/:id/delete' do

end
