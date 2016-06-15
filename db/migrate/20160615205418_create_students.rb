class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.integer :grade
      t.decimal :gpa
      t.integer :disciplinary_strikes
      t.integer :teacher_id
      t.string :shirt_size
      t.string :profile_pic

      t.timestamps null: false
    end
  end
end
