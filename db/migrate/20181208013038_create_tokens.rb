class CreateTokens < ActiveRecord::Migration[5.2]
  def change
    create_table :tokens do |t|
      t.string :creator
      t.string :package
      t.references :state, foreign_key: true
      t.references :recipient, foreign_key: true

      t.timestamps
    end
  end
end
