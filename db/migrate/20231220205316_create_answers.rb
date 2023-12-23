class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :player_id
      t.integer :question_id
      t.integer :votes

      t.timestamps
    end
  end
end
