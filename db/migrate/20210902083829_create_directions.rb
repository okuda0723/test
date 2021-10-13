class CreateDirections < ActiveRecord::Migration[6.1]
  def change
    create_table :directions do |t|
      t.references :cooking, null: false, foreign_key: true
      t.integer :step_number
      t.text :text

      t.timestamps
    end
  end
end
