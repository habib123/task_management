class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    user_roles = user.roles.map{|r| r.name }
    (User::USER_ROLE_PRIORITY&user_roles).each {|role| send(role.underscore, user) }
    if user.roles.size == 0
      can :read, :all
    end
  end

  def novice(user)
    can :read, User
    can :update, User, id: user.id
    can :manage, Todo
    can :read, Campaign
    can :read, Comment
    cannot [:edit_assign,:assign], User
    #polymorphic
    cannot :create, Comment
    can :create, Comment, Comment.todo_commentable do | c |
      c.commentable.user_id == user.id
    end
  end

  def expert(user)
    can :manage, :all
  end
end
