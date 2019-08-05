class CreateNuggets < ActiveRecord::Migration[5.2]
  def change
    create_table :nuggets do |t|
      t.string :title
      t.text :description
      t.text :external_link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
