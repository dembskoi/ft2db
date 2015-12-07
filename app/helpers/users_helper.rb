module UsersHelper
  def user_attributes
    {
      'User' => @user.email
    }
  end
end
