class ApplicationController < ActionController::Base
  def core
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
