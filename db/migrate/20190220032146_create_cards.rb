class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.string :name
      t.integer :display_order
      t.string :detail
      t.datetime :start_deadline
      t.datetime :end_deadline
      t.references :board_list

      t.timestamps
    end
  end
end
