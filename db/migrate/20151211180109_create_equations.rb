class CreateEquations < ActiveRecord::Migration
  def change
    create_table :equations do |t|
      t.string :equ, null: false

      t.timestamps null: false
    end
  end
end
