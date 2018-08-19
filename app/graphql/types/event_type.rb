Types::EventType = GraphQL::ObjectType.define do
  # https://stackoverflow.com/questions/47960194/graphql-ruby-date-or-datetime-type
  name 'Event'

  field :id, !types.ID
  field :title, !types.String
  field :description, !types.String
  field :image_name, !types.String
  field :site_url, !types.String
  field :address, !types.String
  field :latitude, types.Float
  field :longitude, types.Float
  field :starts_at, !Types::DateTimeType
  field :ends_at, !Types::DateTimeType
  field :prices, -> { !types[Types::PriceType] }
  field :hostedBy, -> { Types::UserType }, property: :user
  field :participantIds, types[types.Int]
  field :reviews, -> { !types[Types::ReviewType] }
  field :tags, -> { !types[Types::TagType] }

end