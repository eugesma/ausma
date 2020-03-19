class WelcomeController < ApplicationController
  def index
    if user_signed_in?
    teacher = current_user.teacher
    @assignatures = teacher.teacher_assignatures
    @meetings = teacher.teacher_meetings

    @total_credit_assignatures = teacher.total_credit_assignatures
    end
  end

end
