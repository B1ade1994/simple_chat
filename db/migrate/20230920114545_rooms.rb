class Rooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
