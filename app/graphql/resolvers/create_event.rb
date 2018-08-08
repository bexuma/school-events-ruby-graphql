class Resolvers::CreateEvent < GraphQL::Function

  argument :title, !types.String
  argument :description, !types.String
  argument :image_name, !types.String
  argument :site_url, !types.String
  argument :starts_at, !Types::DateTimeType
  argument :ends_at, !Types::DateTimeType
  argument :prices, types[Inputs::PriceInput]
  argument :address, !types.String

  type Types::EventType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    event = Event.create!(
      title: args[:title],
      description: args[:description],
      image_name: args[:image_name],
      site_url: args[:site_url],
      starts_at: args[:starts_at],
      ends_at: args[:ends_at],
      user: ctx[:current_user],
      address: args[:address]
    )

    if args[:prices]
      args[:prices].each do |price|
        event.prices.create!(
          label: price.label,
          amount: price.amount
        )
      end
    end

    event
    
    rescue ActiveRecord::RecordInvalid => e
      # this would catch all validation errors and translate them to GraphQL::ExecutionError
      GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")

  end

  

end