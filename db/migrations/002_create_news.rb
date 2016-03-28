Sequel.migration do
  change do
    create_table(:posts) do
      primary_key :id

      String :title, null: false
      String :content, null: false, text: true
      DateTime :posted, null: false

      foreign_key :user_id, :users
    end
  end
end
