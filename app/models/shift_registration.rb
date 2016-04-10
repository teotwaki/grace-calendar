require_rel '../helpers/db'

module Grace
  module Models
    class ShiftRegistration < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:volunteer_id, :shift_id]
      end

      many_to_one :shift
      many_to_one :volunteer, class: :User, key: :volunteer_id
      many_to_one :admin, class: :User, key: :admin_id
    end
  end
end
