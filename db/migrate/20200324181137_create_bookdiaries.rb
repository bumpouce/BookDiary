class CreateBookdiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :book_diaries do |t|
      t.string :user_id
      t.string :book_id
      t.datetime :read_on
      t.integer :rating
      t.timestamps
  end
  end
end
