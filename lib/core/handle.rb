module Core
  class Handle
    extend Forwardable

    def initialize(handle)
      @handle = handle
    end

    def_delegators :handle, :fetch_pages_newest_to_oldest

    private

    attr_accessor :handle
  end
end
