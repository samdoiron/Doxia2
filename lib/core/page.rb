module Core
  Page = Struct.new(:handle, :title, :created_at, keyword_init: true)
end
