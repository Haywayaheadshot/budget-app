class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo, default: "avatar-icon.png"
      t.timestamps
    end
  end
end
