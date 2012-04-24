require 'spec_helper'

describe "Admin pages" do

  subject { page }

  describe "admin_profile page" do
    let(:admin) { FactoryGirl.create(:admin) }
    before { visit admin_path(admin) }

    it { should have_selector('h1',    text: admin.name) }
    it { should have_selector('title', text: admin.name) }
  end

  describe "admin page" do
    before { visit newops_path }

    it { should have_selector('h1',    text: 'Admin Sign up') }
    it { should have_selector('title', text: full_title('Admin')) }
  end
end