class ChangeDateTypes < ActiveRecord::Migration[5.2]
  def change
    change_column :book_diaries, :read_on, :string
    change_column :books, :publication_date, :string
  end
end
