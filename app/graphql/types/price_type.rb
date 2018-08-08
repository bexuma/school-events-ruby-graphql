Types::PriceType = GraphQL::ObjectType.define do
  name 'Price'

  field :id, !types.ID
  field :label, types.String
  field :amount, !types.Int
  field :event, -> { Types::EventType }
  
end