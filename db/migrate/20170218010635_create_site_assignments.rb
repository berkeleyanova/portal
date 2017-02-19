class CreateSiteAssignments < ActiveRecord::Migration
  def change
    create_table :site_assignments do |t|
      t.belongs_to :user, index: true
      t.belongs_to :visit, index: true
      t.timestamps null: false
    end
  end
end
