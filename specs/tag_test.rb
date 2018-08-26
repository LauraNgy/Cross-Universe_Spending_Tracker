require('minitest/autorun')
require('minitest/rg')
require_relative('../models/tag')
require_relative('../db/seeds.rb')




class TagTest < MiniTest::Test

  def test_tag_has_name
    assert_equal('groceries', @tag1.name)
  end

end
nil
