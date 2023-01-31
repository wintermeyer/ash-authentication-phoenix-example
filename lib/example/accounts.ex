defmodule Example.Accounts do
  use Ash.Api

  resources do
    registry Example.Accounts.Registry
  end
end
