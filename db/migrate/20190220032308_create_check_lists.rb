class CreateCheckLists < ActiveRecord::Migration[5.0]
  def change
    create_table :check_lists do |t|
      t.string :name
      t.integer :display_order
      t.integer :display_flag
      t.references :card

      t.timestamps
    end
  end
end
