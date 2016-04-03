module Grace
  module Models
    class Post < Sequel::Model
      plugin :validation_helpers

      def validate
        super

        validates_presence [:title, :content, :user]
      end

      def to_json(options = nil)
        {
          id: id,
          title: title,
          content: content,
          created_at: created_at.utc.iso8601,
          author: user
        }.to_json(options)
      end

      many_to_one :user
    end
  end
end
