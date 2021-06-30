require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do


  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Go to the Home page, click on Add to cart for a product" do


     # ACT
    visit root_path

    click_button('Add', match: :first)

    # DEBUG
    sleep 1
    save_screenshot 'test_three.png'

    #VERIFY
    expect(page).to have_content('My Cart (1)')

  end



 
end
