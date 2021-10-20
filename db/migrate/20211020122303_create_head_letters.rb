class CreateHeadLetters < ActiveRecord::Migration[6.0]
  def change
    create_table :head_letters do |t|
      t.string :letter
      t.string :language

      t.timestamps
    end
  end
end
