class CreateQuizzes < ActiveRecord::Migration
  def self.up
    create_table :quizzes do |t|
      t.string :title
      t.text :participants
      t.integer :user_id
      t.float :duration
      t.integer :question_count

      t.timestamps
    end
  end

  def self.down
    drop_table :quizzes
  end
end
