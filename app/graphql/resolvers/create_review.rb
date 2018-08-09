class Resolvers::CreateReview < GraphQL::Function

  argument :message, !types.String
  argument :eventId, !types.ID

  type Types::ReviewType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    Review.create!(
      message: args[:message],
      event_id: args[:eventId],
      user: ctx[:current_user]
    )
    
    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end

  

end