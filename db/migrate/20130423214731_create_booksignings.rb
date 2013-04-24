class CreateBooksignings < ActiveRecord::Migration
  def change
    create_table :booksignings do |t|
      t.string :author
      t.time :at

      t.timestamps
    end
  end
end
