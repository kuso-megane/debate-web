class AddColumnsToOpinions < ActiveRecord::Migration[5.2]
  def change
    add_column :opinions, :content, :string
    add_column :opinions, :user_id, :integer, null: false
    add_column :opinions, :position, :string, null: false
    add_column :opinions, :theme_id, :integer, null: false
    add_column :opinions, :opinion_type, :string, null: false
    add_index :opinions, :user_id
    add_index :opinions, [:theme_id, :position, :opinion_type]
  end
end
