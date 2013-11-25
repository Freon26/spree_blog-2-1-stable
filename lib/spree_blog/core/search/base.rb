module SpreeBlog
  module Core
    module Search
      class Base
        attr_accessor :properties

        def initialize(params)
          @properties = {}
          prepare(params)
        end

        def retrieve_posts
          @posts_scope = get_base_scope
          curr_page = page || 1
          @posts = @posts_scope.page(curr_page).per(per_page)
        end

        def method_missing(name)
          if @properties.has_key? name
            @properties[name]
          else
            super
          end
        end

        protected
        def get_base_scope
          base_scope = Spree::Post.active
          base_scope = base_scope.sorted_by_date
          base_scope = get_posts_conditions_for(base_scope, keywords)
          base_scope
        end

        def get_posts_conditions_for(base_scope, query)
          unless query.blank?
            base_scope = base_scope.like_any([:title, :abstract, :body], query.split)
          end
          base_scope
        end

        def prepare(params)
          @properties[:keywords] = params[:keywords]
          @properties[:search] = params[:search]

          per_page = params[:per_page].to_i

          @properties[:per_page] = per_page > 0 ? per_page : SpreeBlog::Config[:posts_per_page]
          @properties[:page] = (params[:page].to_i <= 0) ? 1 : params[:page].to_i
        end
      end
    end
  end
end
