class Resolvers::CreateUserTagging < GraphQL::Function
  argument :tagId, !types.ID

  type Types::UserTaggingType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    UserTagging.create!(
      tag_id: args[:tagId],
      user: ctx[:current_user]
    )
    
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end