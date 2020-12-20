class AddMaxPeopleToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :max_people, :integer
  end
end
