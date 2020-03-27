class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|
      t.string :reader_id
      t.string :book_id
      t.string :read_on
      t.integer :rating
      t.timestamps
    end
  end
end
