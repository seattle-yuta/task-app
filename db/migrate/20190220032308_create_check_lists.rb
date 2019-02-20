class CreateCheckLists < ActiveRecord::Migration[5.0]
  def change
    create_table :check_lists do |t|
      t.string :name, null: false
      t.integer :display_order
      t.boolean :display_flag, default: false, null: false
      t.references :card, null: false

      t.timestamps
    end
  end
end
