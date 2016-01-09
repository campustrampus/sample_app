require 'test_helper'

class UserTest < ActiveSupport::TestCase
   
   def setup
      @user = User.new(name: "Test user", email: "NLSample@mailinator.com",
                       password: "@test123", password_confirmation: "@test123")
   end

   test "should be valid" do
      assert @user.valid?
   end

   test "name should be present" do
      @user.name = (" ")
      assert_not @user.valid?
   end

   test "email validation should detect invalid addresses" do
      invalid_addresses = %w[hiya@yopmail,com test.email@yopmail. mail@mailonato      r.com testing@mailinator+mail.com]
      invalid_addresses.each do |invalid_address|
         @user.email = invalid_address
         assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
      end
   end

  test "email validation should detect duplicate emails" do
    duplicate_user = @user.dup
    duplicate_user.email = @user.email.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "password should not be blank" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "X" * 5
    assert_not @user.valid?
  end

end
