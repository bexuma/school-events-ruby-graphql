class AddImageNameToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :image_name, :string
  end
end
