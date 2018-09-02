Types::EventTaggingType = GraphQL::ObjectType.define do
  name 'EventTagging'

  field :id, !types.ID
  field :event, Types::EventType
  field :tag, Types::TagType
end