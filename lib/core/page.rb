module Core
  Page = Struct.new(:slug, :title, :created_at, keyword_init: true)
end
