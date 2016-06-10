class CreateThugs < ActiveRecord::Migration
  def change
    create_table :thugs do |t|
      t.string :name
      t.boolean :alive
      t.integer :number_of_teardrops
      t.boolean :og
      t.belongs_to :gang

      t.timestamps null: false
    end
  end
end
