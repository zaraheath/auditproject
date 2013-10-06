module ApplicationHelper

  #Devise methods for login available in all controllers
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def grades_options
    Control::GRADES_KEYS.invert.map{|k, a| [t("controls.grades.#{k}"), a]}
  end

end
