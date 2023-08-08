class CreatePrototypes < ActiveRecord::Migration[7.0]
  def change
    create_table :prototypes do |t|
      t.string :prototype_name, null: false
      t.string :copy,           null: false
      t.text :concept,          null: false
      t.references :user,       foreign_key: true
      t.timestamps
    end
  end
end