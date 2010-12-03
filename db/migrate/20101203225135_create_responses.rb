class CreateResponses < ActiveRecord::Migration
  def self.up
    create_table :responses do |t|
      t.string :session_id
      t.integer :answer_id
      t.string :ip

      t.timestamps
    end
  end

  def self.down
    drop_table :responses
  end
end
