require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.create(name: "Apparel")
      @product = Product.create({
      name:  'Hipster tie',
      description: Faker::Hipster.paragraph(4),
      quantity:10,
      price_cents: 25.00,
      category: @category
        })
      end

      it 'should create and save a product' do
        expect(@product).to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing name coulmn' do
        @product.name = nil
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing price coulmn' do
        @product.price_cents = nil
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing quantity coulmn' do
        @product.quantity = nil
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing category coulmn' do
        @product.category = nil
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end


  end
  
end