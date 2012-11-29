class CreateAfkCheckModules < ActiveRecord::Migration
  def change
    create_table :afk_check_modules do |t|
      t.string :channel_name

      t.timestamps
    end

    remove_column :bots, :afk_check_module
    add_column    :bots, :afk_check_module_id, :integer
  end
end
