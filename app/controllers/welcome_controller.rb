class WelcomeController < ApplicationController
  def index
    return unless user_signed_in?

    @teacher = current_user.teacher
    @year = params[:year].present? ? Date.new(params[:year].to_i) : Date.today

    @assignatures = @teacher.teacher_assignatures
    @meetings = @teacher.teacher_meetings_to_year(@year)
    @formations = @teacher.teacher_formations_to_year(@year)
    @extension_activities = @teacher.teacher_extension_activities
    @posts = @teacher.teacher_posts_to_year(@year)
    @projects = @teacher.teacher_projects_to_year(@year)

    @total_credit_assignatures = @teacher.total_credit_assignatures
  end
end
