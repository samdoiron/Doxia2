class Expireable
  class ExpiredError < RuntimeError; end

  def initialize(target)
    @target = target
  end

  def method_missing(method, *args)
    raise ExpiredError if @expired
    @target.public_send(method, *args)
  end

  def expire!
    @expired = true
  end
end
