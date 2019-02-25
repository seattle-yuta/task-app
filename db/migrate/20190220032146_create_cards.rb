class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :board_lists do |t|
      t.string :name, null: false
      t.integer :display_order
      t.string :detail
      t.datetime :start_deadline
      t.datetime :end_deadline
      t.references :board_list, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
