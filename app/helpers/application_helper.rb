module ApplicationHelper

  def get_version
    `git describe --always`
  end

end
