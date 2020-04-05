module UsersHelper

  def get_avatar(user)
     user.avatar.attached? ? user.avatar.variant(resize: "50x50") : "avatar.png"
  end
end
