class CreateComments < ActiveRecord::Migration[5.2]
  def change
      create_table :comments do |t|
        t.text :user_comment
        t.timestamps
      end
  end
end
