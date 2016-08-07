class CreateH2Tags < ActiveRecord::Migration[5.0]
  def change
    create_table :h2_tags do |t|
      t.string :content
      t.integer :link_id

      t.timestamps
    end
    add_index :h2_tags, :link_id
  end
end
