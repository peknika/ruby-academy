# spec/controllers/likes_controller_spec.rb
require 'rails_helper'

describe LikesController do

  context 'user signed in' do
    login_user

    describe "Post #create" do
      let!(:p) { create :post, user: subject.current_user }
      before { post :create, params: { post_id: p.id } }


      it 'creates post like' do
        expect(p.likes.count).to eq(1)
      end

      it 'redirects to post' do
        expect(response).to redirect_to(p)
      end
    end

    describe "Post #destroy" do
      let!(:p) { create :post, user: subject.current_user }
      let!(:like) { create :like, post: p, user: subject.current_user }

      it 'destroys post like' do
        expect { delete :destroy, params: { post_id: p.id } }.to change { p.likes.count }.by(-1)
      end
    end

  end
end