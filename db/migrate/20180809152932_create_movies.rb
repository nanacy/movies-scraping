class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.date :release
      t.string :director
      t.string :image

      t.timestamps
    end
  end
end
