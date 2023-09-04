class CreateInstructorAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :instructor_assignments do |t|
      t.references :faculty, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
