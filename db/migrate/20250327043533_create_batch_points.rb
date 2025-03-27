class CreateBatchPoints < ActiveRecord::Migration[8.0]
  def change
    create_table :batch_points do |t|
      t.string :batch_name
      t.decimal :batch_points

      t.timestamps
    end
  end
end
