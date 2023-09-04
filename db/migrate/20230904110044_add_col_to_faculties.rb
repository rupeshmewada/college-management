class AddColToFaculties < ActiveRecord::Migration[7.0]
  def change
    add_column :faculties ,:name ,:string
    add_column :faculties ,:no ,:integer
    add_column :faculties ,:address ,:text
  end
end
