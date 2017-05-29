class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new # guest user
      can :read, :all
      can :create, Post
      can :update, Post do |post|
    end
 end

end