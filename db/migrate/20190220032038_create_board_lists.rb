class CreateBoardLists < ActiveRecord::Migration[5.0]
  def change
    create_table :board_lists do |t|
      t.string :name, null: false
      t.integer :display_order
      t.references :projects, null: false

      t.timestamps
    end
  end
end
