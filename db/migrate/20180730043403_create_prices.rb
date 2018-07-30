class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.string :label
      t.integer :amount
      t.references :event, foreign_key: true

    end
  end
end
