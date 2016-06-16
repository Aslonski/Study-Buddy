class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.boolean :admin, default: false
      t.string :activation_digest
      t.boolean :activated, default: false

      t.timestamps null: false
    end
  end
end
