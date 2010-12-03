class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.text :content
      t.integer :correct_answer_id
      t.integer :quizz_id

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
