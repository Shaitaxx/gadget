class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string       :title,                null: false
      t.text         :text,                 null: false
      t.string       :image,                null: false
      t.integer      :price,                null: false
      t.integer      :category_id,          null: false
      # t.references   :user, type: :integer, foreign_key: true
      t.timestamps
    end
  end
end
