require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.permissions' do
    let(:resource) { create :user, email: 'example@example.com', password: '111111' }

    it 'returns permissions' do
      permission = create :permission
      role = create :role, permissions: [permission]
      create :user_role, user: resource, role: role

      expect(resource.roles.to_a).to eq [role]
      expect(resource.permissions.to_a).to eq [permission]
    end
  end

  describe '#super_admin?' do
    let(:roles) { [create(:role, code: 'super_admin')] }
    let(:resource) { create :user, email: 'example@example.com', password: '111111', roles: roles }

    it 'return true' do
      expect(resource.super_admin?).to be true
    end

    context 'when roles do not include super_admin value' do
      let(:roles) { [create(:role, code: 'super_admin1')] }
      it 'return false' do
        expect(resource.super_admin?).to be false
      end
    end

    context 'when roles are empty' do
      let(:roles) { [] }
      it 'return false' do
        expect(resource.super_admin?).to be false
      end
    end
  end

  describe '#role_names' do
    let(:roles) { [create(:role, name: 'role1')] }
    let(:resource) { create :user, email: 'example@example.com', password: '111111', roles: roles }

    it 'return an array role names' do
      expect(resource.role_names).to eq ['role1']
    end

    context 'when roles are empty' do
      let(:roles) { [] }

      it 'return an empty array' do
        expect(resource.role_names).to eq []
      end
    end
  end

  describe '#role_codes' do
    let(:roles) { [create(:role, code: 'role1')] }
    let(:resource) { create :user, email: 'example@example.com', password: '111111', roles: roles }

    it 'return an array role names' do
      expect(resource.role_codes).to eq ['role1']
    end

    context 'when roles are empty' do
      let(:roles) { [] }

      it 'return an empty array' do
        expect(resource.role_codes).to eq []
      end
    end
  end
end
