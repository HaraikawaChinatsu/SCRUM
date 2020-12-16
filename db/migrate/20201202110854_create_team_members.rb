class CreateTeamMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :team_members do |t|

      t.timestamps
      t.integer :team_id, null: false
      t.integer :user_id, null: false
    end
  end
end
