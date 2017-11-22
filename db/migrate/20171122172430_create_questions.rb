class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :body
      t.references :user, foreign_key: true
      t.boolean :private, default: false

      t.timestamps
    end
  end
end
