class RemoveStatusFromRoles < ActiveRecord::Migration[5.2]
  def change
    remove_column :roles, :status, :string
  end
end
