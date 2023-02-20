class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :amount
      t.references :user, foreign_key: { to_table: 'users' }
      # t.references :group, foreign_key: {to_table: 'groups'}

      t.timestamps
    end
  end
end
