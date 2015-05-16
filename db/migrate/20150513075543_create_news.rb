class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.boolean :published  #已发布

      t.string :title       #主标师
      t.string :subtitle    #子标题
      t.text :body          #内容

      t.datetime :pubdate   #发布日期
      t.boolean :stick      #置顶

      t.string :keywords    #关键字
      t.string :author      #作者
      t.string :origin      #来源
      t.string :origin_url  #来源地址

      t.integer :clicks     #点击数
      t.integer :creator_id #创建人

      t.timestamps :null, false
    end

    add_index :news, :published
  end
end
