require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should create a user and save a valid password and password_confirmation' do
          @user = User.create({
          email: "vivi@example.com",
          password: "12345",
          password_confirmation: "12345"
        })
        expect(@user).to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password and password_confirmation that are not match' do
          @user = User.create({
          email: "vivi@example.com",
          password: "12345",
          password_confirmation: "1111"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password and password_confirmation they are both missing' do
          @user = User.create({
          email: "vivi@example.com"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end
     
      it 'should fail - not create a user when password_confirmation if one is missing' do
          @user = User.create({
          email: "koko@example.com",
          password: "8888"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password if one is missing' do
          @user = User.create({
          email: "vivi2@example.com",
          password_confirmation: "6666"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when email is already exist' do
          @user = User.create({
          name: "vivi",
          email: "vivi2@example.com",
          password: "414141",
          password_confirmation: "414141"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

  end
  
end