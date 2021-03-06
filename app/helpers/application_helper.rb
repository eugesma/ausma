module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
      when "success"
        "alert-success"   # Green
      when "error"
        "alert-danger"    # Red
      when "alert"
        "alert-warning"   # Yellow
      when "notice"
        "alert-info"      # Blue
      else
        flash_type.to_s
    end
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def active_class(link_path)
    if params[:controller] == link_path
      return 'active'
    end 
  end

  def active_action(link_path)
    if params[:action] == link_path
      return 'active'
    end
  end

  def user_avatar(user, size=40)
    if user.profile.avatar.attached?
      main_app.url_for(user.profile.avatar.variant(resize: "#{size}x#{size}^", gravity: "center", crop: "#{size}x#{size}+0+0"))
    else
      user.profile.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'profile-placeholder.png')), filename: 'profile-placeholder.png', content_type: 'image/png')
      user.save
      main_app.url_for(user.profile.avatar.variant(resize: "#{size}x#{size}^", gravity: "center", crop: "#{size}x#{size}+0+0"))
    end
  end

  def format_number(a_number)
    number_with_delimiter(number_with_precision(a_number, precision: 0, strip_insignificant_zeros: true), :delimiter => ".", :separator => ",")
  end

  def number_to_percent(a_number)
    number_to_currency(a_number, unit: "%", precision: 0, format: "%n %")
  end
end
