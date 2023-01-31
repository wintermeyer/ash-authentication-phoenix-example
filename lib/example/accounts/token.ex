defmodule Example.Accounts.Token do
  use Ash.Resource,
    data_layer: AshPostgres.DataLayer,
    extensions: [AshAuthentication.TokenResource]

  token do
    api Example.Accounts
  end

  postgres do
    table "tokens"
    repo Example.Repo
  end
end
