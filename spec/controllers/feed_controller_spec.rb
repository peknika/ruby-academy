# spec/controllers/feed_controller_spec.rb
require 'rails_helper'

describe FeedController do

  context 'user signed in' do
    login_user

    describe 'Get #index' do
      before { get :index }

      it { is_expected.to render_template(:index) }
    end
  end
end