class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :housenumber
      t.string :zipcode
      t.references :contact

      t.timestamps
    end
  end
end
