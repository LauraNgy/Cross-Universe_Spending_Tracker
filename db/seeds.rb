require_relative('../models/tag.rb')
require('pry-byebug')

Tag.delete_all()


###########TAGS##############

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


##########MERCHANTS##########
@merchant1 = Merchant.new({
  "name" => "Tesco"
  })

@merchant2 = Merchant.new({
  "name" => "Amazon"
  })

@merchant3 = Merchant.new({
  "name" => "e-bay"
  })

@merchant4 = Merchant.new({
  "name" => "The Cafe"
  })

binding.pry
nil
