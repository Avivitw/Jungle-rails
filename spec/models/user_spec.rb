require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should create a user and save a valid password and password_confirmation' do
          @user = User.create({
          name: "vivian",
          email: "vivi@example.com",
          password: "12345678",
          password_confirmation: "12345678"
        })
        expect(@user).to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password and password_confirmation that are not match' do
          @user = User.create({
          name: "bobo",
          email: "bobo@example.com",
          password: "12345678",
          password_confirmation: "1111"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password and password_confirmation they are both missing' do
          @user = User.create({
          name: "vovo",
          email: "vovo@example.com"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end
     
      it 'should fail - not create a user when password_confirmation if one is missing' do
          @user = User.create({
          name: "koko",
          email: "koko@example.com",
          password: "88888888"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password if one is missing' do
          @user = User.create({
          name: "nono",
          email: "nono@example.com",
          password_confirmation: "66666666"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when email is already exist' do
          @user = User.create({
          name: "vivi",
          email: "vivi@example.com",
          password: "4141414141",
          password_confirmation: "41414141"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

  end
  
end