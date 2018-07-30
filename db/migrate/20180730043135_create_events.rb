class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true
      t.text :site_url
      t.datetime :starts_at
      t.datetime :ends_at

      t.timestamps
    end
  end
end
