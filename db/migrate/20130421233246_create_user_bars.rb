class CreateUserBars < ActiveRecord::Migration
  def change
    create_table :user_bars do |t|
      t.integer :user_id
      t.integer :bar_id
      t.boolean :attended

      t.timestamps
    end
  end
end
