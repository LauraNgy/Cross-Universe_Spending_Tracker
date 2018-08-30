require_relative('../models/tag.rb')
require_relative('../models/merchant.rb')
require_relative('../models/account.rb')
require_relative('../models/transaction.rb')
require('pry-byebug')

Transaction.delete_all()
Tag.delete_all()
Merchant.delete_all()
Account.delete_all()


###########TAGS##############

@tag1 = Tag.new({
  "name" => "groceries"
  })

@tag2 = Tag.new({
  "name" => "beauty"
  })

@tag3 = Tag.new({
  "name" => "transport"
  })

@tag4 = Tag.new({
  "name" => "entertainment"
  })

@tag5 = Tag.new({
  "name" => "utilities"
  })

@tag1.save()
@tag2.save()
@tag3.save()
@tag4.save()
@tag5.save()



##########MERCHANTS##########
@merchant1 = Merchant.new({
  "name" => "Diamond City Surplus"
  })

@merchant2 = Merchant.new({
  "name" => "Amazon"
  })

@merchant3 = Merchant.new({
  "name" => "Oregon Trail Vendor"
  })

@merchant4 = Merchant.new({
  "name" => "Florean Fortescue's Ice Cream Parlour"
  })

@merchant5 = Merchant.new({
  "name" => "Citadel of Ricks"
  })

@merchant1.save()
@merchant2.save()
@merchant3.save()
@merchant4.save()
@merchant5.save()


########ACCOUNTS#############
@account1 = Account.new({
  "currency" => "Bottle Caps",
  "budget" => 300,
  "spending_limit" => 100
  })

@account2 = Account.new({
  "currency" => "Pounds",
  "budget" => 1000,
  "spending_limit" => 750
  })

@account3 = Account.new({
  "currency" => "Oxens",
  "budget" => 3,
  "spending_limit" => 3
  })

  @account4 = Account.new({
    "currency" => "Knuts",
    "budget" => 100,
    "spending_limit" => 50
    })

@account5 = Account.new({
  "currency" => "Schmeckles",
  "budget" => 15000,
  "spending_limit" => 15000
  })

@account1.save()
@account2.save()
@account3.save()
@account4.save()
@account5.save()


#######TRANSACTIONS##########
@transaction1 = Transaction.new({
  "amount" => 105,
  "merchant_id" => @merchant1.id,
  "tag_id" => @tag1.id,
  "description" => "food and stimpaks",
  "account_id" => @account1.id,
  "transaction_date" => "3 Jan 2017"
  })

@transaction2 = Transaction.new({
  "amount" => 15,
  "merchant_id" => @merchant2.id,
  "tag_id" => @tag2.id,
  "description" => "video games",
  "account_id" => @account2.id,
  "transaction_date" => "21 Jan 2019"
  })

@transaction3 = Transaction.new({
  "amount" => 1,
  "merchant_id" => @merchant3.id,
  "tag_id" => @tag3.id,
  "description" => "cross Snake River",
  "account_id" => @account3.id,
  "transaction_date" => "01 Mar 2018"
  })

@transaction4 = Transaction.new({
  "amount" => 2.5,
  "merchant_id" => @merchant4.id,
  "tag_id" => @tag4.id,
  "description" => "took Hermione out for ice-cream",
  "account_id" => @account4.id,
  "transaction_date" => "10 Mar 2018"
  })

@transaction5 = Transaction.new({
  "amount" => 701.42,
  "merchant_id" => @merchant5.id,
  "tag_id" => @tag5.id,
  "description" => "repair portal gun",
  "account_id" => @account5.id,
  "transaction_date" => "5 Oct 2018"
  })

@transaction6 = Transaction.new({
  "amount" => 100,
  "merchant_id" => @merchant1.id,
  "tag_id" => @tag3.id,
  "description" => "new fusion core",
  "account_id" => @account5.id,
  "transaction_date" => "22 May 2018"
  })

@transaction6 = Transaction.new({
  "amount" => 100,
  "merchant_id" => @merchant3.id,
  "tag_id" => @tag2.id,
  "description" => "brass flute",
  "account_id" => @account4.id,
  "transaction_date" => "17 June 2018"
  })

@transaction7 = Transaction.new({
  "amount" => 350,
  "merchant_id" => @merchant1.id,
  "tag_id" => @tag5.id,
  "description" => "plasma gun",
  "account_id" => @account5.id,
  "transaction_date" => "9 Oct 2018"
  })

@transaction8 = Transaction.new({
  "amount" => 4.5,
  "merchant_id" => @merchant4.id,
  "tag_id" => @tag4.id,
  "description" => "flying wheezer",
  "account_id" => @account1.id,
  "transaction_date" => "6 Dec 2018"
  })

@transaction9 = Transaction.new({
  "amount" => 78.99,
  "merchant_id" => @merchant2.id,
  "tag_id" => @tag4.id,
  "description" => "real fake door imitation",
  "account_id" => @account5.id,
  "transaction_date" => "16 Dec 2018"
  })

@transaction10 = Transaction.new({
  "amount" => 36,
  "merchant_id" => @merchant5.id,
  "tag_id" => @tag3.id,
  "description" => "transporter gun replacement",
  "account_id" => @account5.id,
  "transaction_date" => "29 Aug 2018"
  })


@transaction1.save()
@transaction2.save()
@transaction3.save()
@transaction4.save()
@transaction5.save()
@transaction6.save()
@transaction7.save()
@transaction8.save()
@transaction9.save()
@transaction10.save()


binding.pry
nil
