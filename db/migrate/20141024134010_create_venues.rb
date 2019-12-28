class CreateVenues < ActiveRecord::Migration[4.2]
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
