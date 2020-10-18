module Core
  class Application
    def transaction
      yield
    end
  end
end
