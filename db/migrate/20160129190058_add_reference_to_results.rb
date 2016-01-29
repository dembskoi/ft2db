class AddReferenceToResults < ActiveRecord::Migration
  def change
    remove_column :results, :gas
    add_reference :results, :gas, index: true, null: false
  end
end
