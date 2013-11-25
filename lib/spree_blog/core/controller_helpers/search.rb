module SpreeBlog
  module Core
    module ControllerHelpers
      module Search
        def build_posts_searcher params
          SpreeBlog::Config.searcher_class.new(params)
        end
      end
    end
  end
end
