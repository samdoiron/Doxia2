require 'test_helper'

class ExpirableTest < ActiveSupport::TestCase
  test "delegates all methods if not expired" do
    assert_equal 2, Expirable.new(1).succ
  end

  test "#expire! causes all future method calls to raise" do
    assert_raises Expirable::UseAfterExpire do
      expireable = Expirable.new(1)
      expireable.expire!
      expireable.succ
    end
  end
end
