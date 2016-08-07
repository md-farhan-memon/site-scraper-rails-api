class CreateATags < ActiveRecord::Migration[5.0]
  def change
    create_table :a_tags do |t|
      t.string :text
      t.string :value
      t.integer :link_id

      t.timestamps
    end
    add_index :a_tags, :link_id
  end
end
