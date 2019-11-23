class CreateReadingChallenges < ActiveRecord::Migration[5.2]
  def change
    create_table :reading_challenges do |t|
      t.string :book_title
      t.string :comment
      t.date :reading_date

      t.timestamps
    end
  end
end
