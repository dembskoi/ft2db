class CreateGases < ActiveRecord::Migration
  def change
    create_table :gases do |t|
      t.string :name, null: false, unique: true

      t.timestamps null: false
    end
  end
end

