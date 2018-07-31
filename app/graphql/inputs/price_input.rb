Inputs::PriceInput = GraphQL::InputObjectType.define do
  name "PriceInput"
  argument :label, !types.String
  argument :amount, !types.Int
end