class Question < ActiveRecord::Base
  belongs_to :quizz
  has_one :correct_answer, :class_name=>"Answer"
end
