require_relative('../models/tag.rb')
require('pry-byebug')

@groceries_tag = Tag.new({
  "name" => "groceries"
  })

@beauty_tag = Tag.new({
  "name" => "beauty"
  })

@transport_tag = Tag.new({
  "name" => "transport"
  })

@entertainment_tag = Tag.new({
  "name" => "entertainment"
  })



binding.pry
nil
