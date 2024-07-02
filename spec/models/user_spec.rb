require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    
    it "returns an error if password or password_confirmation is not present" do
      user = User.new(first_name: "Daisy", last_name: "Duke", email: "dd@gamil.com")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Password can't be blank")
      expect(user.errors.full_messages.last).to eql("Password confirmation can't be blank")
    end

    it "returns an error if password and password_confirmation don't match" do
      user = User.new(first_name: "Daisy", last_name: "Duke", email: "dd@gamil.com", password: "123456", password_confirmation: "bob1234")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Password confirmation doesn't match Password")
    end
    it "returns an error if password length is less then 5" do
      user = User.new(first_name: "Daisy", last_name: "Duke", email: "dd@gamil.com", password: "1234", password_confirmation: "1234")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Password is too short (minimum is 5 characters)")
    end

    it "Add to db when all the fields are filled out and the passwords match" do
      user = User.new(first_name: "Daisy", last_name: "Duke", email: "dd@gamil.com", password: "123456", password_confirmation: "123456")
      
      expect(user).to be_valid
      expect {user.save }.to change(User, :count)
      expect(user.errors.full_messages.first).to eql(nil)
    end

    it "returns an error if email is not unique" do
      user1 = User.create(first_name: "Daisy", last_name: "Duke", email: "dd@gamil.com", password: "123456", password_confirmation: "123456")
      user = User.new(first_name: "Donald", last_name: "Duck", email: "DD@gamil.com", password: "1234567", password_confirmation: "1234567")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Email has already been taken")
    end

    it "returns an error if first name is not filled out" do
      user = User.new(last_name: "Duke", email: "dd@gamil.com", password: "1234567", password_confirmation: "1234567")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("First name can't be blank")
    end

    it "returns an error if last name is not filled out" do
      user = User.new(first_name: "Daisy", email: "dd@gamil.com", password: "1234567", password_confirmation: "1234567")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Last name can't be blank")
    end

    it "returns an error if email is not filled out" do
      user = User.new(first_name: "Daisy", last_name: "Duke", password: "1234567", password_confirmation: "1234567")
      
      expect(user).not_to be_valid
      expect {user.save }.not_to change(User, :count)
      expect(user.errors.full_messages.first).to eql("Email can't be blank")
    end


  end

  describe '.authenticate_with_credentials' do
    
    it ""
  end

end
