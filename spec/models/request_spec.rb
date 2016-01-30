require 'rails_helper'

RSpec.describe Request, :type => :model do
  context 'validations' do
    let(:request) { Request.new(consultant_id: nil) }

    it { expect(request).not_to be_valid }
  end

end
