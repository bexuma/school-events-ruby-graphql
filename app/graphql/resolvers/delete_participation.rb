class Resolvers::DeleteParticipation < GraphQL::Function

  argument :eventId, !types.ID

  type Types::ParticipationType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    ctx[:current_user].participating_events.find_by_id(args[:eventId]).destroy
    
    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end

  

end