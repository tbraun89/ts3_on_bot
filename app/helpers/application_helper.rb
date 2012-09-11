module ApplicationHelper

  def get_version
    `git describe --abbrev=0`
  end

end
