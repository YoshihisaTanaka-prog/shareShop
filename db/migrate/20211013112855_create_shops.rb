class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :japanese_name
      t.string :engilsh_name
      t.timestamps
    end
  end
end
