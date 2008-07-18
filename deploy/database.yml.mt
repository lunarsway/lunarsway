development:
  adapter: mysql
  database: db40592_lunarsway_dev
  host: internal-db.s40592.gridserver.com
  username: db40592_lunar
  password: fattoush

# Warning: The database defined as 'test' will be erased and
# re-generated from your development database when you run 'rake'.
# Do not set this db to the same as development or production.
test:
  adapter: mysql
  database: db40592_lunarsway_test
  host: 127.0.0.1
  username: db40592_lunar
  password: fattoush

production:
  adapter: mysql
  database: db40592_lunarsway_prod
  host: internal-db.s40592.gridserver.com
  username: db40592_lunar
  password: fattoush