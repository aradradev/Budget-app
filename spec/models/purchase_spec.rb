require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', user:)
    purchase = Purchase.new(name: 'Grocery shopping', amount: 50.0, user:, categories: [category])
    expect(purchase).not_to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', user:)
    purchase = Purchase.new(amount: 50.0, user:, categories: [category])
    expect(purchase).to_not be_valid
  end
end
