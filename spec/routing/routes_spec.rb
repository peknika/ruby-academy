require 'rails_helper'

describe 'Routes Spec', :type => :routing do
  describe 'Users Controller' do
    it "should route '/profile' :to => 'users#show'" do
      expect(get: profile_path).to route_to( 'users#show')
    end

    it "should route '/avatar' :to => 'users#upload_avatar'" do
      expect(patch: avatar_path).to route_to( 'users#upload_avatar')
    end
  end

  describe 'Devise Controller' do
    it "should route new_user_session'" do
      expect(get: new_user_session_path).to route_to( 'users#show')
    end

    it "should route '/avatar' :to => 'users#upload_avatar'" do
      expect(patch: avatar_path).to route_to( 'users#upload_avatar')
    end
  end
end