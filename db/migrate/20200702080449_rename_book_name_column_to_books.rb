class RenameBookNameColumnToBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :book_name, :name
    rename_column :books, :book_comment, :body
  end
end
