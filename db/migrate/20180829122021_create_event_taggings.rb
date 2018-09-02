class CreateEventTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :event_taggings do |t|
      t.references :event, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end

    add_index :event_taggings, [:event_id, :tag_id], unique: true
  end
end
