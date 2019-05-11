class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string   :name
      t.string   :location
      t.text     :text
      t.text     :image
      t.timestamps null: true
    end
  end
end
