class CreateTableJumbotron < ActiveRecord::Migration[5.0]
  def change
    create_table :jumbotrons do |t|
      t.integer :user_id
      t.string :bg
    end
  end
end
