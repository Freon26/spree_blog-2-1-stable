FactoryGirl.define do
  factory :blogger_user, parent: :user do
    spree_roles { [Spree::Role.find_by_name('blogger') || create(:role, name: 'blogger')] }
  end

  factory :author, class: Spree::Author do
    first_name "Eugenio"
    last_name "Montale"
    bio Faker::Lorem.paragraph
    seo_description Faker::Lorem.paragraph
  end

  factory :tag, class: Spree::Tag do
    name "Mondiali Calcio"
    factory :tag_with_description do
      description "Tutto sui mondiali di calcio"
    end
    factory :tag_with_sequence_name do
      sequence(:name) { |n| "#{Faker::Lorem.word} #{n}" }
    end
  end

  factory :category, class: Spree::Category do
    name "Sport"
    factory :category_with_description do
      description "Tutto sullo sport"
    end
  end

  factory :post, class: Spree::Post do
    author
    category
    title "Titolo post"
    body "Corpo del post"
    published_at Time.now

    factory :post_with_different_name do
      title Faker::Lorem.sentence
    end

    trait :with_tags do
      ignore do
        tags_count 3
      end
      after :create do |post, evaluator|
        evaluator.tags_count.times do
          post.tags << create(:tag_with_sequence_name)
        end
      end
    end

    trait :with_related_posts do
      after :create do |post|
        post.related_posts << create(:post_with_different_name, category: Spree::Category.first)
      end
    end

    trait :without_title do
      title nil
    end
    trait :without_published_at do
      published_at nil
    end
    trait :without_body do
      body nil
    end
    trait :without_author do
      author nil
    end
    trait :without_category do
      category nil
    end

    factory :post_without_title,          traits: [:without_title]
    factory :post_without_body,           traits: [:without_body]
    factory :post_without_published_at,   traits: [:without_published_at]
    factory :post_without_category,       traits: [:without_category]
    factory :post_without_author,         traits: [:without_author]
    factory :post_with_tags,              traits: [:with_tags]
    factory :post_with_related_posts,    traits: [:with_related_posts]
  end
end
