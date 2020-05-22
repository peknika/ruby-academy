# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

describe PostsController, type: :controller do

  context 'user signed in' do
    login_user

    describe "GET #index" do
      before { get :index }

      it { expect(response.status).to eq(200) }
      it { is_expected.to render_template(:index)}
    end

    describe 'Get #new' do
      before { get :new }

      it { is_expected.to render_template(:new) }

      it 'assigns new post' do
        expect(assigns(:post)).to be_a_new Post
      end
    end

    describe 'Post #create' do
      before { post :create, params: { post: attributes_for(:post, user: subject.current_user) } }

      it 'saves new post' do
        expect(subject.current_user.posts).to include(assigns(:post))
      end

      it 'has image attached' do
        expect(assigns(:post).image).to be_attached
      end

      it 'redirects to #show' do
        expect(subject).to redirect_to action: :show, id: assigns(:post).id
      end
    end

    describe 'Post #destroy' do
      let!(:post) { create :post, user: subject.current_user }

      it 'removes post from table' do
        expect { delete :destroy, params: { id: post.id } }.to change { Post.count }.by(-1)
      end

      it 'renders index template' do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to profile_url(subject.current_user)
      end
    end

    describe 'Get #show' do
      let!(:post) { create :post, user: subject.current_user }

      before { get :show, params: { id: post.id } }

      it { expect(response.status).to eq(200) }
      it { is_expected.to render_template(:show)}
    end
  end
end