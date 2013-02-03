class CreatePhotoUrls < ActiveRecord::Migration
  def change
    create_table :photo_urls do |t|
      t.integer :user_id
      t.string :url

      t.timestamps
    end
  end
end
