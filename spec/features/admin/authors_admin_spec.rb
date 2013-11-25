require 'spec_helper'

describe "Authors Admin" do

  context 'as admin user' do
    stub_authorization!

    before(:each) do
      visit spree.admin_path
      click_link "Posts"
      click_link "Authors"
    end

    context "visiting the posts index" do
      it "should have the header text 'Listing Authors'" do
        within('h1') { expect(page).to have_content("Listing Authors") }
      end
    end

    context "creating an author" do
      it "should create a new author" do
        click_link "New Author"
        fill_in 'author_first_name',      :with => Faker::Name.first_name
        fill_in 'author_last_name',       :with => Faker::Name.last_name
        fill_in 'author_bio',             :with => Faker::Lorem.paragraph
        fill_in 'author_seo_description', :with => Faker::Lorem.paragraph
        click_button 'Create'
        expect(page).to have_content('successfully created!')
      end
    end

    context "editing an author" do
      let(:author) { create :author, first_name: "Filippo" }
      it "should update selected author" do
        within_row(1) { click_icon :edit }
        fill_in 'author_first_name', :with => "Francesco"
        fill_in 'author_last_name',  :with => "Rossi"
        click_button "Update"
        expect(page).to have_content('successfully updated!')
        within_row(1) {
          expect(find('td:nth-child(1)')).to have_content('Francesco')
          expect(find('td:nth-child(2)')).to have_content('Rossi')
        }
      end
    end
  end
end
