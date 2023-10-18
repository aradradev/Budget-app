require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is not valid without a valid attributes' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', user:)
    expect(category).not_to be_valid
  end
  it 'is not valid without a name' do
    user = User.new(email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', user:)
    expect(category).not_to be_valid
  end
end
