class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :title
      t.text :content
      # t.references :post, null: false, foreign_key: true
      t.integer :commented_on_id 
      t.string :commented_on_type 
      t.references :user, null: false, foreign_key: true 

      t.timestamps
    end
    add_index  :comments, [:commented_on_type, :commented_on_id]
  end
end
