class CreateDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :diaries do |t|

      t.timestamps
      t.string :title,              null: false, default: ""
      t.date :date,              null: false
      t.integer :weight,            null: false
      t.text :text,                 null: false
      t.string :image_id
    end
  end
end
