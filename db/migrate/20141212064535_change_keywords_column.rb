class ChangeKeywordsColumn < ActiveRecord::Migration
  def change
    change_column :books, :keywords, :string, :array => true, :default => '{}'
  end
end
