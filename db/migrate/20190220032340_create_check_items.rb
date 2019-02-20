class CreateCheckItems < ActiveRecord::Migration[5.0]
  def change
    create_table :check_items do |t|
      t.string :name
      t.integer :display_order
      t.integer :achievement_flag
      t.references :check_list

      t.timestamps
    end
  end
end
