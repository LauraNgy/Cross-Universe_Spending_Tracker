require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/account.rb')
require('pry-byebug')

Tag.delete_all()
Merchant.delete_all()
Account.delete_all()


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

@merchant1.save()
@merchant2.save()
@merchant3.save()
@merchant4.save()


########ACCOUNTS#############
@account1 = Account.new({
  "holder" => "Amy",
  "currency_type" => "pounds",
  "budget" => 100,
  "balance" => 100
  })

@account2 = Account.new({
  "holder" => "Dan",
  "currency_type" => "potatoes",
  "budget" => 500,
  "balance" => 500
  })

@account3 = Account.new({
  "holder" => "Rick",
  "currency_type" => "schmeckles",
  "budget" => 200,
  "balance" => 200
  })

@account1.save()
@account2.save()
@account3.save()


binding.pry
nil
