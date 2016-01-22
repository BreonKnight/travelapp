class AddImageToCity < ActiveRecord::Migration
  def change
    add_column :cities, :img_url, :string
  end
end
