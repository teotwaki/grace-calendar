require_rel '../helpers/db'

module Grace
  module Models
    class Shift < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:begins_on, :shift_type_id]
      end

      many_to_one :shift_type
      one_to_many :shift_registrations
    end
  end
end
