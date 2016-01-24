class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.string :res, null: false
      t.string :name, null: false
      t.string :time, null: false
      t.string :gas, null: false

      t.json :standard_data, default: {}, null: false
      t.json :scalar_data, default: {}, null: false
      t.json :vector_data, default: {}, null: false

      t.references :type, index: true, null: false
      t.references :equation, index: true
      t.references :experiment, index: true

      t.timestamps null: false
    end

    add_index :results, [:name, :time], unique: true
  end
end
