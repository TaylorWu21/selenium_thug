class CreateGangs < ActiveRecord::Migration
  def change
    create_table :gangs do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
