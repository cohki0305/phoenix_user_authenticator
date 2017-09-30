# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :user_authenticator,
  ecto_repos: [UserAuthenticator.Repo]

# Configures the endpoint
config :user_authenticator, UserAuthenticator.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8PS4OzO7GMOWGRlAa8NdHGHQx0iCljJLAtPACuweg3CqbJy+xhprf7pWtGBNypgZ",
  render_errors: [view: UserAuthenticator.ErrorView, accepts: ~w(html json)],
  pubsub: [name: UserAuthenticator.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
