class Resolvers::DeleteUserTagging < GraphQL::Function
  argument :tagId, !types.ID

  type Types::UserTaggingType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    UserTagging.find_by(user: ctx[:current_user], tag_id: args[:tagId]).destroy
    
    rescue ActiveRecord::RecordInvalid => e
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
  end
end