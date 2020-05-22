# spec/controllers/comments_controller_spec.rb
require 'rails_helper'

describe CommentsController, type: :controller do
  context 'user signed in' do
    login_user

    describe 'Post #create' do
      let!(:p) { create :post, user: subject.current_user }

      it 'saves new post' do
        post :create, params: { comment: attributes_for(:comment, post: p) }
        expect(subject.post.comments).to include(assigns(:comment))
      end
    end

    describe 'Post #destroy' do
      let!(:p) { create :post, user: subject.current_user }
      let!(:comment) {create :comment, post: p }

      it 'removes post from table' do
        expect { delete :destroy, params: { id: comment.id } }.to change { Comment.count }.by(-1)
      end
    end
  end
end