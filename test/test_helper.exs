ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Dienekes.Repo, :manual)

#Mox
Application.put_env(:dienekes, :api_client, Dienekes.Numbers.HTTPClientMock)
Mox.defmock(Dienekes.Numbers.HTTPClientMock, for: Dienekes.Numbers.APIClient)
