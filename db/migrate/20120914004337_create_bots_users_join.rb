class CreateBotsUsersJoin < ActiveRecord::Migration
  def up
    create_table 'bots_users', :id => false do |t|
      t.column :bot_id,  :integer
      t.column :user_id, :integer
    end
  end

  def down
    drop_table 'bots_users'
  end
end
