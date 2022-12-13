class CreateNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :notifications do |t|
      t.{polymorphic} :recipient
      t.string :type
      t.text :params
      t.datetime :read_at

      t.timestamps
    end
  end
end
