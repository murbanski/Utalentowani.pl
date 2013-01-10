# encoding: UTF-8
require 'spec_helper'

describe "Static Pages" do
subject {page}
  describe "Home Page" do
before {visit root_path}
	it {should have_selector('h1', text: 'Witamy w Serwisie Utalentowani.pl')}
  	it {should have_selector('title', text: full_title(''))}
  	it {should_not have_selector('title', text: 'Utalentowani.pl |')}
  end

  describe "Help Page" do
  	before {visit help_path}
  	it {should have_selector('h1', text: 'Pomoc')}
	it {should have_selector('title', text: full_title('Pomoc'))}
  end

  describe "Contact Page" do
  	before {visit contact_path}
 
		it {should have_selector('title', text: full_title('Kontakt'))}
		it {should have_selector('h1', text: "Kontakt")}
  end

  describe "About Page" do
  	before {visit about_path}

	it {should have_selector('title', text: full_title('O nas'))}
  	it {should have_selector('h1', text: 'Jak to wszystko się zaczęło...')}
  end
  it "should have the right link on the layout" do
  	visit root_path
  	click_link "O nas"
  	page.should have_selector 'title', text: full_title('O nas')
  	click_link "Pomoc"
  	page.should have_selector 'title', text: full_title('Pomoc')
  	click_link "Kontakt"
  	page.should have_selector 'title', text: full_title('Kontakt')
  end

end
