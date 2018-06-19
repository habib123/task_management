module UsersHelper
  def status
    [:qualified, :not_qualified, :banned]
  end

  def user_type(user)
    "#{ user.type.blank? ? 'user' : user.type.underscore}[role_ids][]"
  end
end
