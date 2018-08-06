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
      email: args[:authProvider][:email][:email],
      password: args[:authProvider][:email][:password],
      avatar: args[:avatar],
    )

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })

  end
end