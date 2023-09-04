class DropFaculty < ActiveRecord::Migration[7.0]
  def change
    drop_table :facultis ,if_exists: true
  end
end
