class AddHomeCityToUser < ActiveRecord::Migration
  def change
    add_column :users, :home_city, :integer
    change_column :users, :current_city, 'integer USING CAST(current_city AS integer)'
  end
end
