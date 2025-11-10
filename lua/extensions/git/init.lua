local pref = 'extensions.git.'
return {
  require(pref .. 'gitsigns'),
  require(pref .. 'neogit')
}
