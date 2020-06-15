module PostsHelper
  def post_status_label(post)
    # Label del estado para vista.
    if post.auditoria?; return 'warning'
    elsif post.validado?; return 'success'
    elsif post.rechazado?; return 'danger'
    end
  end
end