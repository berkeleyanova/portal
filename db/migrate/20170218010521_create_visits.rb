class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :time
      t.string :day_of_week
      t.belongs_to :school, index: true

      t.timestamps null: false
    end
  end
end
