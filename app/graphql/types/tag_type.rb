Types::TagType = GraphQL::ObjectType.define do
  name 'Tag'

  field :id, !types.ID
  field :name, types.String
  
end