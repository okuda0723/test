class CreateCookings < ActiveRecord::Migration[6.1]
  def change
    create_table :cookings do |t|
      t.string :title
      t.date :created_date
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :comment
      t.float :rating

      t.timestamps
    end
  end
end
