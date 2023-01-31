defmodule Example.Accounts.Registry do
  use Ash.Registry, extensions: [Ash.Registry.ResourceValidations]

  entries do
    entry Example.Accounts.User
    entry Example.Accounts.Token
  end
end
