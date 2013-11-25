require 'spec_helper'

describe Spree::Author do
  context "validation" do
    let(:author) { build :author }

    it "should be valid with valid attributes" do
      expect(author).to be_valid
    end

    it "should not be valid without first_name" do
      author.first_name = nil
      expect(author).not_to be_valid
    end

    it "should not be valid without last_name" do
      author.last_name = nil
      expect(author).not_to be_valid
    end

    it "should not be valid without bio" do
      author.bio = nil
      expect(author).not_to be_valid
    end

    it "should not be valid withoud seo_description" do
      author.seo_description = nil
      expect(author).not_to be_valid
    end

    it "should have an unique permalink" do
      another_author = create(:author)
      expect(author).to be_valid
      expect(author.permalink).to eq('eugenio-montale-1')
    end
  end

  context "permalink" do
    let(:author) { create :author }

    context "when created" do
      it "should be composed with first_name-last_name format" do
        expect(author.permalink).to eq("eugenio-montale")
      end
    end

    context "when edited" do
      it "should be updated" do
        author.update_attributes(permalink: "luigi-pirandello")
        expect(author.permalink).to eq("luigi-pirandello")
      end
    end
  end

  context "Seo Fields" do
    let(:author) { create :author }
    context "Seo Slug" do
      it "should have a seo_slug" do
        expect(author).to respond_to(:seo_slug)
      end
      it "should be the same as permalink" do
        expect(author.seo_slug).to eq(author.permalink)
      end
    end
    context "Seo Description" do
      it "should have a seo_description" do
        expect(author).to respond_to(:seo_description)
      end
    end
    context "Seo Title" do
      it "should have a seo_title" do
        expect(author).to respond_to(:seo_title)
      end
      it "should contain the full name" do
        expect(author.seo_title).to match(Regexp.new(author.full_name))
      end
    end
  end
end
