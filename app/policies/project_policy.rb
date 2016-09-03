class ProjectPolicy < ApplicationPolicy
  def show?
    is_admin? || context.current_user.projects.find_by_id(record.id)
  end

  def reports?
    index?
  end

  def archived?
    update?
  end

  def import?
    update?
  end

  def import_upload?
    import?
  end

  class Scope < Scope
    def resolve
      if is_admin?
        Project
      else
        context.current_user.projects
      end
    end
  end
end
