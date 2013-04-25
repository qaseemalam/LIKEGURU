class CreateFblikes < ActiveRecord::Migration
  def change
    create_table :fblikes do |t|
      t.string :User_Id
      t.string :Like_Id
      t.string :Like_Name
      t.string :Like_Category

      t.timestamps
    end
  end
end
