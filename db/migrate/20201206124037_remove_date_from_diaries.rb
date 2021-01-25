class RemoveDateFromDiaries < ActiveRecord::Migration[5.2]
  def change
    remove_column :diaries, :date, :integer
  end
end
