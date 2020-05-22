class PostPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    record.user_id == current_user.id
  end

  class Scope < Scope
    def resolve
      scope
    end
  end
end
