class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.timestamp :time
      t.text :location

      t.timestamps
    end
  end
end
