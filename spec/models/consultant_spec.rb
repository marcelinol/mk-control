require 'rails_helper'

RSpec.describe Consultant, :type => :model do
  context 'validations' do
    let(:consultant) { Consultant.new(name: nil) }

    it { expect(consultant).not_to be_valid }

    it 'does not duplicate name' do
      create(:consultant)
      new_consultant = build(:consultant)

      expect(new_consultant).not_to be_valid
    end
  end
end
