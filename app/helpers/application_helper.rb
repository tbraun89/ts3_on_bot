m
dule ApplicationHelper

  def get_version
    `git describe --exact-match --abbrev=0`
  end

end
