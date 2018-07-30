class AddPriorityToProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :priority, :integer
  end
end
