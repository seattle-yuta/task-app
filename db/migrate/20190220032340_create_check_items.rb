class CreateCheckItems < ActiveRecord::Migration[5.0]
  def change
    create_table :check_items do |t|
      t.string :name, null: false
      t.integer :display_order
      t.boolean :achievement_flag, default: false, null: false
      t.references :check_list, null: false
      t.references :user, null: false

      t.timestamps
    end
  end
end
