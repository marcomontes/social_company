class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
      t.integer :visibility, default: 0
      t.text :group_ids, array: true, default: []
      t.text :body

      t.timestamps null: false
    end
  end
end
