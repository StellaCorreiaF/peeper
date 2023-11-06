class CreateComments < ActiveRecord::Migration[7.0]
  def change
    unless table_exists?(:comments)
      create_table :comments do |t|
        t.references :post, foreign_key: true
        t.text :body
        t.timestamps
      end
    end
  end
end
