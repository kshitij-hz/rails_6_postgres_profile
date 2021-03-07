class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true
      t.string :line
      t.string :street
      t.string :landmark
      t.string :city
      t.string :state
      t.integer :pin_code

      t.timestamps
    end
  end
end
