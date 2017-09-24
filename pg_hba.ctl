#
# These lines are useful if running a development-only instance of PostgreSQL on Debian, where no high level of security
# is needed. In these cases, apply the following steps in an admin-level `psql` session first:
#
# CREATE USER per;
# ALTER USER per WITH SUPERUSER;
#
# Then, replace the entries in pg_hba.ctl with the lines below. Note that this makes _any_ local account be able to run
# PostgreSQL connection as any user. Very useful and convenient for local development, but utterly useless on a
# production-level, multi-user server.
#

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
