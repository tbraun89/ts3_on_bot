module ApplicationHelper

  def get_version
    `git describe --tags \`git rev-list --tags --max-count=1\``
  end

end
