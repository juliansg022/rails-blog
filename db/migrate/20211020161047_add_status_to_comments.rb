# frozen_string_literal: true

# AddStatusToComments class
class AddStatusToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :status, :string
  end
end
