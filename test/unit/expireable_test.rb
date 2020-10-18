require 'test_helper'

class ExpireableTest < ActiveSupport::TestCase
  test "delegates all methods if not expired" do
    assert_equal 2, Expireable.new(1).succ
  end

  test "#expire! causes all future method calls to raise" do
    assert_raises Expireable::ExpiredError do
      expireable = Expireable.new(1)
      expireable.expire!
      expireable.succ
    end
  end
end
