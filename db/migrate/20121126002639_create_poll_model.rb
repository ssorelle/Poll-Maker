class CreatePollModel < ActiveRecord::Migration
  def up
    create_table :polls do |t|
      t.string :name, :null => false
      t.string :link, :null => false
      t.string :mgr_link, :null => false
      t.string :email
      t.timestamps
    end
  end

  def down
    drop_table :polls
  end
end
