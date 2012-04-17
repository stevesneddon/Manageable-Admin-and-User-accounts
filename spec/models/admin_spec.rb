# == Schema Information
#
# Table name: admins
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

require 'spec_helper'

describe Admin do
  before { @admin = Admin.new(name: "Example Admin", email: "admin@example.com") }

  subject { @admin }

  it { should respond_to(:name) }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @admin.name = " " }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @admin.email = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @admin.name = "a" * 64 }
    it { should_not be_valid }
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[admin@foo,com user_at_foo.org example.admin@foo.]
      addresses.each do |invalid_address|
        @admin.email = invalid_address
        @admin.should_not be_valid
      end      
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[admin@foo.com A_ADMIN@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @admin.email = valid_address
        @admin.should be_valid
      end      
    end
  end

  describe "when email address is already taken" do
    before do
      admin_with_same_email = @admin.dup
      admin_with_same_email.email = @admin.email.upcase
      admin_with_same_email.save
    end

    it { should_not be_valid }
  end
end