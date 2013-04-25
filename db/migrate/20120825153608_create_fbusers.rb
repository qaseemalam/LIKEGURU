class CreateFbusers < ActiveRecord::Migration
  def change
    create_table :fbusers do |t|
      t.string :User_Id
      t.string :User_Name
      t.string :User_Email
      t.string :Image_Ref

      t.timestamps
    end
  end
end
