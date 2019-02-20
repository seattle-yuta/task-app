class CreateBoardLists < ActiveRecord::Migration[5.0]
  def change
    create_table :board_lists do |t|
      t.string :name
      t.integer :display_order
      t.references :project

      t.timestamps
    end
  end
end
