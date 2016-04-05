require 'rails_helper'
require 'sidekiq/testing'
Sidekiq::Testing.fake!

RSpec.describe Customer, :type => :model do
  context 'validations' do
    let(:customer) { Customer.new(name: nil, source: nil) }

    it { expect(customer).not_to be_valid }

    it 'has two errors' do
      customer.valid?
      expect(customer.errors.count).to eq(2)
    end
  end

  context 'callbacks' do
    context '#schedule_next_contact' do
      let(:consultant) { create(:consultant) }
      let(:customer)   { build(:customer, consultant: consultant) }

      it 'schedules next contact' do
        customer.next_contact_date = 2.days.from_now

        expect { customer.save }.to change(ReminderWorker.jobs, :size).by(1)
      end
    end
  end

  context 'scopes' do
    let!(:consultant) { create(:consultant) }
    let!(:customer)   { create(:customer, next_contact_date: Time.now) }

    before { consultant.customers << customer  }

    it { binding.pry; expect(consultant.customers.must_contact_today.count).to eq 1 }

  end

end
