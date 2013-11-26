require 'spec_helper'

describe Spree::Category do
  context "validation" do
    let(:category) { build :category }
    it "should be valid without a description" do
      expect(category).to be_valid
    end

    it "should have an unique name" do
      another_category = create :category, name: "sport"
      expect(category).not_to be_valid
    end
  end

  context "permalink" do
    let(:category) { create :category }
    it "should be generated by name" do
      expect(category.permalink).to eq(category.name.to_s.to_url)
    end
  end

  context "Seo Fields" do
    let(:category) { create :category }
    context "Seo Slug" do
      it "should have a seo_slug" do
        expect(category).to respond_to(:seo_slug)
      end
      it "should be the same as permalink" do
        expect(category.seo_slug).to eq(category.permalink)
      end
    end
    context "Seo Description" do
      it "should have a seo_description" do
        expect(category).to respond_to(:seo_description)
      end
    end
    context "Seo Title" do
      it "should have a seo_title" do
        expect(category).to respond_to(:seo_title)
      end
      it "should contain the name" do
        expect(category.seo_title).to get(Regexp.new(category.name))
      end
    end
  end
end
