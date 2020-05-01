class AddColumnToDetails < ActiveRecord::Migration[5.2]
  def change
    add_column :details, :user_id, :integer
  end
end
