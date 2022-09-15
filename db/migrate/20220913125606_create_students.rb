class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :email
      t.bigint :phone_number
      t.integer :studentID

      t.timestamps
    end
  end
end
