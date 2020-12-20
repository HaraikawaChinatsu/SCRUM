class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.timestamps
      t.integer :user_id,          null: false
      t.string :name,              null: false
      t.integer :number_of_people, null: false
      t.text :introduction,        null: false
      t.string :image_id
    end
  end
end
