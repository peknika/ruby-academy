# spec/controllers/comments_controller_spec.rb
require 'rails_helper'

describe CommentsController do

  context 'user signed in' do
    login_user

    describe 'Post #create' do
      let!(:p) { create :post, user: subject.current_user }
      before { post :create, params: { post_id: p.id, comment: attributes_for(:comment, user: subject.current_user, post: p) } }

      it 'saves new comment' do
        expect(p.comments).to include(assigns(:comment))
      end
    end

    describe 'Post #destroy' do
      let!(:p) { create :post, user: subject.current_user }
      let!(:comment) { create :comment, user: subject.current_user, post: p }

      it 'removes comment from table' do
        expect { delete :destroy, params: { post_id: p.id, id: comment.id } }.to change { Comment.count }.by(-1)
      end
    end
  end
end