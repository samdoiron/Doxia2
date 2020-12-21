module InMemory
  class Store
    attr_accessor :pages

    def initialize
      @pages = []
    end
  end
end
