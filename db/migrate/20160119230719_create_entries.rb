class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :title
      t.string :body
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
