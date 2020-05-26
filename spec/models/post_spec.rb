# spec/models/post_spec.rb
require 'rails_helper'

describe Post, :type => :model   do
  let(:user) { create :user }
  subject { build(:post, user: user) }

  it { should belong_to(:user) }
  it { should validate_presence_of(:image) }
  it { should have_many(:likes) }
  it { should have_many(:comments) }
  it { is_expected.to validate_content_type_of(:image).allowing('image/png', 'image/jpg', 'image/jpeg') }
  it { is_expected.to validate_content_type_of(:image).rejecting('text/plain', 'text/xml', 'image/gif') }
  it { is_expected.to validate_size_of(:image).less_than(3.megabytes) }

end