Sequel.migration do
  change do
    create_table(:users) do
      primary_key :id

      String :first_name, null: false
      String :last_name, null: false
      String :email, null: false
      String :phone_number, null: false
    end

    create_table(:oauth_users) do
      String :provider, null: false
      Integer :id, null: false

      foreign_key :user_id, :users
      primary_key [:provider, :id], name: :oauth_users_pk
    end
  end
end
