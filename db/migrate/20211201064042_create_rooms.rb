class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :introduction
      t.string :price
      t.string :adress
      t.string :roomimage

      t.timestamps
    end
  end
end
