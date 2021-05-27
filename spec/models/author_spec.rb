require 'rails_helper'

RSpec.describe Author, :type => :model do
  subject { FactoryBot.create :author }

  describe 'Validations' do
    it "is not valid without a name" do
      expect(subject).to be_valid
    end

    it "is not valid without a unique name" do
      author2 = FactoryBot.build :author, name: subject.name
      expect(author2).not_to be_valid
    end
  end
end