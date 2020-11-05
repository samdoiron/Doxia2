class Expirable < SimpleDelegator
  class UseAfterExpire < RuntimeError; end

  ruby2_keywords def method_missing(*)
    Kernel.send(:raise, UseAfterExpire) if @expired
    super
  end

  def expire!
    @expired = true
  end
end
