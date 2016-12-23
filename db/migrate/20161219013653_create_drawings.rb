class CreateDrawings < ActiveRecord::Migration[5.0]
  def change
    create_table :drawings do |t|
      t.integer :product_id
      t.string :drawing

    end
  end
end
