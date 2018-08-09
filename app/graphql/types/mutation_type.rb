Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createUser, function: Resolvers::CreateUser.new
  field :signInUser, function: Resolvers::SignInUser.new
  field :createEvent, function: Resolvers::CreateEvent.new
  field :createReview, function: Resolvers::CreateReview.new
  field :deleteReview, function: Resolvers::DeleteReview.new
  field :createParticipation, function: Resolvers::CreateParticipation.new
  field :deleteParticipation, function: Resolvers::DeleteParticipation.new

end
