class AddFieldsToUser < ActiveRecord::Migration
  def change
        add_column :users, :birthday, :string
        add_column :users, :year, :string
        add_column :users, :favprog, :string
        add_column :users, :food, :string
  end
end
