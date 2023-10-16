require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(name: 'Groceries', icon: 'icon.png', user: user)
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    category = Category.new(icon: 'icon.png', user: user)
    expect(category).to_not be_valid
  end
end
