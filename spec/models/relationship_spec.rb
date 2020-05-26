require 'rails_helper'

describe Relationship, type: :model do
  let(:follower) { create :user }
  let(:followed) { create :user }
  subject { build :relationship, follower: follower, followed: followed }

  it { should belong_to(:follower) }
  it { should belong_to(:followed) }
  it { should validate_presence_of(:follower_id) }
  it { should validate_presence_of(:followed_id) }
end
