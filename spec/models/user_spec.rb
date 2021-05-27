require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'Validations' do
    it "is not valid without a login name" do
      user.login_name = nil
      expect(user).to_not be_valid
    end
    it "is not valid without a user name" do
      user.name = nil
      expect(user).to_not be_valid
    end

    it "is not valid without unique login name" do
      user.login_name = 'abcd'
      user.save
      user2 = FactoryBot.build(:user, login_name: 'ABCD')
      expect(user2).to_not be_valid
      expect(user2.errors).to be_present
    end
  end
end