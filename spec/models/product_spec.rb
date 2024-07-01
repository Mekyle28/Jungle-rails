require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do
    
    it "returns an error if category is not present" do
      product = Product.new(:name => "daisy", quantity: 1, price: 1000)
      
      expect(product).not_to be_valid
      expect {product.save }.not_to change(Product, :count)
      expect(product.errors.full_messages.last).to eql("Category can't be blank")
    end

    it "returns error if name is not present" do
      category = Category.new(:name => "flowers")
      product = Product.new( category: category, quantity: 1, price: 1000)

      expect(product).not_to be_valid
      expect {product.save }.not_to change(Product, :count)
      expect(product.errors.full_messages.first).to eql("Name can't be blank")
    end

    it "returns error if quantity is not present" do
      category = Category.new(:name => "flowers")
      product = Product.new( category: category, name: "Daisy", price: 1000)

      expect(product).not_to be_valid
      expect {product.save }.not_to change(Product, :count)
      expect(product.errors.full_messages.first).to eql("Quantity can't be blank")
    end

    it "returns error if price is not present" do
      category = Category.new(:name => "flowers")
      product = Product.new( category: category, name: "Daisy", quantity: 1)

      expect(product).not_to be_valid
      expect {product.save }.not_to change(Product, :count)
      expect(product.errors.full_messages.last).to eql("Price can't be blank")
    end

    it "Adds product to the db if name, category, price, and quantity are present" do
      category = Category.new(:name => "flowers")
      product = Product.new( category: category, name: "Daisy", price: 1000, quantity: 1)

      expect(product).to be_valid
      expect {product.save }.to change(Product, :count)
      expect(product.errors.full_messages.first).to eql(nil)
    end

  end
end
