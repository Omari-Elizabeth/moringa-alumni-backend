class AddPasswordToUser < ActiveRecord::Migration[7.0]
  def change
    add_column:Users,:password_digest,:string
  end
end
