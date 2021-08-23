require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'is valid with valid attributes' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: "bob.kirk@gmail.com", password: "password", password_confirmation: "password")
      expect(@user).to be_valid
    end

    it 'is not valid without a first name' do
      @user = User.create(first_name: nil, last_name: "Kirk", email: "bob.kirk@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'is not valid without a last name' do
      @user = User.create(first_name: "Bob", last_name: nil, email: "bob.kirk@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'is not valid without a email' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: nil, password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'is not valid without a password' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: "bob.kirk@gmail.com", password: nil, password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'is not valid without a password confirmation' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: "bob.kirk@gmail.com", password: "password", password_confirmation: nil)
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'is not valid if password confirmation does not match' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: "bob.kirk@gmail.com", password: "password", password_confirmation: "password2")
      expect(@user).to_not be_valid
    end

    it 'is not valid with a password < 6 characters' do
      @user = User.create(first_name: "Bob", last_name: "Kirk", email: "bob.kirk@gmail.com", password: "pass", password_confirmation: "pass")
      expect(@user).to_not be_valid
    end

    it 'is not valid without a unique email' do
      @userA = User.create(first_name: "Kathy", last_name: "Tam", email: "kathy@gmail.com", password: "password", password_confirmation: "password")
      @user = User.create(first_name: "Kathy", last_name: "Tam", email: "kATHy@gmail.com", password: "password", password_confirmation: "password")
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end
end
