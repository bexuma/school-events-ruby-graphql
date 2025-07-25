class Resolvers::CreateParticipation < GraphQL::Function
  argument :eventId, !types.ID

  type Types::ParticipationType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    Participation.create!(
      event_id: args[:eventId],
      user: ctx[:current_user]
    )
    
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end