class Course::Admin::AdminController < Course::Admin::Controller
  before_action :load_settings, only: [:components, :update_components]
  add_breadcrumb :index, :course_admin_path

  def index
  end

  def update #:nodoc:
    if current_course.update_attributes(course_setting_params)
      redirect_to course_admin_path(current_course),
                  success: t('.success', title: current_course.title)
    else
      render 'index'
    end
  end

  def components #:nodoc:
  end

  def update_components #:nodoc:
    @settings.update(settings_effective_params)
    if current_course.save
      redirect_to course_admin_components_path(current_course), success: t('.success')
    else
      @settings.errors = current_course.errors
      render 'components'
    end
  end

  private

  # Load our settings adapter to handle component settings
  def load_settings
    @settings = Course::Settings::Effective.new(current_course, current_component_host)
  end

  def course_setting_params #:nodoc:
    params.require(:course).
      permit(:title, :description, :status, :start_at, :end_at)
  end

  def settings_effective_params #:nodoc:
    params.require(:settings_effective)
  end
end