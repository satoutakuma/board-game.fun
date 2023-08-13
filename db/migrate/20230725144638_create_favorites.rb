class CreateFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :favorites do |t|
      t.references :customer, foreign_key: true
      t.references :game, foreign_key: true
      

      t.timestamps
    end
  end
end
