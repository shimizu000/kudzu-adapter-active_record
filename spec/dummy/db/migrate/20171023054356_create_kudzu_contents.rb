class CreateKudzuContents < ActiveRecord::Migration[5.0]
  def change
    create_table :kudzu_contents do |t|
      t.references :page
      t.binary     :data
      t.timestamps null: false
    end
  end
end
