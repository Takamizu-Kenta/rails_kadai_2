class RenameIntrodcutionColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :introdcution, :introduction
  end
end
