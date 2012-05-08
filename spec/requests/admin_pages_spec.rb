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
  describe "new ops person" do

    before { visit newops_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
# New
      describe "error messages" do
        before { click_button submit }

        it { should have_selector('title', text: 'Admin Sign up') }
        it { should have_content('error') }
      end
      it "should not create an admin" do
        expect { click_button submit }.not_to change(Admin, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example Admin"
        fill_in "Email",        with: "admin@example.com"
        fill_in "Password",     with: "foobarbaz"
        fill_in "Confirmation", with: "foobarbaz"
      end
# New

      describe "after saving the user" do
          before { click_button submit }
          let(:user) { User.find_by_email('user@example.com') }

          it { should have_selector('title', text: user.name) }
          it { should have_selector('div.alert.alert-success', text: 'Welcome') }
          it { should have_link('Sign out') }
        end

      it "should create a user" do
        expect { click_button submit }.to change(Admin, :count).by(1)
      end
    end
  end
  
  describe "edit" do
    let(:admin) { FactoryGirl.create(:admin) }
    before { visit edit_admin_path(admin) }

    describe "page" do
      it { should have_selector('h1',    text: "Update your profile") }
      it { should have_selector('title', text: "Edit admin") }
      it { should have_link('change', href: 'http://gravatar.com/emails') }
    end

    describe "with invalid information" do
      before { click_button "Save changes" }

      it { should have_content('error') }
    end

    describe "with valid information" do
      let(:new_name)  { "New Name" }
      let(:new_email) { "new@example.com" }
      before do
        fill_in "Name",             with: new_name
        fill_in "Email",            with: new_email
        fill_in "Password",         with: admin.password
        fill_in "Confirm Password", with: admin.password
        click_button "Save changes"
      end

      it { should have_selector('title', text: new_name) }
      it { should have_selector('div.alert.alert-success') }
      it { should have_link('Sign out', href: signout_path) }
      specify { admin.reload.name.should  == new_name }
      specify { admin.reload.email.should == new_email }
    end
  end
end