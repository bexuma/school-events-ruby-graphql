Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  # TODO: remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :allUsers, !types[Types::UserType] do
    resolve ->(obj, _args, _ctx) { User.all }
  end

  field :allEvents, !types[Types::EventType] do
    resolve ->(obj, _args, _ctx) { Event.all }
  end

end
