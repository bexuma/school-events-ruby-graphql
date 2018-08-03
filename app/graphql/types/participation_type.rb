Types::ParticipationType = GraphQL::ObjectType.define do
  # https://stackoverflow.com/questions/47960194/graphql-ruby-date-or-datetime-type
  name 'Participation'

  field :id, !types.ID
  field :event, Types::EventType
  field :participant, -> { Types::UserType }, property: :user

  field :reviews, -> { !types[Types::ReviewType] }
end