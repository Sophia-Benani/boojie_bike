class CreateBikes < ActiveRecord::Migration[7.0]
  def change
    create_table :bikes do |t|
      t.string :name
      t.string :brand
      t.string :type
      t.string :description
      t.string :address
      t.string :accessories
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
