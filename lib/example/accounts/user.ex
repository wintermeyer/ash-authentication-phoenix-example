defmodule Example.Accounts.User do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication]

  attributes do
    uuid_primary_key :id
    attribute :email, :ci_string, allow_nil?: false
    attribute :hashed_password, :string, allow_nil?: false, sensitive?: true
  end

  authentication do
    api Example.Accounts

    strategies do
      password :password do
        identity_field(:email)
      end
    end

    tokens do
      enabled?(true)
      token_resource(Example.Accounts.Token)

      signing_secret(Application.get_env(:example, ExampleWeb.Endpoint)[:secret_key_base])
    end
  end

  postgres do
    table "users"
    repo Example.Repo
  end

  identities do
    identity :unique_email, [:email]
  end
end
