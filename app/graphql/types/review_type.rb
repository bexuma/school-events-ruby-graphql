Types::ReviewType = GraphQL::ObjectType.define do
  name 'Review'

  field :id, !types.ID
  field :message, !types.String
  field :event, -> { Types::EventType }
  field :user, -> { Types::UserType }
  
end