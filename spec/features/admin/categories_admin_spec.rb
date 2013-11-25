require 'spec_helper'

describe "Category Admin" do
  context 'as admin user' do
    stub_authorization!
    before(:each) do
      visit spree.admin_path
      click_link "Posts"
      click_link "Categories"
    end

    context "visiting the categories index" do
      it "should have the header text 'Listing Categories'" do
        within('h1') { expect(page).to have_content("Listing Categories") }
      end
    end

    context "creating a category" do
      it "should create a new category" do
        click_link "New Category"
        fill_in 'category_name',        with: Faker::Lorem.word
        fill_in 'category_description', with: Faker::Lorem.paragraph
        click_button 'Create'
        expect(page).to have_content('successfully created')
      end
    end

    context "editing a category" do
      let(:category) { create :category }
      it "should update selected category" do
        within_row(1) { click_icon :edit }
        fill_in 'category_name',        with: "Sport e Affini"
        fill_in 'category_description', with: "Tutto quello che riguarda lo sport"
        click_button 'Update'
        expect(page).to have_content("successfully updated")
        within_row(1) {
          expect(find('td:nth-child(1)')).to have_content("Sport e Affini")
        }
      end
    end
  end
end
