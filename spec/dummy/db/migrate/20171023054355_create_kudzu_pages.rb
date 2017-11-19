class CreateKudzuPages < ActiveRecord::Migration[5.0]
  def change
    create_table :kudzu_pages do |t|
      t.text     :url
      t.integer  :status
      t.text     :mime_type
      t.integer  :size
      t.text     :charset
      t.text     :digest
      t.text     :response_header
      t.float    :response_time
      t.datetime :fetched_at
      t.integer  :revisit_interval
      t.datetime :revisit_at
      t.timestamps null: false

      t.index :url, length: 255
      t.index :digest
    end
  end
end
