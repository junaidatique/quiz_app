class Ability
  include CanCan::Ability

  def initialize(user)
            
    if user.admin?
      can :manage, :all
    
    elsif user.products?
      can :manage, Quiz
    elsif user.seller?
      can :manage, QuizAttempt
    end
    
  end
end
