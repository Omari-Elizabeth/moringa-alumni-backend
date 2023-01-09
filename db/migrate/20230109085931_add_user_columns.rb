class AddUserColumns < ActiveRecord::Migration[7.0]
  def change
    add_column:Users,:username, :string
  end
end
