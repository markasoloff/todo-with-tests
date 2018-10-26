class AddListIdToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :list_id, :string
    add_column :tasks, :integer, :string
  end
end
