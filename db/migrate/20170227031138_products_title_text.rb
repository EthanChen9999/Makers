class ProductsTitleText < ActiveRecord::Migration[5.0]
  def up
    remove_column :products, :title
    add_column :products, :title, :text
  end
  def down
    remove_column :products, :title
    add_coumn :products, :title, :string
  end
end
