require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
      it 'should create a user and save a valid password and password_confirmation' do
          @user = User.create({
          name: "vivian",
          email: "viviian@example.com",
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
          password_confirmation: "11111111"
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
     
      it 'should fail - not create a user when password_confirmation is missing' do
          @user = User.create({
          name: "koko",
          email: "koko@example.com",
          password: "88888888"
        })
        expect(@user).not_to be_valid
        puts @user.errors.full_messages
      end

      it 'should fail - not create a user when password is missing' do
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


  describe '.authenticate_with_credentials' do

    before(:all)  do
          user = User.create({
          name: "rachel",
          email: "rachel@example.com",
          password: "22222222",
          password_confirmation: "22222222"
        })
      end

    it 'should fail - not create a user instance when password is wrong' do
      user = User.authenticate_with_credentials("vivi@example.com", "11111111")
      expect(user).to be_nil
    end

    it 'should fail - not create a user instance when email does not exist' do
      user = User.authenticate_with_credentials("fake@nono.com", "11111111")
      expect(user).to be_nil
    end

    it 'should fail - not create a user instance when password is empty' do
      user = User.authenticate_with_credentials("vivi@example.com", "")
      expect(user).to be_nil
    end

    it 'should pass - create a user instance when email and password are correct' do
      user = User.authenticate_with_credentials("rachel@example.com", "12345678")
      expect(user.name).to eq "rachel"
    end
    

  end

  
end