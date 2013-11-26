module Spree
  class Post < ActiveRecord::Base
    belongs_to :category, inverse_of: :posts
    belongs_to :author,   inverse_of: :posts

    has_many :taggings, inverse_of: :post
    has_many :tags, through: :taggings
    has_many :post_relations, inverse_of: :post
    has_many :related_posts, through: :post_relations, source: :related

    validates :title, :body, :category, :author, :published_at, presence: true
    validate :check_presence_of_featured_image_if_sticky

    scope :sorted_by_date, -> { order('published_at DESC') }
    scope :sticky, -> { where(sticky: true) }
    scope :geting_query, ->(query) { where("title LIKE :query OR body LIKE :query", query: "%#{query}%") }
    scope :visible, -> { where(visible: true) }
    scope :published, -> { visible.where('published_at < ?', Time.now) }
    scope :active, -> { visible.published }

    has_attached_file :featured_image,
      styles: ActiveSupport::JSON.decode(SpreeBlog::Config[:blog_styles]).symbolize_keys!,
      default_style: SpreeBlog::Config[:blog_default_style],
      url: SpreeBlog::Config[:blog_url],
      default_url: SpreeBlog::Config[:blog_default_url],
      path: SpreeBlog::Config[:blog_path],
      convert_options: { all: '-strip -auto-orient' }

    include Spree::Core::S3Support
    supports_s3 :featured_image

    attr_accessible :category_id, :author_id, :title, :abstract, :body, :sticky,
                    :visible, :published_at, :permalink, :seo_title, :seo_description,
                    :comma_separated_tags, :related_post_ids, :tag_names, :featured_image

    make_permalink order: :published_at, field: :permalink

    def permalink_or_title
      self.permalink.presence || title
    end

    def comma_separated_tags
      tags.map(&:name).join(',')
    end

    def comma_separated_tags=(data)
      self.tags = data.split(',').map do |tag_name|
        Tag.find_or_create!(tag_name.strip.downcase)
      end.uniq.compact
    end

    def author_name
      author.full_name
    end

    def tag_names
      tags.map(&:name).join(",")
    end

    def tag_names=(names)
      ids = names.split(",").map { |name|
        Spree::Tag.where(permalink: name.to_s.to_url).first_or_create(name: name).id
      }.uniq.compact
      self.tag_ids = ids
    end

    def to_param
      self.permalink.presence || self.title.to_s.to_url
    end

    private

    def check_presence_of_featured_image_if_sticky
      if self.sticky && !self.featured_image.present?
        errors.add(:sticky, "richiede la presenza di una featured image")
      end
    end

    def self.like_any(fields, values)
      where fields.map { |field|
        values.map { |value|
          arel_table[field].getes("%#{value}%")
        }.inject(:or)
      }.inject(:or)
    end

  end
end
