class AddRelationAndTopCategories < ActiveRecord::Migration[6.0]
  def up
    add_column :categories, :parent_id, :integer
    add_column :categories, :is_top, :boolean
  end
end
