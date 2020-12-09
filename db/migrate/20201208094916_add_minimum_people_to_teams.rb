class AddMinimumPeopleToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :minimum_people, :integer
  end
end
