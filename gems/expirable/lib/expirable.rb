class Expirable < SimpleDelegator
  class ExpiredError < RuntimeError; end

  def method_missing(...)
    Kernel.send(:raise, ExpiredError) if @expired
    super
  end

  def expire!
    @expired = true
  end
end
