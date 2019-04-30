class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :subject
      t.string :request
      t.string :response
      t.references :token, foreign_key: true

      t.timestamps
    end
  end
end
