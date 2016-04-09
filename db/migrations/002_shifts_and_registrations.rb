Sequel.migration do
  change do
    create_table(:shift_types) do
      primary_key :id

      Time :begins_at, null: false
      Time :ends_at, null: false
      String :description, null: false
      Integer :staff_required, null: false
      Integer :volunteers_required, null: false
    end

    create_table(:shifts) do
      primary_key :id

      Date :begins_on, null: false, index: true
      Date :ends_on, null: true
      Time :starts_at, null: true
      Time :ends_at, null: true
      String :description, null: true, text: true
      Integer :staff_required, null: true
      Integer :volunteers_required, null: true

      foreign_key :shift_type_id, :shift_types
    end

    create_table(:shift_registrations) do
      primary_key :id

      DateTime :requested_at, null: false, default: Sequel::SQL::Function.new(:datetime, 'now', 'localtime')
      TrueClass :is_approved, null: false, default: false
      DateTime :approved_at, null: true
      TrueClass :is_cancelled, null: false, default: false
      DateTime :cancelled_at, null: true
      String :reason, null: true, text: true

      foreign_key :volunteer_id, :users
      foreign_key :shift_id, :shifts
      foreign_key :admin_id, :users
    end
  end
end
