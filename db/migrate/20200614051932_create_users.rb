class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    
    create_table(:users) do |t|
      t.string :mobile
      t.string :password
      t.string :full_name
      t.string :type, default: 0
      t.string :token
      t.timestamps
    end

    add_index :users, :mobile,                unique: true

  end
end
