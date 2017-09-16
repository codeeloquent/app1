class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can? :manage, User, id: user.id
    if user.admin?
    	can? :manage, Comment
      can? :manage, Product
    else
    	can? [:create, :read], Comment
      cna? :read, Product
    end
  end
end