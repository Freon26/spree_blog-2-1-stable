module Spree
  BaseController.class_eval do
    include SpreeBlog::Core::ControllerHelpers::Search
  end
end
