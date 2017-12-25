class AddDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :descriptions, :text
  end
end
