module UsersHelper

  def get_avatar(user)
     user.avatar.attached? ? user.avatar.variant(combine_options: { resize: '256x256^', extent: '256x256', gravity: 'Center' }) : "avatar.png"
  end
end
