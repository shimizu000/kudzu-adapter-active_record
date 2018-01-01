class CreateKudzuChunks < ActiveRecord::Migration[5.0]
  def change
    create_table :kudzu_chunks do |t|
      t.references :page
      t.binary     :data
      t.timestamps null: false
    end
  end
end
