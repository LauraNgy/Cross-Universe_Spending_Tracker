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
get '/transactions/new' do
  @merchants = Merchant.all()
  @tags = Tag.all()
  erb(:"transactions/new")
end


# create



# show



# edit



# update



#delete
