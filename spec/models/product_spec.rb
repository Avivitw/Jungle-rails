require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
      it 'should create and save a product' do
          @category = Category.new(name: "Apparel")
          @product = Product.create({
          name:  'Hipster tie',
          description: Faker::Hipster.paragraph(4),
          quantity:10,
          price: 25.00,
          category: @category
        })
        expect(@product).to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing name coulmn' do
          @category = Category.new(name: "Apparel")
          @product = Product.create({
          description: Faker::Hipster.paragraph(4),
          quantity:10,
          price: 25.00,
          category: @category
        })
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing price coulmn' do
          @category = Category.new(name: "Apparel")
          @product = Product.create({
          name:  "pants",
          description: Faker::Hipster.paragraph(4),
          quantity:10,
          category: @category
        })
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing quantity coulmn' do
          @category = Category.new(name: "Apparel")
          @product = Product.create({
          name:  "shoes",
          description: Faker::Hipster.paragraph(4),
          price: 25.00,
          category: @category
        })
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end

      it 'should fail due to missing category coulmn' do
          @product = Product.create({
          name:  "shoes",
          description: Faker::Hipster.paragraph(4),
          price: 25.00,
          quantity:10,
          
        })
        expect(@product).not_to be_valid
        puts @product.errors.full_messages
      end


  end
  
end