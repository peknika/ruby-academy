# spec/models/user_spec.rb
require 'rails_helper'

describe User, type: :model do
  subject { build(:user) }

  it { should have_many(:posts) }

  it { should have_many(:passive_relationships).with_foreign_key(:followed_id).class_name('Relationship') }
  it { should have_many(:active_relationships).with_foreign_key(:follower_id).class_name('Relationship') }

  it { should have_many(:followers).through(:passive_relationships).source(:follower) }
  it { should have_many(:following).through(:active_relationships).source(:followed) }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:username) }
  it { should validate_uniqueness_of(:username) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
end