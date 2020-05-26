require 'rails_helper'

describe Like, type: :model do
  let(:user) { create :user }
  let(:post) { create :post, user: user}
  subject { build(:like, user:user, post: post) }

  it { should belong_to(:user) }
  it { should belong_to(:post) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:post) }
end
