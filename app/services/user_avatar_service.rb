class UserAvatarService
  def initialize(params)
    @user = User.find(params[:id])
    @avatar = params[:avatar]
  end

  def attach_avatar
    attach_file
  end

  private

  def attach_file
    avatar_file = "#{@avatar}.png"
    path = "app/assets/images/#{avatar_file}"
    @user.avatar.attach(io: File.open(path), filename: avatar_file,
                        content_type: 'image/png')
  end
end