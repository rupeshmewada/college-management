class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.datetime :dob
      t.text :address
      t.integer :no
      t.text :email

      t.timestamps
    end
  end
end
