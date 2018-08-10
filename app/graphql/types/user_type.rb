Types::UserType = GraphQL::ObjectType.define do
  name 'User'

  field :id, !types.ID
  field :name, !types.String
  field :email, !types.String
  field :username, !types.String
  field :avatar, !types.String
  field :participatingEvents, -> { !types[Types::EventType] }
  
end