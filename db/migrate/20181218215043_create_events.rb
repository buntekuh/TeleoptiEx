class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.index :calendar_id
      t.string :name
      t.datetime :dstart
      t.datetime :dend
      t.timestamps
    end
  end
end
