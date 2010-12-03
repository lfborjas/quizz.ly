class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.text :content
      t.integer :question_id
      t.boolean :is_correct, :default => false

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
