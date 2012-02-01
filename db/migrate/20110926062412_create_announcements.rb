class CreateAnnouncements < ActiveRecord::Migration
  def self.up
    create_table :announcements do |t|
      t.string :title
      t.text :news
      t.date :published_from
      t.date :published_to
      t.boolean :active

      t.timestamps
    end
  end

  def self.down
    drop_table :announcements
  end
end
