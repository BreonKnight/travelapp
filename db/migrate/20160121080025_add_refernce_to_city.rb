class AddRefernceToCity < ActiveRecord::Migration
  def change
    change_table :entries do |t|
      t.belongs_to :city, index: true, foreign_key: true
    end
  end
end
