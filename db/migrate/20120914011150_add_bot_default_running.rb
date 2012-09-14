class AddBotDefaultRunning < ActiveRecord::Migration
  def change
    change_column :bots, :running, :boolean, :default => false
  end
end
