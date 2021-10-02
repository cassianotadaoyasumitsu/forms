class CreateForms < ActiveRecord::Migration[6.0]
  def change
    create_table :forms do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :prefecture
      t.text :address
      t.boolean :driver
      t.text :licences
      t.string :passport
      t.string :my_number
      t.text :observations

      t.timestamps
    end
  end
end
