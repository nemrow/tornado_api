class CreateChanges < ActiveRecord::Migration
  def change
    create_table :changes do |t|
      t.text :selector
      t.string :selector_checksum
      t.text :content
      t.string :content_type
      t.integer :page_id

      t.timestamps
    end
  end
end
