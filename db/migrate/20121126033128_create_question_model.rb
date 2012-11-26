class CreateQuestionModel < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.text :question, :null => false
      t.references :poll
      
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
