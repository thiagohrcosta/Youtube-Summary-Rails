class CreateVideoContents < ActiveRecord::Migration[7.1]
  def change
    create_table :video_contents do |t|
      t.string :title, null: false
      t.string :cover, null: false
      t.text :content, null: false
      t.string :url, null: false

      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
