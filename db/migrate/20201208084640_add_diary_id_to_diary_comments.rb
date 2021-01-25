class AddDiaryIdToDiaryComments < ActiveRecord::Migration[5.2]
  def change
    add_column :diary_comments, :diary_id, :integer
  end
end
