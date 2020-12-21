class TestContainer
  extend Dry::Container::Mixin

  register "application" do
    Core::Application.new(InMemory::Repository.new)
  end
end