# spec/controllers/users_controller_spec.rb
require 'rails_helper'

describe UsersController do

  context 'user signed in' do
    login_user

    describe 'Get #show' do
      before { get :show, params: {id: subject.current_user.id} }

      it { expect(response.status).to eq(200) }
      it { is_expected.to render_template(:show)}
    end

    describe 'PATCH #upload_avatar' do
      before { patch 'upload_avatar', params: { user: { avatar: Rack::Test::UploadedFile.new(Rails.root.join('app', 'assets', 'images', 'test_image.png'), 'image/png')  } } }

      it 'attaches avatar' do
        expect(subject.current_user.avatar).to be_attached
      end
    end
  end
end