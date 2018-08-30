require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/tag.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')
also_reload('../models/*')

# index
get '/tags' do
  @tags = Tag.all()
  erb (:"tags/index")
end

# new
get '/tags/new' do
  erb (:"tags/new")
end

# create
post '/tags' do
  @new_tag = Tag.new(params)
  @new_tag.save()
  redirect to '/done'
end

# show
get '/tags/:id' do
  @tag = Tag.find(params['id'].to_i)
  @trans_by_tag = @tag.transactions()
  @transactions = Transaction.sort_by(params, @trans_by_tag)
  erb (:"tags/show")
end

# edit
get '/tags/:id/edit' do
  @tag = Tag.find(params['id'].to_i)
  erb (:"tags/edit")
end

# update
post '/tags/:id' do
  @tag = Tag.new(params)
  @tag.update()
  redirect to '/done'
end

# delete
post '/tags/:id/delete' do
  @tag = Tag.find(params['id'].to_i)
  Transaction.delete_tag(@tag)
  redirect to '/done'
end
