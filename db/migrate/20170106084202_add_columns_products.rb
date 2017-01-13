class AddColumnsProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :tags, :string
    add_column :products, :print_time, :integer
    add_column :products, :dimensions, :json
    add_column :products, :quantity, :integer

  end
end
