class CreateBooks < ActiveRecord::Migration
  def change
    create_table(:books) do |t|
      t.string :title
      t.string :author
      t.datetime :releasedate
      t.text :keywords, array: true
      t.timestamps
    end
  end
end
