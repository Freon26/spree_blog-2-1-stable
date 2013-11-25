require 'spec_helper'

describe Spree::Post do
  context "validation" do
    context "with valid attributes" do
      let(:post) { build :post }
      it "should be valid" do
        expect(post).to be_valid
      end
    end
    context "when missing attribute" do
      context "is 'title'" do
        let(:post) { build :post_without_title }
        it "should not be valid" do
          expect(post).not_to be_valid
        end
      end
      context "is 'body'" do
        let(:post) { build :post_without_body }
        it "should not be valid" do
          expect(post).not_to be_valid
        end
      end
      context "is 'published_at'" do
        let(:post) { build :post_without_published_at }
        it "should not be valid" do
          expect(post).not_to be_valid
        end
      end

      context "is 'author'" do
        let(:post) { build :post_without_author }
        it "should not be valid" do
          expect(post).not_to be_valid
        end
      end

      context "is 'category'" do
        let(:post) { build :post_without_category }
        it "should not be valid" do
          expect(post).not_to be_valid
        end
      end
    end
  end

  context "associations" do
    context "tags" do
      let(:post) { create :post_with_tags, tags_count: 5 }
      it "should have 5 tags" do
        expect(post).to have(5).tags
      end

      context "comma_separated_tags=" do
        it "should overwrite previous tags" do
          post.comma_separated_tags = ""
          expect(post).to have(0).tags
        end

        it "should remove duplication of tags" do
          post.comma_separated_tags = "mondiali calcio, mondiali calcio"
          expect(post).to have(1).tags
        end

      end
    end

    context "related_posts" do
      let(:post) { create :post_with_related_posts }
      it "should have 1 related post" do
        expect(post).to have(1).related_posts
      end

    end
  end
end
