Types::UserTaggingType = GraphQL::ObjectType.define do
  name 'UserTagging'

  field :id, !types.ID
  field :user, Types::UserType
  field :tag, Types::TagType
end