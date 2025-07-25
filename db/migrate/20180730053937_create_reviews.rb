class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end
