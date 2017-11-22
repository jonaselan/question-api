class CreateTenants < ActiveRecord::Migration[5.1]
  def change
    create_table :tenants do |t|
      t.string :name
      t.integer :request_counts, default: 0
      t.string :api_token, default: ''

      t.timestamps
    end
  end
end
