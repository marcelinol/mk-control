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
      let(:customer) { build(:customer) }

      it 'schedules next contact' do
        customer.next_contact_date = 2.days.from_now

        expect { customer.save }.to change(ReminderWorker.jobs, :size).by(1)
      end
    end
  end

end
