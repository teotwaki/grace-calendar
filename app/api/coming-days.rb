module GraceApi
  module Api
    class ComingDays < Common
      get '/api/coming-days' do
        get_days.collect do |day|
          {
            date: day,
            services: [
              {
                type: 'breakfast',
                help_needed: true,
              },
              {
                type: 'dinner',
                help_needed: true
              },
              {
                type: 'night',
                help_needed: true
              },
            ]
          }
        end.to_json
      end

      private
        def get_days
          day = Date.today
          (0..6).collect { |x| day + x }
        end
    end
  end
end
