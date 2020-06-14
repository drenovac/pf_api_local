class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.string :title
      t.boolean :is_admin, default: false
      t.integer :users_count
    end
  end
end
