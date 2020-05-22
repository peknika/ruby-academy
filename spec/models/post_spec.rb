# spec/models/post_spec.rb
require 'rails_helper'

describe Post, :type => :model   do

  it { is_expected.to belong_to(:user) }
  it { is_expected.to validates_presence_of(:title) }

  it 'saves the image' do
    expect(subject.current_user.posts.create image: post_params ).to be_valid
  end

  it 'doe not saves the image' do
    expect(subject.current_user.posts.create image: post_params ).to be_valid
  end
end



context 'validates image format' do
  it 'allows to set png file as an image' do
    login_user
  end

  it 'doesnt allow to use invalid image format' do

  end
end