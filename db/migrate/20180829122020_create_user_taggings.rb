class CreateUserTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :user_taggings do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :user_taggings, [:user_id, :tag_id], unique: true
  end
end
