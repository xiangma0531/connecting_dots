class CreateDots < ActiveRecord::Migration[6.0]
  def change
    create_table :dots do |t|
      t.string :title, null: false
      t.integer :category_id, null: false
      t.text :introduction, null: false
      t.text :effort, null: false
      t.text :study, null: false
      t.date :acted_at, null: false
      t.references :student, null: false, foreign_key: true
      t.timestamps
    end
  end
end
