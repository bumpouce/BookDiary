class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :publication_date
      t.string :subject
      t.timestamps
    end
  end
end
