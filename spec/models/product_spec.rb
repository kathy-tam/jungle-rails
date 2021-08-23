require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Shirt", price: 40, quantity: 1, category: @category)
      expect(@product).to be_valid
      expect(@product.errors.full_messages).to be_empty
    end

    it 'is not valid without a name' do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: nil, price: 40, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'is not valid without a price' do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Shirt", price: nil, quantity: 1, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'is not valid without a quantity' do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Shirt", price: 40, quantity: nil, category: @category)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'is not valid without a category' do
      @category = Category.create(name: "Clothing")
      @product = Product.create(name: "Shirt", price: 40, quantity: 1, category: nil)
      expect(@product).to_not be_valid
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
