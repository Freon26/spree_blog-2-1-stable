module Spree
  class Author < ActiveRecord::Base
    has_many :posts, inverse_of: :author

    validates :first_name, :last_name, :bio, :permalink, :seo_description, presence: true
    validates :permalink, :uniqueness => true
    scope :sorted_alphabetically, -> { order('first_name, last_name') }
    attr_accessible :first_name, :last_name, :permalink, :bio, :seo_description

    make_permalink order: :first_name, field: :permalink

    def full_name
      [ first_name, last_name ].join(" ")
    end

    def to_param
      self.permalink.presence || self.full_name.to_s.to_url
    end

    def seo_slug
      self.permalink
    end

    def seo_title
      self.full_name.to_s
    end
  end
end
