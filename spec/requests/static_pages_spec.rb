require 'spec_helper'

describe "StaticPages" do
  
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }
  
  describe "Home page" do
    before { visit root_path }        # could've also used before(:each)

    it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_title('| Home') }
    
    # in case we didn't use subject{page} above:    
=begin
    it "should have the h1 'Sample App'" do
      # visit root_path
      expect(page).to have_content('Sample App')
    end

    it "should have the base title" do
      expect(page).to have_title("#{base_title}")
    end

    it "should not have a custom page title" do
      expect(page).not_to have_title('| Home')
    end  
=end
  end
  
  
  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('About') }
    it { should have_title(full_title('About Us')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
  
  
end
