class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.string :title
      t.date :date
      t.float :weight
      t.float :sets
      t.float :reps

      t.timestamps null: false
    end
  end
end
