class WelcomeController < ApplicationController
  def index
    if user_signed_in?
    @teacher = current_user.teacher
    @assignatures = @teacher.teacher_assignatures
    @meetings = @teacher.teacher_meetings
    @formations = @teacher.teacher_formations
    @extension_activities = @teacher.teacher_extension_activities
    @posts = @teacher.teacher_posts

    @total_credit_assignatures = @teacher.total_credit_assignatures
    end
  end

end
