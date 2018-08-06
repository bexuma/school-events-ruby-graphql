class Resolvers::CreateUser < GraphQL::Function

  AuthProviderInput = GraphQL::InputObjectType.define do
    name 'AuthProviderSignupData'
    argument :email, Types::AuthProviderEmailInput
  end

  argument :name, !types.String
  argument :username, !types.String
  argument :authProvider, !AuthProviderInput
  argument :avatar, !types.String

  type do
    name 'SignUpPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(_obj, args, _ctx)
    user = User.create!(
      name: args[:name],
      username: args[:username],
      avatar: args[:avatar],
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password] 
    )

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })

    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end
end