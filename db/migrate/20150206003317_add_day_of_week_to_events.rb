class AddDayOfWeekToEvents < ActiveRecord::Migration[4.2]
  def change
    add_column :events, :day_of_week, :string, null: false, default: ''
    add_index  :events, :day_of_week
  end
end
