class UserAvatarService
  def initialize(user_id, avatar)
    @user = User.find(user_id)
    @avatar = avatar.presence || 'avatar_default'
  end

  def attach_file
    avatar_file = "#{@avatar}.png"
    path = "app/assets/images/avatars/#{avatar_file}"
    @user.avatar.attach(io: File.open(path), filename: avatar_file,
                        content_type: 'image/png')
  end
end