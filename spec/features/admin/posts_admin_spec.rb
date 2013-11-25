require 'spec_helper'

describe "Posts Admin" do

  context 'as admin user' do
    stub_authorization!

    context "visiting the posts index" do
      before(:each) do
        visit spree.admin_posts_path
      end
      it "should have the header text 'Listing Orders'" do
        within('h1') { expect(page).to have_content("Listing Posts") }
      end
    end
  end

  context 'as blogger user' do
    custom_authorization! do |user|
      can [:admin, :edit, :index, :read], Spree::Post
    end

    context "when I visit admin_posts_path" do
      it "should only display tab 'Posts'" do
        visit spree.admin_posts_path
        expect(page).to have_link('Posts')
        expect(page).not_to have_link('Orders')
      end
    end

  end
end
