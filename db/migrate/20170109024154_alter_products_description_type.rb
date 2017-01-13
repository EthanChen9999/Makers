class AlterProductsDescriptionType < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :description
    add_column :products, :description, :text
  end
  def down
    remove_column :products, :description
    add_column :products, :description, :string
  end
end
