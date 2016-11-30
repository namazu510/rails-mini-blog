class CreateBlogs < ActiveRecord::Migration[5.0]
  def change
    create_table :blogs do |t|
      t.string :body
      t.integer :like, default: 0

      t.timestamps
    end
  end
end
