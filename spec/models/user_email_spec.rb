require 'rails_helper'

RSpec.describe UserEmail, type: :model do
  let(:email) { build(:user_email) }
  it 'rejects invalid email addresses' do
    email.email = 'wrong'
    expect(email.valid?).to eq(false)
  end
end
