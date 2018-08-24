require_relative('../models/tag.rb')
require('pry-byebug')

Tag.delete_all()

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

@groceries_tag.save()
@beauty_tag.save()
@transport_tag.save()
@entertainment_tag.save()

binding.pry
nil
