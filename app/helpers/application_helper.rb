module ApplicationHelper
  def custom_body_class
    body_class
    @body_class += ' h-full'
  end

  private
end
