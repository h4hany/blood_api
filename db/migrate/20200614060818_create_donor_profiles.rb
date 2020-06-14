class CreateDonorProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :donor_profiles do |t|
      t.refernces :user
      t.float :latitude
      t.float :longitude
      t.refernces :bloodType
      t.integer :is_verified, default: 0
      t.string :verification_code
      t.integer :is_available, default: 0

      t.timestamps
    end
  end
end
