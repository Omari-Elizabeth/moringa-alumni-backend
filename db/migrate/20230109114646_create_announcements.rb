class CreateAnnouncements < ActiveRecord::Migration[7.0]
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :content
      t.integer :admin_id

      t.timestamps
    end
  end
end
