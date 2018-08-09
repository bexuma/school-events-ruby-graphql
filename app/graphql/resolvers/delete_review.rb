class Resolvers::DeleteReview < GraphQL::Function

  argument :reviewId, !types.ID

  type Types::ReviewType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    Review.find(args[:reviewId]).destroy
    
    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end

  

end