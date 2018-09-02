class Resolvers::DeleteParticipation < GraphQL::Function
  argument :eventId, !types.ID

  type Types::ParticipationType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    Participation.find_by(user: ctx[:current_user], event_id: args[:eventId]).destroy
    
    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end
end