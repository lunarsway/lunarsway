class CreateMailingListItems < ActiveRecord::Migration
  def self.up
    create_table :mailing_list_items do |t|
      t.string :first_name
      t.string :last_name
      t.string :email

      t.timestamps
    end
  end

  def self.down
    drop_table :mailing_list_items
  end
end
