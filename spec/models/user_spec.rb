require 'spec_helper'

describe User do
	before { @user = FactoryGirl.build(:user) }

	describe "User Validations" do
		it "should be valid when email is in correct format" do
			expect(@user.valid?).to be_truthy
		end

		it "should not be valid when email is not in correct format" do
			@user.email = "tahul@gre"
			expect(@user.valid?).to be_falsey
		end

		it "should not have a first name longer than 50 characters" do
			@user.first_name = "a"*51
			expect(@user.valid?).to be_falsey
		end

		it "should not have a last name longer than 50 characters" do
			@user.last_name = "a"*51
			expect(@user.valid?).to be_falsey
		end
		
		it "should not create duplicate user" do
		  duplicate_user = @user.dup
		  @user.save
		  expect(duplicate_user.valid?).to be_falsey
	  end
	end

end
