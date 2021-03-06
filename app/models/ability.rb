class Ability

  include CanCan::Ability

  def initialize(user)
    unless user.nil?
      if user.admin?
        admin_ability(user)
      else
        user_ability(user)
      end
    end
  end

  private

  def user_ability(user)
    can :read, :menu
    can :read, :overview
    can [:read, :update, :change_running_state], Bot do |bot|
      bot.users.include?(user)
    end
  end

  def admin_ability(user)
    can :manage, :all

    cannot :destroy, User, :id => user.id
  end

end
