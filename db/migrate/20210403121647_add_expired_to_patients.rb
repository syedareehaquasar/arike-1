class AddExpiredToPatients < ActiveRecord::Migration[6.1]
  def change
    add_column :patients, :expired, :datetime
  end
end
