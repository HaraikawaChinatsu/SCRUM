class AddDateToDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :diaries, :date, :datetime
  end
end
