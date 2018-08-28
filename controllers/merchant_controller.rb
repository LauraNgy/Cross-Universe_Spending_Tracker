require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/transaction.rb')
require_relative('../models/merchant.rb')
require('pry-byebug')
also_reload('../models/*')

# index
get '/merchants' do
  erb (:"merchants/index")
end

# new


# create


# show


# edit


# update


# delete
