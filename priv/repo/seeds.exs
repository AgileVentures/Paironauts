{:ok, _user} = Paironauts.Accounts.create_user(%{
  username: "BoyGeorge",
  password: System.get_env("SUPER_SECRET_PASSWORD"),
})
