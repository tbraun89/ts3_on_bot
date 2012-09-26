class AddServerDataToBot < ActiveRecord::Migration
  def change
    add_column :bots, :server_address, :string
    add_column :bots, :server_port,    :string
    add_column :bots, :server_id,      :string
    add_column :bots, :query_user,     :string
    add_column :bots, :query_password, :string
  end
end
