require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

      before :each do
      @user = User.create({
            name: "vivian",
            email: "viviian@example.com",
            password: "12345678",
            password_confirmation: "12345678" 
        })
      end

    it 'should create a user and save a valid password and password_confirmation' do
      expect(@user).to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password and password_confirmation that are not match' do
      @user.password_confirmation =  "11111111"
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password and password_confirmation they are both missing' do
      @user.password_confirmation =  nil
      @user.password =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end
    
    it 'should fail - not create a user when password_confirmation is missing' do
      @user.password_confirmation =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when password is missing' do
    @user.password =  nil
      expect(@user).not_to be_valid
      puts @user.errors.full_messages
    end

    it 'should fail - not create a user when email is already exist' do
        user = User.create({
        name: "vivi",
        email: "viviian@example.com",
        password: "4141414141",
        password_confirmation: "41414141"
      })
      expect(user).not_to be_valid
      puts user.errors.full_messages
    end

  end


  describe '.authenticate_with_credentials' do

    before(:all)  do
          user = User.create({
          name: "rachel",
          email: "rachelberr@example.com",
          password: "22222222",
          password_confirmation: "22222222"
        })
      end

    it 'should pass - create a user instance when email and password are correct' do
      user = User.authenticate_with_credentials("rachelberr@example.com", "22222222")
      expect(user.name).to eq "rachel"
    end

    it 'should pass - create a user instance when email have white spaces' do
      user = User.authenticate_with_credentials("  rachelberr@example.com  ", "22222222")
      expect(user.name).to eq "rachel"
    end

    it 'should pass - create a user instance when email have different case insenstive' do
      user = User.authenticate_with_credentials("Rachelberr@example.COM", "22222222")
      expect(user.name).to eq "rachel"
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


    

  end

  
end