class RemoveColFromFaculties < ActiveRecord::Migration[7.0]
  def change
    remove_column :faculties, :no, :integer
    remove_column :faculties, :name, :string
    remove_column :faculties, :address, :string
  end
end
