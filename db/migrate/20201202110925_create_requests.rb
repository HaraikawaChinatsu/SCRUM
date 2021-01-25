class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.timestamps
      t.integer :team_id, null: false
      t.integer :user_id, null: false
      t.integer :status, null: false
    end
  end
end
