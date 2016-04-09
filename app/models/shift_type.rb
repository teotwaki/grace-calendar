module Grace
  module Models
    class ShiftType < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:begins_at, :ends_at, :description,
                            :staff_required, :volunteers_required]
      end

      one_to_many :shifts
    end
  end
end
