# spec/models/user_spec.rb
require 'rails_helper'

describe User, type: :model do
  subject { build(:user) }

  it { is_expected.to have_many(:posts) }

  it { is_expected.to have_many(:passive_relationships).with_foreign_key(:followed_id).class_name('Relationship') }
  it { is_expected.to have_many(:active_relationships).with_foreign_key(:follower_id).class_name('Relationship') }

  it { is_expected.to have_many(:followers).through(:passive_relationships).source(:follower) }
  it { is_expected.to have_many(:following).through(:active_relationships).source(:followed) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:email).ignoring_case_sensitivity }
  it { is_expected.to validate_presence_of(:username) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }



end