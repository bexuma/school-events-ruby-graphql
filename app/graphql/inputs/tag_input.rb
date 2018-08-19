Inputs::TagInput = GraphQL::InputObjectType.define do
  name "TagInput"
  argument :name, !types.String
end