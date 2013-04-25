class CreateFbclickdata < ActiveRecord::Migration
  def change
    create_table :fbclickdata do |t|
      t.string :Like_Id
      t.string :Like_category

      t.timestamps
    end
  end
end
