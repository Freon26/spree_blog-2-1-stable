class Spree::BlogConfiguration < Spree::Preferences::Configuration
  preference :blog_default_url, :string, :default => '/spree/blog/:id/:style/:basename.:extension'
  preference :blog_path, :string, :default => ':rails_root/public/spree/blog/:id/:style/:basename.:extension'
  preference :blog_url, :string, :default => '/spree/blog/:id/:style/:basename.:extension'
  preference :blog_styles, :string, :default => "{\"mini\":\"48x32>\",\"blog\":\"300x200>\",\"big\":\"600x300>\", \"thumb\":\"200x133>\"}"
  preference :blog_default_style, :string, :default => 'blog'

  preference :posts_per_page, :integer, :default => 5

  def searcher_class
    @searcher_class ||= SpreeBlog::Core::Search::Base
  end

  def searcher_class=(sclass)
    @searcher_class = sclass
  end

end
