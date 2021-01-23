class CreateTrouts < ActiveRecord::Migration
  def change
    create_table :trouts do |t|
      t.string :name
      t.string :personality
      t.text   :biography
      t.string :image
      t.integer :user_id
    end
  end
end
