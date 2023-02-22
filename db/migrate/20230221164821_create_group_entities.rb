class CreateGroupEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :group_entities do |t|
      t.references :entity, null: false, foreign_key: {to_table: 'entities'}
      t.references :group, null: false, foreign_key: {to_table: 'groups'}

      t.timestamps
    end
  end
end
