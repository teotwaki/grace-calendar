Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id

      String :first_name, null: false
      String :last_name, null: false
      String :email_address, null: false, unique: true
      String :phone_number
      TrueClass :is_approved, default: false
      TrueClass :is_admin, default: false
      DateTime :created_at, null: false, default: Sequel::SQL::Function.new(:datetime, 'now', 'localtime')
    end

    create_table(:oauth_users) do
      String :provider, null: false
      String :id, null: false

      foreign_key :user_id, :users
      primary_key [:provider, :id], name: :oauth_users_pk
    end

    create_table(:posts) do
      primary_key :id

      String :title, null: false
      String :content, null: false, text: true
      DateTime :created_at, null: false, default: Sequel::SQL::Function.new(:datetime, 'now', 'localtime')

      foreign_key :user_id, :users
    end
  end
end
