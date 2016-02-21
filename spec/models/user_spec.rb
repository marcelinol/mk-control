require 'rails_helper'

RSpec.describe User do
  context 'callbacks' do
    let(:user) { build(:user) }
    it 'creates and assigns a consultant' do
      user.save
      user.reload

      expect(user.consultant).to be
    end
  end
end
