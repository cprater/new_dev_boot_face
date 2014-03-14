class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text :content
      t.belongs_to :user
      #t.belongs_to :group, nil
      t.timestamps
    end
  end
end

