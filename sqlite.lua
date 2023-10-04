local function list_matches(arg_1)
  local sqlite3 = require("luasql.sqlite3")   -- import lib luasql.sqlite3
  -- local sqlite3 = require("sqlite3.so")   -- import lib luasql.sqlite3

  -- Ouvrez la connexion à la base de données SQLite
  local env = assert(sqlite3.sqlite3())
  local con = assert(env:connect("dictionnary.db"))

  local french_table = assert(con:execute("select * from french WHERE word LIKE '"..arg_1.."%'"))  -- send sql request result to french_table
  local row = french_table:fetch({}, "a")   -- a = create associative table where column's name are used as key
  while row do
      -- Traitez les données de chaque ligne
      print(row.word)
      row = french_table:fetch({}, "a")
  end

  -- Fermez la connexion à la base de données
  con:close()
  env:close()
end

list_matches("bonjo")
-- return {
--   list_matches = list_matches
-- }
