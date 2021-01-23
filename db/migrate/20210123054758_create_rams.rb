class CreateRams < ActiveRecord::Migration
  def change
    create_table :rams do |t|
      t.string :name
      t.string :personality
      t.text   :biography
      t.string :image
      t.integer :user_id
    end
  end
end
