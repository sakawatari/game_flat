class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :game_title
      t.text :content

      t.timestamps null: false
    end
  end
end
