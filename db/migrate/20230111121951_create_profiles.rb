class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.string :gender
      t.string :cohort
      t.string :birthday
      t.string :profession
      t.string :avatar

      t.timestamps
    end
  end
end
