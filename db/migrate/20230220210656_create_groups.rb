class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :icon, default: "avatar-icon.png"
      t.references :user, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
