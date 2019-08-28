class CreateArticles < ActiveRecord::Migration[5.2]
  def change
      create_table :articles do |t|
        t.text :author_name
        t.text :author_content
        t.timestamps
      end

      Article.create :author_name => 'Vadim Dimnich', :author_content => 'Article text1'
      Article.create :author_name => 'Vadim Dimnich', :author_content => 'Article text2'
      Article.create :author_name => 'Vadim Dimnich', :author_content => 'Article text3'
      Article.create :author_name => 'Vadim Dimnich', :author_content => 'Article text4'
      Article.create :author_name => 'Vadim Dimnich', :author_content => 'Article text5'
  end
end
