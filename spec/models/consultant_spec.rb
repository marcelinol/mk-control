require 'rails_helper'

RSpec.describe Consultant, :type => :model do
  context 'validations' do
    let(:consultant) { Consultant.new(name: nil) }

    it { expect(consultant).not_to be_valid }
  end

  context 'callbacks' do
    let(:consultant) { create(:consultant) }

    it 'updates balance' do
      expect(consultant.balance).to eq 0

      consultant.income = BigDecimal.new(100)
      consultant.save
      expect(consultant.balance).to be > 0

      consultant.outcome = BigDecimal.new(300)
      consultant.save
      expect(consultant.balance).to be < 0
    end
  end
end
