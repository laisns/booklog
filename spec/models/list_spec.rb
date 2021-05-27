require 'rails_helper'

RSpec.describe List, :type => :model do
  subject { FactoryBot.create :list }
end