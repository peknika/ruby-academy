# spec/controllers/relationships_controller_spec.rb
require 'rails_helper'

describe RelationshipsController do

  context 'user signed in' do
    login_user

    describe "Post #create" do
      let!(:celebrity) { create :user }
      before { post :create, params: { id: celebrity.id } }

      it 'follows other user' do
        expect(subject.current_user.following?(celebrity)).to be true
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end

      it 'flashes a success message' do
        expect( subject.request.flash[:success] ).to_not be_nil
      end
    end

    describe 'Delete #destroy' do
      let!(:celebrity) { create :user }
      let!(:relationship) { create :relationship, follower: subject.current_user, followed: celebrity }
      before { delete :destroy, params: { id: subject.current_user.active_relationships.find_by(followed_id: celebrity.id).id } }

      it 'follows other user' do
        expect(subject.current_user.following?(celebrity)).to be false
      end

      it 'redirects to root' do
        expect(response).to redirect_to(root_path)
      end

      it 'flashes a success message' do
        expect( subject.request.flash[:success] ).to_not be_nil
      end
    end
  end
end