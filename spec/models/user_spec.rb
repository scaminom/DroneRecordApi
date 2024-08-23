require 'rails_helper'

RSpec.describe User do
  describe 'associations' do
    it { is_expected.to have_many(:drones).dependent(:destroy) }
  end

  describe 'validations' do
    subject { build(:user) }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }

    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to allow_value('user@example.com').for(:email) }
    it { is_expected.not_to allow_value('invalid_email').for(:email) }

    it { is_expected.to validate_presence_of(:password).on(:create) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).on(:create) }

    it { is_expected.to validate_presence_of(:role) }
    it { is_expected.to define_enum_for(:role).with_values(%w[user admin]) }

    it { is_expected.to allow_value('John').for(:first_name) }
    it { is_expected.not_to allow_value('John123').for(:first_name) }

    it { is_expected.to allow_value('Doe').for(:last_name) }
    it { is_expected.not_to allow_value('Doe123').for(:last_name) }
  end

  describe 'jti column for token revocation' do
    it { is_expected.to have_db_column(:jti).of_type(:string) }
    it { is_expected.to have_db_index(:jti).unique(true) }
  end

  describe 'allowed params' do
    it 'has correct WHITELISTED_ATTRIBUTES' do
      expect(User::WHITELISTED_ATTRIBUTES).to eq([:username, :email, :password, :role, :first_name, :last_name])
    end

    it 'has correct WHITELISTED_ATTRIBUTES_REGISTRATION' do
      expect(User::WHITELISTED_ATTRIBUTES_REGISTRATION).to eq([:username, :email, :password, :first_name, :last_name])
    end
  end

  describe '#jwt_payload' do
    let(:user) do
      build(:user, first_name: 'John', last_name: 'Doe', role: 'user', username: 'john_doe', email: 'john@example.com')
    end

    it 'returns the correct payload' do
      payload = user.jwt_payload
      expect(payload).to include('first_name' => 'John', 'last_name' => 'Doe', 'role' => 'user')
    end
  end
end
