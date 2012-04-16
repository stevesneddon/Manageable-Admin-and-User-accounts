require 'spec_helper'

describe "Admin pages" do

  subject { page }

  describe "admin page" do
    before { visit admin_path }

    it { should have_selector('h1',    text: 'Admin Sign up') }
    it { should have_selector('title', text: full_title('Admin')) }
  end
end