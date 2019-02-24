require 'pg'

def setup
  con = PG::Connection.connect_start(:user => 'postgres',
                                     :host => 'db')

  socket = con.socket_io
  status = con.connect_poll
  while status != PG::PGRES_POLLING_OK do
    # do some work while waiting for the connection to complete
    if status == PG::PGRES_POLLING_READING
      if (not select([socket], [], [], 10.0))
        raise "Asynchronous connection timed out!"
      end
    elsif(status == PG::PGRES_POLLING_WRITING)
      if(not select([], [socket], [], 10.0))
        raise "Asynchronous connection timed out!"
      end
    end
    status = con.connect_poll
  end

  con.exec "CREATE DATABASE db
    WITH
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'C'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1
    TEMPLATE = template0;"

  con.exec 'GRANT ALL ON DATABASE db TO postgres;

CREATE USER default_user WITH
  LOGIN
  NOSUPERUSER
  NOINHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION;

GRANT TEMPORARY, CONNECT ON DATABASE db TO default_user;'

  con.finish

  con = PG::Connection.connect_start(:user => 'postgres',
                                     :dbname => 'db',
                                     :host => 'db')

  socket = con.socket_io
  status = con.connect_poll
  while status != PG::PGRES_POLLING_OK do
    # do some work while waiting for the connection to complete
    if status == PG::PGRES_POLLING_READING
      if (not select([socket], [], [], 10.0))
        raise "Asynchronous connection timed out!"
      end
    elsif(status == PG::PGRES_POLLING_WRITING)
      if(not select([], [socket], [], 10.0))
        raise "Asynchronous connection timed out!"
      end
    end
    status = con.connect_poll
  end

  con.exec 'CREATE TABLE public.cameras
(
    serial numeric,
    username text COLLATE pg_catalog."default"
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.cameras
    OWNER to postgres;

GRANT SELECT ON TABLE public.cameras TO default_user;

GRANT ALL ON TABLE public.cameras TO postgres;

INSERT INTO public.cameras(
    serial, username)
    	VALUES (2296354227, \'The Watcher\');'

  con.finish
end