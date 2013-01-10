# encoding: UTF-8
require 'spec_helper'

describe "User Pages" do
	subject {page}
  describe "Signup Page" do
  	before {visit signup_path}
  	it {should have_selector('title', text: full_title('Zarejestruj się'))}
   it {should have_selector('h1', text: 'Rejestracja')}
    end
    describe "Profile Page" do
    	let(:user) {FactoryGirl.create(:user)}
    		before {visit user_path(user)}
    		it {should have_selector('h1', text: user.name)}
    		it {should have_selector('title', text: user.name)}
    	
    end
    describe "signup" do
    	before {visit signup_path}
    	let(:submit) {"Utwórz Moje Konto"}

    	describe "with invalid information" do
    		it "should not create a user" do
    		expect {click_button submit}.to_not change(User, :count)
    		end
    	end
    	
    
    describe "with valid information" do
        before {visit signup_path}
    	before do
    		fill_in "Name", with: "Example User"
    		fill_in "Email", with: "user@example.com"
    		fill_in "Password", with: "foobar"
    		fill_in "Confirmation", with: "foobar"
           click_button submit
    	end
    	it "should create a user" do
    		
    
    	expect {click_button submit}.to change(User, :count).by(1)
    end
    describe "after saving user" do

before { click_button submit }
it { should have_selector('title', text: 'Sign up') }
it { should have_content('error') }
end
end
  end

end
