class AddAfkCheckModuleToBot < ActiveRecord::Migration

  def change
    add_column :bots, :afk_check_module, :boolean, :default => false
  end

end
