class CreateEvents < ActiveRecord::Migration[8.0]
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :event_type
      t.integer :team_size

      t.timestamps
    end
  end
end
