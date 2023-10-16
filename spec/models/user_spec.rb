require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'john', email: 'john@example.com', password: 'password')
    expect(user).to be_valid
  end
  it 'is not valid without a valid name' do
    user = User.new(email: 'john@example.com', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is not valid without a valid email' do
    user = User.new(name: 'john', email: 'johnexample.com', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is not valid without an email' do
    user = User.new(name: 'john', password: 'password')
    expect(user).to_not be_valid
  end
  it 'is not valid without a valid password' do
    user = User.new(name: 'john', email: 'johnexample.com', password: 'pass')
    expect(user).to_not be_valid
  end
  it 'is not valid without a password' do
    user = User.new(name: 'john', email: 'johnexample.com')
    expect(user).to_not be_valid
  end
end
