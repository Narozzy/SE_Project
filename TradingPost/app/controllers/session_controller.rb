class SessionController < Clearance::SessionController
  protected
  def url_after_create
    root_path
  end
end
