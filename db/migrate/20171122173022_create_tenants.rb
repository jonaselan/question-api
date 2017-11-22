class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :request_counts
      t.string :api_token

      t.timestamps
    end
  end
end
