class RemoveStatusFromReservations < ActiveRecord::Migration[6.1]
  def change
    remove_column :reservations, :status, :string
  end
end
