require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', user: user)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(user: User.new(name: 'john', email: 'john@example.com', password: 'password'))
    expect(category).to_not be_valid
  end
end
