class RenameRestaurantColumn < ActiveRecord::Migration
  def up
    rename_column :restaurants, :type, :kind
  end

  def down
  end
end
