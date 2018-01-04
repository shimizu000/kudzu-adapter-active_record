class CreateKudzuLinks < ActiveRecord::Migration[5.0]
  def change
    create_table :kudzu_links do |t|
      t.text    :uuid
      t.text    :url
      t.text    :title
      t.integer :state
      t.integer :depth
      t.timestamps null: false
    end
    add_index :kudzu_links, :uuid, length: 4
    add_index :kudzu_links, :url, length: 32
    add_index :kudzu_links, :state
  end
end
