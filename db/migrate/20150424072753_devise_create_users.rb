class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Database authenticatable
      t.string :email,              unique: true, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.boolean :is_student, default: true


      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      #links
      t.string :linkedin_url
      t.string :github_url
      t.string :personal_website
      t.string :company_website
      
      #ratings
      t.float   :rating_value, default: 5.0
      t.integer :rating_count, default: 1, null: false

      t.timestamps
    end
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string 
    add_column :users, :corporation, :string 
    add_column :users, :school, :string 
    add_column :users, :image_url, :string 
    add_column :users, :profile, :string 


    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
