class AddListIdToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :list_id, :integer
  end
end
