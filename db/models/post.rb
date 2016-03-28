class Post < Sequel::Model
  plugin :validation_helpers

  def validate
    super

    validates_presence [:title, :content, :posted]
  end

  def to_json(options = nil)
    {
      title: title,
      content: content,
      posted: posted.utc.iso8601,
      author: user
    }.to_json(options)
  end

  many_to_one :user
end
