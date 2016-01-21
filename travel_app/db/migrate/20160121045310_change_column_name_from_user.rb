class ChangeColumnNameFromUser < ActiveRecord::Migration
  def change
    rename_column :users, :current_city, :current_city_id
    rename_column :users, :home_city, :home_city_id
  end
end
