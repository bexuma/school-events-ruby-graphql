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
    resolve ->(obj, _args, _ctx) { Event.order("id DESC") }
  end

  field :event, !Types::EventType do
    argument :eventId, types.ID
    resolve ->(obj, args, _ctx) { 
      Event.find(args[:eventId])
    }
  end

  field :userParticipatingEvents, !types[Types::EventType] do
    resolve ->(obj, args, ctx) {
      if ctx[:current_user].blank?
        raise GraphQL::ExecutionError.new("Authentication required")
      end

      ctx[:current_user].participating_events
    }
  end

  field :userHostedEvents, !types[Types::EventType] do
    resolve ->(obj, args, ctx) {
      if ctx[:current_user].blank?
        raise GraphQL::ExecutionError.new("Authentication required")
      end

      ctx[:current_user].hosted_events
    }
  end

  field :userIsParticipating, !types.Boolean do
    argument :eventId, types.ID

    resolve ->(obj, args, ctx) { 
      if ctx[:current_user].blank?
        raise GraphQL::ExecutionError.new("Authentication required")
      end

      ctx[:current_user].participating_events.pluck(:id).include? args[:eventId].to_i
    }
  end

end
