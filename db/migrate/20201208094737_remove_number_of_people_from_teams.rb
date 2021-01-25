class RemoveNumberOfPeopleFromTeams < ActiveRecord::Migration[5.2]
  def change
    remove_column :teams, :number_of_people, :integer
  end
end
