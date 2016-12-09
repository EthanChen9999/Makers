class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title,          null: false, default: ""
      t.string :description,    null: false, default: ""
      t.integer :user_id,       null: false

      t.timestamps              null: false
    end
  end
end
