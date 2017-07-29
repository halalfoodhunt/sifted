class CreateAdvertisements < ActiveRecord::Migration
  def change
    create_table :advertisements do |t|
      t.string :name
      t.datetime :commencement_date
      t.datetime :expiry_date
      t.boolean :publish, default: false

      t.timestamps null: false
    end
  end
end
