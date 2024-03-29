--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg20.04+1)
-- Dumped by pg_dump version 15.3 (Ubuntu 15.3-0ubuntu0.23.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE ONLY public.game_user DROP CONSTRAINT game_user_game_id_fkey;
ALTER TABLE ONLY public.game_record DROP CONSTRAINT game_record_game_id_fkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_sso_provider_id_fkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_user_id_fkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_sso_provider_id_fkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_sso_provider_id_fkey;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_session_id_fkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_user_id_fkey;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_auth_factor_id_fkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_fkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_user_id_fkey;
DROP INDEX auth.users_instance_id_idx;
DROP INDEX auth.users_instance_id_email_idx;
DROP INDEX auth.users_email_partial_key;
DROP INDEX auth.user_id_created_at_idx;
DROP INDEX auth.sso_providers_resource_id_idx;
DROP INDEX auth.sso_domains_sso_provider_id_idx;
DROP INDEX auth.sso_domains_domain_idx;
DROP INDEX auth.sessions_user_id_idx;
DROP INDEX auth.sessions_not_after_idx;
DROP INDEX auth.saml_relay_states_sso_provider_id_idx;
DROP INDEX auth.saml_relay_states_for_email_idx;
DROP INDEX auth.saml_relay_states_created_at_idx;
DROP INDEX auth.saml_providers_sso_provider_id_idx;
DROP INDEX auth.refresh_tokens_updated_at_idx;
DROP INDEX auth.refresh_tokens_session_id_revoked_idx;
DROP INDEX auth.refresh_tokens_parent_idx;
DROP INDEX auth.refresh_tokens_instance_id_user_id_idx;
DROP INDEX auth.refresh_tokens_instance_id_idx;
DROP INDEX auth.recovery_token_idx;
DROP INDEX auth.reauthentication_token_idx;
DROP INDEX auth.mfa_factors_user_friendly_name_unique;
DROP INDEX auth.mfa_challenge_created_at_idx;
DROP INDEX auth.idx_user_id_auth_method;
DROP INDEX auth.idx_auth_code;
DROP INDEX auth.identities_user_id_idx;
DROP INDEX auth.identities_email_idx;
DROP INDEX auth.flow_state_created_at_idx;
DROP INDEX auth.factor_id_created_at_idx;
DROP INDEX auth.email_change_token_new_idx;
DROP INDEX auth.email_change_token_current_idx;
DROP INDEX auth.confirmation_token_idx;
DROP INDEX auth.audit_logs_instance_id_idx;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY public.users DROP CONSTRAINT users_loginid_key;
ALTER TABLE ONLY public.random_number_table DROP CONSTRAINT random_number_table_pkey;
ALTER TABLE ONLY public.games DROP CONSTRAINT games_pkey;
ALTER TABLE ONLY public.game_user DROP CONSTRAINT game_user_pkey;
ALTER TABLE ONLY public.game_record DROP CONSTRAINT game_record_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_pkey;
ALTER TABLE ONLY auth.users DROP CONSTRAINT users_phone_key;
ALTER TABLE ONLY auth.sso_providers DROP CONSTRAINT sso_providers_pkey;
ALTER TABLE ONLY auth.sso_domains DROP CONSTRAINT sso_domains_pkey;
ALTER TABLE ONLY auth.sessions DROP CONSTRAINT sessions_pkey;
ALTER TABLE ONLY auth.schema_migrations DROP CONSTRAINT schema_migrations_pkey;
ALTER TABLE ONLY auth.saml_relay_states DROP CONSTRAINT saml_relay_states_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_pkey;
ALTER TABLE ONLY auth.saml_providers DROP CONSTRAINT saml_providers_entity_id_key;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_token_unique;
ALTER TABLE ONLY auth.refresh_tokens DROP CONSTRAINT refresh_tokens_pkey;
ALTER TABLE ONLY auth.mfa_factors DROP CONSTRAINT mfa_factors_pkey;
ALTER TABLE ONLY auth.mfa_challenges DROP CONSTRAINT mfa_challenges_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey;
ALTER TABLE ONLY auth.instances DROP CONSTRAINT instances_pkey;
ALTER TABLE ONLY auth.identities DROP CONSTRAINT identities_pkey;
ALTER TABLE ONLY auth.flow_state DROP CONSTRAINT flow_state_pkey;
ALTER TABLE ONLY auth.audit_log_entries DROP CONSTRAINT audit_log_entries_pkey;
ALTER TABLE ONLY auth.mfa_amr_claims DROP CONSTRAINT amr_id_pk;
ALTER TABLE auth.refresh_tokens ALTER COLUMN id DROP DEFAULT;
DROP TABLE public.users;
DROP TABLE public.random_number_table;
DROP TABLE public.games;
DROP TABLE public.game_user;
DROP TABLE public.game_record;
DROP TABLE auth.users;
DROP TABLE auth.sso_providers;
DROP TABLE auth.sso_domains;
DROP TABLE auth.sessions;
DROP TABLE auth.schema_migrations;
DROP TABLE auth.saml_relay_states;
DROP TABLE auth.saml_providers;
DROP SEQUENCE auth.refresh_tokens_id_seq;
DROP TABLE auth.refresh_tokens;
DROP TABLE auth.mfa_factors;
DROP TABLE auth.mfa_challenges;
DROP TABLE auth.mfa_amr_claims;
DROP TABLE auth.instances;
DROP TABLE auth.identities;
DROP TABLE auth.flow_state;
DROP TABLE auth.audit_log_entries;
DROP PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean);
DROP PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean);
DROP FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean);
DROP FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean);
DROP FUNCTION public.hello_world();
DROP FUNCTION auth.uid();
DROP FUNCTION auth.role();
DROP FUNCTION auth.jwt();
DROP FUNCTION auth.email();
DROP TYPE auth.factor_type;
DROP TYPE auth.factor_status;
DROP TYPE auth.code_challenge_method;
DROP TYPE auth.aal_level;
DROP SCHEMA public;
DROP SCHEMA auth;
--
-- Name: auth; Type: SCHEMA; Schema: -; Owner: supabase_admin
--

CREATE SCHEMA auth;


ALTER SCHEMA auth OWNER TO supabase_admin;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: aal_level; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.aal_level AS ENUM (
    'aal1',
    'aal2',
    'aal3'
);


ALTER TYPE auth.aal_level OWNER TO supabase_auth_admin;

--
-- Name: code_challenge_method; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.code_challenge_method AS ENUM (
    's256',
    'plain'
);


ALTER TYPE auth.code_challenge_method OWNER TO supabase_auth_admin;

--
-- Name: factor_status; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_status AS ENUM (
    'unverified',
    'verified'
);


ALTER TYPE auth.factor_status OWNER TO supabase_auth_admin;

--
-- Name: factor_type; Type: TYPE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TYPE auth.factor_type AS ENUM (
    'totp',
    'webauthn'
);


ALTER TYPE auth.factor_type OWNER TO supabase_auth_admin;

--
-- Name: email(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.email() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.email', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'email')
  )::text
$$;


ALTER FUNCTION auth.email() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION email(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.email() IS 'Deprecated. Use auth.jwt() -> ''email'' instead.';


--
-- Name: jwt(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.jwt() RETURNS jsonb
    LANGUAGE sql STABLE
    AS $$
  select 
    coalesce(
        nullif(current_setting('request.jwt.claim', true), ''),
        nullif(current_setting('request.jwt.claims', true), '')
    )::jsonb
$$;


ALTER FUNCTION auth.jwt() OWNER TO supabase_auth_admin;

--
-- Name: role(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.role() RETURNS text
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.role', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'role')
  )::text
$$;


ALTER FUNCTION auth.role() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION role(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.role() IS 'Deprecated. Use auth.jwt() -> ''role'' instead.';


--
-- Name: uid(); Type: FUNCTION; Schema: auth; Owner: supabase_auth_admin
--

CREATE FUNCTION auth.uid() RETURNS uuid
    LANGUAGE sql STABLE
    AS $$
  select 
  coalesce(
    nullif(current_setting('request.jwt.claim.sub', true), ''),
    (nullif(current_setting('request.jwt.claims', true), '')::jsonb ->> 'sub')
  )::uuid
$$;


ALTER FUNCTION auth.uid() OWNER TO supabase_auth_admin;

--
-- Name: FUNCTION uid(); Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON FUNCTION auth.uid() IS 'Deprecated. Use auth.jwt() -> ''sub'' instead.';


--
-- Name: hello_world(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.hello_world() RETURNS text
    LANGUAGE sql
    AS $$
  select 'Hello world';
$$;


ALTER FUNCTION public.hello_world() OWNER TO postgres;

--
-- Name: makenewgame(numeric, numeric, numeric, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare

_random_number_table_rec RECORD;
_p1 integer;
_p2 integer;
_p3 integer;
_p4 integer;
_no integer;
loopnum integer;
_i_loop integer;
v_id integer;

cur1 CURSOR FOR
	select no,p1,p2 from random_number_table where person_num=_person_num ORDER by no;

begin
  loopnum = 0;
	_i_loop = 1;
	if _coat_num > 1 then
		if _dobules_flg = true then
		  if(_coat_num * 4 <= _person_num) then
				loopnum = _coat_num;
			else 
			  loopnum = trunc( _person_num / 4);
			end if;
		else
			if(_coat_num * 2 <= _person_num) then
				loopnum = _coat_num;
			else 
			  loopnum = trunc( _person_num / 2);
			end if;
		end if;
	end if;

	if loopnum = 0 then
		loopnum := 1;
	end if;

	insert into games (player_num, coat_num ,dobules_flg, userid) 
	values ( _person_num, _coat_num, _dobules_flg, _userid)
	returning id into v_id;

  delete from games where userid = _userid;
	delete from games where updated_at < now() - interval '100 days';

  OPEN cur1;
  LOOP	
   		FETCH cur1 INTO _random_number_table_rec;
			EXIT WHEN NOT FOUND;

			_p1 = _random_number_table_rec.p1;
			_p2 = _random_number_table_rec.p2;
			if _dobules_flg = true then
   			FETCH cur1 INTO _random_number_table_rec;
				EXIT WHEN NOT FOUND;

				_p3 = _random_number_table_rec.p1;
				_p4 = _random_number_table_rec.p2;
			end if;

			--RAISE INFO 'rec=> % % % % %',_i_loop, _p1,_p2,_p3,_p4;
			if(_dobules_flg = true ) then
				insert into game_record ( game_id, game_no, player_1, player_2,player_3,player_4 ) 
				values ( v_id, _i_loop, _p1, _p2, _p3, _p4);
			else
				insert into game_record ( game_id, game_no,player_1, player_2 ) 
				values ( v_id, _i_loop, _p1, _p2);
			end if;

			_i_loop = _i_loop + 1;
			if ( _i_loop > loopnum ) then
				_i_loop = 1;
			end if;

  END LOOP;
  CLOSE cur1;

	for _i_loop in 1.._person_num loop
		insert into game_user (player_no, game_id)
		values ( _i_loop, v_id );
	end loop;

	return v_id;
END;
$$;


ALTER FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean) OWNER TO postgres;

--
-- Name: newmakenewgame(text, numeric, numeric, boolean); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean) RETURNS integer
    LANGUAGE plpgsql
    AS $$
declare

_random_number_table_rec RECORD;
_p1 integer;
_p2 integer;
_p3 integer;
_p4 integer;
_no integer;
loopnum integer;
_i_loop integer;
v_id integer;

cur1 CURSOR FOR
	select no,p1,p2 from random_number_table where person_num=_person_num ORDER by no;

begin
  loopnum = 1;

  if _dobules_flg = true then
     if _coat_num * 4 > _person_num then
        _coat_num = trunc(_person_num / 4);
     end if;
  else if _coat_num * 2 > _person_num then
        _coat_num = trunc(_person_num / 2);
        end if;
  end if;

  delete from games where userid = _userid;

	insert into games (player_num, coat_num ,dobules_flg, userid) 
	values ( _person_num, _coat_num, _dobules_flg, _userid)
	returning id into v_id;

  OPEN cur1;
  LOOP	
   		FETCH cur1 INTO _random_number_table_rec;
	   		EXIT WHEN NOT FOUND;

			_p1 = _random_number_table_rec.p1;
			_p2 = _random_number_table_rec.p2;
			if _dobules_flg = true then
   			FETCH cur1 INTO _random_number_table_rec;
				EXIT WHEN NOT FOUND;

				_p3 = _random_number_table_rec.p1;
				_p4 = _random_number_table_rec.p2;
			end if;

			--RAISE INFO 'rec=> % % % % %',_i_loop, _p1,_p2,_p3,_p4;
			if(_dobules_flg = true ) then
				insert into game_record ( game_id, game_no, player_1, player_2,player_3,player_4 ) 
				values ( v_id, loopnum, _p1, _p2, _p3, _p4);
			else
				insert into game_record ( game_id, game_no,player_1, player_2 ) 
				values ( v_id, loopnum, _p1, _p2);
			end if;

                        loopnum = loopnum + 1;
                        
  END LOOP;
  CLOSE cur1;

	for _i_loop in 1.._person_num loop
		insert into game_user (player_no, game_id)
		values ( _i_loop, v_id );
	end loop;

	return v_id;
END;
$$;


ALTER FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean) OWNER TO postgres;

--
-- Name: testfnc(numeric, numeric, numeric, boolean); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean)
    LANGUAGE plpgsql
    AS $_$
declare

_userid  alias for $1;
_person_num  alias for $2;
_coat_num alias for $3;
_dobules_flg alias for $4;

_random_number_table_rec RECORD;
_p1 integer;
_p2 integer;
_p3 integer;
_p4 integer;
_no integer;
loopnum integer;
_i_loop integer;
v_id integer;

cur1 CURSOR FOR
	select no,p1,p2 from random_number_table where person_num=_person_num ORDER by no;

begin
  loopnum = 0;
	_i_loop = 1;
	if _coat_num > 1 then
		if _dobules_flg = true then
		  if(_coat_num * 4 <= _person_num) then
				loopnum = _coat_num;
			else 
			  loopnum = trunc( _person_num / 4);
			end if;
		else
			if(_coat_num * 2 <= _person_num) then
				loopnum = _coat_num;
			else 
			  loopnum = trunc( _person_num / 2);
			end if;
		end if;
	end if;

	if loopnum = 0 then
		loopnum := 1;
	end if;

	insert into games (player_num, coat_num ,dobules_flg, user_id) 
	values ( _person_num, _coat_num, _dobules_flg, _user_id)
	returning id into v_id;

	delete from games where updated_at < now() - interval '100 days';

  OPEN cur1;
  LOOP	
   		FETCH cur1 INTO _random_number_table_rec;
			EXIT WHEN NOT FOUND;

			_p1 = _random_number_table_rec.p1;
			_p2 = _random_number_table_rec.p2;
			if _dobules_flg = true then
   			FETCH cur1 INTO _random_number_table_rec;
				EXIT WHEN NOT FOUND;

				_p3 = _random_number_table_rec.p1;
				_p4 = _random_number_table_rec.p2;
			end if;

			--RAISE INFO 'rec=> % % % % %',_i_loop, _p1,_p2,_p3,_p4;
			if(_dobules_flg = true ) then
				insert into game_record ( game_id, game_no, player_1, player_2,player_3,player_4 ) 
				values ( v_id, _i_loop, _p1, _p2, _p3, _p4);
			else
				insert into game_record ( game_id, game_no,player_1, player_2 ) 
				values ( v_id, _i_loop, _p1, _p2);
			end if;

			_i_loop = _i_loop + 1;
			if ( _i_loop > loopnum ) then
				_i_loop = 1;
			end if;

  END LOOP;
  CLOSE cur1;
	
END;
$_$;


ALTER PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean) OWNER TO postgres;

--
-- Name: testfnc(text, numeric, numeric, boolean); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean)
    LANGUAGE plpgsql
    AS $_$
declare

_tokenid  alias for $1;
_person_num  alias for $2;
_coat_num alias for $3;
_dobules_flg alias for $4;

_random_number_table_rec RECORD;
_p1 integer;
_p2 integer;
_p3 integer;
_p4 integer;
_no integer;
loopnum integer;
_i_loop integer;
v_id integer;

cur1 CURSOR FOR
 select no,p1,p2 from random_number_table where person_num=_person_num ORDER by no;

begin
  loopnum = 0;
 _i_loop = 1;
 if _coat_num > 1 then
  if _dobules_flg = true then
    if(_coat_num * 4 <= _person_num) then
    loopnum = _coat_num;
   else 
     loopnum = trunc( _person_num / 4);
   end if;
  else
   if(_coat_num * 2 <= _person_num) then
    loopnum = _coat_num;
   else 
     loopnum = trunc( _person_num / 2);
   end if;
  end if;
 end if;

 if loopnum = 0 then
  loopnum := 1;
 end if;

 insert into games (player_num, coat_num ,dobules_flg,tokenid) 
values ( _person_num, _coat_num, _dobules_flg, _tokenid)
 returning id into v_id;

 delete from game_record where game_id = v_id and score_1 = 0 and score_2 = 0;

  OPEN cur1;
  LOOP 
     FETCH cur1 INTO _random_number_table_rec;
   EXIT WHEN NOT FOUND;

   _p1 = _random_number_table_rec.p1;
   _p2 = _random_number_table_rec.p2;
   if _dobules_flg = true then
      FETCH cur1 INTO _random_number_table_rec;
    EXIT WHEN NOT FOUND;

    _p3 = _random_number_table_rec.p1;
    _p4 = _random_number_table_rec.p2;
   end if;

   --RAISE INFO 'rec=> % % % % %',_i_loop, _p1,_p2,_p3,_p4;
   if(_dobules_flg = true ) then
    insert into game_record ( game_id, game_no, player_1, player_2,player_3,player_4 ) 
values ( v_id, _i_loop, _p1, _p2, _p3, _p4);
   else
    insert into game_record ( game_id, game_no,player_1, player_2 ) 
values ( v_id, _i_loop, _p1, _p2);
   end if;

   _i_loop = _i_loop + 1;
   if ( _i_loop > loopnum ) then
    _i_loop = 1;
   end if;

  END LOOP;
  CLOSE cur1;
 
END;
$_$;


ALTER PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: audit_log_entries; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.audit_log_entries (
    instance_id uuid,
    id uuid NOT NULL,
    payload json,
    created_at timestamp with time zone,
    ip_address character varying(64) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE auth.audit_log_entries OWNER TO supabase_auth_admin;

--
-- Name: TABLE audit_log_entries; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.audit_log_entries IS 'Auth: Audit trail for user actions.';


--
-- Name: flow_state; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.flow_state (
    id uuid NOT NULL,
    user_id uuid,
    auth_code text NOT NULL,
    code_challenge_method auth.code_challenge_method NOT NULL,
    code_challenge text NOT NULL,
    provider_type text NOT NULL,
    provider_access_token text,
    provider_refresh_token text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    authentication_method text NOT NULL
);


ALTER TABLE auth.flow_state OWNER TO supabase_auth_admin;

--
-- Name: TABLE flow_state; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.flow_state IS 'stores metadata for pkce logins';


--
-- Name: identities; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.identities (
    id text NOT NULL,
    user_id uuid NOT NULL,
    identity_data jsonb NOT NULL,
    provider text NOT NULL,
    last_sign_in_at timestamp with time zone,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    email text GENERATED ALWAYS AS (lower((identity_data ->> 'email'::text))) STORED
);


ALTER TABLE auth.identities OWNER TO supabase_auth_admin;

--
-- Name: TABLE identities; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.identities IS 'Auth: Stores identities associated to a user.';


--
-- Name: COLUMN identities.email; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.identities.email IS 'Auth: Email is a generated column that references the optional email property in the identity_data';


--
-- Name: instances; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.instances (
    id uuid NOT NULL,
    uuid uuid,
    raw_base_config text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE auth.instances OWNER TO supabase_auth_admin;

--
-- Name: TABLE instances; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.instances IS 'Auth: Manages users across multiple sites.';


--
-- Name: mfa_amr_claims; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_amr_claims (
    session_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    authentication_method text NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE auth.mfa_amr_claims OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_amr_claims; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_amr_claims IS 'auth: stores authenticator method reference claims for multi factor authentication';


--
-- Name: mfa_challenges; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_challenges (
    id uuid NOT NULL,
    factor_id uuid NOT NULL,
    created_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    ip_address inet NOT NULL
);


ALTER TABLE auth.mfa_challenges OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_challenges; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_challenges IS 'auth: stores metadata about challenge requests made';


--
-- Name: mfa_factors; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.mfa_factors (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    friendly_name text,
    factor_type auth.factor_type NOT NULL,
    status auth.factor_status NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    secret text
);


ALTER TABLE auth.mfa_factors OWNER TO supabase_auth_admin;

--
-- Name: TABLE mfa_factors; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.mfa_factors IS 'auth: stores metadata about factors';


--
-- Name: refresh_tokens; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.refresh_tokens (
    instance_id uuid,
    id bigint NOT NULL,
    token character varying(255),
    user_id character varying(255),
    revoked boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    parent character varying(255),
    session_id uuid
);


ALTER TABLE auth.refresh_tokens OWNER TO supabase_auth_admin;

--
-- Name: TABLE refresh_tokens; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.refresh_tokens IS 'Auth: Store of tokens used to refresh JWT tokens once they expire.';


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE; Schema: auth; Owner: supabase_auth_admin
--

CREATE SEQUENCE auth.refresh_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth.refresh_tokens_id_seq OWNER TO supabase_auth_admin;

--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: auth; Owner: supabase_auth_admin
--

ALTER SEQUENCE auth.refresh_tokens_id_seq OWNED BY auth.refresh_tokens.id;


--
-- Name: saml_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_providers (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    entity_id text NOT NULL,
    metadata_xml text NOT NULL,
    metadata_url text,
    attribute_mapping jsonb,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "entity_id not empty" CHECK ((char_length(entity_id) > 0)),
    CONSTRAINT "metadata_url not empty" CHECK (((metadata_url = NULL::text) OR (char_length(metadata_url) > 0))),
    CONSTRAINT "metadata_xml not empty" CHECK ((char_length(metadata_xml) > 0))
);


ALTER TABLE auth.saml_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_providers IS 'Auth: Manages SAML Identity Provider connections.';


--
-- Name: saml_relay_states; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.saml_relay_states (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    request_id text NOT NULL,
    for_email text,
    redirect_to text,
    from_ip_address inet,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "request_id not empty" CHECK ((char_length(request_id) > 0))
);


ALTER TABLE auth.saml_relay_states OWNER TO supabase_auth_admin;

--
-- Name: TABLE saml_relay_states; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.saml_relay_states IS 'Auth: Contains SAML Relay State information for each Service Provider initiated login.';


--
-- Name: schema_migrations; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE auth.schema_migrations OWNER TO supabase_auth_admin;

--
-- Name: TABLE schema_migrations; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.schema_migrations IS 'Auth: Manages updates to the auth system.';


--
-- Name: sessions; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sessions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    factor_id uuid,
    aal auth.aal_level,
    not_after timestamp with time zone
);


ALTER TABLE auth.sessions OWNER TO supabase_auth_admin;

--
-- Name: TABLE sessions; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sessions IS 'Auth: Stores session data associated to a user.';


--
-- Name: COLUMN sessions.not_after; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sessions.not_after IS 'Auth: Not after is a nullable column that contains a timestamp after which the session should be regarded as expired.';


--
-- Name: sso_domains; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_domains (
    id uuid NOT NULL,
    sso_provider_id uuid NOT NULL,
    domain text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "domain not empty" CHECK ((char_length(domain) > 0))
);


ALTER TABLE auth.sso_domains OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_domains; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_domains IS 'Auth: Manages SSO email address domain mapping to an SSO Identity Provider.';


--
-- Name: sso_providers; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.sso_providers (
    id uuid NOT NULL,
    resource_id text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT "resource_id not empty" CHECK (((resource_id = NULL::text) OR (char_length(resource_id) > 0)))
);


ALTER TABLE auth.sso_providers OWNER TO supabase_auth_admin;

--
-- Name: TABLE sso_providers; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.sso_providers IS 'Auth: Manages SSO identity provider information; see saml_providers for SAML.';


--
-- Name: COLUMN sso_providers.resource_id; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.sso_providers.resource_id IS 'Auth: Uniquely identifies a SSO provider according to a user-chosen resource ID (case insensitive), useful in infrastructure as code.';


--
-- Name: users; Type: TABLE; Schema: auth; Owner: supabase_auth_admin
--

CREATE TABLE auth.users (
    instance_id uuid,
    id uuid NOT NULL,
    aud character varying(255),
    role character varying(255),
    email character varying(255),
    encrypted_password character varying(255),
    email_confirmed_at timestamp with time zone,
    invited_at timestamp with time zone,
    confirmation_token character varying(255),
    confirmation_sent_at timestamp with time zone,
    recovery_token character varying(255),
    recovery_sent_at timestamp with time zone,
    email_change_token_new character varying(255),
    email_change character varying(255),
    email_change_sent_at timestamp with time zone,
    last_sign_in_at timestamp with time zone,
    raw_app_meta_data jsonb,
    raw_user_meta_data jsonb,
    is_super_admin boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    phone text DEFAULT NULL::character varying,
    phone_confirmed_at timestamp with time zone,
    phone_change text DEFAULT ''::character varying,
    phone_change_token character varying(255) DEFAULT ''::character varying,
    phone_change_sent_at timestamp with time zone,
    confirmed_at timestamp with time zone GENERATED ALWAYS AS (LEAST(email_confirmed_at, phone_confirmed_at)) STORED,
    email_change_token_current character varying(255) DEFAULT ''::character varying,
    email_change_confirm_status smallint DEFAULT 0,
    banned_until timestamp with time zone,
    reauthentication_token character varying(255) DEFAULT ''::character varying,
    reauthentication_sent_at timestamp with time zone,
    is_sso_user boolean DEFAULT false NOT NULL,
    deleted_at timestamp with time zone,
    CONSTRAINT users_email_change_confirm_status_check CHECK (((email_change_confirm_status >= 0) AND (email_change_confirm_status <= 2)))
);


ALTER TABLE auth.users OWNER TO supabase_auth_admin;

--
-- Name: TABLE users; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON TABLE auth.users IS 'Auth: Stores user login data within a secure schema.';


--
-- Name: COLUMN users.is_sso_user; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON COLUMN auth.users.is_sso_user IS 'Auth: Set this column to true when the account comes from SSO. These accounts can have duplicate emails.';


--
-- Name: game_record; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_record (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    game_no smallint NOT NULL,
    player_1 smallint,
    player_2 smallint,
    player_3 smallint,
    player_4 smallint,
    score_1 smallint DEFAULT '0'::smallint NOT NULL,
    score_2 smallint DEFAULT '0'::smallint NOT NULL,
    game_id bigint
);


ALTER TABLE public.game_record OWNER TO postgres;

--
-- Name: game_record_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.game_record ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.game_record_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: game_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.game_user (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    modified_at timestamp with time zone DEFAULT now() NOT NULL,
    player_no smallint NOT NULL,
    player_name text DEFAULT 'NULL'::text,
    game_id bigint
);


ALTER TABLE public.game_user OWNER TO postgres;

--
-- Name: game_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.game_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.game_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: games; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.games (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    modified_at timestamp with time zone DEFAULT now(),
    player_num smallint DEFAULT '4'::smallint NOT NULL,
    coat_num smallint DEFAULT '1'::smallint NOT NULL,
    dobules_flg boolean DEFAULT true NOT NULL,
    userid text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.games OWNER TO postgres;

--
-- Name: games_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.games ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.games_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: random_number_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.random_number_table (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    no smallint,
    p1 smallint NOT NULL,
    p2 smallint NOT NULL,
    person_num smallint
);


ALTER TABLE public.random_number_table OWNER TO postgres;

--
-- Name: random_number_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.random_number_table ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.random_number_table_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    created_at timestamp with time zone DEFAULT now(),
    modified_at timestamp with time zone DEFAULT now(),
    loginid text,
    login_type smallint DEFAULT '1'::smallint NOT NULL,
    CONSTRAINT users_login_type_check CHECK (((1 <= login_type) AND (login_type <= 10)))
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: refresh_tokens id; Type: DEFAULT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens ALTER COLUMN id SET DEFAULT nextval('auth.refresh_tokens_id_seq'::regclass);


--
-- Data for Name: audit_log_entries; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.audit_log_entries (instance_id, id, payload, created_at, ip_address) FROM stdin;
\.


--
-- Data for Name: flow_state; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.flow_state (id, user_id, auth_code, code_challenge_method, code_challenge, provider_type, provider_access_token, provider_refresh_token, created_at, updated_at, authentication_method) FROM stdin;
\.


--
-- Data for Name: identities; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.identities (id, user_id, identity_data, provider, last_sign_in_at, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: instances; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.instances (id, uuid, raw_base_config, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: mfa_amr_claims; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_amr_claims (session_id, created_at, updated_at, authentication_method, id) FROM stdin;
\.


--
-- Data for Name: mfa_challenges; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_challenges (id, factor_id, created_at, verified_at, ip_address) FROM stdin;
\.


--
-- Data for Name: mfa_factors; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.mfa_factors (id, user_id, friendly_name, factor_type, status, created_at, updated_at, secret) FROM stdin;
\.


--
-- Data for Name: refresh_tokens; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.refresh_tokens (instance_id, id, token, user_id, revoked, created_at, updated_at, parent, session_id) FROM stdin;
\.


--
-- Data for Name: saml_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_providers (id, sso_provider_id, entity_id, metadata_xml, metadata_url, attribute_mapping, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: saml_relay_states; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.saml_relay_states (id, sso_provider_id, request_id, for_email, redirect_to, from_ip_address, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.schema_migrations (version) FROM stdin;
20171026211738
20171026211808
20171026211834
20180103212743
20180108183307
20180119214651
20180125194653
00
20210710035447
20210722035447
20210730183235
20210909172000
20210927181326
20211122151130
20211124214934
20211202183645
20220114185221
20220114185340
20220224000811
20220323170000
20220429102000
20220531120530
20220614074223
20220811173540
20221003041349
20221003041400
20221011041400
20221020193600
20221021073300
20221021082433
20221027105023
20221114143122
20221114143410
20221125140132
20221208132122
20221215195500
20221215195800
20221215195900
20230116124310
20230116124412
20230131181311
20230322519590
20230402418590
20230411005111
20230508135423
20230523124323
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sessions (id, user_id, created_at, updated_at, factor_id, aal, not_after) FROM stdin;
\.


--
-- Data for Name: sso_domains; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_domains (id, sso_provider_id, domain, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: sso_providers; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.sso_providers (id, resource_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: auth; Owner: supabase_auth_admin
--

COPY auth.users (instance_id, id, aud, role, email, encrypted_password, email_confirmed_at, invited_at, confirmation_token, confirmation_sent_at, recovery_token, recovery_sent_at, email_change_token_new, email_change, email_change_sent_at, last_sign_in_at, raw_app_meta_data, raw_user_meta_data, is_super_admin, created_at, updated_at, phone, phone_confirmed_at, phone_change, phone_change_token, phone_change_sent_at, email_change_token_current, email_change_confirm_status, banned_until, reauthentication_token, reauthentication_sent_at, is_sso_user, deleted_at) FROM stdin;
\.


--
-- Data for Name: game_record; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_record (id, created_at, modified_at, game_no, player_1, player_2, player_3, player_4, score_1, score_2, game_id) FROM stdin;
859	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	1	1	2	3	4	0	0	101
860	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	2	5	6	1	7	0	0	101
861	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	3	2	4	3	6	0	0	101
862	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	4	5	7	1	4	0	0	101
863	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	5	2	6	3	7	0	0	101
864	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	6	1	5	4	6	0	0	101
865	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	7	2	7	3	5	0	0	101
866	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	8	1	6	4	7	0	0	101
867	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	9	2	5	1	3	0	0	101
868	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	10	6	7	4	5	0	0	101
\.


--
-- Data for Name: game_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.game_user (id, created_at, modified_at, player_no, player_name, game_id) FROM stdin;
431	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	1	NULL	101
432	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	2	NULL	101
433	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	3	NULL	101
434	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	4	NULL	101
435	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	5	NULL	101
436	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	6	NULL	101
437	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	7	NULL	101
\.


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.games (id, created_at, modified_at, player_num, coat_num, dobules_flg, userid) FROM stdin;
101	2023-08-17 14:25:03.997434+00	2023-08-17 14:25:03.997434+00	7	1	t	Ufe9e746df649a4b36e12b70e87d30aa4
\.


--
-- Data for Name: random_number_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.random_number_table (id, created_at, no, p1, p2, person_num) FROM stdin;
1	2023-05-07 09:31:51.263664+00	1	1	2	4
2	2023-05-07 09:31:51.263664+00	2	3	4	4
3	2023-05-07 09:31:51.263664+00	3	1	3	4
4	2023-05-07 09:31:51.263664+00	4	2	4	4
5	2023-05-07 09:31:51.263664+00	5	1	4	4
6	2023-05-07 09:31:51.263664+00	6	2	3	4
7	2023-05-07 09:31:51.263664+00	1	1	2	5
8	2023-05-07 09:31:51.263664+00	2	3	4	5
9	2023-05-07 09:31:51.263664+00	3	1	5	5
10	2023-05-07 09:31:51.263664+00	4	2	4	5
11	2023-05-07 09:31:51.263664+00	5	3	5	5
12	2023-05-07 09:31:51.263664+00	6	1	4	5
13	2023-05-07 09:31:51.263664+00	7	2	5	5
14	2023-05-07 09:31:51.263664+00	8	1	3	5
15	2023-05-07 09:31:51.263664+00	9	4	5	5
16	2023-05-07 09:31:51.263664+00	10	2	3	5
17	2023-05-07 09:31:51.263664+00	11	1	5	5
18	2023-05-07 09:31:51.263664+00	12	4	3	5
19	2023-05-07 09:31:51.263664+00	13	1	2	5
20	2023-05-07 09:31:51.263664+00	14	5	3	5
21	2023-05-07 09:31:51.263664+00	15	4	2	5
22	2023-05-07 09:31:51.263664+00	16	1	3	5
23	2023-05-07 09:31:51.263664+00	17	5	2	5
24	2023-05-07 09:31:51.263664+00	18	1	4	5
25	2023-05-07 09:31:51.263664+00	19	3	2	5
26	2023-05-07 09:31:51.263664+00	20	5	4	5
27	2023-05-07 09:31:51.263664+00	1	1	2	6
28	2023-05-07 09:31:51.263664+00	2	3	4	6
29	2023-05-07 09:31:51.263664+00	3	5	6	6
30	2023-05-07 09:31:51.263664+00	4	1	4	6
31	2023-05-07 09:31:51.263664+00	5	2	6	6
32	2023-05-07 09:31:51.263664+00	6	3	5	6
33	2023-05-07 09:31:51.263664+00	7	1	6	6
34	2023-05-07 09:31:51.263664+00	8	4	5	6
35	2023-05-07 09:31:51.263664+00	9	2	3	6
36	2023-05-07 09:31:51.263664+00	10	1	5	6
37	2023-05-07 09:31:51.263664+00	11	6	3	6
38	2023-05-07 09:31:51.263664+00	12	4	2	6
39	2023-05-07 09:31:51.263664+00	13	1	3	6
40	2023-05-07 09:31:51.263664+00	14	5	2	6
41	2023-05-07 09:31:51.263664+00	15	6	4	6
42	2023-05-07 09:31:51.263664+00	16	1	2	6
43	2023-05-07 09:31:51.263664+00	17	3	4	6
44	2023-05-07 09:31:51.263664+00	18	5	6	6
45	2023-05-07 09:31:51.263664+00	19	1	4	6
46	2023-05-07 09:31:51.263664+00	20	2	6	6
47	2023-05-07 09:31:51.263664+00	21	3	5	6
48	2023-05-07 09:31:51.263664+00	22	1	6	6
49	2023-05-07 09:31:51.263664+00	23	4	5	6
50	2023-05-07 09:31:51.263664+00	24	2	3	6
51	2023-05-07 09:31:51.263664+00	25	1	5	6
52	2023-05-07 09:31:51.263664+00	26	6	3	6
53	2023-05-07 09:31:51.263664+00	27	4	2	6
54	2023-05-07 09:31:51.263664+00	28	1	3	6
55	2023-05-07 09:31:51.263664+00	29	5	2	6
56	2023-05-07 09:31:51.263664+00	30	6	4	6
57	2023-05-07 09:31:51.263664+00	1	1	2	7
58	2023-05-07 09:31:51.263664+00	2	3	4	7
59	2023-05-07 09:31:51.263664+00	3	5	6	7
60	2023-05-07 09:31:51.263664+00	4	1	7	7
61	2023-05-07 09:31:51.263664+00	5	2	4	7
62	2023-05-07 09:31:51.263664+00	6	3	6	7
63	2023-05-07 09:31:51.263664+00	7	5	7	7
64	2023-05-07 09:31:51.263664+00	8	1	4	7
65	2023-05-07 09:31:51.263664+00	9	2	6	7
66	2023-05-07 09:31:51.263664+00	10	3	7	7
67	2023-05-07 09:31:51.263664+00	11	1	5	7
68	2023-05-07 09:31:51.263664+00	12	4	6	7
69	2023-05-07 09:31:51.263664+00	13	2	7	7
70	2023-05-07 09:31:51.263664+00	14	3	5	7
71	2023-05-07 09:31:51.263664+00	15	1	6	7
72	2023-05-07 09:31:51.263664+00	16	4	7	7
73	2023-05-07 09:31:51.263664+00	17	2	5	7
74	2023-05-07 09:31:51.263664+00	18	1	3	7
75	2023-05-07 09:31:51.263664+00	19	6	7	7
76	2023-05-07 09:31:51.263664+00	20	4	5	7
77	2023-05-07 09:31:51.263664+00	1	1	2	8
78	2023-05-07 09:31:51.263664+00	2	3	4	8
79	2023-05-07 09:31:51.263664+00	3	5	6	8
80	2023-05-07 09:31:51.263664+00	4	7	8	8
81	2023-05-07 09:31:51.263664+00	5	1	4	8
82	2023-05-07 09:31:51.263664+00	6	2	6	8
83	2023-05-07 09:31:51.263664+00	7	3	8	8
84	2023-05-07 09:31:51.263664+00	8	5	7	8
85	2023-05-07 09:31:51.263664+00	9	1	6	8
86	2023-05-07 09:31:51.263664+00	10	4	8	8
87	2023-05-07 09:31:51.263664+00	11	2	7	8
88	2023-05-07 09:31:51.263664+00	12	3	5	8
89	2023-05-07 09:31:51.263664+00	13	1	8	8
90	2023-05-07 09:31:51.263664+00	14	6	7	8
91	2023-05-07 09:31:51.263664+00	15	4	5	8
92	2023-05-07 09:31:51.263664+00	16	2	3	8
93	2023-05-07 09:31:51.263664+00	17	1	7	8
94	2023-05-07 09:31:51.263664+00	18	8	5	8
95	2023-05-07 09:31:51.263664+00	19	6	3	8
96	2023-05-07 09:31:51.263664+00	20	4	2	8
97	2023-05-07 09:31:51.263664+00	21	1	5	8
98	2023-05-07 09:31:51.263664+00	22	7	3	8
99	2023-05-07 09:31:51.263664+00	23	8	2	8
100	2023-05-07 09:31:51.263664+00	24	6	4	8
101	2023-05-07 09:31:51.263664+00	25	1	3	8
102	2023-05-07 09:31:51.263664+00	26	5	2	8
103	2023-05-07 09:31:51.263664+00	27	7	4	8
104	2023-05-07 09:31:51.263664+00	28	8	6	8
105	2023-05-07 09:31:51.263664+00	1	1	2	9
106	2023-05-07 09:31:51.263664+00	2	3	4	9
107	2023-05-07 09:31:51.263664+00	3	5	6	9
108	2023-05-07 09:31:51.263664+00	4	7	8	9
109	2023-05-07 09:31:51.263664+00	5	1	9	9
110	2023-05-07 09:31:51.263664+00	6	2	4	9
111	2023-05-07 09:31:51.263664+00	7	3	6	9
112	2023-05-07 09:31:51.263664+00	8	5	8	9
113	2023-05-07 09:31:51.263664+00	9	7	9	9
114	2023-05-07 09:31:51.263664+00	10	1	4	9
115	2023-05-07 09:31:51.263664+00	11	2	6	9
116	2023-05-07 09:31:51.263664+00	12	3	8	9
117	2023-05-07 09:31:51.263664+00	13	5	9	9
118	2023-05-07 09:31:51.263664+00	14	1	7	9
119	2023-05-07 09:31:51.263664+00	15	4	6	9
120	2023-05-07 09:31:51.263664+00	16	2	8	9
121	2023-05-07 09:31:51.263664+00	17	3	9	9
122	2023-05-07 09:31:51.263664+00	18	5	7	9
123	2023-05-07 09:31:51.263664+00	19	1	6	9
124	2023-05-07 09:31:51.263664+00	20	4	8	9
125	2023-05-07 09:31:51.263664+00	21	2	9	9
126	2023-05-07 09:31:51.263664+00	22	3	7	9
127	2023-05-07 09:31:51.263664+00	23	1	5	9
128	2023-05-07 09:31:51.263664+00	24	6	8	9
129	2023-05-07 09:31:51.263664+00	25	4	9	9
130	2023-05-07 09:31:51.263664+00	26	2	7	9
131	2023-05-07 09:31:51.263664+00	27	3	5	9
132	2023-05-07 09:31:51.263664+00	28	1	8	9
133	2023-05-07 09:31:51.263664+00	29	6	9	9
134	2023-05-07 09:31:51.263664+00	30	4	7	9
135	2023-05-07 09:31:51.263664+00	31	2	5	9
136	2023-05-07 09:31:51.263664+00	32	1	3	9
137	2023-05-07 09:31:51.263664+00	33	8	9	9
138	2023-05-07 09:31:51.263664+00	34	6	7	9
139	2023-05-07 09:31:51.263664+00	35	4	5	9
140	2023-05-07 09:31:51.263664+00	36	2	3	9
141	2023-05-07 09:31:51.263664+00	1	1	2	10
142	2023-05-07 09:31:51.263664+00	2	3	4	10
143	2023-05-07 09:31:51.263664+00	3	5	6	10
144	2023-05-07 09:31:51.263664+00	4	7	8	10
145	2023-05-07 09:31:51.263664+00	5	9	10	10
146	2023-05-07 09:31:51.263664+00	6	1	4	10
147	2023-05-07 09:31:51.263664+00	7	2	6	10
148	2023-05-07 09:31:51.263664+00	8	3	8	10
149	2023-05-07 09:31:51.263664+00	9	5	10	10
150	2023-05-07 09:31:51.263664+00	10	7	9	10
151	2023-05-07 09:31:51.263664+00	11	1	6	10
152	2023-05-07 09:31:51.263664+00	12	4	8	10
153	2023-05-07 09:31:51.263664+00	13	2	10	10
154	2023-05-07 09:31:51.263664+00	14	3	9	10
155	2023-05-07 09:31:51.263664+00	15	5	7	10
156	2023-05-07 09:31:51.263664+00	16	1	8	10
157	2023-05-07 09:31:51.263664+00	17	6	10	10
158	2023-05-07 09:31:51.263664+00	18	4	9	10
159	2023-05-07 09:31:51.263664+00	19	2	7	10
160	2023-05-07 09:31:51.263664+00	20	3	5	10
161	2023-05-07 09:31:51.263664+00	21	1	10	10
162	2023-05-07 09:31:51.263664+00	22	8	9	10
163	2023-05-07 09:31:51.263664+00	23	6	7	10
164	2023-05-07 09:31:51.263664+00	24	4	5	10
165	2023-05-07 09:31:51.263664+00	25	2	3	10
166	2023-05-07 09:31:51.263664+00	26	1	9	10
167	2023-05-07 09:31:51.263664+00	27	10	7	10
168	2023-05-07 09:31:51.263664+00	28	8	5	10
169	2023-05-07 09:31:51.263664+00	29	6	3	10
170	2023-05-07 09:31:51.263664+00	30	4	2	10
171	2023-05-07 09:31:51.263664+00	31	1	7	10
172	2023-05-07 09:31:51.263664+00	32	9	5	10
173	2023-05-07 09:31:51.263664+00	33	10	3	10
174	2023-05-07 09:31:51.263664+00	34	8	2	10
175	2023-05-07 09:31:51.263664+00	35	6	4	10
176	2023-05-07 09:31:51.263664+00	36	1	5	10
177	2023-05-07 09:31:51.263664+00	37	7	3	10
178	2023-05-07 09:31:51.263664+00	38	9	2	10
179	2023-05-07 09:31:51.263664+00	39	10	4	10
180	2023-05-07 09:31:51.263664+00	40	8	6	10
181	2023-05-07 09:31:51.263664+00	41	1	3	10
182	2023-05-07 09:31:51.263664+00	42	5	2	10
183	2023-05-07 09:31:51.263664+00	43	7	4	10
184	2023-05-07 09:31:51.263664+00	44	9	6	10
185	2023-05-07 09:31:51.263664+00	45	10	8	10
186	2023-05-07 09:31:51.263664+00	1	1	2	11
187	2023-05-07 09:31:51.263664+00	2	3	4	11
188	2023-05-07 09:31:51.263664+00	3	5	6	11
189	2023-05-07 09:31:51.263664+00	4	7	8	11
190	2023-05-07 09:31:51.263664+00	5	9	10	11
191	2023-05-07 09:31:51.263664+00	6	1	11	11
192	2023-05-07 09:31:51.263664+00	7	2	4	11
193	2023-05-07 09:31:51.263664+00	8	3	6	11
194	2023-05-07 09:31:51.263664+00	9	5	8	11
195	2023-05-07 09:31:51.263664+00	10	7	10	11
196	2023-05-07 09:31:51.263664+00	11	9	11	11
197	2023-05-07 09:31:51.263664+00	12	1	4	11
198	2023-05-07 09:31:51.263664+00	13	2	6	11
199	2023-05-07 09:31:51.263664+00	14	3	8	11
200	2023-05-07 09:31:51.263664+00	15	5	10	11
201	2023-05-07 09:31:51.263664+00	16	7	11	11
202	2023-05-07 09:31:51.263664+00	17	1	9	11
203	2023-05-07 09:31:51.263664+00	18	4	6	11
204	2023-05-07 09:31:51.263664+00	19	2	8	11
205	2023-05-07 09:31:51.263664+00	20	3	10	11
206	2023-05-07 09:31:51.263664+00	21	5	11	11
207	2023-05-07 09:31:51.263664+00	22	7	9	11
208	2023-05-07 09:31:51.263664+00	23	1	6	11
209	2023-05-07 09:31:51.263664+00	24	4	8	11
210	2023-05-07 09:31:51.263664+00	25	2	10	11
211	2023-05-07 09:31:51.263664+00	26	3	11	11
212	2023-05-07 09:31:51.263664+00	27	5	9	11
213	2023-05-07 09:31:51.263664+00	28	1	7	11
214	2023-05-07 09:31:51.263664+00	29	6	8	11
215	2023-05-07 09:31:51.263664+00	30	4	10	11
216	2023-05-07 09:31:51.263664+00	31	2	11	11
217	2023-05-07 09:31:51.263664+00	32	3	9	11
218	2023-05-07 09:31:51.263664+00	33	5	7	11
219	2023-05-07 09:31:51.263664+00	34	1	8	11
220	2023-05-07 09:31:51.263664+00	35	6	10	11
221	2023-05-07 09:31:51.263664+00	36	4	11	11
222	2023-05-07 09:31:51.263664+00	37	2	9	11
223	2023-05-07 09:31:51.263664+00	38	3	7	11
224	2023-05-07 09:31:51.263664+00	39	1	5	11
225	2023-05-07 09:31:51.263664+00	40	8	10	11
226	2023-05-07 09:31:51.263664+00	41	6	11	11
227	2023-05-07 09:31:51.263664+00	42	4	9	11
228	2023-05-07 09:31:51.263664+00	43	2	7	11
229	2023-05-07 09:31:51.263664+00	44	3	5	11
230	2023-05-07 09:31:51.263664+00	45	1	10	11
231	2023-05-07 09:31:51.263664+00	46	8	11	11
232	2023-05-07 09:31:51.263664+00	47	6	9	11
233	2023-05-07 09:31:51.263664+00	48	4	7	11
234	2023-05-07 09:31:51.263664+00	49	2	5	11
235	2023-05-07 09:31:51.263664+00	50	1	3	11
236	2023-05-07 09:31:51.263664+00	51	10	11	11
237	2023-05-07 09:31:51.263664+00	52	8	9	11
238	2023-05-07 09:31:51.263664+00	53	6	7	11
239	2023-05-07 09:31:51.263664+00	54	4	5	11
240	2023-05-07 09:31:51.263664+00	55	2	3	11
241	2023-05-07 09:31:51.263664+00	1	1	2	12
242	2023-05-07 09:31:51.263664+00	2	3	4	12
243	2023-05-07 09:31:51.263664+00	3	5	6	12
244	2023-05-07 09:31:51.263664+00	4	7	8	12
245	2023-05-07 09:31:51.263664+00	5	9	10	12
246	2023-05-07 09:31:51.263664+00	6	11	12	12
247	2023-05-07 09:31:51.263664+00	7	1	4	12
248	2023-05-07 09:31:51.263664+00	8	2	6	12
249	2023-05-07 09:31:51.263664+00	9	3	8	12
250	2023-05-07 09:31:51.263664+00	10	5	10	12
251	2023-05-07 09:31:51.263664+00	11	7	12	12
252	2023-05-07 09:31:51.263664+00	12	9	11	12
253	2023-05-07 09:31:51.263664+00	13	1	6	12
254	2023-05-07 09:31:51.263664+00	14	4	8	12
255	2023-05-07 09:31:51.263664+00	15	2	10	12
256	2023-05-07 09:31:51.263664+00	16	3	12	12
257	2023-05-07 09:31:51.263664+00	17	5	11	12
258	2023-05-07 09:31:51.263664+00	18	7	9	12
259	2023-05-07 09:31:51.263664+00	19	1	8	12
260	2023-05-07 09:31:51.263664+00	20	6	10	12
261	2023-05-07 09:31:51.263664+00	21	4	12	12
262	2023-05-07 09:31:51.263664+00	22	2	11	12
263	2023-05-07 09:31:51.263664+00	23	3	9	12
264	2023-05-07 09:31:51.263664+00	24	5	7	12
265	2023-05-07 09:31:51.263664+00	25	1	10	12
266	2023-05-07 09:31:51.263664+00	26	8	12	12
267	2023-05-07 09:31:51.263664+00	27	6	11	12
268	2023-05-07 09:31:51.263664+00	28	4	9	12
269	2023-05-07 09:31:51.263664+00	29	2	7	12
270	2023-05-07 09:31:51.263664+00	30	3	5	12
271	2023-05-07 09:31:51.263664+00	31	1	12	12
272	2023-05-07 09:31:51.263664+00	32	10	11	12
273	2023-05-07 09:31:51.263664+00	33	8	9	12
274	2023-05-07 09:31:51.263664+00	34	6	7	12
275	2023-05-07 09:31:51.263664+00	35	4	5	12
276	2023-05-07 09:31:51.263664+00	36	2	3	12
277	2023-05-07 09:31:51.263664+00	37	1	11	12
278	2023-05-07 09:31:51.263664+00	38	12	9	12
279	2023-05-07 09:31:51.263664+00	39	10	7	12
280	2023-05-07 09:31:51.263664+00	40	8	5	12
281	2023-05-07 09:31:51.263664+00	41	6	3	12
282	2023-05-07 09:31:51.263664+00	42	4	2	12
283	2023-05-07 09:31:51.263664+00	43	1	9	12
284	2023-05-07 09:31:51.263664+00	44	11	7	12
285	2023-05-07 09:31:51.263664+00	45	12	5	12
286	2023-05-07 09:31:51.263664+00	46	10	3	12
287	2023-05-07 09:31:51.263664+00	47	8	2	12
288	2023-05-07 09:31:51.263664+00	48	6	4	12
289	2023-05-07 09:31:51.263664+00	49	1	7	12
290	2023-05-07 09:31:51.263664+00	50	9	5	12
291	2023-05-07 09:31:51.263664+00	51	11	3	12
292	2023-05-07 09:31:51.263664+00	52	12	2	12
293	2023-05-07 09:31:51.263664+00	53	10	4	12
294	2023-05-07 09:31:51.263664+00	54	8	6	12
295	2023-05-07 09:31:51.263664+00	55	1	5	12
296	2023-05-07 09:31:51.263664+00	56	7	3	12
297	2023-05-07 09:31:51.263664+00	57	9	2	12
298	2023-05-07 09:31:51.263664+00	58	11	4	12
299	2023-05-07 09:31:51.263664+00	59	12	6	12
300	2023-05-07 09:31:51.263664+00	60	10	8	12
301	2023-05-07 09:31:51.263664+00	61	1	3	12
302	2023-05-07 09:31:51.263664+00	62	5	2	12
303	2023-05-07 09:31:51.263664+00	63	7	4	12
304	2023-05-07 09:31:51.263664+00	64	9	6	12
305	2023-05-07 09:31:51.263664+00	65	11	8	12
306	2023-05-07 09:31:51.263664+00	66	12	10	12
307	2023-05-07 09:31:51.263664+00	1	1	2	13
308	2023-05-07 09:31:51.263664+00	2	3	4	13
309	2023-05-07 09:31:51.263664+00	3	5	6	13
310	2023-05-07 09:31:51.263664+00	4	7	8	13
311	2023-05-07 09:31:51.263664+00	5	9	10	13
312	2023-05-07 09:31:51.263664+00	6	11	12	13
313	2023-05-07 09:31:51.263664+00	7	1	13	13
314	2023-05-07 09:31:51.263664+00	8	2	4	13
315	2023-05-07 09:31:51.263664+00	9	3	6	13
316	2023-05-07 09:31:51.263664+00	10	5	8	13
317	2023-05-07 09:31:51.263664+00	11	7	10	13
318	2023-05-07 09:31:51.263664+00	12	9	12	13
319	2023-05-07 09:31:51.263664+00	13	11	13	13
320	2023-05-07 09:31:51.263664+00	14	1	4	13
321	2023-05-07 09:31:51.263664+00	15	2	6	13
322	2023-05-07 09:31:51.263664+00	16	3	8	13
323	2023-05-07 09:31:51.263664+00	17	5	10	13
324	2023-05-07 09:31:51.263664+00	18	7	12	13
325	2023-05-07 09:31:51.263664+00	19	9	13	13
326	2023-05-07 09:31:51.263664+00	20	1	11	13
327	2023-05-07 09:31:51.263664+00	21	4	6	13
328	2023-05-07 09:31:51.263664+00	22	2	8	13
329	2023-05-07 09:31:51.263664+00	23	3	10	13
330	2023-05-07 09:31:51.263664+00	24	5	12	13
331	2023-05-07 09:31:51.263664+00	25	7	13	13
332	2023-05-07 09:31:51.263664+00	26	9	11	13
333	2023-05-07 09:31:51.263664+00	27	1	6	13
334	2023-05-07 09:31:51.263664+00	28	4	8	13
335	2023-05-07 09:31:51.263664+00	29	2	10	13
336	2023-05-07 09:31:51.263664+00	30	3	12	13
337	2023-05-07 09:31:51.263664+00	31	5	13	13
338	2023-05-07 09:31:51.263664+00	32	7	11	13
339	2023-05-07 09:31:51.263664+00	33	1	9	13
340	2023-05-07 09:31:51.263664+00	34	6	8	13
341	2023-05-07 09:31:51.263664+00	35	4	10	13
342	2023-05-07 09:31:51.263664+00	36	2	12	13
343	2023-05-07 09:31:51.263664+00	37	3	13	13
344	2023-05-07 09:31:51.263664+00	38	5	11	13
345	2023-05-07 09:31:51.263664+00	39	7	9	13
346	2023-05-07 09:31:51.263664+00	40	1	8	13
347	2023-05-07 09:31:51.263664+00	41	6	10	13
348	2023-05-07 09:31:51.263664+00	42	4	12	13
349	2023-05-07 09:31:51.263664+00	43	2	13	13
350	2023-05-07 09:31:51.263664+00	44	3	11	13
351	2023-05-07 09:31:51.263664+00	45	5	9	13
352	2023-05-07 09:31:51.263664+00	46	1	7	13
353	2023-05-07 09:31:51.263664+00	47	8	10	13
354	2023-05-07 09:31:51.263664+00	48	6	12	13
355	2023-05-07 09:31:51.263664+00	49	4	13	13
356	2023-05-07 09:31:51.263664+00	50	2	11	13
357	2023-05-07 09:31:51.263664+00	51	3	9	13
358	2023-05-07 09:31:51.263664+00	52	5	7	13
359	2023-05-07 09:31:51.263664+00	53	1	10	13
360	2023-05-07 09:31:51.263664+00	54	8	12	13
361	2023-05-07 09:31:51.263664+00	55	6	13	13
362	2023-05-07 09:31:51.263664+00	56	4	11	13
363	2023-05-07 09:31:51.263664+00	57	2	9	13
364	2023-05-07 09:31:51.263664+00	58	3	7	13
365	2023-05-07 09:31:51.263664+00	59	1	5	13
366	2023-05-07 09:31:51.263664+00	60	10	12	13
367	2023-05-07 09:31:51.263664+00	61	8	13	13
368	2023-05-07 09:31:51.263664+00	62	6	11	13
369	2023-05-07 09:31:51.263664+00	63	4	9	13
370	2023-05-07 09:31:51.263664+00	64	2	7	13
371	2023-05-07 09:31:51.263664+00	65	3	5	13
372	2023-05-07 09:31:51.263664+00	66	1	12	13
373	2023-05-07 09:31:51.263664+00	67	10	13	13
374	2023-05-07 09:31:51.263664+00	68	8	11	13
375	2023-05-07 09:31:51.263664+00	69	6	9	13
376	2023-05-07 09:31:51.263664+00	70	4	7	13
377	2023-05-07 09:31:51.263664+00	71	2	5	13
378	2023-05-07 09:31:51.263664+00	72	1	3	13
379	2023-05-07 09:31:51.263664+00	73	12	13	13
380	2023-05-07 09:31:51.263664+00	74	10	11	13
381	2023-05-07 09:31:51.263664+00	75	8	9	13
382	2023-05-07 09:31:51.263664+00	76	6	7	13
383	2023-05-07 09:31:51.263664+00	77	4	5	13
384	2023-05-07 09:31:51.263664+00	78	2	3	13
385	2023-05-07 09:31:51.263664+00	1	1	2	14
386	2023-05-07 09:31:51.263664+00	2	3	4	14
387	2023-05-07 09:31:51.263664+00	3	5	6	14
388	2023-05-07 09:31:51.263664+00	4	7	8	14
389	2023-05-07 09:31:51.263664+00	5	9	10	14
390	2023-05-07 09:31:51.263664+00	6	11	12	14
391	2023-05-07 09:31:51.263664+00	7	13	14	14
392	2023-05-07 09:31:51.263664+00	8	1	4	14
393	2023-05-07 09:31:51.263664+00	9	2	6	14
394	2023-05-07 09:31:51.263664+00	10	3	8	14
395	2023-05-07 09:31:51.263664+00	11	5	10	14
396	2023-05-07 09:31:51.263664+00	12	7	12	14
397	2023-05-07 09:31:51.263664+00	13	9	14	14
398	2023-05-07 09:31:51.263664+00	14	11	13	14
399	2023-05-07 09:31:51.263664+00	15	1	6	14
400	2023-05-07 09:31:51.263664+00	16	4	8	14
401	2023-05-07 09:31:51.263664+00	17	2	10	14
402	2023-05-07 09:31:51.263664+00	18	3	12	14
403	2023-05-07 09:31:51.263664+00	19	5	14	14
404	2023-05-07 09:31:51.263664+00	20	7	13	14
405	2023-05-07 09:31:51.263664+00	21	9	11	14
406	2023-05-07 09:31:51.263664+00	22	1	8	14
407	2023-05-07 09:31:51.263664+00	23	6	10	14
408	2023-05-07 09:31:51.263664+00	24	4	12	14
409	2023-05-07 09:31:51.263664+00	25	2	14	14
410	2023-05-07 09:31:51.263664+00	26	3	13	14
411	2023-05-07 09:31:51.263664+00	27	5	11	14
412	2023-05-07 09:31:51.263664+00	28	7	9	14
413	2023-05-07 09:31:51.263664+00	29	1	10	14
414	2023-05-07 09:31:51.263664+00	30	8	12	14
415	2023-05-07 09:31:51.263664+00	31	6	14	14
416	2023-05-07 09:31:51.263664+00	32	4	13	14
417	2023-05-07 09:31:51.263664+00	33	2	11	14
418	2023-05-07 09:31:51.263664+00	34	3	9	14
419	2023-05-07 09:31:51.263664+00	35	5	7	14
420	2023-05-07 09:31:51.263664+00	36	1	12	14
421	2023-05-07 09:31:51.263664+00	37	10	14	14
422	2023-05-07 09:31:51.263664+00	38	8	13	14
423	2023-05-07 09:31:51.263664+00	39	6	11	14
424	2023-05-07 09:31:51.263664+00	40	4	9	14
425	2023-05-07 09:31:51.263664+00	41	2	7	14
426	2023-05-07 09:31:51.263664+00	42	3	5	14
427	2023-05-07 09:31:51.263664+00	43	1	14	14
428	2023-05-07 09:31:51.263664+00	44	12	13	14
429	2023-05-07 09:31:51.263664+00	45	10	11	14
430	2023-05-07 09:31:51.263664+00	46	8	9	14
431	2023-05-07 09:31:51.263664+00	47	6	7	14
432	2023-05-07 09:31:51.263664+00	48	4	5	14
433	2023-05-07 09:31:51.263664+00	49	2	3	14
434	2023-05-07 09:31:51.263664+00	50	1	13	14
435	2023-05-07 09:31:51.263664+00	51	14	11	14
436	2023-05-07 09:31:51.263664+00	52	12	9	14
437	2023-05-07 09:31:51.263664+00	53	10	7	14
438	2023-05-07 09:31:51.263664+00	54	8	5	14
439	2023-05-07 09:31:51.263664+00	55	6	3	14
440	2023-05-07 09:31:51.263664+00	56	4	2	14
441	2023-05-07 09:31:51.263664+00	57	1	11	14
442	2023-05-07 09:31:51.263664+00	58	13	9	14
443	2023-05-07 09:31:51.263664+00	59	14	7	14
444	2023-05-07 09:31:51.263664+00	60	12	5	14
445	2023-05-07 09:31:51.263664+00	61	10	3	14
446	2023-05-07 09:31:51.263664+00	62	8	2	14
447	2023-05-07 09:31:51.263664+00	63	6	4	14
448	2023-05-07 09:31:51.263664+00	64	1	9	14
449	2023-05-07 09:31:51.263664+00	65	11	7	14
450	2023-05-07 09:31:51.263664+00	66	13	5	14
451	2023-05-07 09:31:51.263664+00	67	14	3	14
452	2023-05-07 09:31:51.263664+00	68	12	2	14
453	2023-05-07 09:31:51.263664+00	69	10	4	14
454	2023-05-07 09:31:51.263664+00	70	8	6	14
455	2023-05-07 09:31:51.263664+00	71	1	7	14
456	2023-05-07 09:31:51.263664+00	72	9	5	14
457	2023-05-07 09:31:51.263664+00	73	11	3	14
458	2023-05-07 09:31:51.263664+00	74	13	2	14
459	2023-05-07 09:31:51.263664+00	75	14	4	14
460	2023-05-07 09:31:51.263664+00	76	12	6	14
461	2023-05-07 09:31:51.263664+00	77	10	8	14
462	2023-05-07 09:31:51.263664+00	78	1	5	14
463	2023-05-07 09:31:51.263664+00	79	7	3	14
464	2023-05-07 09:31:51.263664+00	80	9	2	14
465	2023-05-07 09:31:51.263664+00	81	11	4	14
466	2023-05-07 09:31:51.263664+00	82	13	6	14
467	2023-05-07 09:31:51.263664+00	83	14	8	14
468	2023-05-07 09:31:51.263664+00	84	12	10	14
469	2023-05-07 09:31:51.263664+00	85	1	3	14
470	2023-05-07 09:31:51.263664+00	86	5	2	14
471	2023-05-07 09:31:51.263664+00	87	7	4	14
472	2023-05-07 09:31:51.263664+00	88	9	6	14
473	2023-05-07 09:31:51.263664+00	89	11	8	14
474	2023-05-07 09:31:51.263664+00	90	13	10	14
475	2023-05-07 09:31:51.263664+00	91	14	12	14
476	2023-05-07 09:31:51.263664+00	1	1	2	15
477	2023-05-07 09:31:51.263664+00	2	3	4	15
478	2023-05-07 09:31:51.263664+00	3	5	6	15
479	2023-05-07 09:31:51.263664+00	4	7	8	15
480	2023-05-07 09:31:51.263664+00	5	9	10	15
481	2023-05-07 09:31:51.263664+00	6	11	12	15
482	2023-05-07 09:31:51.263664+00	7	13	14	15
483	2023-05-07 09:31:51.263664+00	8	1	15	15
484	2023-05-07 09:31:51.263664+00	9	2	4	15
485	2023-05-07 09:31:51.263664+00	10	3	6	15
486	2023-05-07 09:31:51.263664+00	11	5	8	15
487	2023-05-07 09:31:51.263664+00	12	7	10	15
488	2023-05-07 09:31:51.263664+00	13	9	12	15
489	2023-05-07 09:31:51.263664+00	14	11	14	15
490	2023-05-07 09:31:51.263664+00	15	13	15	15
491	2023-05-07 09:31:51.263664+00	16	1	4	15
492	2023-05-07 09:31:51.263664+00	17	2	6	15
493	2023-05-07 09:31:51.263664+00	18	3	8	15
494	2023-05-07 09:31:51.263664+00	19	5	10	15
495	2023-05-07 09:31:51.263664+00	20	7	12	15
496	2023-05-07 09:31:51.263664+00	21	9	14	15
497	2023-05-07 09:31:51.263664+00	22	11	15	15
498	2023-05-07 09:31:51.263664+00	23	1	13	15
499	2023-05-07 09:31:51.263664+00	24	4	6	15
500	2023-05-07 09:31:51.263664+00	25	2	8	15
501	2023-05-07 09:31:51.263664+00	26	3	10	15
502	2023-05-07 09:31:51.263664+00	27	5	12	15
503	2023-05-07 09:31:51.263664+00	28	7	14	15
504	2023-05-07 09:31:51.263664+00	29	9	15	15
505	2023-05-07 09:31:51.263664+00	30	11	13	15
506	2023-05-07 09:31:51.263664+00	31	1	6	15
507	2023-05-07 09:31:51.263664+00	32	4	8	15
508	2023-05-07 09:31:51.263664+00	33	2	10	15
509	2023-05-07 09:31:51.263664+00	34	3	12	15
510	2023-05-07 09:31:51.263664+00	35	5	14	15
511	2023-05-07 09:31:51.263664+00	36	7	15	15
512	2023-05-07 09:31:51.263664+00	37	9	13	15
513	2023-05-07 09:31:51.263664+00	38	1	11	15
514	2023-05-07 09:31:51.263664+00	39	6	8	15
515	2023-05-07 09:31:51.263664+00	40	4	10	15
516	2023-05-07 09:31:51.263664+00	41	2	12	15
517	2023-05-07 09:31:51.263664+00	42	3	14	15
518	2023-05-07 09:31:51.263664+00	43	5	15	15
519	2023-05-07 09:31:51.263664+00	44	7	13	15
520	2023-05-07 09:31:51.263664+00	45	9	11	15
521	2023-05-07 09:31:51.263664+00	46	1	8	15
522	2023-05-07 09:31:51.263664+00	47	6	10	15
523	2023-05-07 09:31:51.263664+00	48	4	12	15
524	2023-05-07 09:31:51.263664+00	49	2	14	15
525	2023-05-07 09:31:51.263664+00	50	3	15	15
526	2023-05-07 09:31:51.263664+00	51	5	13	15
527	2023-05-07 09:31:51.263664+00	52	7	11	15
528	2023-05-07 09:31:51.263664+00	53	1	9	15
529	2023-05-07 09:31:51.263664+00	54	8	10	15
530	2023-05-07 09:31:51.263664+00	55	6	12	15
531	2023-05-07 09:31:51.263664+00	56	4	14	15
532	2023-05-07 09:31:51.263664+00	57	2	15	15
533	2023-05-07 09:31:51.263664+00	58	3	13	15
534	2023-05-07 09:31:51.263664+00	59	5	11	15
535	2023-05-07 09:31:51.263664+00	60	7	9	15
536	2023-05-07 09:31:51.263664+00	61	1	10	15
537	2023-05-07 09:31:51.263664+00	62	8	12	15
538	2023-05-07 09:31:51.263664+00	63	6	14	15
539	2023-05-07 09:31:51.263664+00	64	4	15	15
540	2023-05-07 09:31:51.263664+00	65	2	13	15
541	2023-05-07 09:31:51.263664+00	66	3	11	15
542	2023-05-07 09:31:51.263664+00	67	5	9	15
543	2023-05-07 09:31:51.263664+00	68	1	7	15
544	2023-05-07 09:31:51.263664+00	69	10	12	15
545	2023-05-07 09:31:51.263664+00	70	8	14	15
546	2023-05-07 09:31:51.263664+00	71	6	15	15
547	2023-05-07 09:31:51.263664+00	72	4	13	15
548	2023-05-07 09:31:51.263664+00	73	2	11	15
549	2023-05-07 09:31:51.263664+00	74	3	9	15
550	2023-05-07 09:31:51.263664+00	75	5	7	15
551	2023-05-07 09:31:51.263664+00	76	1	12	15
552	2023-05-07 09:31:51.263664+00	77	10	14	15
553	2023-05-07 09:31:51.263664+00	78	8	15	15
554	2023-05-07 09:31:51.263664+00	79	6	13	15
555	2023-05-07 09:31:51.263664+00	80	4	11	15
556	2023-05-07 09:31:51.263664+00	81	2	9	15
557	2023-05-07 09:31:51.263664+00	82	3	7	15
558	2023-05-07 09:31:51.263664+00	83	1	5	15
559	2023-05-07 09:31:51.263664+00	84	12	14	15
560	2023-05-07 09:31:51.263664+00	85	10	15	15
561	2023-05-07 09:31:51.263664+00	86	8	13	15
562	2023-05-07 09:31:51.263664+00	87	6	11	15
563	2023-05-07 09:31:51.263664+00	88	4	9	15
564	2023-05-07 09:31:51.263664+00	89	2	7	15
565	2023-05-07 09:31:51.263664+00	90	3	5	15
566	2023-05-07 09:31:51.263664+00	91	1	14	15
567	2023-05-07 09:31:51.263664+00	92	12	15	15
568	2023-05-07 09:31:51.263664+00	93	10	13	15
569	2023-05-07 09:31:51.263664+00	94	8	11	15
570	2023-05-07 09:31:51.263664+00	95	6	9	15
571	2023-05-07 09:31:51.263664+00	96	4	7	15
572	2023-05-07 09:31:51.263664+00	97	2	5	15
573	2023-05-07 09:31:51.263664+00	98	1	3	15
574	2023-05-07 09:31:51.263664+00	99	14	15	15
575	2023-05-07 09:31:51.263664+00	100	12	13	15
576	2023-05-07 09:31:51.263664+00	101	10	11	15
577	2023-05-07 09:31:51.263664+00	102	8	9	15
578	2023-05-07 09:31:51.263664+00	103	6	7	15
579	2023-05-07 09:31:51.263664+00	104	4	5	15
580	2023-05-07 09:31:51.263664+00	105	2	3	15
581	2023-05-07 09:31:51.263664+00	1	1	2	16
582	2023-05-07 09:31:51.263664+00	2	3	4	16
583	2023-05-07 09:31:51.263664+00	3	5	6	16
584	2023-05-07 09:31:51.263664+00	4	7	8	16
585	2023-05-07 09:31:51.263664+00	5	9	10	16
586	2023-05-07 09:31:51.263664+00	6	11	12	16
587	2023-05-07 09:31:51.263664+00	7	13	14	16
588	2023-05-07 09:31:51.263664+00	8	15	16	16
589	2023-05-07 09:31:51.263664+00	9	1	4	16
590	2023-05-07 09:31:51.263664+00	10	2	6	16
591	2023-05-07 09:31:51.263664+00	11	3	8	16
592	2023-05-07 09:31:51.263664+00	12	5	10	16
593	2023-05-07 09:31:51.263664+00	13	7	12	16
594	2023-05-07 09:31:51.263664+00	14	9	14	16
595	2023-05-07 09:31:51.263664+00	15	11	16	16
596	2023-05-07 09:31:51.263664+00	16	13	15	16
597	2023-05-07 09:31:51.263664+00	17	1	6	16
598	2023-05-07 09:31:51.263664+00	18	4	8	16
599	2023-05-07 09:31:51.263664+00	19	2	10	16
600	2023-05-07 09:31:51.263664+00	20	3	12	16
601	2023-05-07 09:31:51.263664+00	21	5	14	16
602	2023-05-07 09:31:51.263664+00	22	7	16	16
603	2023-05-07 09:31:51.263664+00	23	9	15	16
604	2023-05-07 09:31:51.263664+00	24	11	13	16
605	2023-05-07 09:31:51.263664+00	25	1	8	16
606	2023-05-07 09:31:51.263664+00	26	6	10	16
607	2023-05-07 09:31:51.263664+00	27	4	12	16
608	2023-05-07 09:31:51.263664+00	28	2	14	16
609	2023-05-07 09:31:51.263664+00	29	3	16	16
610	2023-05-07 09:31:51.263664+00	30	5	15	16
611	2023-05-07 09:31:51.263664+00	31	7	13	16
612	2023-05-07 09:31:51.263664+00	32	9	11	16
613	2023-05-07 09:31:51.263664+00	33	1	10	16
614	2023-05-07 09:31:51.263664+00	34	8	12	16
615	2023-05-07 09:31:51.263664+00	35	6	14	16
616	2023-05-07 09:31:51.263664+00	36	4	16	16
617	2023-05-07 09:31:51.263664+00	37	2	15	16
618	2023-05-07 09:31:51.263664+00	38	3	13	16
619	2023-05-07 09:31:51.263664+00	39	5	11	16
620	2023-05-07 09:31:51.263664+00	40	7	9	16
621	2023-05-07 09:31:51.263664+00	41	1	12	16
622	2023-05-07 09:31:51.263664+00	42	10	14	16
623	2023-05-07 09:31:51.263664+00	43	8	16	16
624	2023-05-07 09:31:51.263664+00	44	6	15	16
625	2023-05-07 09:31:51.263664+00	45	4	13	16
626	2023-05-07 09:31:51.263664+00	46	2	11	16
627	2023-05-07 09:31:51.263664+00	47	3	9	16
628	2023-05-07 09:31:51.263664+00	48	5	7	16
629	2023-05-07 09:31:51.263664+00	49	1	14	16
630	2023-05-07 09:31:51.263664+00	50	12	16	16
631	2023-05-07 09:31:51.263664+00	51	10	15	16
632	2023-05-07 09:31:51.263664+00	52	8	13	16
633	2023-05-07 09:31:51.263664+00	53	6	11	16
634	2023-05-07 09:31:51.263664+00	54	4	9	16
635	2023-05-07 09:31:51.263664+00	55	2	7	16
636	2023-05-07 09:31:51.263664+00	56	3	5	16
637	2023-05-07 09:31:51.263664+00	57	1	16	16
638	2023-05-07 09:31:51.263664+00	58	14	15	16
639	2023-05-07 09:31:51.263664+00	59	12	13	16
640	2023-05-07 09:31:51.263664+00	60	10	11	16
641	2023-05-07 09:31:51.263664+00	61	8	9	16
642	2023-05-07 09:31:51.263664+00	62	6	7	16
643	2023-05-07 09:31:51.263664+00	63	4	5	16
644	2023-05-07 09:31:51.263664+00	64	2	3	16
645	2023-05-07 09:31:51.263664+00	65	1	15	16
646	2023-05-07 09:31:51.263664+00	66	16	13	16
647	2023-05-07 09:31:51.263664+00	67	14	11	16
648	2023-05-07 09:31:51.263664+00	68	12	9	16
649	2023-05-07 09:31:51.263664+00	69	10	7	16
650	2023-05-07 09:31:51.263664+00	70	8	5	16
651	2023-05-07 09:31:51.263664+00	71	6	3	16
652	2023-05-07 09:31:51.263664+00	72	4	2	16
653	2023-05-07 09:31:51.263664+00	73	1	13	16
654	2023-05-07 09:31:51.263664+00	74	15	11	16
655	2023-05-07 09:31:51.263664+00	75	16	9	16
656	2023-05-07 09:31:51.263664+00	76	14	7	16
657	2023-05-07 09:31:51.263664+00	77	12	5	16
658	2023-05-07 09:31:51.263664+00	78	10	3	16
659	2023-05-07 09:31:51.263664+00	79	8	2	16
660	2023-05-07 09:31:51.263664+00	80	6	4	16
661	2023-05-07 09:31:51.263664+00	81	1	11	16
662	2023-05-07 09:31:51.263664+00	82	13	9	16
663	2023-05-07 09:31:51.263664+00	83	15	7	16
664	2023-05-07 09:31:51.263664+00	84	16	5	16
665	2023-05-07 09:31:51.263664+00	85	14	3	16
666	2023-05-07 09:31:51.263664+00	86	12	2	16
667	2023-05-07 09:31:51.263664+00	87	10	4	16
668	2023-05-07 09:31:51.263664+00	88	8	6	16
669	2023-05-07 09:31:51.263664+00	89	1	9	16
670	2023-05-07 09:31:51.263664+00	90	11	7	16
671	2023-05-07 09:31:51.263664+00	91	13	5	16
672	2023-05-07 09:31:51.263664+00	92	15	3	16
673	2023-05-07 09:31:51.263664+00	93	16	2	16
674	2023-05-07 09:31:51.263664+00	94	14	4	16
675	2023-05-07 09:31:51.263664+00	95	12	6	16
676	2023-05-07 09:31:51.263664+00	96	10	8	16
677	2023-05-07 09:31:51.263664+00	97	1	7	16
678	2023-05-07 09:31:51.263664+00	98	9	5	16
679	2023-05-07 09:31:51.263664+00	99	11	3	16
680	2023-05-07 09:31:51.263664+00	100	13	2	16
681	2023-05-07 09:31:51.263664+00	101	15	4	16
682	2023-05-07 09:31:51.263664+00	102	16	6	16
683	2023-05-07 09:31:51.263664+00	103	14	8	16
684	2023-05-07 09:31:51.263664+00	104	12	10	16
685	2023-05-07 09:31:51.263664+00	105	1	5	16
686	2023-05-07 09:31:51.263664+00	106	7	3	16
687	2023-05-07 09:31:51.263664+00	107	9	2	16
688	2023-05-07 09:31:51.263664+00	108	11	4	16
689	2023-05-07 09:31:51.263664+00	109	13	6	16
690	2023-05-07 09:31:51.263664+00	110	15	8	16
691	2023-05-07 09:31:51.263664+00	111	16	10	16
692	2023-05-07 09:31:51.263664+00	112	14	12	16
693	2023-05-07 09:31:51.263664+00	113	1	3	16
694	2023-05-07 09:31:51.263664+00	114	5	2	16
695	2023-05-07 09:31:51.263664+00	115	7	4	16
696	2023-05-07 09:31:51.263664+00	116	9	6	16
697	2023-05-07 09:31:51.263664+00	117	11	8	16
698	2023-05-07 09:31:51.263664+00	118	13	10	16
699	2023-05-07 09:31:51.263664+00	119	15	12	16
700	2023-05-07 09:31:51.263664+00	120	16	14	16
701	2023-05-07 09:31:51.263664+00	1	1	2	17
702	2023-05-07 09:31:51.263664+00	2	3	4	17
703	2023-05-07 09:31:51.263664+00	3	5	6	17
704	2023-05-07 09:31:51.263664+00	4	7	8	17
705	2023-05-07 09:31:51.263664+00	5	9	10	17
706	2023-05-07 09:31:51.263664+00	6	11	12	17
707	2023-05-07 09:31:51.263664+00	7	13	14	17
708	2023-05-07 09:31:51.263664+00	8	15	16	17
709	2023-05-07 09:31:51.263664+00	9	1	17	17
710	2023-05-07 09:31:51.263664+00	10	2	4	17
711	2023-05-07 09:31:51.263664+00	11	3	6	17
712	2023-05-07 09:31:51.263664+00	12	5	8	17
713	2023-05-07 09:31:51.263664+00	13	7	10	17
714	2023-05-07 09:31:51.263664+00	14	9	12	17
715	2023-05-07 09:31:51.263664+00	15	11	14	17
716	2023-05-07 09:31:51.263664+00	16	13	16	17
717	2023-05-07 09:31:51.263664+00	17	15	17	17
718	2023-05-07 09:31:51.263664+00	18	1	4	17
719	2023-05-07 09:31:51.263664+00	19	2	6	17
720	2023-05-07 09:31:51.263664+00	20	3	8	17
721	2023-05-07 09:31:51.263664+00	21	5	10	17
722	2023-05-07 09:31:51.263664+00	22	7	12	17
723	2023-05-07 09:31:51.263664+00	23	9	14	17
724	2023-05-07 09:31:51.263664+00	24	11	16	17
725	2023-05-07 09:31:51.263664+00	25	13	17	17
726	2023-05-07 09:31:51.263664+00	26	1	15	17
727	2023-05-07 09:31:51.263664+00	27	4	6	17
728	2023-05-07 09:31:51.263664+00	28	2	8	17
729	2023-05-07 09:31:51.263664+00	29	3	10	17
730	2023-05-07 09:31:51.263664+00	30	5	12	17
731	2023-05-07 09:31:51.263664+00	31	7	14	17
732	2023-05-07 09:31:51.263664+00	32	9	16	17
733	2023-05-07 09:31:51.263664+00	33	11	17	17
734	2023-05-07 09:31:51.263664+00	34	13	15	17
735	2023-05-07 09:31:51.263664+00	35	1	6	17
736	2023-05-07 09:31:51.263664+00	36	4	8	17
737	2023-05-07 09:31:51.263664+00	37	2	10	17
738	2023-05-07 09:31:51.263664+00	38	3	12	17
739	2023-05-07 09:31:51.263664+00	39	5	14	17
740	2023-05-07 09:31:51.263664+00	40	7	16	17
741	2023-05-07 09:31:51.263664+00	41	9	17	17
742	2023-05-07 09:31:51.263664+00	42	11	15	17
743	2023-05-07 09:31:51.263664+00	43	1	13	17
744	2023-05-07 09:31:51.263664+00	44	6	8	17
745	2023-05-07 09:31:51.263664+00	45	4	10	17
746	2023-05-07 09:31:51.263664+00	46	2	12	17
747	2023-05-07 09:31:51.263664+00	47	3	14	17
748	2023-05-07 09:31:51.263664+00	48	5	16	17
749	2023-05-07 09:31:51.263664+00	49	7	17	17
750	2023-05-07 09:31:51.263664+00	50	9	15	17
751	2023-05-07 09:31:51.263664+00	51	11	13	17
752	2023-05-07 09:31:51.263664+00	52	1	8	17
753	2023-05-07 09:31:51.263664+00	53	6	10	17
754	2023-05-07 09:31:51.263664+00	54	4	12	17
755	2023-05-07 09:31:51.263664+00	55	2	14	17
756	2023-05-07 09:31:51.263664+00	56	3	16	17
757	2023-05-07 09:31:51.263664+00	57	5	17	17
758	2023-05-07 09:31:51.263664+00	58	7	15	17
759	2023-05-07 09:31:51.263664+00	59	9	13	17
760	2023-05-07 09:31:51.263664+00	60	1	11	17
761	2023-05-07 09:31:51.263664+00	61	8	10	17
762	2023-05-07 09:31:51.263664+00	62	6	12	17
763	2023-05-07 09:31:51.263664+00	63	4	14	17
764	2023-05-07 09:31:51.263664+00	64	2	16	17
765	2023-05-07 09:31:51.263664+00	65	3	17	17
766	2023-05-07 09:31:51.263664+00	66	5	15	17
767	2023-05-07 09:31:51.263664+00	67	7	13	17
768	2023-05-07 09:31:51.263664+00	68	9	11	17
769	2023-05-07 09:31:51.263664+00	69	1	10	17
770	2023-05-07 09:31:51.263664+00	70	8	12	17
771	2023-05-07 09:31:51.263664+00	71	6	14	17
772	2023-05-07 09:31:51.263664+00	72	4	16	17
773	2023-05-07 09:31:51.263664+00	73	2	17	17
774	2023-05-07 09:31:51.263664+00	74	3	15	17
775	2023-05-07 09:31:51.263664+00	75	5	13	17
776	2023-05-07 09:31:51.263664+00	76	7	11	17
777	2023-05-07 09:31:51.263664+00	77	1	9	17
778	2023-05-07 09:31:51.263664+00	78	10	12	17
779	2023-05-07 09:31:51.263664+00	79	8	14	17
780	2023-05-07 09:31:51.263664+00	80	6	16	17
781	2023-05-07 09:31:51.263664+00	81	4	17	17
782	2023-05-07 09:31:51.263664+00	82	2	15	17
783	2023-05-07 09:31:51.263664+00	83	3	13	17
784	2023-05-07 09:31:51.263664+00	84	5	11	17
785	2023-05-07 09:31:51.263664+00	85	7	9	17
786	2023-05-07 09:31:51.263664+00	86	1	12	17
787	2023-05-07 09:31:51.263664+00	87	10	14	17
788	2023-05-07 09:31:51.263664+00	88	8	16	17
789	2023-05-07 09:31:51.263664+00	89	6	17	17
790	2023-05-07 09:31:51.263664+00	90	4	15	17
791	2023-05-07 09:31:51.263664+00	91	2	13	17
792	2023-05-07 09:31:51.263664+00	92	3	11	17
793	2023-05-07 09:31:51.263664+00	93	5	9	17
794	2023-05-07 09:31:51.263664+00	94	1	7	17
795	2023-05-07 09:31:51.263664+00	95	12	14	17
796	2023-05-07 09:31:51.263664+00	96	10	16	17
797	2023-05-07 09:31:51.263664+00	97	8	17	17
798	2023-05-07 09:31:51.263664+00	98	6	15	17
799	2023-05-07 09:31:51.263664+00	99	4	13	17
800	2023-05-07 09:31:51.263664+00	100	2	11	17
801	2023-05-07 09:31:51.263664+00	101	3	9	17
802	2023-05-07 09:31:51.263664+00	102	5	7	17
803	2023-05-07 09:31:51.263664+00	103	1	14	17
804	2023-05-07 09:31:51.263664+00	104	12	16	17
805	2023-05-07 09:31:51.263664+00	105	10	17	17
806	2023-05-07 09:31:51.263664+00	106	8	15	17
807	2023-05-07 09:31:51.263664+00	107	6	13	17
808	2023-05-07 09:31:51.263664+00	108	4	11	17
809	2023-05-07 09:31:51.263664+00	109	2	9	17
810	2023-05-07 09:31:51.263664+00	110	3	7	17
811	2023-05-07 09:31:51.263664+00	111	1	5	17
812	2023-05-07 09:31:51.263664+00	112	14	16	17
813	2023-05-07 09:31:51.263664+00	113	12	17	17
814	2023-05-07 09:31:51.263664+00	114	10	15	17
815	2023-05-07 09:31:51.263664+00	115	8	13	17
816	2023-05-07 09:31:51.263664+00	116	6	11	17
817	2023-05-07 09:31:51.263664+00	117	4	9	17
818	2023-05-07 09:31:51.263664+00	118	2	7	17
819	2023-05-07 09:31:51.263664+00	119	3	5	17
820	2023-05-07 09:31:51.263664+00	120	1	16	17
821	2023-05-07 09:31:51.263664+00	121	14	17	17
822	2023-05-07 09:31:51.263664+00	122	12	15	17
823	2023-05-07 09:31:51.263664+00	123	10	13	17
824	2023-05-07 09:31:51.263664+00	124	8	11	17
825	2023-05-07 09:31:51.263664+00	125	6	9	17
826	2023-05-07 09:31:51.263664+00	126	4	7	17
827	2023-05-07 09:31:51.263664+00	127	2	5	17
828	2023-05-07 09:31:51.263664+00	128	1	3	17
829	2023-05-07 09:31:51.263664+00	129	16	17	17
830	2023-05-07 09:31:51.263664+00	130	14	15	17
831	2023-05-07 09:31:51.263664+00	131	12	13	17
832	2023-05-07 09:31:51.263664+00	132	10	11	17
833	2023-05-07 09:31:51.263664+00	133	8	9	17
834	2023-05-07 09:31:51.263664+00	134	6	7	17
835	2023-05-07 09:31:51.263664+00	135	4	5	17
836	2023-05-07 09:31:51.263664+00	136	2	3	17
837	2023-05-07 09:31:51.263664+00	1	1	2	18
838	2023-05-07 09:31:51.263664+00	2	3	4	18
839	2023-05-07 09:31:51.263664+00	3	5	6	18
840	2023-05-07 09:31:51.263664+00	4	7	8	18
841	2023-05-07 09:31:51.263664+00	5	9	10	18
842	2023-05-07 09:31:51.263664+00	6	11	12	18
843	2023-05-07 09:31:51.263664+00	7	13	14	18
844	2023-05-07 09:31:51.263664+00	8	15	16	18
845	2023-05-07 09:31:51.263664+00	9	17	18	18
846	2023-05-07 09:31:51.263664+00	10	1	4	18
847	2023-05-07 09:31:51.263664+00	11	2	6	18
848	2023-05-07 09:31:51.263664+00	12	3	8	18
849	2023-05-07 09:31:51.263664+00	13	5	10	18
850	2023-05-07 09:31:51.263664+00	14	7	12	18
851	2023-05-07 09:31:51.263664+00	15	9	14	18
852	2023-05-07 09:31:51.263664+00	16	11	16	18
853	2023-05-07 09:31:51.263664+00	17	13	18	18
854	2023-05-07 09:31:51.263664+00	18	15	17	18
855	2023-05-07 09:31:51.263664+00	19	1	6	18
856	2023-05-07 09:31:51.263664+00	20	4	8	18
857	2023-05-07 09:31:51.263664+00	21	2	10	18
858	2023-05-07 09:31:51.263664+00	22	3	12	18
859	2023-05-07 09:31:51.263664+00	23	5	14	18
860	2023-05-07 09:31:51.263664+00	24	7	16	18
861	2023-05-07 09:31:51.263664+00	25	9	18	18
862	2023-05-07 09:31:51.263664+00	26	11	17	18
863	2023-05-07 09:31:51.263664+00	27	13	15	18
864	2023-05-07 09:31:51.263664+00	28	1	8	18
865	2023-05-07 09:31:51.263664+00	29	6	10	18
866	2023-05-07 09:31:51.263664+00	30	4	12	18
867	2023-05-07 09:31:51.263664+00	31	2	14	18
868	2023-05-07 09:31:51.263664+00	32	3	16	18
869	2023-05-07 09:31:51.263664+00	33	5	18	18
870	2023-05-07 09:31:51.263664+00	34	7	17	18
871	2023-05-07 09:31:51.263664+00	35	9	15	18
872	2023-05-07 09:31:51.263664+00	36	11	13	18
873	2023-05-07 09:31:51.263664+00	37	1	10	18
874	2023-05-07 09:31:51.263664+00	38	8	12	18
875	2023-05-07 09:31:51.263664+00	39	6	14	18
876	2023-05-07 09:31:51.263664+00	40	4	16	18
877	2023-05-07 09:31:51.263664+00	41	2	18	18
878	2023-05-07 09:31:51.263664+00	42	3	17	18
879	2023-05-07 09:31:51.263664+00	43	5	15	18
880	2023-05-07 09:31:51.263664+00	44	7	13	18
881	2023-05-07 09:31:51.263664+00	45	9	11	18
882	2023-05-07 09:31:51.263664+00	46	1	12	18
883	2023-05-07 09:31:51.263664+00	47	10	14	18
884	2023-05-07 09:31:51.263664+00	48	8	16	18
885	2023-05-07 09:31:51.263664+00	49	6	18	18
886	2023-05-07 09:31:51.263664+00	50	4	17	18
887	2023-05-07 09:31:51.263664+00	51	2	15	18
888	2023-05-07 09:31:51.263664+00	52	3	13	18
889	2023-05-07 09:31:51.263664+00	53	5	11	18
890	2023-05-07 09:31:51.263664+00	54	7	9	18
891	2023-05-07 09:31:51.263664+00	55	1	14	18
892	2023-05-07 09:31:51.263664+00	56	12	16	18
893	2023-05-07 09:31:51.263664+00	57	10	18	18
894	2023-05-07 09:31:51.263664+00	58	8	17	18
895	2023-05-07 09:31:51.263664+00	59	6	15	18
896	2023-05-07 09:31:51.263664+00	60	4	13	18
897	2023-05-07 09:31:51.263664+00	61	2	11	18
898	2023-05-07 09:31:51.263664+00	62	3	9	18
899	2023-05-07 09:31:51.263664+00	63	5	7	18
900	2023-05-07 09:31:51.263664+00	64	1	16	18
901	2023-05-07 09:31:51.263664+00	65	14	18	18
902	2023-05-07 09:31:51.263664+00	66	12	17	18
903	2023-05-07 09:31:51.263664+00	67	10	15	18
904	2023-05-07 09:31:51.263664+00	68	8	13	18
905	2023-05-07 09:31:51.263664+00	69	6	11	18
906	2023-05-07 09:31:51.263664+00	70	4	9	18
907	2023-05-07 09:31:51.263664+00	71	2	7	18
908	2023-05-07 09:31:51.263664+00	72	3	5	18
909	2023-05-07 09:31:51.263664+00	73	1	18	18
910	2023-05-07 09:31:51.263664+00	74	16	17	18
911	2023-05-07 09:31:51.263664+00	75	14	15	18
912	2023-05-07 09:31:51.263664+00	76	12	13	18
913	2023-05-07 09:31:51.263664+00	77	10	11	18
914	2023-05-07 09:31:51.263664+00	78	8	9	18
915	2023-05-07 09:31:51.263664+00	79	6	7	18
916	2023-05-07 09:31:51.263664+00	80	4	5	18
917	2023-05-07 09:31:51.263664+00	81	2	3	18
918	2023-05-07 09:31:51.263664+00	82	1	17	18
919	2023-05-07 09:31:51.263664+00	83	18	15	18
920	2023-05-07 09:31:51.263664+00	84	16	13	18
921	2023-05-07 09:31:51.263664+00	85	14	11	18
922	2023-05-07 09:31:51.263664+00	86	12	9	18
923	2023-05-07 09:31:51.263664+00	87	10	7	18
924	2023-05-07 09:31:51.263664+00	88	8	5	18
925	2023-05-07 09:31:51.263664+00	89	6	3	18
926	2023-05-07 09:31:51.263664+00	90	4	2	18
927	2023-05-07 09:31:51.263664+00	91	1	15	18
928	2023-05-07 09:31:51.263664+00	92	17	13	18
929	2023-05-07 09:31:51.263664+00	93	18	11	18
930	2023-05-07 09:31:51.263664+00	94	16	9	18
931	2023-05-07 09:31:51.263664+00	95	14	7	18
932	2023-05-07 09:31:51.263664+00	96	12	5	18
933	2023-05-07 09:31:51.263664+00	97	10	3	18
934	2023-05-07 09:31:51.263664+00	98	8	2	18
935	2023-05-07 09:31:51.263664+00	99	6	4	18
936	2023-05-07 09:31:51.263664+00	100	1	13	18
937	2023-05-07 09:31:51.263664+00	101	15	11	18
938	2023-05-07 09:31:51.263664+00	102	17	9	18
939	2023-05-07 09:31:51.263664+00	103	18	7	18
940	2023-05-07 09:31:51.263664+00	104	16	5	18
941	2023-05-07 09:31:51.263664+00	105	14	3	18
942	2023-05-07 09:31:51.263664+00	106	12	2	18
943	2023-05-07 09:31:51.263664+00	107	10	4	18
944	2023-05-07 09:31:51.263664+00	108	8	6	18
945	2023-05-07 09:31:51.263664+00	109	1	11	18
946	2023-05-07 09:31:51.263664+00	110	13	9	18
947	2023-05-07 09:31:51.263664+00	111	15	7	18
948	2023-05-07 09:31:51.263664+00	112	17	5	18
949	2023-05-07 09:31:51.263664+00	113	18	3	18
950	2023-05-07 09:31:51.263664+00	114	16	2	18
951	2023-05-07 09:31:51.263664+00	115	14	4	18
952	2023-05-07 09:31:51.263664+00	116	12	6	18
953	2023-05-07 09:31:51.263664+00	117	10	8	18
954	2023-05-07 09:31:51.263664+00	118	1	9	18
955	2023-05-07 09:31:51.263664+00	119	11	7	18
956	2023-05-07 09:31:51.263664+00	120	13	5	18
957	2023-05-07 09:31:51.263664+00	121	15	3	18
958	2023-05-07 09:31:51.263664+00	122	17	2	18
959	2023-05-07 09:31:51.263664+00	123	18	4	18
960	2023-05-07 09:31:51.263664+00	124	16	6	18
961	2023-05-07 09:31:51.263664+00	125	14	8	18
962	2023-05-07 09:31:51.263664+00	126	12	10	18
963	2023-05-07 09:31:51.263664+00	127	1	7	18
964	2023-05-07 09:31:51.263664+00	128	9	5	18
965	2023-05-07 09:31:51.263664+00	129	11	3	18
966	2023-05-07 09:31:51.263664+00	130	13	2	18
967	2023-05-07 09:31:51.263664+00	131	15	4	18
968	2023-05-07 09:31:51.263664+00	132	17	6	18
969	2023-05-07 09:31:51.263664+00	133	18	8	18
970	2023-05-07 09:31:51.263664+00	134	16	10	18
971	2023-05-07 09:31:51.263664+00	135	14	12	18
972	2023-05-07 09:31:51.263664+00	136	1	5	18
973	2023-05-07 09:31:51.263664+00	137	7	3	18
974	2023-05-07 09:31:51.263664+00	138	9	2	18
975	2023-05-07 09:31:51.263664+00	139	11	4	18
976	2023-05-07 09:31:51.263664+00	140	13	6	18
977	2023-05-07 09:31:51.263664+00	141	15	8	18
978	2023-05-07 09:31:51.263664+00	142	17	10	18
979	2023-05-07 09:31:51.263664+00	143	18	12	18
980	2023-05-07 09:31:51.263664+00	144	16	14	18
981	2023-05-07 09:31:51.263664+00	145	1	3	18
982	2023-05-07 09:31:51.263664+00	146	5	2	18
983	2023-05-07 09:31:51.263664+00	147	7	4	18
984	2023-05-07 09:31:51.263664+00	148	9	6	18
985	2023-05-07 09:31:51.263664+00	149	11	8	18
986	2023-05-07 09:31:51.263664+00	150	13	10	18
987	2023-05-07 09:31:51.263664+00	151	15	12	18
988	2023-05-07 09:31:51.263664+00	152	17	14	18
989	2023-05-07 09:31:51.263664+00	153	18	16	18
990	2023-05-07 09:31:51.263664+00	1	1	2	19
991	2023-05-07 09:31:51.263664+00	2	3	4	19
992	2023-05-07 09:31:51.263664+00	3	5	6	19
993	2023-05-07 09:31:51.263664+00	4	7	8	19
994	2023-05-07 09:31:51.263664+00	5	9	10	19
995	2023-05-07 09:31:51.263664+00	6	11	12	19
996	2023-05-07 09:31:51.263664+00	7	13	14	19
997	2023-05-07 09:31:51.263664+00	8	15	16	19
998	2023-05-07 09:31:51.263664+00	9	17	18	19
999	2023-05-07 09:31:51.263664+00	10	1	19	19
1000	2023-05-07 09:31:51.263664+00	11	2	4	19
1001	2023-05-07 09:31:51.263664+00	12	3	6	19
1002	2023-05-07 09:31:51.263664+00	13	5	8	19
1003	2023-05-07 09:31:51.263664+00	14	7	10	19
1004	2023-05-07 09:31:51.263664+00	15	9	12	19
1005	2023-05-07 09:31:51.263664+00	16	11	14	19
1006	2023-05-07 09:31:51.263664+00	17	13	16	19
1007	2023-05-07 09:31:51.263664+00	18	15	18	19
1008	2023-05-07 09:31:51.263664+00	19	17	19	19
1009	2023-05-07 09:31:51.263664+00	20	1	4	19
1010	2023-05-07 09:31:51.263664+00	21	2	6	19
1011	2023-05-07 09:31:51.263664+00	22	3	8	19
1012	2023-05-07 09:31:51.263664+00	23	5	10	19
1013	2023-05-07 09:31:51.263664+00	24	7	12	19
1014	2023-05-07 09:31:51.263664+00	25	9	14	19
1015	2023-05-07 09:31:51.263664+00	26	11	16	19
1016	2023-05-07 09:31:51.263664+00	27	13	18	19
1017	2023-05-07 09:31:51.263664+00	28	15	19	19
1018	2023-05-07 09:31:51.263664+00	29	1	17	19
1019	2023-05-07 09:31:51.263664+00	30	4	6	19
1020	2023-05-07 09:31:51.263664+00	31	2	8	19
1021	2023-05-07 09:31:51.263664+00	32	3	10	19
1022	2023-05-07 09:31:51.263664+00	33	5	12	19
1023	2023-05-07 09:31:51.263664+00	34	7	14	19
1024	2023-05-07 09:31:51.263664+00	35	9	16	19
1025	2023-05-07 09:31:51.263664+00	36	11	18	19
1026	2023-05-07 09:31:51.263664+00	37	13	19	19
1027	2023-05-07 09:31:51.263664+00	38	15	17	19
1028	2023-05-07 09:31:51.263664+00	39	1	6	19
1029	2023-05-07 09:31:51.263664+00	40	4	8	19
1030	2023-05-07 09:31:51.263664+00	41	2	10	19
1031	2023-05-07 09:31:51.263664+00	42	3	12	19
1032	2023-05-07 09:31:51.263664+00	43	5	14	19
1033	2023-05-07 09:31:51.263664+00	44	7	16	19
1034	2023-05-07 09:31:51.263664+00	45	9	18	19
1035	2023-05-07 09:31:51.263664+00	46	11	19	19
1036	2023-05-07 09:31:51.263664+00	47	13	17	19
1037	2023-05-07 09:31:51.263664+00	48	1	15	19
1038	2023-05-07 09:31:51.263664+00	49	6	8	19
1039	2023-05-07 09:31:51.263664+00	50	4	10	19
1040	2023-05-07 09:31:51.263664+00	51	2	12	19
1041	2023-05-07 09:31:51.263664+00	52	3	14	19
1042	2023-05-07 09:31:51.263664+00	53	5	16	19
1043	2023-05-07 09:31:51.263664+00	54	7	18	19
1044	2023-05-07 09:31:51.263664+00	55	9	19	19
1045	2023-05-07 09:31:51.263664+00	56	11	17	19
1046	2023-05-07 09:31:51.263664+00	57	13	15	19
1047	2023-05-07 09:31:51.263664+00	58	1	8	19
1048	2023-05-07 09:31:51.263664+00	59	6	10	19
1049	2023-05-07 09:31:51.263664+00	60	4	12	19
1050	2023-05-07 09:31:51.263664+00	61	2	14	19
1051	2023-05-07 09:31:51.263664+00	62	3	16	19
1052	2023-05-07 09:31:51.263664+00	63	5	18	19
1053	2023-05-07 09:31:51.263664+00	64	7	19	19
1054	2023-05-07 09:31:51.263664+00	65	9	17	19
1055	2023-05-07 09:31:51.263664+00	66	11	15	19
1056	2023-05-07 09:31:51.263664+00	67	1	13	19
1057	2023-05-07 09:31:51.263664+00	68	8	10	19
1058	2023-05-07 09:31:51.263664+00	69	6	12	19
1059	2023-05-07 09:31:51.263664+00	70	4	14	19
1060	2023-05-07 09:31:51.263664+00	71	2	16	19
1061	2023-05-07 09:31:51.263664+00	72	3	18	19
1062	2023-05-07 09:31:51.263664+00	73	5	19	19
1063	2023-05-07 09:31:51.263664+00	74	7	17	19
1064	2023-05-07 09:31:51.263664+00	75	9	15	19
1065	2023-05-07 09:31:51.263664+00	76	11	13	19
1066	2023-05-07 09:31:51.263664+00	77	1	10	19
1067	2023-05-07 09:31:51.263664+00	78	8	12	19
1068	2023-05-07 09:31:51.263664+00	79	6	14	19
1069	2023-05-07 09:31:51.263664+00	80	4	16	19
1070	2023-05-07 09:31:51.263664+00	81	2	18	19
1071	2023-05-07 09:31:51.263664+00	82	3	19	19
1072	2023-05-07 09:31:51.263664+00	83	5	17	19
1073	2023-05-07 09:31:51.263664+00	84	7	15	19
1074	2023-05-07 09:31:51.263664+00	85	9	13	19
1075	2023-05-07 09:31:51.263664+00	86	1	11	19
1076	2023-05-07 09:31:51.263664+00	87	10	12	19
1077	2023-05-07 09:31:51.263664+00	88	8	14	19
1078	2023-05-07 09:31:51.263664+00	89	6	16	19
1079	2023-05-07 09:31:51.263664+00	90	4	18	19
1080	2023-05-07 09:31:51.263664+00	91	2	19	19
1081	2023-05-07 09:31:51.263664+00	92	3	17	19
1082	2023-05-07 09:31:51.263664+00	93	5	15	19
1083	2023-05-07 09:31:51.263664+00	94	7	13	19
1084	2023-05-07 09:31:51.263664+00	95	9	11	19
1085	2023-05-07 09:31:51.263664+00	96	1	12	19
1086	2023-05-07 09:31:51.263664+00	97	10	14	19
1087	2023-05-07 09:31:51.263664+00	98	8	16	19
1088	2023-05-07 09:31:51.263664+00	99	6	18	19
1089	2023-05-07 09:31:51.263664+00	100	4	19	19
1090	2023-05-07 09:31:51.263664+00	101	2	17	19
1091	2023-05-07 09:31:51.263664+00	102	3	15	19
1092	2023-05-07 09:31:51.263664+00	103	5	13	19
1093	2023-05-07 09:31:51.263664+00	104	7	11	19
1094	2023-05-07 09:31:51.263664+00	105	1	9	19
1095	2023-05-07 09:31:51.263664+00	106	12	14	19
1096	2023-05-07 09:31:51.263664+00	107	10	16	19
1097	2023-05-07 09:31:51.263664+00	108	8	18	19
1098	2023-05-07 09:31:51.263664+00	109	6	19	19
1099	2023-05-07 09:31:51.263664+00	110	4	17	19
1100	2023-05-07 09:31:51.263664+00	111	2	15	19
1101	2023-05-07 09:31:51.263664+00	112	3	13	19
1102	2023-05-07 09:31:51.263664+00	113	5	11	19
1103	2023-05-07 09:31:51.263664+00	114	7	9	19
1104	2023-05-07 09:31:51.263664+00	115	1	14	19
1105	2023-05-07 09:31:51.263664+00	116	12	16	19
1106	2023-05-07 09:31:51.263664+00	117	10	18	19
1107	2023-05-07 09:31:51.263664+00	118	8	19	19
1108	2023-05-07 09:31:51.263664+00	119	6	17	19
1109	2023-05-07 09:31:51.263664+00	120	4	15	19
1110	2023-05-07 09:31:51.263664+00	121	2	13	19
1111	2023-05-07 09:31:51.263664+00	122	3	11	19
1112	2023-05-07 09:31:51.263664+00	123	5	9	19
1113	2023-05-07 09:31:51.263664+00	124	1	7	19
1114	2023-05-07 09:31:51.263664+00	125	14	16	19
1115	2023-05-07 09:31:51.263664+00	126	12	18	19
1116	2023-05-07 09:31:51.263664+00	127	10	19	19
1117	2023-05-07 09:31:51.263664+00	128	8	17	19
1118	2023-05-07 09:31:51.263664+00	129	6	15	19
1119	2023-05-07 09:31:51.263664+00	130	4	13	19
1120	2023-05-07 09:31:51.263664+00	131	2	11	19
1121	2023-05-07 09:31:51.263664+00	132	3	9	19
1122	2023-05-07 09:31:51.263664+00	133	5	7	19
1123	2023-05-07 09:31:51.263664+00	134	1	16	19
1124	2023-05-07 09:31:51.263664+00	135	14	18	19
1125	2023-05-07 09:31:51.263664+00	136	12	19	19
1126	2023-05-07 09:31:51.263664+00	137	10	17	19
1127	2023-05-07 09:31:51.263664+00	138	8	15	19
1128	2023-05-07 09:31:51.263664+00	139	6	13	19
1129	2023-05-07 09:31:51.263664+00	140	4	11	19
1130	2023-05-07 09:31:51.263664+00	141	2	9	19
1131	2023-05-07 09:31:51.263664+00	142	3	7	19
1132	2023-05-07 09:31:51.263664+00	143	1	5	19
1133	2023-05-07 09:31:51.263664+00	144	16	18	19
1134	2023-05-07 09:31:51.263664+00	145	14	19	19
1135	2023-05-07 09:31:51.263664+00	146	12	17	19
1136	2023-05-07 09:31:51.263664+00	147	10	15	19
1137	2023-05-07 09:31:51.263664+00	148	8	13	19
1138	2023-05-07 09:31:51.263664+00	149	6	11	19
1139	2023-05-07 09:31:51.263664+00	150	4	9	19
1140	2023-05-07 09:31:51.263664+00	151	2	7	19
1141	2023-05-07 09:31:51.263664+00	152	3	5	19
1142	2023-05-07 09:31:51.263664+00	153	1	18	19
1143	2023-05-07 09:31:51.263664+00	154	16	19	19
1144	2023-05-07 09:31:51.263664+00	155	14	17	19
1145	2023-05-07 09:31:51.263664+00	156	12	15	19
1146	2023-05-07 09:31:51.263664+00	157	10	13	19
1147	2023-05-07 09:31:51.263664+00	158	8	11	19
1148	2023-05-07 09:31:51.263664+00	159	6	9	19
1149	2023-05-07 09:31:51.263664+00	160	4	7	19
1150	2023-05-07 09:31:51.263664+00	161	2	5	19
1151	2023-05-07 09:31:51.263664+00	162	1	3	19
1152	2023-05-07 09:31:51.263664+00	163	18	19	19
1153	2023-05-07 09:31:51.263664+00	164	16	17	19
1154	2023-05-07 09:31:51.263664+00	165	14	15	19
1155	2023-05-07 09:31:51.263664+00	166	12	13	19
1156	2023-05-07 09:31:51.263664+00	167	10	11	19
1157	2023-05-07 09:31:51.263664+00	168	8	9	19
1158	2023-05-07 09:31:51.263664+00	169	6	7	19
1159	2023-05-07 09:31:51.263664+00	170	4	5	19
1160	2023-05-07 09:31:51.263664+00	171	2	3	19
1161	2023-05-07 09:31:51.263664+00	1	1	2	20
1162	2023-05-07 09:31:51.263664+00	2	3	4	20
1163	2023-05-07 09:31:51.263664+00	3	5	6	20
1164	2023-05-07 09:31:51.263664+00	4	7	8	20
1165	2023-05-07 09:31:51.263664+00	5	9	10	20
1166	2023-05-07 09:31:51.263664+00	6	11	12	20
1167	2023-05-07 09:31:51.263664+00	7	13	14	20
1168	2023-05-07 09:31:51.263664+00	8	15	16	20
1169	2023-05-07 09:31:51.263664+00	9	17	18	20
1170	2023-05-07 09:31:51.263664+00	10	19	20	20
1171	2023-05-07 09:31:51.263664+00	11	1	4	20
1172	2023-05-07 09:31:51.263664+00	12	2	6	20
1173	2023-05-07 09:31:51.263664+00	13	3	8	20
1174	2023-05-07 09:31:51.263664+00	14	5	10	20
1175	2023-05-07 09:31:51.263664+00	15	7	12	20
1176	2023-05-07 09:31:51.263664+00	16	9	14	20
1177	2023-05-07 09:31:51.263664+00	17	11	16	20
1178	2023-05-07 09:31:51.263664+00	18	13	18	20
1179	2023-05-07 09:31:51.263664+00	19	15	20	20
1180	2023-05-07 09:31:51.263664+00	20	17	19	20
1181	2023-05-07 09:31:51.263664+00	21	1	6	20
1182	2023-05-07 09:31:51.263664+00	22	4	8	20
1183	2023-05-07 09:31:51.263664+00	23	2	10	20
1184	2023-05-07 09:31:51.263664+00	24	3	12	20
1185	2023-05-07 09:31:51.263664+00	25	5	14	20
1186	2023-05-07 09:31:51.263664+00	26	7	16	20
1187	2023-05-07 09:31:51.263664+00	27	9	18	20
1188	2023-05-07 09:31:51.263664+00	28	11	20	20
1189	2023-05-07 09:31:51.263664+00	29	13	19	20
1190	2023-05-07 09:31:51.263664+00	30	15	17	20
1191	2023-05-07 09:31:51.263664+00	31	1	8	20
1192	2023-05-07 09:31:51.263664+00	32	6	10	20
1193	2023-05-07 09:31:51.263664+00	33	4	12	20
1194	2023-05-07 09:31:51.263664+00	34	2	14	20
1195	2023-05-07 09:31:51.263664+00	35	3	16	20
1196	2023-05-07 09:31:51.263664+00	36	5	18	20
1197	2023-05-07 09:31:51.263664+00	37	7	20	20
1198	2023-05-07 09:31:51.263664+00	38	9	19	20
1199	2023-05-07 09:31:51.263664+00	39	11	17	20
1200	2023-05-07 09:31:51.263664+00	40	13	15	20
1201	2023-05-07 09:31:51.263664+00	41	1	10	20
1202	2023-05-07 09:31:51.263664+00	42	8	12	20
1203	2023-05-07 09:31:51.263664+00	43	6	14	20
1204	2023-05-07 09:31:51.263664+00	44	4	16	20
1205	2023-05-07 09:31:51.263664+00	45	2	18	20
1206	2023-05-07 09:31:51.263664+00	46	3	20	20
1207	2023-05-07 09:31:51.263664+00	47	5	19	20
1208	2023-05-07 09:31:51.263664+00	48	7	17	20
1209	2023-05-07 09:31:51.263664+00	49	9	15	20
1210	2023-05-07 09:31:51.263664+00	50	11	13	20
1211	2023-05-07 09:31:51.263664+00	51	1	12	20
1212	2023-05-07 09:31:51.263664+00	52	10	14	20
1213	2023-05-07 09:31:51.263664+00	53	8	16	20
1214	2023-05-07 09:31:51.263664+00	54	6	18	20
1215	2023-05-07 09:31:51.263664+00	55	4	20	20
1216	2023-05-07 09:31:51.263664+00	56	2	19	20
1217	2023-05-07 09:31:51.263664+00	57	3	17	20
1218	2023-05-07 09:31:51.263664+00	58	5	15	20
1219	2023-05-07 09:31:51.263664+00	59	7	13	20
1220	2023-05-07 09:31:51.263664+00	60	9	11	20
1221	2023-05-07 09:31:51.263664+00	61	1	14	20
1222	2023-05-07 09:31:51.263664+00	62	12	16	20
1223	2023-05-07 09:31:51.263664+00	63	10	18	20
1224	2023-05-07 09:31:51.263664+00	64	8	20	20
1225	2023-05-07 09:31:51.263664+00	65	6	19	20
1226	2023-05-07 09:31:51.263664+00	66	4	17	20
1227	2023-05-07 09:31:51.263664+00	67	2	15	20
1228	2023-05-07 09:31:51.263664+00	68	3	13	20
1229	2023-05-07 09:31:51.263664+00	69	5	11	20
1230	2023-05-07 09:31:51.263664+00	70	7	9	20
1231	2023-05-07 09:31:51.263664+00	71	1	16	20
1232	2023-05-07 09:31:51.263664+00	72	14	18	20
1233	2023-05-07 09:31:51.263664+00	73	12	20	20
1234	2023-05-07 09:31:51.263664+00	74	10	19	20
1235	2023-05-07 09:31:51.263664+00	75	8	17	20
1236	2023-05-07 09:31:51.263664+00	76	6	15	20
1237	2023-05-07 09:31:51.263664+00	77	4	13	20
1238	2023-05-07 09:31:51.263664+00	78	2	11	20
1239	2023-05-07 09:31:51.263664+00	79	3	9	20
1240	2023-05-07 09:31:51.263664+00	80	5	7	20
1241	2023-05-07 09:31:51.263664+00	81	1	18	20
1242	2023-05-07 09:31:51.263664+00	82	16	20	20
1243	2023-05-07 09:31:51.263664+00	83	14	19	20
1244	2023-05-07 09:31:51.263664+00	84	12	17	20
1245	2023-05-07 09:31:51.263664+00	85	10	15	20
1246	2023-05-07 09:31:51.263664+00	86	8	13	20
1247	2023-05-07 09:31:51.263664+00	87	6	11	20
1248	2023-05-07 09:31:51.263664+00	88	4	9	20
1249	2023-05-07 09:31:51.263664+00	89	2	7	20
1250	2023-05-07 09:31:51.263664+00	90	3	5	20
1251	2023-05-07 09:31:51.263664+00	91	1	20	20
1252	2023-05-07 09:31:51.263664+00	92	18	19	20
1253	2023-05-07 09:31:51.263664+00	93	16	17	20
1254	2023-05-07 09:31:51.263664+00	94	14	15	20
1255	2023-05-07 09:31:51.263664+00	95	12	13	20
1256	2023-05-07 09:31:51.263664+00	96	10	11	20
1257	2023-05-07 09:31:51.263664+00	97	8	9	20
1258	2023-05-07 09:31:51.263664+00	98	6	7	20
1259	2023-05-07 09:31:51.263664+00	99	4	5	20
1260	2023-05-07 09:31:51.263664+00	100	2	3	20
1261	2023-05-07 09:31:51.263664+00	101	1	19	20
1262	2023-05-07 09:31:51.263664+00	102	20	17	20
1263	2023-05-07 09:31:51.263664+00	103	18	15	20
1264	2023-05-07 09:31:51.263664+00	104	16	13	20
1265	2023-05-07 09:31:51.263664+00	105	14	11	20
1266	2023-05-07 09:31:51.263664+00	106	12	9	20
1267	2023-05-07 09:31:51.263664+00	107	10	7	20
1268	2023-05-07 09:31:51.263664+00	108	8	5	20
1269	2023-05-07 09:31:51.263664+00	109	6	3	20
1270	2023-05-07 09:31:51.263664+00	110	4	2	20
1271	2023-05-07 09:31:51.263664+00	111	1	17	20
1272	2023-05-07 09:31:51.263664+00	112	19	15	20
1273	2023-05-07 09:31:51.263664+00	113	20	13	20
1274	2023-05-07 09:31:51.263664+00	114	18	11	20
1275	2023-05-07 09:31:51.263664+00	115	16	9	20
1276	2023-05-07 09:31:51.263664+00	116	14	7	20
1277	2023-05-07 09:31:51.263664+00	117	12	5	20
1278	2023-05-07 09:31:51.263664+00	118	10	3	20
1279	2023-05-07 09:31:51.263664+00	119	8	2	20
1280	2023-05-07 09:31:51.263664+00	120	6	4	20
1281	2023-05-07 09:31:51.263664+00	121	1	15	20
1282	2023-05-07 09:31:51.263664+00	122	17	13	20
1283	2023-05-07 09:31:51.263664+00	123	19	11	20
1284	2023-05-07 09:31:51.263664+00	124	20	9	20
1285	2023-05-07 09:31:51.263664+00	125	18	7	20
1286	2023-05-07 09:31:51.263664+00	126	16	5	20
1287	2023-05-07 09:31:51.263664+00	127	14	3	20
1288	2023-05-07 09:31:51.263664+00	128	12	2	20
1289	2023-05-07 09:31:51.263664+00	129	10	4	20
1290	2023-05-07 09:31:51.263664+00	130	8	6	20
1291	2023-05-07 09:31:51.263664+00	131	1	13	20
1292	2023-05-07 09:31:51.263664+00	132	15	11	20
1293	2023-05-07 09:31:51.263664+00	133	17	9	20
1294	2023-05-07 09:31:51.263664+00	134	19	7	20
1295	2023-05-07 09:31:51.263664+00	135	20	5	20
1296	2023-05-07 09:31:51.263664+00	136	18	3	20
1297	2023-05-07 09:31:51.263664+00	137	16	2	20
1298	2023-05-07 09:31:51.263664+00	138	14	4	20
1299	2023-05-07 09:31:51.263664+00	139	12	6	20
1300	2023-05-07 09:31:51.263664+00	140	10	8	20
1301	2023-05-07 09:31:51.263664+00	141	1	11	20
1302	2023-05-07 09:31:51.263664+00	142	13	9	20
1303	2023-05-07 09:31:51.263664+00	143	15	7	20
1304	2023-05-07 09:31:51.263664+00	144	17	5	20
1305	2023-05-07 09:31:51.263664+00	145	19	3	20
1306	2023-05-07 09:31:51.263664+00	146	20	2	20
1307	2023-05-07 09:31:51.263664+00	147	18	4	20
1308	2023-05-07 09:31:51.263664+00	148	16	6	20
1309	2023-05-07 09:31:51.263664+00	149	14	8	20
1310	2023-05-07 09:31:51.263664+00	150	12	10	20
1311	2023-05-07 09:31:51.263664+00	151	1	9	20
1312	2023-05-07 09:31:51.263664+00	152	11	7	20
1313	2023-05-07 09:31:51.263664+00	153	13	5	20
1314	2023-05-07 09:31:51.263664+00	154	15	3	20
1315	2023-05-07 09:31:51.263664+00	155	17	2	20
1316	2023-05-07 09:31:51.263664+00	156	19	4	20
1317	2023-05-07 09:31:51.263664+00	157	20	6	20
1318	2023-05-07 09:31:51.263664+00	158	18	8	20
1319	2023-05-07 09:31:51.263664+00	159	16	10	20
1320	2023-05-07 09:31:51.263664+00	160	14	12	20
1321	2023-05-07 09:31:51.263664+00	161	1	7	20
1322	2023-05-07 09:31:51.263664+00	162	9	5	20
1323	2023-05-07 09:31:51.263664+00	163	11	3	20
1324	2023-05-07 09:31:51.263664+00	164	13	2	20
1325	2023-05-07 09:31:51.263664+00	165	15	4	20
1326	2023-05-07 09:31:51.263664+00	166	17	6	20
1327	2023-05-07 09:31:51.263664+00	167	19	8	20
1328	2023-05-07 09:31:51.263664+00	168	20	10	20
1329	2023-05-07 09:31:51.263664+00	169	18	12	20
1330	2023-05-07 09:31:51.263664+00	170	16	14	20
1331	2023-05-07 09:31:51.263664+00	171	1	5	20
1332	2023-05-07 09:31:51.263664+00	172	7	3	20
1333	2023-05-07 09:31:51.263664+00	173	9	2	20
1334	2023-05-07 09:31:51.263664+00	174	11	4	20
1335	2023-05-07 09:31:51.263664+00	175	13	6	20
1336	2023-05-07 09:31:51.263664+00	176	15	8	20
1337	2023-05-07 09:31:51.263664+00	177	17	10	20
1338	2023-05-07 09:31:51.263664+00	178	19	12	20
1339	2023-05-07 09:31:51.263664+00	179	20	14	20
1340	2023-05-07 09:31:51.263664+00	180	18	16	20
1341	2023-05-07 09:31:51.263664+00	181	1	3	20
1342	2023-05-07 09:31:51.263664+00	182	5	2	20
1343	2023-05-07 09:31:51.263664+00	183	7	4	20
1344	2023-05-07 09:31:51.263664+00	184	9	6	20
1345	2023-05-07 09:31:51.263664+00	185	11	8	20
1346	2023-05-07 09:31:51.263664+00	186	13	10	20
1347	2023-05-07 09:31:51.263664+00	187	15	12	20
1348	2023-05-07 09:31:51.263664+00	188	17	14	20
1349	2023-05-07 09:31:51.263664+00	189	19	16	20
1350	2023-05-07 09:31:51.263664+00	190	20	18	20
1351	2023-05-07 09:31:51.263664+00	1	1	2	21
1352	2023-05-07 09:31:51.263664+00	2	3	4	21
1353	2023-05-07 09:31:51.263664+00	3	5	6	21
1354	2023-05-07 09:31:51.263664+00	4	7	8	21
1355	2023-05-07 09:31:51.263664+00	5	9	10	21
1356	2023-05-07 09:31:51.263664+00	6	11	12	21
1357	2023-05-07 09:31:51.263664+00	7	13	14	21
1358	2023-05-07 09:31:51.263664+00	8	15	16	21
1359	2023-05-07 09:31:51.263664+00	9	17	18	21
1360	2023-05-07 09:31:51.263664+00	10	19	20	21
1361	2023-05-07 09:31:51.263664+00	11	1	21	21
1362	2023-05-07 09:31:51.263664+00	12	2	4	21
1363	2023-05-07 09:31:51.263664+00	13	3	6	21
1364	2023-05-07 09:31:51.263664+00	14	5	8	21
1365	2023-05-07 09:31:51.263664+00	15	7	10	21
1366	2023-05-07 09:31:51.263664+00	16	9	12	21
1367	2023-05-07 09:31:51.263664+00	17	11	14	21
1368	2023-05-07 09:31:51.263664+00	18	13	16	21
1369	2023-05-07 09:31:51.263664+00	19	15	18	21
1370	2023-05-07 09:31:51.263664+00	20	17	20	21
1371	2023-05-07 09:31:51.263664+00	21	19	21	21
1372	2023-05-07 09:31:51.263664+00	22	1	4	21
1373	2023-05-07 09:31:51.263664+00	23	2	6	21
1374	2023-05-07 09:31:51.263664+00	24	3	8	21
1375	2023-05-07 09:31:51.263664+00	25	5	10	21
1376	2023-05-07 09:31:51.263664+00	26	7	12	21
1377	2023-05-07 09:31:51.263664+00	27	9	14	21
1378	2023-05-07 09:31:51.263664+00	28	11	16	21
1379	2023-05-07 09:31:51.263664+00	29	13	18	21
1380	2023-05-07 09:31:51.263664+00	30	15	20	21
1381	2023-05-07 09:31:51.263664+00	31	17	21	21
1382	2023-05-07 09:31:51.263664+00	32	1	19	21
1383	2023-05-07 09:31:51.263664+00	33	4	6	21
1384	2023-05-07 09:31:51.263664+00	34	2	8	21
1385	2023-05-07 09:31:51.263664+00	35	3	10	21
1386	2023-05-07 09:31:51.263664+00	36	5	12	21
1387	2023-05-07 09:31:51.263664+00	37	7	14	21
1388	2023-05-07 09:31:51.263664+00	38	9	16	21
1389	2023-05-07 09:31:51.263664+00	39	11	18	21
1390	2023-05-07 09:31:51.263664+00	40	13	20	21
1391	2023-05-07 09:31:51.263664+00	41	15	21	21
1392	2023-05-07 09:31:51.263664+00	42	17	19	21
1393	2023-05-07 09:31:51.263664+00	43	1	6	21
1394	2023-05-07 09:31:51.263664+00	44	4	8	21
1395	2023-05-07 09:31:51.263664+00	45	2	10	21
1396	2023-05-07 09:31:51.263664+00	46	3	12	21
1397	2023-05-07 09:31:51.263664+00	47	5	14	21
1398	2023-05-07 09:31:51.263664+00	48	7	16	21
1399	2023-05-07 09:31:51.263664+00	49	9	18	21
1400	2023-05-07 09:31:51.263664+00	50	11	20	21
1401	2023-05-07 09:31:51.263664+00	51	13	21	21
1402	2023-05-07 09:31:51.263664+00	52	15	19	21
1403	2023-05-07 09:31:51.263664+00	53	1	17	21
1404	2023-05-07 09:31:51.263664+00	54	6	8	21
1405	2023-05-07 09:31:51.263664+00	55	4	10	21
1406	2023-05-07 09:31:51.263664+00	56	2	12	21
1407	2023-05-07 09:31:51.263664+00	57	3	14	21
1408	2023-05-07 09:31:51.263664+00	58	5	16	21
1409	2023-05-07 09:31:51.263664+00	59	7	18	21
1410	2023-05-07 09:31:51.263664+00	60	9	20	21
1411	2023-05-07 09:31:51.263664+00	61	11	21	21
1412	2023-05-07 09:31:51.263664+00	62	13	19	21
1413	2023-05-07 09:31:51.263664+00	63	15	17	21
1414	2023-05-07 09:31:51.263664+00	64	1	8	21
1415	2023-05-07 09:31:51.263664+00	65	6	10	21
1416	2023-05-07 09:31:51.263664+00	66	4	12	21
1417	2023-05-07 09:31:51.263664+00	67	2	14	21
1418	2023-05-07 09:31:51.263664+00	68	3	16	21
1419	2023-05-07 09:31:51.263664+00	69	5	18	21
1420	2023-05-07 09:31:51.263664+00	70	7	20	21
1421	2023-05-07 09:31:51.263664+00	71	9	21	21
1422	2023-05-07 09:31:51.263664+00	72	11	19	21
1423	2023-05-07 09:31:51.263664+00	73	13	17	21
1424	2023-05-07 09:31:51.263664+00	74	1	15	21
1425	2023-05-07 09:31:51.263664+00	75	8	10	21
1426	2023-05-07 09:31:51.263664+00	76	6	12	21
1427	2023-05-07 09:31:51.263664+00	77	4	14	21
1428	2023-05-07 09:31:51.263664+00	78	2	16	21
1429	2023-05-07 09:31:51.263664+00	79	3	18	21
1430	2023-05-07 09:31:51.263664+00	80	5	20	21
1431	2023-05-07 09:31:51.263664+00	81	7	21	21
1432	2023-05-07 09:31:51.263664+00	82	9	19	21
1433	2023-05-07 09:31:51.263664+00	83	11	17	21
1434	2023-05-07 09:31:51.263664+00	84	13	15	21
1435	2023-05-07 09:31:51.263664+00	85	1	10	21
1436	2023-05-07 09:31:51.263664+00	86	8	12	21
1437	2023-05-07 09:31:51.263664+00	87	6	14	21
1438	2023-05-07 09:31:51.263664+00	88	4	16	21
1439	2023-05-07 09:31:51.263664+00	89	2	18	21
1440	2023-05-07 09:31:51.263664+00	90	3	20	21
1441	2023-05-07 09:31:51.263664+00	91	5	21	21
1442	2023-05-07 09:31:51.263664+00	92	7	19	21
1443	2023-05-07 09:31:51.263664+00	93	9	17	21
1444	2023-05-07 09:31:51.263664+00	94	11	15	21
1445	2023-05-07 09:31:51.263664+00	95	1	13	21
1446	2023-05-07 09:31:51.263664+00	96	10	12	21
1447	2023-05-07 09:31:51.263664+00	97	8	14	21
1448	2023-05-07 09:31:51.263664+00	98	6	16	21
1449	2023-05-07 09:31:51.263664+00	99	4	18	21
1450	2023-05-07 09:31:51.263664+00	100	2	20	21
1451	2023-05-07 09:31:51.263664+00	101	3	21	21
1452	2023-05-07 09:31:51.263664+00	102	5	19	21
1453	2023-05-07 09:31:51.263664+00	103	7	17	21
1454	2023-05-07 09:31:51.263664+00	104	9	15	21
1455	2023-05-07 09:31:51.263664+00	105	11	13	21
1456	2023-05-07 09:31:51.263664+00	106	1	12	21
1457	2023-05-07 09:31:51.263664+00	107	10	14	21
1458	2023-05-07 09:31:51.263664+00	108	8	16	21
1459	2023-05-07 09:31:51.263664+00	109	6	18	21
1460	2023-05-07 09:31:51.263664+00	110	4	20	21
1461	2023-05-07 09:31:51.263664+00	111	2	21	21
1462	2023-05-07 09:31:51.263664+00	112	3	19	21
1463	2023-05-07 09:31:51.263664+00	113	5	17	21
1464	2023-05-07 09:31:51.263664+00	114	7	15	21
1465	2023-05-07 09:31:51.263664+00	115	9	13	21
1466	2023-05-07 09:31:51.263664+00	116	1	11	21
1467	2023-05-07 09:31:51.263664+00	117	12	14	21
1468	2023-05-07 09:31:51.263664+00	118	10	16	21
1469	2023-05-07 09:31:51.263664+00	119	8	18	21
1470	2023-05-07 09:31:51.263664+00	120	6	20	21
1471	2023-05-07 09:31:51.263664+00	121	4	21	21
1472	2023-05-07 09:31:51.263664+00	122	2	19	21
1473	2023-05-07 09:31:51.263664+00	123	3	17	21
1474	2023-05-07 09:31:51.263664+00	124	5	15	21
1475	2023-05-07 09:31:51.263664+00	125	7	13	21
1476	2023-05-07 09:31:51.263664+00	126	9	11	21
1477	2023-05-07 09:31:51.263664+00	127	1	14	21
1478	2023-05-07 09:31:51.263664+00	128	12	16	21
1479	2023-05-07 09:31:51.263664+00	129	10	18	21
1480	2023-05-07 09:31:51.263664+00	130	8	20	21
1481	2023-05-07 09:31:51.263664+00	131	6	21	21
1482	2023-05-07 09:31:51.263664+00	132	4	19	21
1483	2023-05-07 09:31:51.263664+00	133	2	17	21
1484	2023-05-07 09:31:51.263664+00	134	3	15	21
1485	2023-05-07 09:31:51.263664+00	135	5	13	21
1486	2023-05-07 09:31:51.263664+00	136	7	11	21
1487	2023-05-07 09:31:51.263664+00	137	1	9	21
1488	2023-05-07 09:31:51.263664+00	138	14	16	21
1489	2023-05-07 09:31:51.263664+00	139	12	18	21
1490	2023-05-07 09:31:51.263664+00	140	10	20	21
1491	2023-05-07 09:31:51.263664+00	141	8	21	21
1492	2023-05-07 09:31:51.263664+00	142	6	19	21
1493	2023-05-07 09:31:51.263664+00	143	4	17	21
1494	2023-05-07 09:31:51.263664+00	144	2	15	21
1495	2023-05-07 09:31:51.263664+00	145	3	13	21
1496	2023-05-07 09:31:51.263664+00	146	5	11	21
1497	2023-05-07 09:31:51.263664+00	147	7	9	21
1498	2023-05-07 09:31:51.263664+00	148	1	16	21
1499	2023-05-07 09:31:51.263664+00	149	14	18	21
1500	2023-05-07 09:31:51.263664+00	150	12	20	21
1501	2023-05-07 09:31:51.263664+00	151	10	21	21
1502	2023-05-07 09:31:51.263664+00	152	8	19	21
1503	2023-05-07 09:31:51.263664+00	153	6	17	21
1504	2023-05-07 09:31:51.263664+00	154	4	15	21
1505	2023-05-07 09:31:51.263664+00	155	2	13	21
1506	2023-05-07 09:31:51.263664+00	156	3	11	21
1507	2023-05-07 09:31:51.263664+00	157	5	9	21
1508	2023-05-07 09:31:51.263664+00	158	1	7	21
1509	2023-05-07 09:31:51.263664+00	159	16	18	21
1510	2023-05-07 09:31:51.263664+00	160	14	20	21
1511	2023-05-07 09:31:51.263664+00	161	12	21	21
1512	2023-05-07 09:31:51.263664+00	162	10	19	21
1513	2023-05-07 09:31:51.263664+00	163	8	17	21
1514	2023-05-07 09:31:51.263664+00	164	6	15	21
1515	2023-05-07 09:31:51.263664+00	165	4	13	21
1516	2023-05-07 09:31:51.263664+00	166	2	11	21
1517	2023-05-07 09:31:51.263664+00	167	3	9	21
1518	2023-05-07 09:31:51.263664+00	168	5	7	21
1519	2023-05-07 09:31:51.263664+00	169	1	18	21
1520	2023-05-07 09:31:51.263664+00	170	16	20	21
1521	2023-05-07 09:31:51.263664+00	171	14	21	21
1522	2023-05-07 09:31:51.263664+00	172	12	19	21
1523	2023-05-07 09:31:51.263664+00	173	10	17	21
1524	2023-05-07 09:31:51.263664+00	174	8	15	21
1525	2023-05-07 09:31:51.263664+00	175	6	13	21
1526	2023-05-07 09:31:51.263664+00	176	4	11	21
1527	2023-05-07 09:31:51.263664+00	177	2	9	21
1528	2023-05-07 09:31:51.263664+00	178	3	7	21
1529	2023-05-07 09:31:51.263664+00	179	1	5	21
1530	2023-05-07 09:31:51.263664+00	180	18	20	21
1531	2023-05-07 09:31:51.263664+00	181	16	21	21
1532	2023-05-07 09:31:51.263664+00	182	14	19	21
1533	2023-05-07 09:31:51.263664+00	183	12	17	21
1534	2023-05-07 09:31:51.263664+00	184	10	15	21
1535	2023-05-07 09:31:51.263664+00	185	8	13	21
1536	2023-05-07 09:31:51.263664+00	186	6	11	21
1537	2023-05-07 09:31:51.263664+00	187	4	9	21
1538	2023-05-07 09:31:51.263664+00	188	2	7	21
1539	2023-05-07 09:31:51.263664+00	189	3	5	21
1540	2023-05-07 09:31:51.263664+00	190	1	20	21
1541	2023-05-07 09:31:51.263664+00	191	18	21	21
1542	2023-05-07 09:31:51.263664+00	192	16	19	21
1543	2023-05-07 09:31:51.263664+00	193	14	17	21
1544	2023-05-07 09:31:51.263664+00	194	12	15	21
1545	2023-05-07 09:31:51.263664+00	195	10	13	21
1546	2023-05-07 09:31:51.263664+00	196	8	11	21
1547	2023-05-07 09:31:51.263664+00	197	6	9	21
1548	2023-05-07 09:31:51.263664+00	198	4	7	21
1549	2023-05-07 09:31:51.263664+00	199	2	5	21
1550	2023-05-07 09:31:51.263664+00	200	1	3	21
1551	2023-05-07 09:31:51.263664+00	201	20	21	21
1552	2023-05-07 09:31:51.263664+00	202	18	19	21
1553	2023-05-07 09:31:51.263664+00	203	16	17	21
1554	2023-05-07 09:31:51.263664+00	204	14	15	21
1555	2023-05-07 09:31:51.263664+00	205	12	13	21
1556	2023-05-07 09:31:51.263664+00	206	10	11	21
1557	2023-05-07 09:31:51.263664+00	207	8	9	21
1558	2023-05-07 09:31:51.263664+00	208	6	7	21
1559	2023-05-07 09:31:51.263664+00	209	4	5	21
1560	2023-05-07 09:31:51.263664+00	210	2	3	21
1561	2023-05-07 09:31:51.263664+00	1	1	2	22
1562	2023-05-07 09:31:51.263664+00	2	3	4	22
1563	2023-05-07 09:31:51.263664+00	3	5	6	22
1564	2023-05-07 09:31:51.263664+00	4	7	8	22
1565	2023-05-07 09:31:51.263664+00	5	9	10	22
1566	2023-05-07 09:31:51.263664+00	6	11	12	22
1567	2023-05-07 09:31:51.263664+00	7	13	14	22
1568	2023-05-07 09:31:51.263664+00	8	15	16	22
1569	2023-05-07 09:31:51.263664+00	9	17	18	22
1570	2023-05-07 09:31:51.263664+00	10	19	20	22
1571	2023-05-07 09:31:51.263664+00	11	21	22	22
1572	2023-05-07 09:31:51.263664+00	12	1	4	22
1573	2023-05-07 09:31:51.263664+00	13	2	6	22
1574	2023-05-07 09:31:51.263664+00	14	3	8	22
1575	2023-05-07 09:31:51.263664+00	15	5	10	22
1576	2023-05-07 09:31:51.263664+00	16	7	12	22
1577	2023-05-07 09:31:51.263664+00	17	9	14	22
1578	2023-05-07 09:31:51.263664+00	18	11	16	22
1579	2023-05-07 09:31:51.263664+00	19	13	18	22
1580	2023-05-07 09:31:51.263664+00	20	15	20	22
1581	2023-05-07 09:31:51.263664+00	21	17	22	22
1582	2023-05-07 09:31:51.263664+00	22	19	21	22
1583	2023-05-07 09:31:51.263664+00	23	1	6	22
1584	2023-05-07 09:31:51.263664+00	24	4	8	22
1585	2023-05-07 09:31:51.263664+00	25	2	10	22
1586	2023-05-07 09:31:51.263664+00	26	3	12	22
1587	2023-05-07 09:31:51.263664+00	27	5	14	22
1588	2023-05-07 09:31:51.263664+00	28	7	16	22
1589	2023-05-07 09:31:51.263664+00	29	9	18	22
1590	2023-05-07 09:31:51.263664+00	30	11	20	22
1591	2023-05-07 09:31:51.263664+00	31	13	22	22
1592	2023-05-07 09:31:51.263664+00	32	15	21	22
1593	2023-05-07 09:31:51.263664+00	33	17	19	22
1594	2023-05-07 09:31:51.263664+00	34	1	8	22
1595	2023-05-07 09:31:51.263664+00	35	6	10	22
1596	2023-05-07 09:31:51.263664+00	36	4	12	22
1597	2023-05-07 09:31:51.263664+00	37	2	14	22
1598	2023-05-07 09:31:51.263664+00	38	3	16	22
1599	2023-05-07 09:31:51.263664+00	39	5	18	22
1600	2023-05-07 09:31:51.263664+00	40	7	20	22
1601	2023-05-07 09:31:51.263664+00	41	9	22	22
1602	2023-05-07 09:31:51.263664+00	42	11	21	22
1603	2023-05-07 09:31:51.263664+00	43	13	19	22
1604	2023-05-07 09:31:51.263664+00	44	15	17	22
1605	2023-05-07 09:31:51.263664+00	45	1	10	22
1606	2023-05-07 09:31:51.263664+00	46	8	12	22
1607	2023-05-07 09:31:51.263664+00	47	6	14	22
1608	2023-05-07 09:31:51.263664+00	48	4	16	22
1609	2023-05-07 09:31:51.263664+00	49	2	18	22
1610	2023-05-07 09:31:51.263664+00	50	3	20	22
1611	2023-05-07 09:31:51.263664+00	51	5	22	22
1612	2023-05-07 09:31:51.263664+00	52	7	21	22
1613	2023-05-07 09:31:51.263664+00	53	9	19	22
1614	2023-05-07 09:31:51.263664+00	54	11	17	22
1615	2023-05-07 09:31:51.263664+00	55	13	15	22
1616	2023-05-07 09:31:51.263664+00	56	1	12	22
1617	2023-05-07 09:31:51.263664+00	57	10	14	22
1618	2023-05-07 09:31:51.263664+00	58	8	16	22
1619	2023-05-07 09:31:51.263664+00	59	6	18	22
1620	2023-05-07 09:31:51.263664+00	60	4	20	22
1621	2023-05-07 09:31:51.263664+00	61	2	22	22
1622	2023-05-07 09:31:51.263664+00	62	3	21	22
1623	2023-05-07 09:31:51.263664+00	63	5	19	22
1624	2023-05-07 09:31:51.263664+00	64	7	17	22
1625	2023-05-07 09:31:51.263664+00	65	9	15	22
1626	2023-05-07 09:31:51.263664+00	66	11	13	22
1627	2023-05-07 09:31:51.263664+00	67	1	14	22
1628	2023-05-07 09:31:51.263664+00	68	12	16	22
1629	2023-05-07 09:31:51.263664+00	69	10	18	22
1630	2023-05-07 09:31:51.263664+00	70	8	20	22
1631	2023-05-07 09:31:51.263664+00	71	6	22	22
1632	2023-05-07 09:31:51.263664+00	72	4	21	22
1633	2023-05-07 09:31:51.263664+00	73	2	19	22
1634	2023-05-07 09:31:51.263664+00	74	3	17	22
1635	2023-05-07 09:31:51.263664+00	75	5	15	22
1636	2023-05-07 09:31:51.263664+00	76	7	13	22
1637	2023-05-07 09:31:51.263664+00	77	9	11	22
1638	2023-05-07 09:31:51.263664+00	78	1	16	22
1639	2023-05-07 09:31:51.263664+00	79	14	18	22
1640	2023-05-07 09:31:51.263664+00	80	12	20	22
1641	2023-05-07 09:31:51.263664+00	81	10	22	22
1642	2023-05-07 09:31:51.263664+00	82	8	21	22
1643	2023-05-07 09:31:51.263664+00	83	6	19	22
1644	2023-05-07 09:31:51.263664+00	84	4	17	22
1645	2023-05-07 09:31:51.263664+00	85	2	15	22
1646	2023-05-07 09:31:51.263664+00	86	3	13	22
1647	2023-05-07 09:31:51.263664+00	87	5	11	22
1648	2023-05-07 09:31:51.263664+00	88	7	9	22
1649	2023-05-07 09:31:51.263664+00	89	1	18	22
1650	2023-05-07 09:31:51.263664+00	90	16	20	22
1651	2023-05-07 09:31:51.263664+00	91	14	22	22
1652	2023-05-07 09:31:51.263664+00	92	12	21	22
1653	2023-05-07 09:31:51.263664+00	93	10	19	22
1654	2023-05-07 09:31:51.263664+00	94	8	17	22
1655	2023-05-07 09:31:51.263664+00	95	6	15	22
1656	2023-05-07 09:31:51.263664+00	96	4	13	22
1657	2023-05-07 09:31:51.263664+00	97	2	11	22
1658	2023-05-07 09:31:51.263664+00	98	3	9	22
1659	2023-05-07 09:31:51.263664+00	99	5	7	22
1660	2023-05-07 09:31:51.263664+00	100	1	20	22
1661	2023-05-07 09:31:51.263664+00	101	18	22	22
1662	2023-05-07 09:31:51.263664+00	102	16	21	22
1663	2023-05-07 09:31:51.263664+00	103	14	19	22
1664	2023-05-07 09:31:51.263664+00	104	12	17	22
1665	2023-05-07 09:31:51.263664+00	105	10	15	22
1666	2023-05-07 09:31:51.263664+00	106	8	13	22
1667	2023-05-07 09:31:51.263664+00	107	6	11	22
1668	2023-05-07 09:31:51.263664+00	108	4	9	22
1669	2023-05-07 09:31:51.263664+00	109	2	7	22
1670	2023-05-07 09:31:51.263664+00	110	3	5	22
1671	2023-05-07 09:31:51.263664+00	111	1	22	22
1672	2023-05-07 09:31:51.263664+00	112	20	21	22
1673	2023-05-07 09:31:51.263664+00	113	18	19	22
1674	2023-05-07 09:31:51.263664+00	114	16	17	22
1675	2023-05-07 09:31:51.263664+00	115	14	15	22
1676	2023-05-07 09:31:51.263664+00	116	12	13	22
1677	2023-05-07 09:31:51.263664+00	117	10	11	22
1678	2023-05-07 09:31:51.263664+00	118	8	9	22
1679	2023-05-07 09:31:51.263664+00	119	6	7	22
1680	2023-05-07 09:31:51.263664+00	120	4	5	22
1681	2023-05-07 09:31:51.263664+00	121	2	3	22
1682	2023-05-07 09:31:51.263664+00	122	1	21	22
1683	2023-05-07 09:31:51.263664+00	123	22	19	22
1684	2023-05-07 09:31:51.263664+00	124	20	17	22
1685	2023-05-07 09:31:51.263664+00	125	18	15	22
1686	2023-05-07 09:31:51.263664+00	126	16	13	22
1687	2023-05-07 09:31:51.263664+00	127	14	11	22
1688	2023-05-07 09:31:51.263664+00	128	12	9	22
1689	2023-05-07 09:31:51.263664+00	129	10	7	22
1690	2023-05-07 09:31:51.263664+00	130	8	5	22
1691	2023-05-07 09:31:51.263664+00	131	6	3	22
1692	2023-05-07 09:31:51.263664+00	132	4	2	22
1693	2023-05-07 09:31:51.263664+00	133	1	19	22
1694	2023-05-07 09:31:51.263664+00	134	21	17	22
1695	2023-05-07 09:31:51.263664+00	135	22	15	22
1696	2023-05-07 09:31:51.263664+00	136	20	13	22
1697	2023-05-07 09:31:51.263664+00	137	18	11	22
1698	2023-05-07 09:31:51.263664+00	138	16	9	22
1699	2023-05-07 09:31:51.263664+00	139	14	7	22
1700	2023-05-07 09:31:51.263664+00	140	12	5	22
1701	2023-05-07 09:31:51.263664+00	141	10	3	22
1702	2023-05-07 09:31:51.263664+00	142	8	2	22
1703	2023-05-07 09:31:51.263664+00	143	6	4	22
1704	2023-05-07 09:31:51.263664+00	144	1	17	22
1705	2023-05-07 09:31:51.263664+00	145	19	15	22
1706	2023-05-07 09:31:51.263664+00	146	21	13	22
1707	2023-05-07 09:31:51.263664+00	147	22	11	22
1708	2023-05-07 09:31:51.263664+00	148	20	9	22
1709	2023-05-07 09:31:51.263664+00	149	18	7	22
1710	2023-05-07 09:31:51.263664+00	150	16	5	22
1711	2023-05-07 09:31:51.263664+00	151	14	3	22
1712	2023-05-07 09:31:51.263664+00	152	12	2	22
1713	2023-05-07 09:31:51.263664+00	153	10	4	22
1714	2023-05-07 09:31:51.263664+00	154	8	6	22
1715	2023-05-07 09:31:51.263664+00	155	1	15	22
1716	2023-05-07 09:31:51.263664+00	156	17	13	22
1717	2023-05-07 09:31:51.263664+00	157	19	11	22
1718	2023-05-07 09:31:51.263664+00	158	21	9	22
1719	2023-05-07 09:31:51.263664+00	159	22	7	22
1720	2023-05-07 09:31:51.263664+00	160	20	5	22
1721	2023-05-07 09:31:51.263664+00	161	18	3	22
1722	2023-05-07 09:31:51.263664+00	162	16	2	22
1723	2023-05-07 09:31:51.263664+00	163	14	4	22
1724	2023-05-07 09:31:51.263664+00	164	12	6	22
1725	2023-05-07 09:31:51.263664+00	165	10	8	22
1726	2023-05-07 09:31:51.263664+00	166	1	13	22
1727	2023-05-07 09:31:51.263664+00	167	15	11	22
1728	2023-05-07 09:31:51.263664+00	168	17	9	22
1729	2023-05-07 09:31:51.263664+00	169	19	7	22
1730	2023-05-07 09:31:51.263664+00	170	21	5	22
1731	2023-05-07 09:31:51.263664+00	171	22	3	22
1732	2023-05-07 09:31:51.263664+00	172	20	2	22
1733	2023-05-07 09:31:51.263664+00	173	18	4	22
1734	2023-05-07 09:31:51.263664+00	174	16	6	22
1735	2023-05-07 09:31:51.263664+00	175	14	8	22
1736	2023-05-07 09:31:51.263664+00	176	12	10	22
1737	2023-05-07 09:31:51.263664+00	177	1	11	22
1738	2023-05-07 09:31:51.263664+00	178	13	9	22
1739	2023-05-07 09:31:51.263664+00	179	15	7	22
1740	2023-05-07 09:31:51.263664+00	180	17	5	22
1741	2023-05-07 09:31:51.263664+00	181	19	3	22
1742	2023-05-07 09:31:51.263664+00	182	21	2	22
1743	2023-05-07 09:31:51.263664+00	183	22	4	22
1744	2023-05-07 09:31:51.263664+00	184	20	6	22
1745	2023-05-07 09:31:51.263664+00	185	18	8	22
1746	2023-05-07 09:31:51.263664+00	186	16	10	22
1747	2023-05-07 09:31:51.263664+00	187	14	12	22
1748	2023-05-07 09:31:51.263664+00	188	1	9	22
1749	2023-05-07 09:31:51.263664+00	189	11	7	22
1750	2023-05-07 09:31:51.263664+00	190	13	5	22
1751	2023-05-07 09:31:51.263664+00	191	15	3	22
1752	2023-05-07 09:31:51.263664+00	192	17	2	22
1753	2023-05-07 09:31:51.263664+00	193	19	4	22
1754	2023-05-07 09:31:51.263664+00	194	21	6	22
1755	2023-05-07 09:31:51.263664+00	195	22	8	22
1756	2023-05-07 09:31:51.263664+00	196	20	10	22
1757	2023-05-07 09:31:51.263664+00	197	18	12	22
1758	2023-05-07 09:31:51.263664+00	198	16	14	22
1759	2023-05-07 09:31:51.263664+00	199	1	7	22
1760	2023-05-07 09:31:51.263664+00	200	9	5	22
1761	2023-05-07 09:31:51.263664+00	201	11	3	22
1762	2023-05-07 09:31:51.263664+00	202	13	2	22
1763	2023-05-07 09:31:51.263664+00	203	15	4	22
1764	2023-05-07 09:31:51.263664+00	204	17	6	22
1765	2023-05-07 09:31:51.263664+00	205	19	8	22
1766	2023-05-07 09:31:51.263664+00	206	21	10	22
1767	2023-05-07 09:31:51.263664+00	207	22	12	22
1768	2023-05-07 09:31:51.263664+00	208	20	14	22
1769	2023-05-07 09:31:51.263664+00	209	18	16	22
1770	2023-05-07 09:31:51.263664+00	210	1	5	22
1771	2023-05-07 09:31:51.263664+00	211	7	3	22
1772	2023-05-07 09:31:51.263664+00	212	9	2	22
1773	2023-05-07 09:31:51.263664+00	213	11	4	22
1774	2023-05-07 09:31:51.263664+00	214	13	6	22
1775	2023-05-07 09:31:51.263664+00	215	15	8	22
1776	2023-05-07 09:31:51.263664+00	216	17	10	22
1777	2023-05-07 09:31:51.263664+00	217	19	12	22
1778	2023-05-07 09:31:51.263664+00	218	21	14	22
1779	2023-05-07 09:31:51.263664+00	219	22	16	22
1780	2023-05-07 09:31:51.263664+00	220	20	18	22
1781	2023-05-07 09:31:51.263664+00	221	1	3	22
1782	2023-05-07 09:31:51.263664+00	222	5	2	22
1783	2023-05-07 09:31:51.263664+00	223	7	4	22
1784	2023-05-07 09:31:51.263664+00	224	9	6	22
1785	2023-05-07 09:31:51.263664+00	225	11	8	22
1786	2023-05-07 09:31:51.263664+00	226	13	10	22
1787	2023-05-07 09:31:51.263664+00	227	15	12	22
1788	2023-05-07 09:31:51.263664+00	228	17	14	22
1789	2023-05-07 09:31:51.263664+00	229	19	16	22
1790	2023-05-07 09:31:51.263664+00	230	21	18	22
1791	2023-05-07 09:31:51.263664+00	231	22	20	22
1792	2023-05-07 09:31:51.263664+00	1	1	2	23
1793	2023-05-07 09:31:51.263664+00	2	3	4	23
1794	2023-05-07 09:31:51.263664+00	3	5	6	23
1795	2023-05-07 09:31:51.263664+00	4	7	8	23
1796	2023-05-07 09:31:51.263664+00	5	9	10	23
1797	2023-05-07 09:31:51.263664+00	6	11	12	23
1798	2023-05-07 09:31:51.263664+00	7	13	14	23
1799	2023-05-07 09:31:51.263664+00	8	15	16	23
1800	2023-05-07 09:31:51.263664+00	9	17	18	23
1801	2023-05-07 09:31:51.263664+00	10	19	20	23
1802	2023-05-07 09:31:51.263664+00	11	21	22	23
1803	2023-05-07 09:31:51.263664+00	12	1	23	23
1804	2023-05-07 09:31:51.263664+00	13	2	4	23
1805	2023-05-07 09:31:51.263664+00	14	3	6	23
1806	2023-05-07 09:31:51.263664+00	15	5	8	23
1807	2023-05-07 09:31:51.263664+00	16	7	10	23
1808	2023-05-07 09:31:51.263664+00	17	9	12	23
1809	2023-05-07 09:31:51.263664+00	18	11	14	23
1810	2023-05-07 09:31:51.263664+00	19	13	16	23
1811	2023-05-07 09:31:51.263664+00	20	15	18	23
1812	2023-05-07 09:31:51.263664+00	21	17	20	23
1813	2023-05-07 09:31:51.263664+00	22	19	22	23
1814	2023-05-07 09:31:51.263664+00	23	21	23	23
1815	2023-05-07 09:31:51.263664+00	24	1	4	23
1816	2023-05-07 09:31:51.263664+00	25	2	6	23
1817	2023-05-07 09:31:51.263664+00	26	3	8	23
1818	2023-05-07 09:31:51.263664+00	27	5	10	23
1819	2023-05-07 09:31:51.263664+00	28	7	12	23
1820	2023-05-07 09:31:51.263664+00	29	9	14	23
1821	2023-05-07 09:31:51.263664+00	30	11	16	23
1822	2023-05-07 09:31:51.263664+00	31	13	18	23
1823	2023-05-07 09:31:51.263664+00	32	15	20	23
1824	2023-05-07 09:31:51.263664+00	33	17	22	23
1825	2023-05-07 09:31:51.263664+00	34	19	23	23
1826	2023-05-07 09:31:51.263664+00	35	1	21	23
1827	2023-05-07 09:31:51.263664+00	36	4	6	23
1828	2023-05-07 09:31:51.263664+00	37	2	8	23
1829	2023-05-07 09:31:51.263664+00	38	3	10	23
1830	2023-05-07 09:31:51.263664+00	39	5	12	23
1831	2023-05-07 09:31:51.263664+00	40	7	14	23
1832	2023-05-07 09:31:51.263664+00	41	9	16	23
1833	2023-05-07 09:31:51.263664+00	42	11	18	23
1834	2023-05-07 09:31:51.263664+00	43	13	20	23
1835	2023-05-07 09:31:51.263664+00	44	15	22	23
1836	2023-05-07 09:31:51.263664+00	45	17	23	23
1837	2023-05-07 09:31:51.263664+00	46	19	21	23
1838	2023-05-07 09:31:51.263664+00	47	1	6	23
1839	2023-05-07 09:31:51.263664+00	48	4	8	23
1840	2023-05-07 09:31:51.263664+00	49	2	10	23
1841	2023-05-07 09:31:51.263664+00	50	3	12	23
1842	2023-05-07 09:31:51.263664+00	51	5	14	23
1843	2023-05-07 09:31:51.263664+00	52	7	16	23
1844	2023-05-07 09:31:51.263664+00	53	9	18	23
1845	2023-05-07 09:31:51.263664+00	54	11	20	23
1846	2023-05-07 09:31:51.263664+00	55	13	22	23
1847	2023-05-07 09:31:51.263664+00	56	15	23	23
1848	2023-05-07 09:31:51.263664+00	57	17	21	23
1849	2023-05-07 09:31:51.263664+00	58	1	19	23
1850	2023-05-07 09:31:51.263664+00	59	6	8	23
1851	2023-05-07 09:31:51.263664+00	60	4	10	23
1852	2023-05-07 09:31:51.263664+00	61	2	12	23
1853	2023-05-07 09:31:51.263664+00	62	3	14	23
1854	2023-05-07 09:31:51.263664+00	63	5	16	23
1855	2023-05-07 09:31:51.263664+00	64	7	18	23
1856	2023-05-07 09:31:51.263664+00	65	9	20	23
1857	2023-05-07 09:31:51.263664+00	66	11	22	23
1858	2023-05-07 09:31:51.263664+00	67	13	23	23
1859	2023-05-07 09:31:51.263664+00	68	15	21	23
1860	2023-05-07 09:31:51.263664+00	69	17	19	23
1861	2023-05-07 09:31:51.263664+00	70	1	8	23
1862	2023-05-07 09:31:51.263664+00	71	6	10	23
1863	2023-05-07 09:31:51.263664+00	72	4	12	23
1864	2023-05-07 09:31:51.263664+00	73	2	14	23
1865	2023-05-07 09:31:51.263664+00	74	3	16	23
1866	2023-05-07 09:31:51.263664+00	75	5	18	23
1867	2023-05-07 09:31:51.263664+00	76	7	20	23
1868	2023-05-07 09:31:51.263664+00	77	9	22	23
1869	2023-05-07 09:31:51.263664+00	78	11	23	23
1870	2023-05-07 09:31:51.263664+00	79	13	21	23
1871	2023-05-07 09:31:51.263664+00	80	15	19	23
1872	2023-05-07 09:31:51.263664+00	81	1	17	23
1873	2023-05-07 09:31:51.263664+00	82	8	10	23
1874	2023-05-07 09:31:51.263664+00	83	6	12	23
1875	2023-05-07 09:31:51.263664+00	84	4	14	23
1876	2023-05-07 09:31:51.263664+00	85	2	16	23
1877	2023-05-07 09:31:51.263664+00	86	3	18	23
1878	2023-05-07 09:31:51.263664+00	87	5	20	23
1879	2023-05-07 09:31:51.263664+00	88	7	22	23
1880	2023-05-07 09:31:51.263664+00	89	9	23	23
1881	2023-05-07 09:31:51.263664+00	90	11	21	23
1882	2023-05-07 09:31:51.263664+00	91	13	19	23
1883	2023-05-07 09:31:51.263664+00	92	15	17	23
1884	2023-05-07 09:31:51.263664+00	93	1	10	23
1885	2023-05-07 09:31:51.263664+00	94	8	12	23
1886	2023-05-07 09:31:51.263664+00	95	6	14	23
1887	2023-05-07 09:31:51.263664+00	96	4	16	23
1888	2023-05-07 09:31:51.263664+00	97	2	18	23
1889	2023-05-07 09:31:51.263664+00	98	3	20	23
1890	2023-05-07 09:31:51.263664+00	99	5	22	23
1891	2023-05-07 09:31:51.263664+00	100	7	23	23
1892	2023-05-07 09:31:51.263664+00	101	9	21	23
1893	2023-05-07 09:31:51.263664+00	102	11	19	23
1894	2023-05-07 09:31:51.263664+00	103	13	17	23
1895	2023-05-07 09:31:51.263664+00	104	1	15	23
1896	2023-05-07 09:31:51.263664+00	105	10	12	23
1897	2023-05-07 09:31:51.263664+00	106	8	14	23
1898	2023-05-07 09:31:51.263664+00	107	6	16	23
1899	2023-05-07 09:31:51.263664+00	108	4	18	23
1900	2023-05-07 09:31:51.263664+00	109	2	20	23
1901	2023-05-07 09:31:51.263664+00	110	3	22	23
1902	2023-05-07 09:31:51.263664+00	111	5	23	23
1903	2023-05-07 09:31:51.263664+00	112	7	21	23
1904	2023-05-07 09:31:51.263664+00	113	9	19	23
1905	2023-05-07 09:31:51.263664+00	114	11	17	23
1906	2023-05-07 09:31:51.263664+00	115	13	15	23
1907	2023-05-07 09:31:51.263664+00	116	1	12	23
1908	2023-05-07 09:31:51.263664+00	117	10	14	23
1909	2023-05-07 09:31:51.263664+00	118	8	16	23
1910	2023-05-07 09:31:51.263664+00	119	6	18	23
1911	2023-05-07 09:31:51.263664+00	120	4	20	23
1912	2023-05-07 09:31:51.263664+00	121	2	22	23
1913	2023-05-07 09:31:51.263664+00	122	3	23	23
1914	2023-05-07 09:31:51.263664+00	123	5	21	23
1915	2023-05-07 09:31:51.263664+00	124	7	19	23
1916	2023-05-07 09:31:51.263664+00	125	9	17	23
1917	2023-05-07 09:31:51.263664+00	126	11	15	23
1918	2023-05-07 09:31:51.263664+00	127	1	13	23
1919	2023-05-07 09:31:51.263664+00	128	12	14	23
1920	2023-05-07 09:31:51.263664+00	129	10	16	23
1921	2023-05-07 09:31:51.263664+00	130	8	18	23
1922	2023-05-07 09:31:51.263664+00	131	6	20	23
1923	2023-05-07 09:31:51.263664+00	132	4	22	23
1924	2023-05-07 09:31:51.263664+00	133	2	23	23
1925	2023-05-07 09:31:51.263664+00	134	3	21	23
1926	2023-05-07 09:31:51.263664+00	135	5	19	23
1927	2023-05-07 09:31:51.263664+00	136	7	17	23
1928	2023-05-07 09:31:51.263664+00	137	9	15	23
1929	2023-05-07 09:31:51.263664+00	138	11	13	23
1930	2023-05-07 09:31:51.263664+00	139	1	14	23
1931	2023-05-07 09:31:51.263664+00	140	12	16	23
1932	2023-05-07 09:31:51.263664+00	141	10	18	23
1933	2023-05-07 09:31:51.263664+00	142	8	20	23
1934	2023-05-07 09:31:51.263664+00	143	6	22	23
1935	2023-05-07 09:31:51.263664+00	144	4	23	23
1936	2023-05-07 09:31:51.263664+00	145	2	21	23
1937	2023-05-07 09:31:51.263664+00	146	3	19	23
1938	2023-05-07 09:31:51.263664+00	147	5	17	23
1939	2023-05-07 09:31:51.263664+00	148	7	15	23
1940	2023-05-07 09:31:51.263664+00	149	9	13	23
1941	2023-05-07 09:31:51.263664+00	150	1	11	23
1942	2023-05-07 09:31:51.263664+00	151	14	16	23
1943	2023-05-07 09:31:51.263664+00	152	12	18	23
1944	2023-05-07 09:31:51.263664+00	153	10	20	23
1945	2023-05-07 09:31:51.263664+00	154	8	22	23
1946	2023-05-07 09:31:51.263664+00	155	6	23	23
1947	2023-05-07 09:31:51.263664+00	156	4	21	23
1948	2023-05-07 09:31:51.263664+00	157	2	19	23
1949	2023-05-07 09:31:51.263664+00	158	3	17	23
1950	2023-05-07 09:31:51.263664+00	159	5	15	23
1951	2023-05-07 09:31:51.263664+00	160	7	13	23
1952	2023-05-07 09:31:51.263664+00	161	9	11	23
1953	2023-05-07 09:31:51.263664+00	162	1	16	23
1954	2023-05-07 09:31:51.263664+00	163	14	18	23
1955	2023-05-07 09:31:51.263664+00	164	12	20	23
1956	2023-05-07 09:31:51.263664+00	165	10	22	23
1957	2023-05-07 09:31:51.263664+00	166	8	23	23
1958	2023-05-07 09:31:51.263664+00	167	6	21	23
1959	2023-05-07 09:31:51.263664+00	168	4	19	23
1960	2023-05-07 09:31:51.263664+00	169	2	17	23
1961	2023-05-07 09:31:51.263664+00	170	3	15	23
1962	2023-05-07 09:31:51.263664+00	171	5	13	23
1963	2023-05-07 09:31:51.263664+00	172	7	11	23
1964	2023-05-07 09:31:51.263664+00	173	1	9	23
1965	2023-05-07 09:31:51.263664+00	174	16	18	23
1966	2023-05-07 09:31:51.263664+00	175	14	20	23
1967	2023-05-07 09:31:51.263664+00	176	12	22	23
1968	2023-05-07 09:31:51.263664+00	177	10	23	23
1969	2023-05-07 09:31:51.263664+00	178	8	21	23
1970	2023-05-07 09:31:51.263664+00	179	6	19	23
1971	2023-05-07 09:31:51.263664+00	180	4	17	23
1972	2023-05-07 09:31:51.263664+00	181	2	15	23
1973	2023-05-07 09:31:51.263664+00	182	3	13	23
1974	2023-05-07 09:31:51.263664+00	183	5	11	23
1975	2023-05-07 09:31:51.263664+00	184	7	9	23
1976	2023-05-07 09:31:51.263664+00	185	1	18	23
1977	2023-05-07 09:31:51.263664+00	186	16	20	23
1978	2023-05-07 09:31:51.263664+00	187	14	22	23
1979	2023-05-07 09:31:51.263664+00	188	12	23	23
1980	2023-05-07 09:31:51.263664+00	189	10	21	23
1981	2023-05-07 09:31:51.263664+00	190	8	19	23
1982	2023-05-07 09:31:51.263664+00	191	6	17	23
1983	2023-05-07 09:31:51.263664+00	192	4	15	23
1984	2023-05-07 09:31:51.263664+00	193	2	13	23
1985	2023-05-07 09:31:51.263664+00	194	3	11	23
1986	2023-05-07 09:31:51.263664+00	195	5	9	23
1987	2023-05-07 09:31:51.263664+00	196	1	7	23
1988	2023-05-07 09:31:51.263664+00	197	18	20	23
1989	2023-05-07 09:31:51.263664+00	198	16	22	23
1990	2023-05-07 09:31:51.263664+00	199	14	23	23
1991	2023-05-07 09:31:51.263664+00	200	12	21	23
1992	2023-05-07 09:31:51.263664+00	201	10	19	23
1993	2023-05-07 09:31:51.263664+00	202	8	17	23
1994	2023-05-07 09:31:51.263664+00	203	6	15	23
1995	2023-05-07 09:31:51.263664+00	204	4	13	23
1996	2023-05-07 09:31:51.263664+00	205	2	11	23
1997	2023-05-07 09:31:51.263664+00	206	3	9	23
1998	2023-05-07 09:31:51.263664+00	207	5	7	23
1999	2023-05-07 09:31:51.263664+00	208	1	20	23
2000	2023-05-07 09:31:51.263664+00	209	18	22	23
2001	2023-05-07 09:31:51.263664+00	210	16	23	23
2002	2023-05-07 09:31:51.263664+00	211	14	21	23
2003	2023-05-07 09:31:51.263664+00	212	12	19	23
2004	2023-05-07 09:31:51.263664+00	213	10	17	23
2005	2023-05-07 09:31:51.263664+00	214	8	15	23
2006	2023-05-07 09:31:51.263664+00	215	6	13	23
2007	2023-05-07 09:31:51.263664+00	216	4	11	23
2008	2023-05-07 09:31:51.263664+00	217	2	9	23
2009	2023-05-07 09:31:51.263664+00	218	3	7	23
2010	2023-05-07 09:31:51.263664+00	219	1	5	23
2011	2023-05-07 09:31:51.263664+00	220	20	22	23
2012	2023-05-07 09:31:51.263664+00	221	18	23	23
2013	2023-05-07 09:31:51.263664+00	222	16	21	23
2014	2023-05-07 09:31:51.263664+00	223	14	19	23
2015	2023-05-07 09:31:51.263664+00	224	12	17	23
2016	2023-05-07 09:31:51.263664+00	225	10	15	23
2017	2023-05-07 09:31:51.263664+00	226	8	13	23
2018	2023-05-07 09:31:51.263664+00	227	6	11	23
2019	2023-05-07 09:31:51.263664+00	228	4	9	23
2020	2023-05-07 09:31:51.263664+00	229	2	7	23
2021	2023-05-07 09:31:51.263664+00	230	3	5	23
2022	2023-05-07 09:31:51.263664+00	231	1	22	23
2023	2023-05-07 09:31:51.263664+00	232	20	23	23
2024	2023-05-07 09:31:51.263664+00	233	18	21	23
2025	2023-05-07 09:31:51.263664+00	234	16	19	23
2026	2023-05-07 09:31:51.263664+00	235	14	17	23
2027	2023-05-07 09:31:51.263664+00	236	12	15	23
2028	2023-05-07 09:31:51.263664+00	237	10	13	23
2029	2023-05-07 09:31:51.263664+00	238	8	11	23
2030	2023-05-07 09:31:51.263664+00	239	6	9	23
2031	2023-05-07 09:31:51.263664+00	240	4	7	23
2032	2023-05-07 09:31:51.263664+00	241	2	5	23
2033	2023-05-07 09:31:51.263664+00	242	1	3	23
2034	2023-05-07 09:31:51.263664+00	243	22	23	23
2035	2023-05-07 09:31:51.263664+00	244	20	21	23
2036	2023-05-07 09:31:51.263664+00	245	18	19	23
2037	2023-05-07 09:31:51.263664+00	246	16	17	23
2038	2023-05-07 09:31:51.263664+00	247	14	15	23
2039	2023-05-07 09:31:51.263664+00	248	12	13	23
2040	2023-05-07 09:31:51.263664+00	249	10	11	23
2041	2023-05-07 09:31:51.263664+00	250	8	9	23
2042	2023-05-07 09:31:51.263664+00	251	6	7	23
2043	2023-05-07 09:31:51.263664+00	252	4	5	23
2044	2023-05-07 09:31:51.263664+00	253	2	3	23
2045	2023-05-07 09:31:51.263664+00	1	1	2	24
2046	2023-05-07 09:31:51.263664+00	2	3	4	24
2047	2023-05-07 09:31:51.263664+00	3	5	6	24
2048	2023-05-07 09:31:51.263664+00	4	7	8	24
2049	2023-05-07 09:31:51.263664+00	5	9	10	24
2050	2023-05-07 09:31:51.263664+00	6	11	12	24
2051	2023-05-07 09:31:51.263664+00	7	13	14	24
2052	2023-05-07 09:31:51.263664+00	8	15	16	24
2053	2023-05-07 09:31:51.263664+00	9	17	18	24
2054	2023-05-07 09:31:51.263664+00	10	19	20	24
2055	2023-05-07 09:31:51.263664+00	11	21	22	24
2056	2023-05-07 09:31:51.263664+00	12	23	24	24
2057	2023-05-07 09:31:51.263664+00	13	1	4	24
2058	2023-05-07 09:31:51.263664+00	14	2	6	24
2059	2023-05-07 09:31:51.263664+00	15	3	8	24
2060	2023-05-07 09:31:51.263664+00	16	5	10	24
2061	2023-05-07 09:31:51.263664+00	17	7	12	24
2062	2023-05-07 09:31:51.263664+00	18	9	14	24
2063	2023-05-07 09:31:51.263664+00	19	11	16	24
2064	2023-05-07 09:31:51.263664+00	20	13	18	24
2065	2023-05-07 09:31:51.263664+00	21	15	20	24
2066	2023-05-07 09:31:51.263664+00	22	17	22	24
2067	2023-05-07 09:31:51.263664+00	23	19	24	24
2068	2023-05-07 09:31:51.263664+00	24	21	23	24
2069	2023-05-07 09:31:51.263664+00	25	1	6	24
2070	2023-05-07 09:31:51.263664+00	26	4	8	24
2071	2023-05-07 09:31:51.263664+00	27	2	10	24
2072	2023-05-07 09:31:51.263664+00	28	3	12	24
2073	2023-05-07 09:31:51.263664+00	29	5	14	24
2074	2023-05-07 09:31:51.263664+00	30	7	16	24
2075	2023-05-07 09:31:51.263664+00	31	9	18	24
2076	2023-05-07 09:31:51.263664+00	32	11	20	24
2077	2023-05-07 09:31:51.263664+00	33	13	22	24
2078	2023-05-07 09:31:51.263664+00	34	15	24	24
2079	2023-05-07 09:31:51.263664+00	35	17	23	24
2080	2023-05-07 09:31:51.263664+00	36	19	21	24
2081	2023-05-07 09:31:51.263664+00	37	1	8	24
2082	2023-05-07 09:31:51.263664+00	38	6	10	24
2083	2023-05-07 09:31:51.263664+00	39	4	12	24
2084	2023-05-07 09:31:51.263664+00	40	2	14	24
2085	2023-05-07 09:31:51.263664+00	41	3	16	24
2086	2023-05-07 09:31:51.263664+00	42	5	18	24
2087	2023-05-07 09:31:51.263664+00	43	7	20	24
2088	2023-05-07 09:31:51.263664+00	44	9	22	24
2089	2023-05-07 09:31:51.263664+00	45	11	24	24
2090	2023-05-07 09:31:51.263664+00	46	13	23	24
2091	2023-05-07 09:31:51.263664+00	47	15	21	24
2092	2023-05-07 09:31:51.263664+00	48	17	19	24
2093	2023-05-07 09:31:51.263664+00	49	1	10	24
2094	2023-05-07 09:31:51.263664+00	50	8	12	24
2095	2023-05-07 09:31:51.263664+00	51	6	14	24
2096	2023-05-07 09:31:51.263664+00	52	4	16	24
2097	2023-05-07 09:31:51.263664+00	53	2	18	24
2098	2023-05-07 09:31:51.263664+00	54	3	20	24
2099	2023-05-07 09:31:51.263664+00	55	5	22	24
2100	2023-05-07 09:31:51.263664+00	56	7	24	24
2101	2023-05-07 09:31:51.263664+00	57	9	23	24
2102	2023-05-07 09:31:51.263664+00	58	11	21	24
2103	2023-05-07 09:31:51.263664+00	59	13	19	24
2104	2023-05-07 09:31:51.263664+00	60	15	17	24
2105	2023-05-07 09:31:51.263664+00	61	1	12	24
2106	2023-05-07 09:31:51.263664+00	62	10	14	24
2107	2023-05-07 09:31:51.263664+00	63	8	16	24
2108	2023-05-07 09:31:51.263664+00	64	6	18	24
2109	2023-05-07 09:31:51.263664+00	65	4	20	24
2110	2023-05-07 09:31:51.263664+00	66	2	22	24
2111	2023-05-07 09:31:51.263664+00	67	3	24	24
2112	2023-05-07 09:31:51.263664+00	68	5	23	24
2113	2023-05-07 09:31:51.263664+00	69	7	21	24
2114	2023-05-07 09:31:51.263664+00	70	9	19	24
2115	2023-05-07 09:31:51.263664+00	71	11	17	24
2116	2023-05-07 09:31:51.263664+00	72	13	15	24
2117	2023-05-07 09:31:51.263664+00	73	1	14	24
2118	2023-05-07 09:31:51.263664+00	74	12	16	24
2119	2023-05-07 09:31:51.263664+00	75	10	18	24
2120	2023-05-07 09:31:51.263664+00	76	8	20	24
2121	2023-05-07 09:31:51.263664+00	77	6	22	24
2122	2023-05-07 09:31:51.263664+00	78	4	24	24
2123	2023-05-07 09:31:51.263664+00	79	2	23	24
2124	2023-05-07 09:31:51.263664+00	80	3	21	24
2125	2023-05-07 09:31:51.263664+00	81	5	19	24
2126	2023-05-07 09:31:51.263664+00	82	7	17	24
2127	2023-05-07 09:31:51.263664+00	83	9	15	24
2128	2023-05-07 09:31:51.263664+00	84	11	13	24
2129	2023-05-07 09:31:51.263664+00	85	1	16	24
2130	2023-05-07 09:31:51.263664+00	86	14	18	24
2131	2023-05-07 09:31:51.263664+00	87	12	20	24
2132	2023-05-07 09:31:51.263664+00	88	10	22	24
2133	2023-05-07 09:31:51.263664+00	89	8	24	24
2134	2023-05-07 09:31:51.263664+00	90	6	23	24
2135	2023-05-07 09:31:51.263664+00	91	4	21	24
2136	2023-05-07 09:31:51.263664+00	92	2	19	24
2137	2023-05-07 09:31:51.263664+00	93	3	17	24
2138	2023-05-07 09:31:51.263664+00	94	5	15	24
2139	2023-05-07 09:31:51.263664+00	95	7	13	24
2140	2023-05-07 09:31:51.263664+00	96	9	11	24
2141	2023-05-07 09:31:51.263664+00	97	1	18	24
2142	2023-05-07 09:31:51.263664+00	98	16	20	24
2143	2023-05-07 09:31:51.263664+00	99	14	22	24
2144	2023-05-07 09:31:51.263664+00	100	12	24	24
2145	2023-05-07 09:31:51.263664+00	101	10	23	24
2146	2023-05-07 09:31:51.263664+00	102	8	21	24
2147	2023-05-07 09:31:51.263664+00	103	6	19	24
2148	2023-05-07 09:31:51.263664+00	104	4	17	24
2149	2023-05-07 09:31:51.263664+00	105	2	15	24
2150	2023-05-07 09:31:51.263664+00	106	3	13	24
2151	2023-05-07 09:31:51.263664+00	107	5	11	24
2152	2023-05-07 09:31:51.263664+00	108	7	9	24
2153	2023-05-07 09:31:51.263664+00	109	1	20	24
2154	2023-05-07 09:31:51.263664+00	110	18	22	24
2155	2023-05-07 09:31:51.263664+00	111	16	24	24
2156	2023-05-07 09:31:51.263664+00	112	14	23	24
2157	2023-05-07 09:31:51.263664+00	113	12	21	24
2158	2023-05-07 09:31:51.263664+00	114	10	19	24
2159	2023-05-07 09:31:51.263664+00	115	8	17	24
2160	2023-05-07 09:31:51.263664+00	116	6	15	24
2161	2023-05-07 09:31:51.263664+00	117	4	13	24
2162	2023-05-07 09:31:51.263664+00	118	2	11	24
2163	2023-05-07 09:31:51.263664+00	119	3	9	24
2164	2023-05-07 09:31:51.263664+00	120	5	7	24
2165	2023-05-07 09:31:51.263664+00	121	1	22	24
2166	2023-05-07 09:31:51.263664+00	122	20	24	24
2167	2023-05-07 09:31:51.263664+00	123	18	23	24
2168	2023-05-07 09:31:51.263664+00	124	16	21	24
2169	2023-05-07 09:31:51.263664+00	125	14	19	24
2170	2023-05-07 09:31:51.263664+00	126	12	17	24
2171	2023-05-07 09:31:51.263664+00	127	10	15	24
2172	2023-05-07 09:31:51.263664+00	128	8	13	24
2173	2023-05-07 09:31:51.263664+00	129	6	11	24
2174	2023-05-07 09:31:51.263664+00	130	4	9	24
2175	2023-05-07 09:31:51.263664+00	131	2	7	24
2176	2023-05-07 09:31:51.263664+00	132	3	5	24
2177	2023-05-07 09:31:51.263664+00	133	1	24	24
2178	2023-05-07 09:31:51.263664+00	134	22	23	24
2179	2023-05-07 09:31:51.263664+00	135	20	21	24
2180	2023-05-07 09:31:51.263664+00	136	18	19	24
2181	2023-05-07 09:31:51.263664+00	137	16	17	24
2182	2023-05-07 09:31:51.263664+00	138	14	15	24
2183	2023-05-07 09:31:51.263664+00	139	12	13	24
2184	2023-05-07 09:31:51.263664+00	140	10	11	24
2185	2023-05-07 09:31:51.263664+00	141	8	9	24
2186	2023-05-07 09:31:51.263664+00	142	6	7	24
2187	2023-05-07 09:31:51.263664+00	143	4	5	24
2188	2023-05-07 09:31:51.263664+00	144	2	3	24
2189	2023-05-07 09:31:51.263664+00	145	1	23	24
2190	2023-05-07 09:31:51.263664+00	146	24	21	24
2191	2023-05-07 09:31:51.263664+00	147	22	19	24
2192	2023-05-07 09:31:51.263664+00	148	20	17	24
2193	2023-05-07 09:31:51.263664+00	149	18	15	24
2194	2023-05-07 09:31:51.263664+00	150	16	13	24
2195	2023-05-07 09:31:51.263664+00	151	14	11	24
2196	2023-05-07 09:31:51.263664+00	152	12	9	24
2197	2023-05-07 09:31:51.263664+00	153	10	7	24
2198	2023-05-07 09:31:51.263664+00	154	8	5	24
2199	2023-05-07 09:31:51.263664+00	155	6	3	24
2200	2023-05-07 09:31:51.263664+00	156	4	2	24
2201	2023-05-07 09:31:51.263664+00	157	1	21	24
2202	2023-05-07 09:31:51.263664+00	158	23	19	24
2203	2023-05-07 09:31:51.263664+00	159	24	17	24
2204	2023-05-07 09:31:51.263664+00	160	22	15	24
2205	2023-05-07 09:31:51.263664+00	161	20	13	24
2206	2023-05-07 09:31:51.263664+00	162	18	11	24
2207	2023-05-07 09:31:51.263664+00	163	16	9	24
2208	2023-05-07 09:31:51.263664+00	164	14	7	24
2209	2023-05-07 09:31:51.263664+00	165	12	5	24
2210	2023-05-07 09:31:51.263664+00	166	10	3	24
2211	2023-05-07 09:31:51.263664+00	167	8	2	24
2212	2023-05-07 09:31:51.263664+00	168	6	4	24
2213	2023-05-07 09:31:51.263664+00	169	1	19	24
2214	2023-05-07 09:31:51.263664+00	170	21	17	24
2215	2023-05-07 09:31:51.263664+00	171	23	15	24
2216	2023-05-07 09:31:51.263664+00	172	24	13	24
2217	2023-05-07 09:31:51.263664+00	173	22	11	24
2218	2023-05-07 09:31:51.263664+00	174	20	9	24
2219	2023-05-07 09:31:51.263664+00	175	18	7	24
2220	2023-05-07 09:31:51.263664+00	176	16	5	24
2221	2023-05-07 09:31:51.263664+00	177	14	3	24
2222	2023-05-07 09:31:51.263664+00	178	12	2	24
2223	2023-05-07 09:31:51.263664+00	179	10	4	24
2224	2023-05-07 09:31:51.263664+00	180	8	6	24
2225	2023-05-07 09:31:51.263664+00	181	1	17	24
2226	2023-05-07 09:31:51.263664+00	182	19	15	24
2227	2023-05-07 09:31:51.263664+00	183	21	13	24
2228	2023-05-07 09:31:51.263664+00	184	23	11	24
2229	2023-05-07 09:31:51.263664+00	185	24	9	24
2230	2023-05-07 09:31:51.263664+00	186	22	7	24
2231	2023-05-07 09:31:51.263664+00	187	20	5	24
2232	2023-05-07 09:31:51.263664+00	188	18	3	24
2233	2023-05-07 09:31:51.263664+00	189	16	2	24
2234	2023-05-07 09:31:51.263664+00	190	14	4	24
2235	2023-05-07 09:31:51.263664+00	191	12	6	24
2236	2023-05-07 09:31:51.263664+00	192	10	8	24
2237	2023-05-07 09:31:51.263664+00	193	1	15	24
2238	2023-05-07 09:31:51.263664+00	194	17	13	24
2239	2023-05-07 09:31:51.263664+00	195	19	11	24
2240	2023-05-07 09:31:51.263664+00	196	21	9	24
2241	2023-05-07 09:31:51.263664+00	197	23	7	24
2242	2023-05-07 09:31:51.263664+00	198	24	5	24
2243	2023-05-07 09:31:51.263664+00	199	22	3	24
2244	2023-05-07 09:31:51.263664+00	200	20	2	24
2245	2023-05-07 09:31:51.263664+00	201	18	4	24
2246	2023-05-07 09:31:51.263664+00	202	16	6	24
2247	2023-05-07 09:31:51.263664+00	203	14	8	24
2248	2023-05-07 09:31:51.263664+00	204	12	10	24
2249	2023-05-07 09:31:51.263664+00	205	1	13	24
2250	2023-05-07 09:31:51.263664+00	206	15	11	24
2251	2023-05-07 09:31:51.263664+00	207	17	9	24
2252	2023-05-07 09:31:51.263664+00	208	19	7	24
2253	2023-05-07 09:31:51.263664+00	209	21	5	24
2254	2023-05-07 09:31:51.263664+00	210	23	3	24
2255	2023-05-07 09:31:51.263664+00	211	24	2	24
2256	2023-05-07 09:31:51.263664+00	212	22	4	24
2257	2023-05-07 09:31:51.263664+00	213	20	6	24
2258	2023-05-07 09:31:51.263664+00	214	18	8	24
2259	2023-05-07 09:31:51.263664+00	215	16	10	24
2260	2023-05-07 09:31:51.263664+00	216	14	12	24
2261	2023-05-07 09:31:51.263664+00	217	1	11	24
2262	2023-05-07 09:31:51.263664+00	218	13	9	24
2263	2023-05-07 09:31:51.263664+00	219	15	7	24
2264	2023-05-07 09:31:51.263664+00	220	17	5	24
2265	2023-05-07 09:31:51.263664+00	221	19	3	24
2266	2023-05-07 09:31:51.263664+00	222	21	2	24
2267	2023-05-07 09:31:51.263664+00	223	23	4	24
2268	2023-05-07 09:31:51.263664+00	224	24	6	24
2269	2023-05-07 09:31:51.263664+00	225	22	8	24
2270	2023-05-07 09:31:51.263664+00	226	20	10	24
2271	2023-05-07 09:31:51.263664+00	227	18	12	24
2272	2023-05-07 09:31:51.263664+00	228	16	14	24
2273	2023-05-07 09:31:51.263664+00	229	1	9	24
2274	2023-05-07 09:31:51.263664+00	230	11	7	24
2275	2023-05-07 09:31:51.263664+00	231	13	5	24
2276	2023-05-07 09:31:51.263664+00	232	15	3	24
2277	2023-05-07 09:31:51.263664+00	233	17	2	24
2278	2023-05-07 09:31:51.263664+00	234	19	4	24
2279	2023-05-07 09:31:51.263664+00	235	21	6	24
2280	2023-05-07 09:31:51.263664+00	236	23	8	24
2281	2023-05-07 09:31:51.263664+00	237	24	10	24
2282	2023-05-07 09:31:51.263664+00	238	22	12	24
2283	2023-05-07 09:31:51.263664+00	239	20	14	24
2284	2023-05-07 09:31:51.263664+00	240	18	16	24
2285	2023-05-07 09:31:51.263664+00	241	1	7	24
2286	2023-05-07 09:31:51.263664+00	242	9	5	24
2287	2023-05-07 09:31:51.263664+00	243	11	3	24
2288	2023-05-07 09:31:51.263664+00	244	13	2	24
2289	2023-05-07 09:31:51.263664+00	245	15	4	24
2290	2023-05-07 09:31:51.263664+00	246	17	6	24
2291	2023-05-07 09:31:51.263664+00	247	19	8	24
2292	2023-05-07 09:31:51.263664+00	248	21	10	24
2293	2023-05-07 09:31:51.263664+00	249	23	12	24
2294	2023-05-07 09:31:51.263664+00	250	24	14	24
2295	2023-05-07 09:31:51.263664+00	251	22	16	24
2296	2023-05-07 09:31:51.263664+00	252	20	18	24
2297	2023-05-07 09:31:51.263664+00	253	1	5	24
2298	2023-05-07 09:31:51.263664+00	254	7	3	24
2299	2023-05-07 09:31:51.263664+00	255	9	2	24
2300	2023-05-07 09:31:51.263664+00	256	11	4	24
2301	2023-05-07 09:31:51.263664+00	257	13	6	24
2302	2023-05-07 09:31:51.263664+00	258	15	8	24
2303	2023-05-07 09:31:51.263664+00	259	17	10	24
2304	2023-05-07 09:31:51.263664+00	260	19	12	24
2305	2023-05-07 09:31:51.263664+00	261	21	14	24
2306	2023-05-07 09:31:51.263664+00	262	23	16	24
2307	2023-05-07 09:31:51.263664+00	263	24	18	24
2308	2023-05-07 09:31:51.263664+00	264	22	20	24
2309	2023-05-07 09:31:51.263664+00	265	1	3	24
2310	2023-05-07 09:31:51.263664+00	266	5	2	24
2311	2023-05-07 09:31:51.263664+00	267	7	4	24
2312	2023-05-07 09:31:51.263664+00	268	9	6	24
2313	2023-05-07 09:31:51.263664+00	269	11	8	24
2314	2023-05-07 09:31:51.263664+00	270	13	10	24
2315	2023-05-07 09:31:51.263664+00	271	15	12	24
2316	2023-05-07 09:31:51.263664+00	272	17	14	24
2317	2023-05-07 09:31:51.263664+00	273	19	16	24
2318	2023-05-07 09:31:51.263664+00	274	21	18	24
2319	2023-05-07 09:31:51.263664+00	275	23	20	24
2320	2023-05-07 09:31:51.263664+00	276	24	22	24
2321	2023-05-07 09:31:51.263664+00	1	1	2	25
2322	2023-05-07 09:31:51.263664+00	2	3	4	25
2323	2023-05-07 09:31:51.263664+00	3	5	6	25
2324	2023-05-07 09:31:51.263664+00	4	7	8	25
2325	2023-05-07 09:31:51.263664+00	5	9	10	25
2326	2023-05-07 09:31:51.263664+00	6	11	12	25
2327	2023-05-07 09:31:51.263664+00	7	13	14	25
2328	2023-05-07 09:31:51.263664+00	8	15	16	25
2329	2023-05-07 09:31:51.263664+00	9	17	18	25
2330	2023-05-07 09:31:51.263664+00	10	19	20	25
2331	2023-05-07 09:31:51.263664+00	11	21	22	25
2332	2023-05-07 09:31:51.263664+00	12	23	24	25
2333	2023-05-07 09:31:51.263664+00	13	1	25	25
2334	2023-05-07 09:31:51.263664+00	14	2	4	25
2335	2023-05-07 09:31:51.263664+00	15	3	6	25
2336	2023-05-07 09:31:51.263664+00	16	5	8	25
2337	2023-05-07 09:31:51.263664+00	17	7	10	25
2338	2023-05-07 09:31:51.263664+00	18	9	12	25
2339	2023-05-07 09:31:51.263664+00	19	11	14	25
2340	2023-05-07 09:31:51.263664+00	20	13	16	25
2341	2023-05-07 09:31:51.263664+00	21	15	18	25
2342	2023-05-07 09:31:51.263664+00	22	17	20	25
2343	2023-05-07 09:31:51.263664+00	23	19	22	25
2344	2023-05-07 09:31:51.263664+00	24	21	24	25
2345	2023-05-07 09:31:51.263664+00	25	23	25	25
2346	2023-05-07 09:31:51.263664+00	26	1	4	25
2347	2023-05-07 09:31:51.263664+00	27	2	6	25
2348	2023-05-07 09:31:51.263664+00	28	3	8	25
2349	2023-05-07 09:31:51.263664+00	29	5	10	25
2350	2023-05-07 09:31:51.263664+00	30	7	12	25
2351	2023-05-07 09:31:51.263664+00	31	9	14	25
2352	2023-05-07 09:31:51.263664+00	32	11	16	25
2353	2023-05-07 09:31:51.263664+00	33	13	18	25
2354	2023-05-07 09:31:51.263664+00	34	15	20	25
2355	2023-05-07 09:31:51.263664+00	35	17	22	25
2356	2023-05-07 09:31:51.263664+00	36	19	24	25
2357	2023-05-07 09:31:51.263664+00	37	21	25	25
2358	2023-05-07 09:31:51.263664+00	38	1	23	25
2359	2023-05-07 09:31:51.263664+00	39	4	6	25
2360	2023-05-07 09:31:51.263664+00	40	2	8	25
2361	2023-05-07 09:31:51.263664+00	41	3	10	25
2362	2023-05-07 09:31:51.263664+00	42	5	12	25
2363	2023-05-07 09:31:51.263664+00	43	7	14	25
2364	2023-05-07 09:31:51.263664+00	44	9	16	25
2365	2023-05-07 09:31:51.263664+00	45	11	18	25
2366	2023-05-07 09:31:51.263664+00	46	13	20	25
2367	2023-05-07 09:31:51.263664+00	47	15	22	25
2368	2023-05-07 09:31:51.263664+00	48	17	24	25
2369	2023-05-07 09:31:51.263664+00	49	19	25	25
2370	2023-05-07 09:31:51.263664+00	50	21	23	25
2371	2023-05-07 09:31:51.263664+00	51	1	6	25
2372	2023-05-07 09:31:51.263664+00	52	4	8	25
2373	2023-05-07 09:31:51.263664+00	53	2	10	25
2374	2023-05-07 09:31:51.263664+00	54	3	12	25
2375	2023-05-07 09:31:51.263664+00	55	5	14	25
2376	2023-05-07 09:31:51.263664+00	56	7	16	25
2377	2023-05-07 09:31:51.263664+00	57	9	18	25
2378	2023-05-07 09:31:51.263664+00	58	11	20	25
2379	2023-05-07 09:31:51.263664+00	59	13	22	25
2380	2023-05-07 09:31:51.263664+00	60	15	24	25
2381	2023-05-07 09:31:51.263664+00	61	17	25	25
2382	2023-05-07 09:31:51.263664+00	62	19	23	25
2383	2023-05-07 09:31:51.263664+00	63	1	21	25
2384	2023-05-07 09:31:51.263664+00	64	6	8	25
2385	2023-05-07 09:31:51.263664+00	65	4	10	25
2386	2023-05-07 09:31:51.263664+00	66	2	12	25
2387	2023-05-07 09:31:51.263664+00	67	3	14	25
2388	2023-05-07 09:31:51.263664+00	68	5	16	25
2389	2023-05-07 09:31:51.263664+00	69	7	18	25
2390	2023-05-07 09:31:51.263664+00	70	9	20	25
2391	2023-05-07 09:31:51.263664+00	71	11	22	25
2392	2023-05-07 09:31:51.263664+00	72	13	24	25
2393	2023-05-07 09:31:51.263664+00	73	15	25	25
2394	2023-05-07 09:31:51.263664+00	74	17	23	25
2395	2023-05-07 09:31:51.263664+00	75	19	21	25
2396	2023-05-07 09:31:51.263664+00	76	1	8	25
2397	2023-05-07 09:31:51.263664+00	77	6	10	25
2398	2023-05-07 09:31:51.263664+00	78	4	12	25
2399	2023-05-07 09:31:51.263664+00	79	2	14	25
2400	2023-05-07 09:31:51.263664+00	80	3	16	25
2401	2023-05-07 09:31:51.263664+00	81	5	18	25
2402	2023-05-07 09:31:51.263664+00	82	7	20	25
2403	2023-05-07 09:31:51.263664+00	83	9	22	25
2404	2023-05-07 09:31:51.263664+00	84	11	24	25
2405	2023-05-07 09:31:51.263664+00	85	13	25	25
2406	2023-05-07 09:31:51.263664+00	86	15	23	25
2407	2023-05-07 09:31:51.263664+00	87	17	21	25
2408	2023-05-07 09:31:51.263664+00	88	1	19	25
2409	2023-05-07 09:31:51.263664+00	89	8	10	25
2410	2023-05-07 09:31:51.263664+00	90	6	12	25
2411	2023-05-07 09:31:51.263664+00	91	4	14	25
2412	2023-05-07 09:31:51.263664+00	92	2	16	25
2413	2023-05-07 09:31:51.263664+00	93	3	18	25
2414	2023-05-07 09:31:51.263664+00	94	5	20	25
2415	2023-05-07 09:31:51.263664+00	95	7	22	25
2416	2023-05-07 09:31:51.263664+00	96	9	24	25
2417	2023-05-07 09:31:51.263664+00	97	11	25	25
2418	2023-05-07 09:31:51.263664+00	98	13	23	25
2419	2023-05-07 09:31:51.263664+00	99	15	21	25
2420	2023-05-07 09:31:51.263664+00	100	17	19	25
2421	2023-05-07 09:31:51.263664+00	101	1	10	25
2422	2023-05-07 09:31:51.263664+00	102	8	12	25
2423	2023-05-07 09:31:51.263664+00	103	6	14	25
2424	2023-05-07 09:31:51.263664+00	104	4	16	25
2425	2023-05-07 09:31:51.263664+00	105	2	18	25
2426	2023-05-07 09:31:51.263664+00	106	3	20	25
2427	2023-05-07 09:31:51.263664+00	107	5	22	25
2428	2023-05-07 09:31:51.263664+00	108	7	24	25
2429	2023-05-07 09:31:51.263664+00	109	9	25	25
2430	2023-05-07 09:31:51.263664+00	110	11	23	25
2431	2023-05-07 09:31:51.263664+00	111	13	21	25
2432	2023-05-07 09:31:51.263664+00	112	15	19	25
2433	2023-05-07 09:31:51.263664+00	113	1	17	25
2434	2023-05-07 09:31:51.263664+00	114	10	12	25
2435	2023-05-07 09:31:51.263664+00	115	8	14	25
2436	2023-05-07 09:31:51.263664+00	116	6	16	25
2437	2023-05-07 09:31:51.263664+00	117	4	18	25
2438	2023-05-07 09:31:51.263664+00	118	2	20	25
2439	2023-05-07 09:31:51.263664+00	119	3	22	25
2440	2023-05-07 09:31:51.263664+00	120	5	24	25
2441	2023-05-07 09:31:51.263664+00	121	7	25	25
2442	2023-05-07 09:31:51.263664+00	122	9	23	25
2443	2023-05-07 09:31:51.263664+00	123	11	21	25
2444	2023-05-07 09:31:51.263664+00	124	13	19	25
2445	2023-05-07 09:31:51.263664+00	125	15	17	25
2446	2023-05-07 09:31:51.263664+00	126	1	12	25
2447	2023-05-07 09:31:51.263664+00	127	10	14	25
2448	2023-05-07 09:31:51.263664+00	128	8	16	25
2449	2023-05-07 09:31:51.263664+00	129	6	18	25
2450	2023-05-07 09:31:51.263664+00	130	4	20	25
2451	2023-05-07 09:31:51.263664+00	131	2	22	25
2452	2023-05-07 09:31:51.263664+00	132	3	24	25
2453	2023-05-07 09:31:51.263664+00	133	5	25	25
2454	2023-05-07 09:31:51.263664+00	134	7	23	25
2455	2023-05-07 09:31:51.263664+00	135	9	21	25
2456	2023-05-07 09:31:51.263664+00	136	11	19	25
2457	2023-05-07 09:31:51.263664+00	137	13	17	25
2458	2023-05-07 09:31:51.263664+00	138	1	15	25
2459	2023-05-07 09:31:51.263664+00	139	12	14	25
2460	2023-05-07 09:31:51.263664+00	140	10	16	25
2461	2023-05-07 09:31:51.263664+00	141	8	18	25
2462	2023-05-07 09:31:51.263664+00	142	6	20	25
2463	2023-05-07 09:31:51.263664+00	143	4	22	25
2464	2023-05-07 09:31:51.263664+00	144	2	24	25
2465	2023-05-07 09:31:51.263664+00	145	3	25	25
2466	2023-05-07 09:31:51.263664+00	146	5	23	25
2467	2023-05-07 09:31:51.263664+00	147	7	21	25
2468	2023-05-07 09:31:51.263664+00	148	9	19	25
2469	2023-05-07 09:31:51.263664+00	149	11	17	25
2470	2023-05-07 09:31:51.263664+00	150	13	15	25
2471	2023-05-07 09:31:51.263664+00	151	1	14	25
2472	2023-05-07 09:31:51.263664+00	152	12	16	25
2473	2023-05-07 09:31:51.263664+00	153	10	18	25
2474	2023-05-07 09:31:51.263664+00	154	8	20	25
2475	2023-05-07 09:31:51.263664+00	155	6	22	25
2476	2023-05-07 09:31:51.263664+00	156	4	24	25
2477	2023-05-07 09:31:51.263664+00	157	2	25	25
2478	2023-05-07 09:31:51.263664+00	158	3	23	25
2479	2023-05-07 09:31:51.263664+00	159	5	21	25
2480	2023-05-07 09:31:51.263664+00	160	7	19	25
2481	2023-05-07 09:31:51.263664+00	161	9	17	25
2482	2023-05-07 09:31:51.263664+00	162	11	15	25
2483	2023-05-07 09:31:51.263664+00	163	1	13	25
2484	2023-05-07 09:31:51.263664+00	164	14	16	25
2485	2023-05-07 09:31:51.263664+00	165	12	18	25
2486	2023-05-07 09:31:51.263664+00	166	10	20	25
2487	2023-05-07 09:31:51.263664+00	167	8	22	25
2488	2023-05-07 09:31:51.263664+00	168	6	24	25
2489	2023-05-07 09:31:51.263664+00	169	4	25	25
2490	2023-05-07 09:31:51.263664+00	170	2	23	25
2491	2023-05-07 09:31:51.263664+00	171	3	21	25
2492	2023-05-07 09:31:51.263664+00	172	5	19	25
2493	2023-05-07 09:31:51.263664+00	173	7	17	25
2494	2023-05-07 09:31:51.263664+00	174	9	15	25
2495	2023-05-07 09:31:51.263664+00	175	11	13	25
2496	2023-05-07 09:31:51.263664+00	176	1	16	25
2497	2023-05-07 09:31:51.263664+00	177	14	18	25
2498	2023-05-07 09:31:51.263664+00	178	12	20	25
2499	2023-05-07 09:31:51.263664+00	179	10	22	25
2500	2023-05-07 09:31:51.263664+00	180	8	24	25
2501	2023-05-07 09:31:51.263664+00	181	6	25	25
2502	2023-05-07 09:31:51.263664+00	182	4	23	25
2503	2023-05-07 09:31:51.263664+00	183	2	21	25
2504	2023-05-07 09:31:51.263664+00	184	3	19	25
2505	2023-05-07 09:31:51.263664+00	185	5	17	25
2506	2023-05-07 09:31:51.263664+00	186	7	15	25
2507	2023-05-07 09:31:51.263664+00	187	9	13	25
2508	2023-05-07 09:31:51.263664+00	188	1	11	25
2509	2023-05-07 09:31:51.263664+00	189	16	18	25
2510	2023-05-07 09:31:51.263664+00	190	14	20	25
2511	2023-05-07 09:31:51.263664+00	191	12	22	25
2512	2023-05-07 09:31:51.263664+00	192	10	24	25
2513	2023-05-07 09:31:51.263664+00	193	8	25	25
2514	2023-05-07 09:31:51.263664+00	194	6	23	25
2515	2023-05-07 09:31:51.263664+00	195	4	21	25
2516	2023-05-07 09:31:51.263664+00	196	2	19	25
2517	2023-05-07 09:31:51.263664+00	197	3	17	25
2518	2023-05-07 09:31:51.263664+00	198	5	15	25
2519	2023-05-07 09:31:51.263664+00	199	7	13	25
2520	2023-05-07 09:31:51.263664+00	200	9	11	25
2521	2023-05-07 09:31:51.263664+00	201	1	18	25
2522	2023-05-07 09:31:51.263664+00	202	16	20	25
2523	2023-05-07 09:31:51.263664+00	203	14	22	25
2524	2023-05-07 09:31:51.263664+00	204	12	24	25
2525	2023-05-07 09:31:51.263664+00	205	10	25	25
2526	2023-05-07 09:31:51.263664+00	206	8	23	25
2527	2023-05-07 09:31:51.263664+00	207	6	21	25
2528	2023-05-07 09:31:51.263664+00	208	4	19	25
2529	2023-05-07 09:31:51.263664+00	209	2	17	25
2530	2023-05-07 09:31:51.263664+00	210	3	15	25
2531	2023-05-07 09:31:51.263664+00	211	5	13	25
2532	2023-05-07 09:31:51.263664+00	212	7	11	25
2533	2023-05-07 09:31:51.263664+00	213	1	9	25
2534	2023-05-07 09:31:51.263664+00	214	18	20	25
2535	2023-05-07 09:31:51.263664+00	215	16	22	25
2536	2023-05-07 09:31:51.263664+00	216	14	24	25
2537	2023-05-07 09:31:51.263664+00	217	12	25	25
2538	2023-05-07 09:31:51.263664+00	218	10	23	25
2539	2023-05-07 09:31:51.263664+00	219	8	21	25
2540	2023-05-07 09:31:51.263664+00	220	6	19	25
2541	2023-05-07 09:31:51.263664+00	221	4	17	25
2542	2023-05-07 09:31:51.263664+00	222	2	15	25
2543	2023-05-07 09:31:51.263664+00	223	3	13	25
2544	2023-05-07 09:31:51.263664+00	224	5	11	25
2545	2023-05-07 09:31:51.263664+00	225	7	9	25
2546	2023-05-07 09:31:51.263664+00	226	1	20	25
2547	2023-05-07 09:31:51.263664+00	227	18	22	25
2548	2023-05-07 09:31:51.263664+00	228	16	24	25
2549	2023-05-07 09:31:51.263664+00	229	14	25	25
2550	2023-05-07 09:31:51.263664+00	230	12	23	25
2551	2023-05-07 09:31:51.263664+00	231	10	21	25
2552	2023-05-07 09:31:51.263664+00	232	8	19	25
2553	2023-05-07 09:31:51.263664+00	233	6	17	25
2554	2023-05-07 09:31:51.263664+00	234	4	15	25
2555	2023-05-07 09:31:51.263664+00	235	2	13	25
2556	2023-05-07 09:31:51.263664+00	236	3	11	25
2557	2023-05-07 09:31:51.263664+00	237	5	9	25
2558	2023-05-07 09:31:51.263664+00	238	1	7	25
2559	2023-05-07 09:31:51.263664+00	239	20	22	25
2560	2023-05-07 09:31:51.263664+00	240	18	24	25
2561	2023-05-07 09:31:51.263664+00	241	16	25	25
2562	2023-05-07 09:31:51.263664+00	242	14	23	25
2563	2023-05-07 09:31:51.263664+00	243	12	21	25
2564	2023-05-07 09:31:51.263664+00	244	10	19	25
2565	2023-05-07 09:31:51.263664+00	245	8	17	25
2566	2023-05-07 09:31:51.263664+00	246	6	15	25
2567	2023-05-07 09:31:51.263664+00	247	4	13	25
2568	2023-05-07 09:31:51.263664+00	248	2	11	25
2569	2023-05-07 09:31:51.263664+00	249	3	9	25
2570	2023-05-07 09:31:51.263664+00	250	5	7	25
2571	2023-05-07 09:31:51.263664+00	251	1	22	25
2572	2023-05-07 09:31:51.263664+00	252	20	24	25
2573	2023-05-07 09:31:51.263664+00	253	18	25	25
2574	2023-05-07 09:31:51.263664+00	254	16	23	25
2575	2023-05-07 09:31:51.263664+00	255	14	21	25
2576	2023-05-07 09:31:51.263664+00	256	12	19	25
2577	2023-05-07 09:31:51.263664+00	257	10	17	25
2578	2023-05-07 09:31:51.263664+00	258	8	15	25
2579	2023-05-07 09:31:51.263664+00	259	6	13	25
2580	2023-05-07 09:31:51.263664+00	260	4	11	25
2581	2023-05-07 09:31:51.263664+00	261	2	9	25
2582	2023-05-07 09:31:51.263664+00	262	3	7	25
2583	2023-05-07 09:31:51.263664+00	263	1	5	25
2584	2023-05-07 09:31:51.263664+00	264	22	24	25
2585	2023-05-07 09:31:51.263664+00	265	20	25	25
2586	2023-05-07 09:31:51.263664+00	266	18	23	25
2587	2023-05-07 09:31:51.263664+00	267	16	21	25
2588	2023-05-07 09:31:51.263664+00	268	14	19	25
2589	2023-05-07 09:31:51.263664+00	269	12	17	25
2590	2023-05-07 09:31:51.263664+00	270	10	15	25
2591	2023-05-07 09:31:51.263664+00	271	8	13	25
2592	2023-05-07 09:31:51.263664+00	272	6	11	25
2593	2023-05-07 09:31:51.263664+00	273	4	9	25
2594	2023-05-07 09:31:51.263664+00	274	2	7	25
2595	2023-05-07 09:31:51.263664+00	275	3	5	25
2596	2023-05-07 09:31:51.263664+00	276	1	24	25
2597	2023-05-07 09:31:51.263664+00	277	22	25	25
2598	2023-05-07 09:31:51.263664+00	278	20	23	25
2599	2023-05-07 09:31:51.263664+00	279	18	21	25
2600	2023-05-07 09:31:51.263664+00	280	16	19	25
2601	2023-05-07 09:31:51.263664+00	281	14	17	25
2602	2023-05-07 09:31:51.263664+00	282	12	15	25
2603	2023-05-07 09:31:51.263664+00	283	10	13	25
2604	2023-05-07 09:31:51.263664+00	284	8	11	25
2605	2023-05-07 09:31:51.263664+00	285	6	9	25
2606	2023-05-07 09:31:51.263664+00	286	4	7	25
2607	2023-05-07 09:31:51.263664+00	287	2	5	25
2608	2023-05-07 09:31:51.263664+00	288	1	3	25
2609	2023-05-07 09:31:51.263664+00	289	24	25	25
2610	2023-05-07 09:31:51.263664+00	290	22	23	25
2611	2023-05-07 09:31:51.263664+00	291	20	21	25
2612	2023-05-07 09:31:51.263664+00	292	18	19	25
2613	2023-05-07 09:31:51.263664+00	293	16	17	25
2614	2023-05-07 09:31:51.263664+00	294	14	15	25
2615	2023-05-07 09:31:51.263664+00	295	12	13	25
2616	2023-05-07 09:31:51.263664+00	296	10	11	25
2617	2023-05-07 09:31:51.263664+00	297	8	9	25
2618	2023-05-07 09:31:51.263664+00	298	6	7	25
2619	2023-05-07 09:31:51.263664+00	299	4	5	25
2620	2023-05-07 09:31:51.263664+00	300	2	3	25
2621	2023-05-07 09:31:51.263664+00	1	1	2	26
2622	2023-05-07 09:31:51.263664+00	2	3	4	26
2623	2023-05-07 09:31:51.263664+00	3	5	6	26
2624	2023-05-07 09:31:51.263664+00	4	7	8	26
2625	2023-05-07 09:31:51.263664+00	5	9	10	26
2626	2023-05-07 09:31:51.263664+00	6	11	12	26
2627	2023-05-07 09:31:51.263664+00	7	13	14	26
2628	2023-05-07 09:31:51.263664+00	8	15	16	26
2629	2023-05-07 09:31:51.263664+00	9	17	18	26
2630	2023-05-07 09:31:51.263664+00	10	19	20	26
2631	2023-05-07 09:31:51.263664+00	11	21	22	26
2632	2023-05-07 09:31:51.263664+00	12	23	24	26
2633	2023-05-07 09:31:51.263664+00	13	25	26	26
2634	2023-05-07 09:31:51.263664+00	14	1	4	26
2635	2023-05-07 09:31:51.263664+00	15	2	6	26
2636	2023-05-07 09:31:51.263664+00	16	3	8	26
2637	2023-05-07 09:31:51.263664+00	17	5	10	26
2638	2023-05-07 09:31:51.263664+00	18	7	12	26
2639	2023-05-07 09:31:51.263664+00	19	9	14	26
2640	2023-05-07 09:31:51.263664+00	20	11	16	26
2641	2023-05-07 09:31:51.263664+00	21	13	18	26
2642	2023-05-07 09:31:51.263664+00	22	15	20	26
2643	2023-05-07 09:31:51.263664+00	23	17	22	26
2644	2023-05-07 09:31:51.263664+00	24	19	24	26
2645	2023-05-07 09:31:51.263664+00	25	21	26	26
2646	2023-05-07 09:31:51.263664+00	26	23	25	26
2647	2023-05-07 09:31:51.263664+00	27	1	6	26
2648	2023-05-07 09:31:51.263664+00	28	4	8	26
2649	2023-05-07 09:31:51.263664+00	29	2	10	26
2650	2023-05-07 09:31:51.263664+00	30	3	12	26
2651	2023-05-07 09:31:51.263664+00	31	5	14	26
2652	2023-05-07 09:31:51.263664+00	32	7	16	26
2653	2023-05-07 09:31:51.263664+00	33	9	18	26
2654	2023-05-07 09:31:51.263664+00	34	11	20	26
2655	2023-05-07 09:31:51.263664+00	35	13	22	26
2656	2023-05-07 09:31:51.263664+00	36	15	24	26
2657	2023-05-07 09:31:51.263664+00	37	17	26	26
2658	2023-05-07 09:31:51.263664+00	38	19	25	26
2659	2023-05-07 09:31:51.263664+00	39	21	23	26
2660	2023-05-07 09:31:51.263664+00	40	1	8	26
2661	2023-05-07 09:31:51.263664+00	41	6	10	26
2662	2023-05-07 09:31:51.263664+00	42	4	12	26
2663	2023-05-07 09:31:51.263664+00	43	2	14	26
2664	2023-05-07 09:31:51.263664+00	44	3	16	26
2665	2023-05-07 09:31:51.263664+00	45	5	18	26
2666	2023-05-07 09:31:51.263664+00	46	7	20	26
2667	2023-05-07 09:31:51.263664+00	47	9	22	26
2668	2023-05-07 09:31:51.263664+00	48	11	24	26
2669	2023-05-07 09:31:51.263664+00	49	13	26	26
2670	2023-05-07 09:31:51.263664+00	50	15	25	26
2671	2023-05-07 09:31:51.263664+00	51	17	23	26
2672	2023-05-07 09:31:51.263664+00	52	19	21	26
2673	2023-05-07 09:31:51.263664+00	53	1	10	26
2674	2023-05-07 09:31:51.263664+00	54	8	12	26
2675	2023-05-07 09:31:51.263664+00	55	6	14	26
2676	2023-05-07 09:31:51.263664+00	56	4	16	26
2677	2023-05-07 09:31:51.263664+00	57	2	18	26
2678	2023-05-07 09:31:51.263664+00	58	3	20	26
2679	2023-05-07 09:31:51.263664+00	59	5	22	26
2680	2023-05-07 09:31:51.263664+00	60	7	24	26
2681	2023-05-07 09:31:51.263664+00	61	9	26	26
2682	2023-05-07 09:31:51.263664+00	62	11	25	26
2683	2023-05-07 09:31:51.263664+00	63	13	23	26
2684	2023-05-07 09:31:51.263664+00	64	15	21	26
2685	2023-05-07 09:31:51.263664+00	65	17	19	26
2686	2023-05-07 09:31:51.263664+00	66	1	12	26
2687	2023-05-07 09:31:51.263664+00	67	10	14	26
2688	2023-05-07 09:31:51.263664+00	68	8	16	26
2689	2023-05-07 09:31:51.263664+00	69	6	18	26
2690	2023-05-07 09:31:51.263664+00	70	4	20	26
2691	2023-05-07 09:31:51.263664+00	71	2	22	26
2692	2023-05-07 09:31:51.263664+00	72	3	24	26
2693	2023-05-07 09:31:51.263664+00	73	5	26	26
2694	2023-05-07 09:31:51.263664+00	74	7	25	26
2695	2023-05-07 09:31:51.263664+00	75	9	23	26
2696	2023-05-07 09:31:51.263664+00	76	11	21	26
2697	2023-05-07 09:31:51.263664+00	77	13	19	26
2698	2023-05-07 09:31:51.263664+00	78	15	17	26
2699	2023-05-07 09:31:51.263664+00	79	1	14	26
2700	2023-05-07 09:31:51.263664+00	80	12	16	26
2701	2023-05-07 09:31:51.263664+00	81	10	18	26
2702	2023-05-07 09:31:51.263664+00	82	8	20	26
2703	2023-05-07 09:31:51.263664+00	83	6	22	26
2704	2023-05-07 09:31:51.263664+00	84	4	24	26
2705	2023-05-07 09:31:51.263664+00	85	2	26	26
2706	2023-05-07 09:31:51.263664+00	86	3	25	26
2707	2023-05-07 09:31:51.263664+00	87	5	23	26
2708	2023-05-07 09:31:51.263664+00	88	7	21	26
2709	2023-05-07 09:31:51.263664+00	89	9	19	26
2710	2023-05-07 09:31:51.263664+00	90	11	17	26
2711	2023-05-07 09:31:51.263664+00	91	13	15	26
2712	2023-05-07 09:31:51.263664+00	92	1	16	26
2713	2023-05-07 09:31:51.263664+00	93	14	18	26
2714	2023-05-07 09:31:51.263664+00	94	12	20	26
2715	2023-05-07 09:31:51.263664+00	95	10	22	26
2716	2023-05-07 09:31:51.263664+00	96	8	24	26
2717	2023-05-07 09:31:51.263664+00	97	6	26	26
2718	2023-05-07 09:31:51.263664+00	98	4	25	26
2719	2023-05-07 09:31:51.263664+00	99	2	23	26
2720	2023-05-07 09:31:51.263664+00	100	3	21	26
2721	2023-05-07 09:31:51.263664+00	101	5	19	26
2722	2023-05-07 09:31:51.263664+00	102	7	17	26
2723	2023-05-07 09:31:51.263664+00	103	9	15	26
2724	2023-05-07 09:31:51.263664+00	104	11	13	26
2725	2023-05-07 09:31:51.263664+00	105	1	18	26
2726	2023-05-07 09:31:51.263664+00	106	16	20	26
2727	2023-05-07 09:31:51.263664+00	107	14	22	26
2728	2023-05-07 09:31:51.263664+00	108	12	24	26
2729	2023-05-07 09:31:51.263664+00	109	10	26	26
2730	2023-05-07 09:31:51.263664+00	110	8	25	26
2731	2023-05-07 09:31:51.263664+00	111	6	23	26
2732	2023-05-07 09:31:51.263664+00	112	4	21	26
2733	2023-05-07 09:31:51.263664+00	113	2	19	26
2734	2023-05-07 09:31:51.263664+00	114	3	17	26
2735	2023-05-07 09:31:51.263664+00	115	5	15	26
2736	2023-05-07 09:31:51.263664+00	116	7	13	26
2737	2023-05-07 09:31:51.263664+00	117	9	11	26
2738	2023-05-07 09:31:51.263664+00	118	1	20	26
2739	2023-05-07 09:31:51.263664+00	119	18	22	26
2740	2023-05-07 09:31:51.263664+00	120	16	24	26
2741	2023-05-07 09:31:51.263664+00	121	14	26	26
2742	2023-05-07 09:31:51.263664+00	122	12	25	26
2743	2023-05-07 09:31:51.263664+00	123	10	23	26
2744	2023-05-07 09:31:51.263664+00	124	8	21	26
2745	2023-05-07 09:31:51.263664+00	125	6	19	26
2746	2023-05-07 09:31:51.263664+00	126	4	17	26
2747	2023-05-07 09:31:51.263664+00	127	2	15	26
2748	2023-05-07 09:31:51.263664+00	128	3	13	26
2749	2023-05-07 09:31:51.263664+00	129	5	11	26
2750	2023-05-07 09:31:51.263664+00	130	7	9	26
2751	2023-05-07 09:31:51.263664+00	131	1	22	26
2752	2023-05-07 09:31:51.263664+00	132	20	24	26
2753	2023-05-07 09:31:51.263664+00	133	18	26	26
2754	2023-05-07 09:31:51.263664+00	134	16	25	26
2755	2023-05-07 09:31:51.263664+00	135	14	23	26
2756	2023-05-07 09:31:51.263664+00	136	12	21	26
2757	2023-05-07 09:31:51.263664+00	137	10	19	26
2758	2023-05-07 09:31:51.263664+00	138	8	17	26
2759	2023-05-07 09:31:51.263664+00	139	6	15	26
2760	2023-05-07 09:31:51.263664+00	140	4	13	26
2761	2023-05-07 09:31:51.263664+00	141	2	11	26
2762	2023-05-07 09:31:51.263664+00	142	3	9	26
2763	2023-05-07 09:31:51.263664+00	143	5	7	26
2764	2023-05-07 09:31:51.263664+00	144	1	24	26
2765	2023-05-07 09:31:51.263664+00	145	22	26	26
2766	2023-05-07 09:31:51.263664+00	146	20	25	26
2767	2023-05-07 09:31:51.263664+00	147	18	23	26
2768	2023-05-07 09:31:51.263664+00	148	16	21	26
2769	2023-05-07 09:31:51.263664+00	149	14	19	26
2770	2023-05-07 09:31:51.263664+00	150	12	17	26
2771	2023-05-07 09:31:51.263664+00	151	10	15	26
2772	2023-05-07 09:31:51.263664+00	152	8	13	26
2773	2023-05-07 09:31:51.263664+00	153	6	11	26
2774	2023-05-07 09:31:51.263664+00	154	4	9	26
2775	2023-05-07 09:31:51.263664+00	155	2	7	26
2776	2023-05-07 09:31:51.263664+00	156	3	5	26
2777	2023-05-07 09:31:51.263664+00	157	1	26	26
2778	2023-05-07 09:31:51.263664+00	158	24	25	26
2779	2023-05-07 09:31:51.263664+00	159	22	23	26
2780	2023-05-07 09:31:51.263664+00	160	20	21	26
2781	2023-05-07 09:31:51.263664+00	161	18	19	26
2782	2023-05-07 09:31:51.263664+00	162	16	17	26
2783	2023-05-07 09:31:51.263664+00	163	14	15	26
2784	2023-05-07 09:31:51.263664+00	164	12	13	26
2785	2023-05-07 09:31:51.263664+00	165	10	11	26
2786	2023-05-07 09:31:51.263664+00	166	8	9	26
2787	2023-05-07 09:31:51.263664+00	167	6	7	26
2788	2023-05-07 09:31:51.263664+00	168	4	5	26
2789	2023-05-07 09:31:51.263664+00	169	2	3	26
2790	2023-05-07 09:31:51.263664+00	170	1	25	26
2791	2023-05-07 09:31:51.263664+00	171	26	23	26
2792	2023-05-07 09:31:51.263664+00	172	24	21	26
2793	2023-05-07 09:31:51.263664+00	173	22	19	26
2794	2023-05-07 09:31:51.263664+00	174	20	17	26
2795	2023-05-07 09:31:51.263664+00	175	18	15	26
2796	2023-05-07 09:31:51.263664+00	176	16	13	26
2797	2023-05-07 09:31:51.263664+00	177	14	11	26
2798	2023-05-07 09:31:51.263664+00	178	12	9	26
2799	2023-05-07 09:31:51.263664+00	179	10	7	26
2800	2023-05-07 09:31:51.263664+00	180	8	5	26
2801	2023-05-07 09:31:51.263664+00	181	6	3	26
2802	2023-05-07 09:31:51.263664+00	182	4	2	26
2803	2023-05-07 09:31:51.263664+00	183	1	23	26
2804	2023-05-07 09:31:51.263664+00	184	25	21	26
2805	2023-05-07 09:31:51.263664+00	185	26	19	26
2806	2023-05-07 09:31:51.263664+00	186	24	17	26
2807	2023-05-07 09:31:51.263664+00	187	22	15	26
2808	2023-05-07 09:31:51.263664+00	188	20	13	26
2809	2023-05-07 09:31:51.263664+00	189	18	11	26
2810	2023-05-07 09:31:51.263664+00	190	16	9	26
2811	2023-05-07 09:31:51.263664+00	191	14	7	26
2812	2023-05-07 09:31:51.263664+00	192	12	5	26
2813	2023-05-07 09:31:51.263664+00	193	10	3	26
2814	2023-05-07 09:31:51.263664+00	194	8	2	26
2815	2023-05-07 09:31:51.263664+00	195	6	4	26
2816	2023-05-07 09:31:51.263664+00	196	1	21	26
2817	2023-05-07 09:31:51.263664+00	197	23	19	26
2818	2023-05-07 09:31:51.263664+00	198	25	17	26
2819	2023-05-07 09:31:51.263664+00	199	26	15	26
2820	2023-05-07 09:31:51.263664+00	200	24	13	26
2821	2023-05-07 09:31:51.263664+00	201	22	11	26
2822	2023-05-07 09:31:51.263664+00	202	20	9	26
2823	2023-05-07 09:31:51.263664+00	203	18	7	26
2824	2023-05-07 09:31:51.263664+00	204	16	5	26
2825	2023-05-07 09:31:51.263664+00	205	14	3	26
2826	2023-05-07 09:31:51.263664+00	206	12	2	26
2827	2023-05-07 09:31:51.263664+00	207	10	4	26
2828	2023-05-07 09:31:51.263664+00	208	8	6	26
2829	2023-05-07 09:31:51.263664+00	209	1	19	26
2830	2023-05-07 09:31:51.263664+00	210	21	17	26
2831	2023-05-07 09:31:51.263664+00	211	23	15	26
2832	2023-05-07 09:31:51.263664+00	212	25	13	26
2833	2023-05-07 09:31:51.263664+00	213	26	11	26
2834	2023-05-07 09:31:51.263664+00	214	24	9	26
2835	2023-05-07 09:31:51.263664+00	215	22	7	26
2836	2023-05-07 09:31:51.263664+00	216	20	5	26
2837	2023-05-07 09:31:51.263664+00	217	18	3	26
2838	2023-05-07 09:31:51.263664+00	218	16	2	26
2839	2023-05-07 09:31:51.263664+00	219	14	4	26
2840	2023-05-07 09:31:51.263664+00	220	12	6	26
2841	2023-05-07 09:31:51.263664+00	221	10	8	26
2842	2023-05-07 09:31:51.263664+00	222	1	17	26
2843	2023-05-07 09:31:51.263664+00	223	19	15	26
2844	2023-05-07 09:31:51.263664+00	224	21	13	26
2845	2023-05-07 09:31:51.263664+00	225	23	11	26
2846	2023-05-07 09:31:51.263664+00	226	25	9	26
2847	2023-05-07 09:31:51.263664+00	227	26	7	26
2848	2023-05-07 09:31:51.263664+00	228	24	5	26
2849	2023-05-07 09:31:51.263664+00	229	22	3	26
2850	2023-05-07 09:31:51.263664+00	230	20	2	26
2851	2023-05-07 09:31:51.263664+00	231	18	4	26
2852	2023-05-07 09:31:51.263664+00	232	16	6	26
2853	2023-05-07 09:31:51.263664+00	233	14	8	26
2854	2023-05-07 09:31:51.263664+00	234	12	10	26
2855	2023-05-07 09:31:51.263664+00	235	1	15	26
2856	2023-05-07 09:31:51.263664+00	236	17	13	26
2857	2023-05-07 09:31:51.263664+00	237	19	11	26
2858	2023-05-07 09:31:51.263664+00	238	21	9	26
2859	2023-05-07 09:31:51.263664+00	239	23	7	26
2860	2023-05-07 09:31:51.263664+00	240	25	5	26
2861	2023-05-07 09:31:51.263664+00	241	26	3	26
2862	2023-05-07 09:31:51.263664+00	242	24	2	26
2863	2023-05-07 09:31:51.263664+00	243	22	4	26
2864	2023-05-07 09:31:51.263664+00	244	20	6	26
2865	2023-05-07 09:31:51.263664+00	245	18	8	26
2866	2023-05-07 09:31:51.263664+00	246	16	10	26
2867	2023-05-07 09:31:51.263664+00	247	14	12	26
2868	2023-05-07 09:31:51.263664+00	248	1	13	26
2869	2023-05-07 09:31:51.263664+00	249	15	11	26
2870	2023-05-07 09:31:51.263664+00	250	17	9	26
2871	2023-05-07 09:31:51.263664+00	251	19	7	26
2872	2023-05-07 09:31:51.263664+00	252	21	5	26
2873	2023-05-07 09:31:51.263664+00	253	23	3	26
2874	2023-05-07 09:31:51.263664+00	254	25	2	26
2875	2023-05-07 09:31:51.263664+00	255	26	4	26
2876	2023-05-07 09:31:51.263664+00	256	24	6	26
2877	2023-05-07 09:31:51.263664+00	257	22	8	26
2878	2023-05-07 09:31:51.263664+00	258	20	10	26
2879	2023-05-07 09:31:51.263664+00	259	18	12	26
2880	2023-05-07 09:31:51.263664+00	260	16	14	26
2881	2023-05-07 09:31:51.263664+00	261	1	11	26
2882	2023-05-07 09:31:51.263664+00	262	13	9	26
2883	2023-05-07 09:31:51.263664+00	263	15	7	26
2884	2023-05-07 09:31:51.263664+00	264	17	5	26
2885	2023-05-07 09:31:51.263664+00	265	19	3	26
2886	2023-05-07 09:31:51.263664+00	266	21	2	26
2887	2023-05-07 09:31:51.263664+00	267	23	4	26
2888	2023-05-07 09:31:51.263664+00	268	25	6	26
2889	2023-05-07 09:31:51.263664+00	269	26	8	26
2890	2023-05-07 09:31:51.263664+00	270	24	10	26
2891	2023-05-07 09:31:51.263664+00	271	22	12	26
2892	2023-05-07 09:31:51.263664+00	272	20	14	26
2893	2023-05-07 09:31:51.263664+00	273	18	16	26
2894	2023-05-07 09:31:51.263664+00	274	1	9	26
2895	2023-05-07 09:31:51.263664+00	275	11	7	26
2896	2023-05-07 09:31:51.263664+00	276	13	5	26
2897	2023-05-07 09:31:51.263664+00	277	15	3	26
2898	2023-05-07 09:31:51.263664+00	278	17	2	26
2899	2023-05-07 09:31:51.263664+00	279	19	4	26
2900	2023-05-07 09:31:51.263664+00	280	21	6	26
2901	2023-05-07 09:31:51.263664+00	281	23	8	26
2902	2023-05-07 09:31:51.263664+00	282	25	10	26
2903	2023-05-07 09:31:51.263664+00	283	26	12	26
2904	2023-05-07 09:31:51.263664+00	284	24	14	26
2905	2023-05-07 09:31:51.263664+00	285	22	16	26
2906	2023-05-07 09:31:51.263664+00	286	20	18	26
2907	2023-05-07 09:31:51.263664+00	287	1	7	26
2908	2023-05-07 09:31:51.263664+00	288	9	5	26
2909	2023-05-07 09:31:51.263664+00	289	11	3	26
2910	2023-05-07 09:31:51.263664+00	290	13	2	26
2911	2023-05-07 09:31:51.263664+00	291	15	4	26
2912	2023-05-07 09:31:51.263664+00	292	17	6	26
2913	2023-05-07 09:31:51.263664+00	293	19	8	26
2914	2023-05-07 09:31:51.263664+00	294	21	10	26
2915	2023-05-07 09:31:51.263664+00	295	23	12	26
2916	2023-05-07 09:31:51.263664+00	296	25	14	26
2917	2023-05-07 09:31:51.263664+00	297	26	16	26
2918	2023-05-07 09:31:51.263664+00	298	24	18	26
2919	2023-05-07 09:31:51.263664+00	299	22	20	26
2920	2023-05-07 09:31:51.263664+00	300	1	5	26
2921	2023-05-07 09:31:51.263664+00	301	7	3	26
2922	2023-05-07 09:31:51.263664+00	302	9	2	26
2923	2023-05-07 09:31:51.263664+00	303	11	4	26
2924	2023-05-07 09:31:51.263664+00	304	13	6	26
2925	2023-05-07 09:31:51.263664+00	305	15	8	26
2926	2023-05-07 09:31:51.263664+00	306	17	10	26
2927	2023-05-07 09:31:51.263664+00	307	19	12	26
2928	2023-05-07 09:31:51.263664+00	308	21	14	26
2929	2023-05-07 09:31:51.263664+00	309	23	16	26
2930	2023-05-07 09:31:51.263664+00	310	25	18	26
2931	2023-05-07 09:31:51.263664+00	311	26	20	26
2932	2023-05-07 09:31:51.263664+00	312	24	22	26
2933	2023-05-07 09:31:51.263664+00	313	1	3	26
2934	2023-05-07 09:31:51.263664+00	314	5	2	26
2935	2023-05-07 09:31:51.263664+00	315	7	4	26
2936	2023-05-07 09:31:51.263664+00	316	9	6	26
2937	2023-05-07 09:31:51.263664+00	317	11	8	26
2938	2023-05-07 09:31:51.263664+00	318	13	10	26
2939	2023-05-07 09:31:51.263664+00	319	15	12	26
2940	2023-05-07 09:31:51.263664+00	320	17	14	26
2941	2023-05-07 09:31:51.263664+00	321	19	16	26
2942	2023-05-07 09:31:51.263664+00	322	21	18	26
2943	2023-05-07 09:31:51.263664+00	323	23	20	26
2944	2023-05-07 09:31:51.263664+00	324	25	22	26
2945	2023-05-07 09:31:51.263664+00	325	26	24	26
2946	2023-05-07 09:31:51.263664+00	1	1	2	27
2947	2023-05-07 09:31:51.263664+00	2	3	4	27
2948	2023-05-07 09:31:51.263664+00	3	5	6	27
2949	2023-05-07 09:31:51.263664+00	4	7	8	27
2950	2023-05-07 09:31:51.263664+00	5	9	10	27
2951	2023-05-07 09:31:51.263664+00	6	11	12	27
2952	2023-05-07 09:31:51.263664+00	7	13	14	27
2953	2023-05-07 09:31:51.263664+00	8	15	16	27
2954	2023-05-07 09:31:51.263664+00	9	17	18	27
2955	2023-05-07 09:31:51.263664+00	10	19	20	27
2956	2023-05-07 09:31:51.263664+00	11	21	22	27
2957	2023-05-07 09:31:51.263664+00	12	23	24	27
2958	2023-05-07 09:31:51.263664+00	13	25	26	27
2959	2023-05-07 09:31:51.263664+00	14	1	27	27
2960	2023-05-07 09:31:51.263664+00	15	2	4	27
2961	2023-05-07 09:31:51.263664+00	16	3	6	27
2962	2023-05-07 09:31:51.263664+00	17	5	8	27
2963	2023-05-07 09:31:51.263664+00	18	7	10	27
2964	2023-05-07 09:31:51.263664+00	19	9	12	27
2965	2023-05-07 09:31:51.263664+00	20	11	14	27
2966	2023-05-07 09:31:51.263664+00	21	13	16	27
2967	2023-05-07 09:31:51.263664+00	22	15	18	27
2968	2023-05-07 09:31:51.263664+00	23	17	20	27
2969	2023-05-07 09:31:51.263664+00	24	19	22	27
2970	2023-05-07 09:31:51.263664+00	25	21	24	27
2971	2023-05-07 09:31:51.263664+00	26	23	26	27
2972	2023-05-07 09:31:51.263664+00	27	25	27	27
2973	2023-05-07 09:31:51.263664+00	28	1	4	27
2974	2023-05-07 09:31:51.263664+00	29	2	6	27
2975	2023-05-07 09:31:51.263664+00	30	3	8	27
2976	2023-05-07 09:31:51.263664+00	31	5	10	27
2977	2023-05-07 09:31:51.263664+00	32	7	12	27
2978	2023-05-07 09:31:51.263664+00	33	9	14	27
2979	2023-05-07 09:31:51.263664+00	34	11	16	27
2980	2023-05-07 09:31:51.263664+00	35	13	18	27
2981	2023-05-07 09:31:51.263664+00	36	15	20	27
2982	2023-05-07 09:31:51.263664+00	37	17	22	27
2983	2023-05-07 09:31:51.263664+00	38	19	24	27
2984	2023-05-07 09:31:51.263664+00	39	21	26	27
2985	2023-05-07 09:31:51.263664+00	40	23	27	27
2986	2023-05-07 09:31:51.263664+00	41	1	25	27
2987	2023-05-07 09:31:51.263664+00	42	4	6	27
2988	2023-05-07 09:31:51.263664+00	43	2	8	27
2989	2023-05-07 09:31:51.263664+00	44	3	10	27
2990	2023-05-07 09:31:51.263664+00	45	5	12	27
2991	2023-05-07 09:31:51.263664+00	46	7	14	27
2992	2023-05-07 09:31:51.263664+00	47	9	16	27
2993	2023-05-07 09:31:51.263664+00	48	11	18	27
2994	2023-05-07 09:31:51.263664+00	49	13	20	27
2995	2023-05-07 09:31:51.263664+00	50	15	22	27
2996	2023-05-07 09:31:51.263664+00	51	17	24	27
2997	2023-05-07 09:31:51.263664+00	52	19	26	27
2998	2023-05-07 09:31:51.263664+00	53	21	27	27
2999	2023-05-07 09:31:51.263664+00	54	23	25	27
3000	2023-05-07 09:31:51.263664+00	55	1	6	27
3001	2023-05-07 09:31:51.263664+00	56	4	8	27
3002	2023-05-07 09:31:51.263664+00	57	2	10	27
3003	2023-05-07 09:31:51.263664+00	58	3	12	27
3004	2023-05-07 09:31:51.263664+00	59	5	14	27
3005	2023-05-07 09:31:51.263664+00	60	7	16	27
3006	2023-05-07 09:31:51.263664+00	61	9	18	27
3007	2023-05-07 09:31:51.263664+00	62	11	20	27
3008	2023-05-07 09:31:51.263664+00	63	13	22	27
3009	2023-05-07 09:31:51.263664+00	64	15	24	27
3010	2023-05-07 09:31:51.263664+00	65	17	26	27
3011	2023-05-07 09:31:51.263664+00	66	19	27	27
3012	2023-05-07 09:31:51.263664+00	67	21	25	27
3013	2023-05-07 09:31:51.263664+00	68	1	23	27
3014	2023-05-07 09:31:51.263664+00	69	6	8	27
3015	2023-05-07 09:31:51.263664+00	70	4	10	27
3016	2023-05-07 09:31:51.263664+00	71	2	12	27
3017	2023-05-07 09:31:51.263664+00	72	3	14	27
3018	2023-05-07 09:31:51.263664+00	73	5	16	27
3019	2023-05-07 09:31:51.263664+00	74	7	18	27
3020	2023-05-07 09:31:51.263664+00	75	9	20	27
3021	2023-05-07 09:31:51.263664+00	76	11	22	27
3022	2023-05-07 09:31:51.263664+00	77	13	24	27
3023	2023-05-07 09:31:51.263664+00	78	15	26	27
3024	2023-05-07 09:31:51.263664+00	79	17	27	27
3025	2023-05-07 09:31:51.263664+00	80	19	25	27
3026	2023-05-07 09:31:51.263664+00	81	21	23	27
3027	2023-05-07 09:31:51.263664+00	82	1	8	27
3028	2023-05-07 09:31:51.263664+00	83	6	10	27
3029	2023-05-07 09:31:51.263664+00	84	4	12	27
3030	2023-05-07 09:31:51.263664+00	85	2	14	27
3031	2023-05-07 09:31:51.263664+00	86	3	16	27
3032	2023-05-07 09:31:51.263664+00	87	5	18	27
3033	2023-05-07 09:31:51.263664+00	88	7	20	27
3034	2023-05-07 09:31:51.263664+00	89	9	22	27
3035	2023-05-07 09:31:51.263664+00	90	11	24	27
3036	2023-05-07 09:31:51.263664+00	91	13	26	27
3037	2023-05-07 09:31:51.263664+00	92	15	27	27
3038	2023-05-07 09:31:51.263664+00	93	17	25	27
3039	2023-05-07 09:31:51.263664+00	94	19	23	27
3040	2023-05-07 09:31:51.263664+00	95	1	21	27
3041	2023-05-07 09:31:51.263664+00	96	8	10	27
3042	2023-05-07 09:31:51.263664+00	97	6	12	27
3043	2023-05-07 09:31:51.263664+00	98	4	14	27
3044	2023-05-07 09:31:51.263664+00	99	2	16	27
3045	2023-05-07 09:31:51.263664+00	100	3	18	27
3046	2023-05-07 09:31:51.263664+00	101	5	20	27
3047	2023-05-07 09:31:51.263664+00	102	7	22	27
3048	2023-05-07 09:31:51.263664+00	103	9	24	27
3049	2023-05-07 09:31:51.263664+00	104	11	26	27
3050	2023-05-07 09:31:51.263664+00	105	13	27	27
3051	2023-05-07 09:31:51.263664+00	106	15	25	27
3052	2023-05-07 09:31:51.263664+00	107	17	23	27
3053	2023-05-07 09:31:51.263664+00	108	19	21	27
3054	2023-05-07 09:31:51.263664+00	109	1	10	27
3055	2023-05-07 09:31:51.263664+00	110	8	12	27
3056	2023-05-07 09:31:51.263664+00	111	6	14	27
3057	2023-05-07 09:31:51.263664+00	112	4	16	27
3058	2023-05-07 09:31:51.263664+00	113	2	18	27
3059	2023-05-07 09:31:51.263664+00	114	3	20	27
3060	2023-05-07 09:31:51.263664+00	115	5	22	27
3061	2023-05-07 09:31:51.263664+00	116	7	24	27
3062	2023-05-07 09:31:51.263664+00	117	9	26	27
3063	2023-05-07 09:31:51.263664+00	118	11	27	27
3064	2023-05-07 09:31:51.263664+00	119	13	25	27
3065	2023-05-07 09:31:51.263664+00	120	15	23	27
3066	2023-05-07 09:31:51.263664+00	121	17	21	27
3067	2023-05-07 09:31:51.263664+00	122	1	19	27
3068	2023-05-07 09:31:51.263664+00	123	10	12	27
3069	2023-05-07 09:31:51.263664+00	124	8	14	27
3070	2023-05-07 09:31:51.263664+00	125	6	16	27
3071	2023-05-07 09:31:51.263664+00	126	4	18	27
3072	2023-05-07 09:31:51.263664+00	127	2	20	27
3073	2023-05-07 09:31:51.263664+00	128	3	22	27
3074	2023-05-07 09:31:51.263664+00	129	5	24	27
3075	2023-05-07 09:31:51.263664+00	130	7	26	27
3076	2023-05-07 09:31:51.263664+00	131	9	27	27
3077	2023-05-07 09:31:51.263664+00	132	11	25	27
3078	2023-05-07 09:31:51.263664+00	133	13	23	27
3079	2023-05-07 09:31:51.263664+00	134	15	21	27
3080	2023-05-07 09:31:51.263664+00	135	17	19	27
3081	2023-05-07 09:31:51.263664+00	136	1	12	27
3082	2023-05-07 09:31:51.263664+00	137	10	14	27
3083	2023-05-07 09:31:51.263664+00	138	8	16	27
3084	2023-05-07 09:31:51.263664+00	139	6	18	27
3085	2023-05-07 09:31:51.263664+00	140	4	20	27
3086	2023-05-07 09:31:51.263664+00	141	2	22	27
3087	2023-05-07 09:31:51.263664+00	142	3	24	27
3088	2023-05-07 09:31:51.263664+00	143	5	26	27
3089	2023-05-07 09:31:51.263664+00	144	7	27	27
3090	2023-05-07 09:31:51.263664+00	145	9	25	27
3091	2023-05-07 09:31:51.263664+00	146	11	23	27
3092	2023-05-07 09:31:51.263664+00	147	13	21	27
3093	2023-05-07 09:31:51.263664+00	148	15	19	27
3094	2023-05-07 09:31:51.263664+00	149	1	17	27
3095	2023-05-07 09:31:51.263664+00	150	12	14	27
3096	2023-05-07 09:31:51.263664+00	151	10	16	27
3097	2023-05-07 09:31:51.263664+00	152	8	18	27
3098	2023-05-07 09:31:51.263664+00	153	6	20	27
3099	2023-05-07 09:31:51.263664+00	154	4	22	27
3100	2023-05-07 09:31:51.263664+00	155	2	24	27
3101	2023-05-07 09:31:51.263664+00	156	3	26	27
3102	2023-05-07 09:31:51.263664+00	157	5	27	27
3103	2023-05-07 09:31:51.263664+00	158	7	25	27
3104	2023-05-07 09:31:51.263664+00	159	9	23	27
3105	2023-05-07 09:31:51.263664+00	160	11	21	27
3106	2023-05-07 09:31:51.263664+00	161	13	19	27
3107	2023-05-07 09:31:51.263664+00	162	15	17	27
3108	2023-05-07 09:31:51.263664+00	163	1	14	27
3109	2023-05-07 09:31:51.263664+00	164	12	16	27
3110	2023-05-07 09:31:51.263664+00	165	10	18	27
3111	2023-05-07 09:31:51.263664+00	166	8	20	27
3112	2023-05-07 09:31:51.263664+00	167	6	22	27
3113	2023-05-07 09:31:51.263664+00	168	4	24	27
3114	2023-05-07 09:31:51.263664+00	169	2	26	27
3115	2023-05-07 09:31:51.263664+00	170	3	27	27
3116	2023-05-07 09:31:51.263664+00	171	5	25	27
3117	2023-05-07 09:31:51.263664+00	172	7	23	27
3118	2023-05-07 09:31:51.263664+00	173	9	21	27
3119	2023-05-07 09:31:51.263664+00	174	11	19	27
3120	2023-05-07 09:31:51.263664+00	175	13	17	27
3121	2023-05-07 09:31:51.263664+00	176	1	15	27
3122	2023-05-07 09:31:51.263664+00	177	14	16	27
3123	2023-05-07 09:31:51.263664+00	178	12	18	27
3124	2023-05-07 09:31:51.263664+00	179	10	20	27
3125	2023-05-07 09:31:51.263664+00	180	8	22	27
3126	2023-05-07 09:31:51.263664+00	181	6	24	27
3127	2023-05-07 09:31:51.263664+00	182	4	26	27
3128	2023-05-07 09:31:51.263664+00	183	2	27	27
3129	2023-05-07 09:31:51.263664+00	184	3	25	27
3130	2023-05-07 09:31:51.263664+00	185	5	23	27
3131	2023-05-07 09:31:51.263664+00	186	7	21	27
3132	2023-05-07 09:31:51.263664+00	187	9	19	27
3133	2023-05-07 09:31:51.263664+00	188	11	17	27
3134	2023-05-07 09:31:51.263664+00	189	13	15	27
3135	2023-05-07 09:31:51.263664+00	190	1	16	27
3136	2023-05-07 09:31:51.263664+00	191	14	18	27
3137	2023-05-07 09:31:51.263664+00	192	12	20	27
3138	2023-05-07 09:31:51.263664+00	193	10	22	27
3139	2023-05-07 09:31:51.263664+00	194	8	24	27
3140	2023-05-07 09:31:51.263664+00	195	6	26	27
3141	2023-05-07 09:31:51.263664+00	196	4	27	27
3142	2023-05-07 09:31:51.263664+00	197	2	25	27
3143	2023-05-07 09:31:51.263664+00	198	3	23	27
3144	2023-05-07 09:31:51.263664+00	199	5	21	27
3145	2023-05-07 09:31:51.263664+00	200	7	19	27
3146	2023-05-07 09:31:51.263664+00	201	9	17	27
3147	2023-05-07 09:31:51.263664+00	202	11	15	27
3148	2023-05-07 09:31:51.263664+00	203	1	13	27
3149	2023-05-07 09:31:51.263664+00	204	16	18	27
3150	2023-05-07 09:31:51.263664+00	205	14	20	27
3151	2023-05-07 09:31:51.263664+00	206	12	22	27
3152	2023-05-07 09:31:51.263664+00	207	10	24	27
3153	2023-05-07 09:31:51.263664+00	208	8	26	27
3154	2023-05-07 09:31:51.263664+00	209	6	27	27
3155	2023-05-07 09:31:51.263664+00	210	4	25	27
3156	2023-05-07 09:31:51.263664+00	211	2	23	27
3157	2023-05-07 09:31:51.263664+00	212	3	21	27
3158	2023-05-07 09:31:51.263664+00	213	5	19	27
3159	2023-05-07 09:31:51.263664+00	214	7	17	27
3160	2023-05-07 09:31:51.263664+00	215	9	15	27
3161	2023-05-07 09:31:51.263664+00	216	11	13	27
3162	2023-05-07 09:31:51.263664+00	217	1	18	27
3163	2023-05-07 09:31:51.263664+00	218	16	20	27
3164	2023-05-07 09:31:51.263664+00	219	14	22	27
3165	2023-05-07 09:31:51.263664+00	220	12	24	27
3166	2023-05-07 09:31:51.263664+00	221	10	26	27
3167	2023-05-07 09:31:51.263664+00	222	8	27	27
3168	2023-05-07 09:31:51.263664+00	223	6	25	27
3169	2023-05-07 09:31:51.263664+00	224	4	23	27
3170	2023-05-07 09:31:51.263664+00	225	2	21	27
3171	2023-05-07 09:31:51.263664+00	226	3	19	27
3172	2023-05-07 09:31:51.263664+00	227	5	17	27
3173	2023-05-07 09:31:51.263664+00	228	7	15	27
3174	2023-05-07 09:31:51.263664+00	229	9	13	27
3175	2023-05-07 09:31:51.263664+00	230	1	11	27
3176	2023-05-07 09:31:51.263664+00	231	18	20	27
3177	2023-05-07 09:31:51.263664+00	232	16	22	27
3178	2023-05-07 09:31:51.263664+00	233	14	24	27
3179	2023-05-07 09:31:51.263664+00	234	12	26	27
3180	2023-05-07 09:31:51.263664+00	235	10	27	27
3181	2023-05-07 09:31:51.263664+00	236	8	25	27
3182	2023-05-07 09:31:51.263664+00	237	6	23	27
3183	2023-05-07 09:31:51.263664+00	238	4	21	27
3184	2023-05-07 09:31:51.263664+00	239	2	19	27
3185	2023-05-07 09:31:51.263664+00	240	3	17	27
3186	2023-05-07 09:31:51.263664+00	241	5	15	27
3187	2023-05-07 09:31:51.263664+00	242	7	13	27
3188	2023-05-07 09:31:51.263664+00	243	9	11	27
3189	2023-05-07 09:31:51.263664+00	244	1	20	27
3190	2023-05-07 09:31:51.263664+00	245	18	22	27
3191	2023-05-07 09:31:51.263664+00	246	16	24	27
3192	2023-05-07 09:31:51.263664+00	247	14	26	27
3193	2023-05-07 09:31:51.263664+00	248	12	27	27
3194	2023-05-07 09:31:51.263664+00	249	10	25	27
3195	2023-05-07 09:31:51.263664+00	250	8	23	27
3196	2023-05-07 09:31:51.263664+00	251	6	21	27
3197	2023-05-07 09:31:51.263664+00	252	4	19	27
3198	2023-05-07 09:31:51.263664+00	253	2	17	27
3199	2023-05-07 09:31:51.263664+00	254	3	15	27
3200	2023-05-07 09:31:51.263664+00	255	5	13	27
3201	2023-05-07 09:31:51.263664+00	256	7	11	27
3202	2023-05-07 09:31:51.263664+00	257	1	9	27
3203	2023-05-07 09:31:51.263664+00	258	20	22	27
3204	2023-05-07 09:31:51.263664+00	259	18	24	27
3205	2023-05-07 09:31:51.263664+00	260	16	26	27
3206	2023-05-07 09:31:51.263664+00	261	14	27	27
3207	2023-05-07 09:31:51.263664+00	262	12	25	27
3208	2023-05-07 09:31:51.263664+00	263	10	23	27
3209	2023-05-07 09:31:51.263664+00	264	8	21	27
3210	2023-05-07 09:31:51.263664+00	265	6	19	27
3211	2023-05-07 09:31:51.263664+00	266	4	17	27
3212	2023-05-07 09:31:51.263664+00	267	2	15	27
3213	2023-05-07 09:31:51.263664+00	268	3	13	27
3214	2023-05-07 09:31:51.263664+00	269	5	11	27
3215	2023-05-07 09:31:51.263664+00	270	7	9	27
3216	2023-05-07 09:31:51.263664+00	271	1	22	27
3217	2023-05-07 09:31:51.263664+00	272	20	24	27
3218	2023-05-07 09:31:51.263664+00	273	18	26	27
3219	2023-05-07 09:31:51.263664+00	274	16	27	27
3220	2023-05-07 09:31:51.263664+00	275	14	25	27
3221	2023-05-07 09:31:51.263664+00	276	12	23	27
3222	2023-05-07 09:31:51.263664+00	277	10	21	27
3223	2023-05-07 09:31:51.263664+00	278	8	19	27
3224	2023-05-07 09:31:51.263664+00	279	6	17	27
3225	2023-05-07 09:31:51.263664+00	280	4	15	27
3226	2023-05-07 09:31:51.263664+00	281	2	13	27
3227	2023-05-07 09:31:51.263664+00	282	3	11	27
3228	2023-05-07 09:31:51.263664+00	283	5	9	27
3229	2023-05-07 09:31:51.263664+00	284	1	7	27
3230	2023-05-07 09:31:51.263664+00	285	22	24	27
3231	2023-05-07 09:31:51.263664+00	286	20	26	27
3232	2023-05-07 09:31:51.263664+00	287	18	27	27
3233	2023-05-07 09:31:51.263664+00	288	16	25	27
3234	2023-05-07 09:31:51.263664+00	289	14	23	27
3235	2023-05-07 09:31:51.263664+00	290	12	21	27
3236	2023-05-07 09:31:51.263664+00	291	10	19	27
3237	2023-05-07 09:31:51.263664+00	292	8	17	27
3238	2023-05-07 09:31:51.263664+00	293	6	15	27
3239	2023-05-07 09:31:51.263664+00	294	4	13	27
3240	2023-05-07 09:31:51.263664+00	295	2	11	27
3241	2023-05-07 09:31:51.263664+00	296	3	9	27
3242	2023-05-07 09:31:51.263664+00	297	5	7	27
3243	2023-05-07 09:31:51.263664+00	298	1	24	27
3244	2023-05-07 09:31:51.263664+00	299	22	26	27
3245	2023-05-07 09:31:51.263664+00	300	20	27	27
3246	2023-05-07 09:31:51.263664+00	301	18	25	27
3247	2023-05-07 09:31:51.263664+00	302	16	23	27
3248	2023-05-07 09:31:51.263664+00	303	14	21	27
3249	2023-05-07 09:31:51.263664+00	304	12	19	27
3250	2023-05-07 09:31:51.263664+00	305	10	17	27
3251	2023-05-07 09:31:51.263664+00	306	8	15	27
3252	2023-05-07 09:31:51.263664+00	307	6	13	27
3253	2023-05-07 09:31:51.263664+00	308	4	11	27
3254	2023-05-07 09:31:51.263664+00	309	2	9	27
3255	2023-05-07 09:31:51.263664+00	310	3	7	27
3256	2023-05-07 09:31:51.263664+00	311	1	5	27
3257	2023-05-07 09:31:51.263664+00	312	24	26	27
3258	2023-05-07 09:31:51.263664+00	313	22	27	27
3259	2023-05-07 09:31:51.263664+00	314	20	25	27
3260	2023-05-07 09:31:51.263664+00	315	18	23	27
3261	2023-05-07 09:31:51.263664+00	316	16	21	27
3262	2023-05-07 09:31:51.263664+00	317	14	19	27
3263	2023-05-07 09:31:51.263664+00	318	12	17	27
3264	2023-05-07 09:31:51.263664+00	319	10	15	27
3265	2023-05-07 09:31:51.263664+00	320	8	13	27
3266	2023-05-07 09:31:51.263664+00	321	6	11	27
3267	2023-05-07 09:31:51.263664+00	322	4	9	27
3268	2023-05-07 09:31:51.263664+00	323	2	7	27
3269	2023-05-07 09:31:51.263664+00	324	3	5	27
3270	2023-05-07 09:31:51.263664+00	325	1	26	27
3271	2023-05-07 09:31:51.263664+00	326	24	27	27
3272	2023-05-07 09:31:51.263664+00	327	22	25	27
3273	2023-05-07 09:31:51.263664+00	328	20	23	27
3274	2023-05-07 09:31:51.263664+00	329	18	21	27
3275	2023-05-07 09:31:51.263664+00	330	16	19	27
3276	2023-05-07 09:31:51.263664+00	331	14	17	27
3277	2023-05-07 09:31:51.263664+00	332	12	15	27
3278	2023-05-07 09:31:51.263664+00	333	10	13	27
3279	2023-05-07 09:31:51.263664+00	334	8	11	27
3280	2023-05-07 09:31:51.263664+00	335	6	9	27
3281	2023-05-07 09:31:51.263664+00	336	4	7	27
3282	2023-05-07 09:31:51.263664+00	337	2	5	27
3283	2023-05-07 09:31:51.263664+00	338	1	3	27
3284	2023-05-07 09:31:51.263664+00	339	26	27	27
3285	2023-05-07 09:31:51.263664+00	340	24	25	27
3286	2023-05-07 09:31:51.263664+00	341	22	23	27
3287	2023-05-07 09:31:51.263664+00	342	20	21	27
3288	2023-05-07 09:31:51.263664+00	343	18	19	27
3289	2023-05-07 09:31:51.263664+00	344	16	17	27
3290	2023-05-07 09:31:51.263664+00	345	14	15	27
3291	2023-05-07 09:31:51.263664+00	346	12	13	27
3292	2023-05-07 09:31:51.263664+00	347	10	11	27
3293	2023-05-07 09:31:51.263664+00	348	8	9	27
3294	2023-05-07 09:31:51.263664+00	349	6	7	27
3295	2023-05-07 09:31:51.263664+00	350	4	5	27
3296	2023-05-07 09:31:51.263664+00	351	2	3	27
3297	2023-05-07 09:31:51.263664+00	1	1	2	28
3298	2023-05-07 09:31:51.263664+00	2	3	4	28
3299	2023-05-07 09:31:51.263664+00	3	5	6	28
3300	2023-05-07 09:31:51.263664+00	4	7	8	28
3301	2023-05-07 09:31:51.263664+00	5	9	10	28
3302	2023-05-07 09:31:51.263664+00	6	11	12	28
3303	2023-05-07 09:31:51.263664+00	7	13	14	28
3304	2023-05-07 09:31:51.263664+00	8	15	16	28
3305	2023-05-07 09:31:51.263664+00	9	17	18	28
3306	2023-05-07 09:31:51.263664+00	10	19	20	28
3307	2023-05-07 09:31:51.263664+00	11	21	22	28
3308	2023-05-07 09:31:51.263664+00	12	23	24	28
3309	2023-05-07 09:31:51.263664+00	13	25	26	28
3310	2023-05-07 09:31:51.263664+00	14	27	28	28
3311	2023-05-07 09:31:51.263664+00	15	1	4	28
3312	2023-05-07 09:31:51.263664+00	16	2	6	28
3313	2023-05-07 09:31:51.263664+00	17	3	8	28
3314	2023-05-07 09:31:51.263664+00	18	5	10	28
3315	2023-05-07 09:31:51.263664+00	19	7	12	28
3316	2023-05-07 09:31:51.263664+00	20	9	14	28
3317	2023-05-07 09:31:51.263664+00	21	11	16	28
3318	2023-05-07 09:31:51.263664+00	22	13	18	28
3319	2023-05-07 09:31:51.263664+00	23	15	20	28
3320	2023-05-07 09:31:51.263664+00	24	17	22	28
3321	2023-05-07 09:31:51.263664+00	25	19	24	28
3322	2023-05-07 09:31:51.263664+00	26	21	26	28
3323	2023-05-07 09:31:51.263664+00	27	23	28	28
3324	2023-05-07 09:31:51.263664+00	28	25	27	28
3325	2023-05-07 09:31:51.263664+00	29	1	6	28
3326	2023-05-07 09:31:51.263664+00	30	4	8	28
3327	2023-05-07 09:31:51.263664+00	31	2	10	28
3328	2023-05-07 09:31:51.263664+00	32	3	12	28
3329	2023-05-07 09:31:51.263664+00	33	5	14	28
3330	2023-05-07 09:31:51.263664+00	34	7	16	28
3331	2023-05-07 09:31:51.263664+00	35	9	18	28
3332	2023-05-07 09:31:51.263664+00	36	11	20	28
3333	2023-05-07 09:31:51.263664+00	37	13	22	28
3334	2023-05-07 09:31:51.263664+00	38	15	24	28
3335	2023-05-07 09:31:51.263664+00	39	17	26	28
3336	2023-05-07 09:31:51.263664+00	40	19	28	28
3337	2023-05-07 09:31:51.263664+00	41	21	27	28
3338	2023-05-07 09:31:51.263664+00	42	23	25	28
3339	2023-05-07 09:31:51.263664+00	43	1	8	28
3340	2023-05-07 09:31:51.263664+00	44	6	10	28
3341	2023-05-07 09:31:51.263664+00	45	4	12	28
3342	2023-05-07 09:31:51.263664+00	46	2	14	28
3343	2023-05-07 09:31:51.263664+00	47	3	16	28
3344	2023-05-07 09:31:51.263664+00	48	5	18	28
3345	2023-05-07 09:31:51.263664+00	49	7	20	28
3346	2023-05-07 09:31:51.263664+00	50	9	22	28
3347	2023-05-07 09:31:51.263664+00	51	11	24	28
3348	2023-05-07 09:31:51.263664+00	52	13	26	28
3349	2023-05-07 09:31:51.263664+00	53	15	28	28
3350	2023-05-07 09:31:51.263664+00	54	17	27	28
3351	2023-05-07 09:31:51.263664+00	55	19	25	28
3352	2023-05-07 09:31:51.263664+00	56	21	23	28
3353	2023-05-07 09:31:51.263664+00	57	1	10	28
3354	2023-05-07 09:31:51.263664+00	58	8	12	28
3355	2023-05-07 09:31:51.263664+00	59	6	14	28
3356	2023-05-07 09:31:51.263664+00	60	4	16	28
3357	2023-05-07 09:31:51.263664+00	61	2	18	28
3358	2023-05-07 09:31:51.263664+00	62	3	20	28
3359	2023-05-07 09:31:51.263664+00	63	5	22	28
3360	2023-05-07 09:31:51.263664+00	64	7	24	28
3361	2023-05-07 09:31:51.263664+00	65	9	26	28
3362	2023-05-07 09:31:51.263664+00	66	11	28	28
3363	2023-05-07 09:31:51.263664+00	67	13	27	28
3364	2023-05-07 09:31:51.263664+00	68	15	25	28
3365	2023-05-07 09:31:51.263664+00	69	17	23	28
3366	2023-05-07 09:31:51.263664+00	70	19	21	28
3367	2023-05-07 09:31:51.263664+00	71	1	12	28
3368	2023-05-07 09:31:51.263664+00	72	10	14	28
3369	2023-05-07 09:31:51.263664+00	73	8	16	28
3370	2023-05-07 09:31:51.263664+00	74	6	18	28
3371	2023-05-07 09:31:51.263664+00	75	4	20	28
3372	2023-05-07 09:31:51.263664+00	76	2	22	28
3373	2023-05-07 09:31:51.263664+00	77	3	24	28
3374	2023-05-07 09:31:51.263664+00	78	5	26	28
3375	2023-05-07 09:31:51.263664+00	79	7	28	28
3376	2023-05-07 09:31:51.263664+00	80	9	27	28
3377	2023-05-07 09:31:51.263664+00	81	11	25	28
3378	2023-05-07 09:31:51.263664+00	82	13	23	28
3379	2023-05-07 09:31:51.263664+00	83	15	21	28
3380	2023-05-07 09:31:51.263664+00	84	17	19	28
3381	2023-05-07 09:31:51.263664+00	85	1	14	28
3382	2023-05-07 09:31:51.263664+00	86	12	16	28
3383	2023-05-07 09:31:51.263664+00	87	10	18	28
3384	2023-05-07 09:31:51.263664+00	88	8	20	28
3385	2023-05-07 09:31:51.263664+00	89	6	22	28
3386	2023-05-07 09:31:51.263664+00	90	4	24	28
3387	2023-05-07 09:31:51.263664+00	91	2	26	28
3388	2023-05-07 09:31:51.263664+00	92	3	28	28
3389	2023-05-07 09:31:51.263664+00	93	5	27	28
3390	2023-05-07 09:31:51.263664+00	94	7	25	28
3391	2023-05-07 09:31:51.263664+00	95	9	23	28
3392	2023-05-07 09:31:51.263664+00	96	11	21	28
3393	2023-05-07 09:31:51.263664+00	97	13	19	28
3394	2023-05-07 09:31:51.263664+00	98	15	17	28
3395	2023-05-07 09:31:51.263664+00	99	1	16	28
3396	2023-05-07 09:31:51.263664+00	100	14	18	28
3397	2023-05-07 09:31:51.263664+00	101	12	20	28
3398	2023-05-07 09:31:51.263664+00	102	10	22	28
3399	2023-05-07 09:31:51.263664+00	103	8	24	28
3400	2023-05-07 09:31:51.263664+00	104	6	26	28
3401	2023-05-07 09:31:51.263664+00	105	4	28	28
3402	2023-05-07 09:31:51.263664+00	106	2	27	28
3403	2023-05-07 09:31:51.263664+00	107	3	25	28
3404	2023-05-07 09:31:51.263664+00	108	5	23	28
3405	2023-05-07 09:31:51.263664+00	109	7	21	28
3406	2023-05-07 09:31:51.263664+00	110	9	19	28
3407	2023-05-07 09:31:51.263664+00	111	11	17	28
3408	2023-05-07 09:31:51.263664+00	112	13	15	28
3409	2023-05-07 09:31:51.263664+00	113	1	18	28
3410	2023-05-07 09:31:51.263664+00	114	16	20	28
3411	2023-05-07 09:31:51.263664+00	115	14	22	28
3412	2023-05-07 09:31:51.263664+00	116	12	24	28
3413	2023-05-07 09:31:51.263664+00	117	10	26	28
3414	2023-05-07 09:31:51.263664+00	118	8	28	28
3415	2023-05-07 09:31:51.263664+00	119	6	27	28
3416	2023-05-07 09:31:51.263664+00	120	4	25	28
3417	2023-05-07 09:31:51.263664+00	121	2	23	28
3418	2023-05-07 09:31:51.263664+00	122	3	21	28
3419	2023-05-07 09:31:51.263664+00	123	5	19	28
3420	2023-05-07 09:31:51.263664+00	124	7	17	28
3421	2023-05-07 09:31:51.263664+00	125	9	15	28
3422	2023-05-07 09:31:51.263664+00	126	11	13	28
3423	2023-05-07 09:31:51.263664+00	127	1	20	28
3424	2023-05-07 09:31:51.263664+00	128	18	22	28
3425	2023-05-07 09:31:51.263664+00	129	16	24	28
3426	2023-05-07 09:31:51.263664+00	130	14	26	28
3427	2023-05-07 09:31:51.263664+00	131	12	28	28
3428	2023-05-07 09:31:51.263664+00	132	10	27	28
3429	2023-05-07 09:31:51.263664+00	133	8	25	28
3430	2023-05-07 09:31:51.263664+00	134	6	23	28
3431	2023-05-07 09:31:51.263664+00	135	4	21	28
3432	2023-05-07 09:31:51.263664+00	136	2	19	28
3433	2023-05-07 09:31:51.263664+00	137	3	17	28
3434	2023-05-07 09:31:51.263664+00	138	5	15	28
3435	2023-05-07 09:31:51.263664+00	139	7	13	28
3436	2023-05-07 09:31:51.263664+00	140	9	11	28
3437	2023-05-07 09:31:51.263664+00	141	1	22	28
3438	2023-05-07 09:31:51.263664+00	142	20	24	28
3439	2023-05-07 09:31:51.263664+00	143	18	26	28
3440	2023-05-07 09:31:51.263664+00	144	16	28	28
3441	2023-05-07 09:31:51.263664+00	145	14	27	28
3442	2023-05-07 09:31:51.263664+00	146	12	25	28
3443	2023-05-07 09:31:51.263664+00	147	10	23	28
3444	2023-05-07 09:31:51.263664+00	148	8	21	28
3445	2023-05-07 09:31:51.263664+00	149	6	19	28
3446	2023-05-07 09:31:51.263664+00	150	4	17	28
3447	2023-05-07 09:31:51.263664+00	151	2	15	28
3448	2023-05-07 09:31:51.263664+00	152	3	13	28
3449	2023-05-07 09:31:51.263664+00	153	5	11	28
3450	2023-05-07 09:31:51.263664+00	154	7	9	28
3451	2023-05-07 09:31:51.263664+00	155	1	24	28
3452	2023-05-07 09:31:51.263664+00	156	22	26	28
3453	2023-05-07 09:31:51.263664+00	157	20	28	28
3454	2023-05-07 09:31:51.263664+00	158	18	27	28
3455	2023-05-07 09:31:51.263664+00	159	16	25	28
3456	2023-05-07 09:31:51.263664+00	160	14	23	28
3457	2023-05-07 09:31:51.263664+00	161	12	21	28
3458	2023-05-07 09:31:51.263664+00	162	10	19	28
3459	2023-05-07 09:31:51.263664+00	163	8	17	28
3460	2023-05-07 09:31:51.263664+00	164	6	15	28
3461	2023-05-07 09:31:51.263664+00	165	4	13	28
3462	2023-05-07 09:31:51.263664+00	166	2	11	28
3463	2023-05-07 09:31:51.263664+00	167	3	9	28
3464	2023-05-07 09:31:51.263664+00	168	5	7	28
3465	2023-05-07 09:31:51.263664+00	169	1	26	28
3466	2023-05-07 09:31:51.263664+00	170	24	28	28
3467	2023-05-07 09:31:51.263664+00	171	22	27	28
3468	2023-05-07 09:31:51.263664+00	172	20	25	28
3469	2023-05-07 09:31:51.263664+00	173	18	23	28
3470	2023-05-07 09:31:51.263664+00	174	16	21	28
3471	2023-05-07 09:31:51.263664+00	175	14	19	28
3472	2023-05-07 09:31:51.263664+00	176	12	17	28
3473	2023-05-07 09:31:51.263664+00	177	10	15	28
3474	2023-05-07 09:31:51.263664+00	178	8	13	28
3475	2023-05-07 09:31:51.263664+00	179	6	11	28
3476	2023-05-07 09:31:51.263664+00	180	4	9	28
3477	2023-05-07 09:31:51.263664+00	181	2	7	28
3478	2023-05-07 09:31:51.263664+00	182	3	5	28
3479	2023-05-07 09:31:51.263664+00	183	1	28	28
3480	2023-05-07 09:31:51.263664+00	184	26	27	28
3481	2023-05-07 09:31:51.263664+00	185	24	25	28
3482	2023-05-07 09:31:51.263664+00	186	22	23	28
3483	2023-05-07 09:31:51.263664+00	187	20	21	28
3484	2023-05-07 09:31:51.263664+00	188	18	19	28
3485	2023-05-07 09:31:51.263664+00	189	16	17	28
3486	2023-05-07 09:31:51.263664+00	190	14	15	28
3487	2023-05-07 09:31:51.263664+00	191	12	13	28
3488	2023-05-07 09:31:51.263664+00	192	10	11	28
3489	2023-05-07 09:31:51.263664+00	193	8	9	28
3490	2023-05-07 09:31:51.263664+00	194	6	7	28
3491	2023-05-07 09:31:51.263664+00	195	4	5	28
3492	2023-05-07 09:31:51.263664+00	196	2	3	28
3493	2023-05-07 09:31:51.263664+00	197	1	27	28
3494	2023-05-07 09:31:51.263664+00	198	28	25	28
3495	2023-05-07 09:31:51.263664+00	199	26	23	28
3496	2023-05-07 09:31:51.263664+00	200	24	21	28
3497	2023-05-07 09:31:51.263664+00	201	22	19	28
3498	2023-05-07 09:31:51.263664+00	202	20	17	28
3499	2023-05-07 09:31:51.263664+00	203	18	15	28
3500	2023-05-07 09:31:51.263664+00	204	16	13	28
3501	2023-05-07 09:31:51.263664+00	205	14	11	28
3502	2023-05-07 09:31:51.263664+00	206	12	9	28
3503	2023-05-07 09:31:51.263664+00	207	10	7	28
3504	2023-05-07 09:31:51.263664+00	208	8	5	28
3505	2023-05-07 09:31:51.263664+00	209	6	3	28
3506	2023-05-07 09:31:51.263664+00	210	4	2	28
3507	2023-05-07 09:31:51.263664+00	211	1	25	28
3508	2023-05-07 09:31:51.263664+00	212	27	23	28
3509	2023-05-07 09:31:51.263664+00	213	28	21	28
3510	2023-05-07 09:31:51.263664+00	214	26	19	28
3511	2023-05-07 09:31:51.263664+00	215	24	17	28
3512	2023-05-07 09:31:51.263664+00	216	22	15	28
3513	2023-05-07 09:31:51.263664+00	217	20	13	28
3514	2023-05-07 09:31:51.263664+00	218	18	11	28
3515	2023-05-07 09:31:51.263664+00	219	16	9	28
3516	2023-05-07 09:31:51.263664+00	220	14	7	28
3517	2023-05-07 09:31:51.263664+00	221	12	5	28
3518	2023-05-07 09:31:51.263664+00	222	10	3	28
3519	2023-05-07 09:31:51.263664+00	223	8	2	28
3520	2023-05-07 09:31:51.263664+00	224	6	4	28
3521	2023-05-07 09:31:51.263664+00	225	1	23	28
3522	2023-05-07 09:31:51.263664+00	226	25	21	28
3523	2023-05-07 09:31:51.263664+00	227	27	19	28
3524	2023-05-07 09:31:51.263664+00	228	28	17	28
3525	2023-05-07 09:31:51.263664+00	229	26	15	28
3526	2023-05-07 09:31:51.263664+00	230	24	13	28
3527	2023-05-07 09:31:51.263664+00	231	22	11	28
3528	2023-05-07 09:31:51.263664+00	232	20	9	28
3529	2023-05-07 09:31:51.263664+00	233	18	7	28
3530	2023-05-07 09:31:51.263664+00	234	16	5	28
3531	2023-05-07 09:31:51.263664+00	235	14	3	28
3532	2023-05-07 09:31:51.263664+00	236	12	2	28
3533	2023-05-07 09:31:51.263664+00	237	10	4	28
3534	2023-05-07 09:31:51.263664+00	238	8	6	28
3535	2023-05-07 09:31:51.263664+00	239	1	21	28
3536	2023-05-07 09:31:51.263664+00	240	23	19	28
3537	2023-05-07 09:31:51.263664+00	241	25	17	28
3538	2023-05-07 09:31:51.263664+00	242	27	15	28
3539	2023-05-07 09:31:51.263664+00	243	28	13	28
3540	2023-05-07 09:31:51.263664+00	244	26	11	28
3541	2023-05-07 09:31:51.263664+00	245	24	9	28
3542	2023-05-07 09:31:51.263664+00	246	22	7	28
3543	2023-05-07 09:31:51.263664+00	247	20	5	28
3544	2023-05-07 09:31:51.263664+00	248	18	3	28
3545	2023-05-07 09:31:51.263664+00	249	16	2	28
3546	2023-05-07 09:31:51.263664+00	250	14	4	28
3547	2023-05-07 09:31:51.263664+00	251	12	6	28
3548	2023-05-07 09:31:51.263664+00	252	10	8	28
3549	2023-05-07 09:31:51.263664+00	253	1	19	28
3550	2023-05-07 09:31:51.263664+00	254	21	17	28
3551	2023-05-07 09:31:51.263664+00	255	23	15	28
3552	2023-05-07 09:31:51.263664+00	256	25	13	28
3553	2023-05-07 09:31:51.263664+00	257	27	11	28
3554	2023-05-07 09:31:51.263664+00	258	28	9	28
3555	2023-05-07 09:31:51.263664+00	259	26	7	28
3556	2023-05-07 09:31:51.263664+00	260	24	5	28
3557	2023-05-07 09:31:51.263664+00	261	22	3	28
3558	2023-05-07 09:31:51.263664+00	262	20	2	28
3559	2023-05-07 09:31:51.263664+00	263	18	4	28
3560	2023-05-07 09:31:51.263664+00	264	16	6	28
3561	2023-05-07 09:31:51.263664+00	265	14	8	28
3562	2023-05-07 09:31:51.263664+00	266	12	10	28
3563	2023-05-07 09:31:51.263664+00	267	1	17	28
3564	2023-05-07 09:31:51.263664+00	268	19	15	28
3565	2023-05-07 09:31:51.263664+00	269	21	13	28
3566	2023-05-07 09:31:51.263664+00	270	23	11	28
3567	2023-05-07 09:31:51.263664+00	271	25	9	28
3568	2023-05-07 09:31:51.263664+00	272	27	7	28
3569	2023-05-07 09:31:51.263664+00	273	28	5	28
3570	2023-05-07 09:31:51.263664+00	274	26	3	28
3571	2023-05-07 09:31:51.263664+00	275	24	2	28
3572	2023-05-07 09:31:51.263664+00	276	22	4	28
3573	2023-05-07 09:31:51.263664+00	277	20	6	28
3574	2023-05-07 09:31:51.263664+00	278	18	8	28
3575	2023-05-07 09:31:51.263664+00	279	16	10	28
3576	2023-05-07 09:31:51.263664+00	280	14	12	28
3577	2023-05-07 09:31:51.263664+00	281	1	15	28
3578	2023-05-07 09:31:51.263664+00	282	17	13	28
3579	2023-05-07 09:31:51.263664+00	283	19	11	28
3580	2023-05-07 09:31:51.263664+00	284	21	9	28
3581	2023-05-07 09:31:51.263664+00	285	23	7	28
3582	2023-05-07 09:31:51.263664+00	286	25	5	28
3583	2023-05-07 09:31:51.263664+00	287	27	3	28
3584	2023-05-07 09:31:51.263664+00	288	28	2	28
3585	2023-05-07 09:31:51.263664+00	289	26	4	28
3586	2023-05-07 09:31:51.263664+00	290	24	6	28
3587	2023-05-07 09:31:51.263664+00	291	22	8	28
3588	2023-05-07 09:31:51.263664+00	292	20	10	28
3589	2023-05-07 09:31:51.263664+00	293	18	12	28
3590	2023-05-07 09:31:51.263664+00	294	16	14	28
3591	2023-05-07 09:31:51.263664+00	295	1	13	28
3592	2023-05-07 09:31:51.263664+00	296	15	11	28
3593	2023-05-07 09:31:51.263664+00	297	17	9	28
3594	2023-05-07 09:31:51.263664+00	298	19	7	28
3595	2023-05-07 09:31:51.263664+00	299	21	5	28
3596	2023-05-07 09:31:51.263664+00	300	23	3	28
3597	2023-05-07 09:31:51.263664+00	301	25	2	28
3598	2023-05-07 09:31:51.263664+00	302	27	4	28
3599	2023-05-07 09:31:51.263664+00	303	28	6	28
3600	2023-05-07 09:31:51.263664+00	304	26	8	28
3601	2023-05-07 09:31:51.263664+00	305	24	10	28
3602	2023-05-07 09:31:51.263664+00	306	22	12	28
3603	2023-05-07 09:31:51.263664+00	307	20	14	28
3604	2023-05-07 09:31:51.263664+00	308	18	16	28
3605	2023-05-07 09:31:51.263664+00	309	1	11	28
3606	2023-05-07 09:31:51.263664+00	310	13	9	28
3607	2023-05-07 09:31:51.263664+00	311	15	7	28
3608	2023-05-07 09:31:51.263664+00	312	17	5	28
3609	2023-05-07 09:31:51.263664+00	313	19	3	28
3610	2023-05-07 09:31:51.263664+00	314	21	2	28
3611	2023-05-07 09:31:51.263664+00	315	23	4	28
3612	2023-05-07 09:31:51.263664+00	316	25	6	28
3613	2023-05-07 09:31:51.263664+00	317	27	8	28
3614	2023-05-07 09:31:51.263664+00	318	28	10	28
3615	2023-05-07 09:31:51.263664+00	319	26	12	28
3616	2023-05-07 09:31:51.263664+00	320	24	14	28
3617	2023-05-07 09:31:51.263664+00	321	22	16	28
3618	2023-05-07 09:31:51.263664+00	322	20	18	28
3619	2023-05-07 09:31:51.263664+00	323	1	9	28
3620	2023-05-07 09:31:51.263664+00	324	11	7	28
3621	2023-05-07 09:31:51.263664+00	325	13	5	28
3622	2023-05-07 09:31:51.263664+00	326	15	3	28
3623	2023-05-07 09:31:51.263664+00	327	17	2	28
3624	2023-05-07 09:31:51.263664+00	328	19	4	28
3625	2023-05-07 09:31:51.263664+00	329	21	6	28
3626	2023-05-07 09:31:51.263664+00	330	23	8	28
3627	2023-05-07 09:31:51.263664+00	331	25	10	28
3628	2023-05-07 09:31:51.263664+00	332	27	12	28
3629	2023-05-07 09:31:51.263664+00	333	28	14	28
3630	2023-05-07 09:31:51.263664+00	334	26	16	28
3631	2023-05-07 09:31:51.263664+00	335	24	18	28
3632	2023-05-07 09:31:51.263664+00	336	22	20	28
3633	2023-05-07 09:31:51.263664+00	337	1	7	28
3634	2023-05-07 09:31:51.263664+00	338	9	5	28
3635	2023-05-07 09:31:51.263664+00	339	11	3	28
3636	2023-05-07 09:31:51.263664+00	340	13	2	28
3637	2023-05-07 09:31:51.263664+00	341	15	4	28
3638	2023-05-07 09:31:51.263664+00	342	17	6	28
3639	2023-05-07 09:31:51.263664+00	343	19	8	28
3640	2023-05-07 09:31:51.263664+00	344	21	10	28
3641	2023-05-07 09:31:51.263664+00	345	23	12	28
3642	2023-05-07 09:31:51.263664+00	346	25	14	28
3643	2023-05-07 09:31:51.263664+00	347	27	16	28
3644	2023-05-07 09:31:51.263664+00	348	28	18	28
3645	2023-05-07 09:31:51.263664+00	349	26	20	28
3646	2023-05-07 09:31:51.263664+00	350	24	22	28
3647	2023-05-07 09:31:51.263664+00	351	1	5	28
3648	2023-05-07 09:31:51.263664+00	352	7	3	28
3649	2023-05-07 09:31:51.263664+00	353	9	2	28
3650	2023-05-07 09:31:51.263664+00	354	11	4	28
3651	2023-05-07 09:31:51.263664+00	355	13	6	28
3652	2023-05-07 09:31:51.263664+00	356	15	8	28
3653	2023-05-07 09:31:51.263664+00	357	17	10	28
3654	2023-05-07 09:31:51.263664+00	358	19	12	28
3655	2023-05-07 09:31:51.263664+00	359	21	14	28
3656	2023-05-07 09:31:51.263664+00	360	23	16	28
3657	2023-05-07 09:31:51.263664+00	361	25	18	28
3658	2023-05-07 09:31:51.263664+00	362	27	20	28
3659	2023-05-07 09:31:51.263664+00	363	28	22	28
3660	2023-05-07 09:31:51.263664+00	364	26	24	28
3661	2023-05-07 09:31:51.263664+00	365	1	3	28
3662	2023-05-07 09:31:51.263664+00	366	5	2	28
3663	2023-05-07 09:31:51.263664+00	367	7	4	28
3664	2023-05-07 09:31:51.263664+00	368	9	6	28
3665	2023-05-07 09:31:51.263664+00	369	11	8	28
3666	2023-05-07 09:31:51.263664+00	370	13	10	28
3667	2023-05-07 09:31:51.263664+00	371	15	12	28
3668	2023-05-07 09:31:51.263664+00	372	17	14	28
3669	2023-05-07 09:31:51.263664+00	373	19	16	28
3670	2023-05-07 09:31:51.263664+00	374	21	18	28
3671	2023-05-07 09:31:51.263664+00	375	23	20	28
3672	2023-05-07 09:31:51.263664+00	376	25	22	28
3673	2023-05-07 09:31:51.263664+00	377	27	24	28
3674	2023-05-07 09:31:51.263664+00	378	28	26	28
3675	2023-05-07 09:31:51.263664+00	1	1	2	29
3676	2023-05-07 09:31:51.263664+00	2	3	4	29
3677	2023-05-07 09:31:51.263664+00	3	5	6	29
3678	2023-05-07 09:31:51.263664+00	4	7	8	29
3679	2023-05-07 09:31:51.263664+00	5	9	10	29
3680	2023-05-07 09:31:51.263664+00	6	11	12	29
3681	2023-05-07 09:31:51.263664+00	7	13	14	29
3682	2023-05-07 09:31:51.263664+00	8	15	16	29
3683	2023-05-07 09:31:51.263664+00	9	17	18	29
3684	2023-05-07 09:31:51.263664+00	10	19	20	29
3685	2023-05-07 09:31:51.263664+00	11	21	22	29
3686	2023-05-07 09:31:51.263664+00	12	23	24	29
3687	2023-05-07 09:31:51.263664+00	13	25	26	29
3688	2023-05-07 09:31:51.263664+00	14	27	28	29
3689	2023-05-07 09:31:51.263664+00	15	1	29	29
3690	2023-05-07 09:31:51.263664+00	16	2	4	29
3691	2023-05-07 09:31:51.263664+00	17	3	6	29
3692	2023-05-07 09:31:51.263664+00	18	5	8	29
3693	2023-05-07 09:31:51.263664+00	19	7	10	29
3694	2023-05-07 09:31:51.263664+00	20	9	12	29
3695	2023-05-07 09:31:51.263664+00	21	11	14	29
3696	2023-05-07 09:31:51.263664+00	22	13	16	29
3697	2023-05-07 09:31:51.263664+00	23	15	18	29
3698	2023-05-07 09:31:51.263664+00	24	17	20	29
3699	2023-05-07 09:31:51.263664+00	25	19	22	29
3700	2023-05-07 09:31:51.263664+00	26	21	24	29
3701	2023-05-07 09:31:51.263664+00	27	23	26	29
3702	2023-05-07 09:31:51.263664+00	28	25	28	29
3703	2023-05-07 09:31:51.263664+00	29	27	29	29
3704	2023-05-07 09:31:51.263664+00	30	1	4	29
3705	2023-05-07 09:31:51.263664+00	31	2	6	29
3706	2023-05-07 09:31:51.263664+00	32	3	8	29
3707	2023-05-07 09:31:51.263664+00	33	5	10	29
3708	2023-05-07 09:31:51.263664+00	34	7	12	29
3709	2023-05-07 09:31:51.263664+00	35	9	14	29
3710	2023-05-07 09:31:51.263664+00	36	11	16	29
3711	2023-05-07 09:31:51.263664+00	37	13	18	29
3712	2023-05-07 09:31:51.263664+00	38	15	20	29
3713	2023-05-07 09:31:51.263664+00	39	17	22	29
3714	2023-05-07 09:31:51.263664+00	40	19	24	29
3715	2023-05-07 09:31:51.263664+00	41	21	26	29
3716	2023-05-07 09:31:51.263664+00	42	23	28	29
3717	2023-05-07 09:31:51.263664+00	43	25	29	29
3718	2023-05-07 09:31:51.263664+00	44	1	27	29
3719	2023-05-07 09:31:51.263664+00	45	4	6	29
3720	2023-05-07 09:31:51.263664+00	46	2	8	29
3721	2023-05-07 09:31:51.263664+00	47	3	10	29
3722	2023-05-07 09:31:51.263664+00	48	5	12	29
3723	2023-05-07 09:31:51.263664+00	49	7	14	29
3724	2023-05-07 09:31:51.263664+00	50	9	16	29
3725	2023-05-07 09:31:51.263664+00	51	11	18	29
3726	2023-05-07 09:31:51.263664+00	52	13	20	29
3727	2023-05-07 09:31:51.263664+00	53	15	22	29
3728	2023-05-07 09:31:51.263664+00	54	17	24	29
3729	2023-05-07 09:31:51.263664+00	55	19	26	29
3730	2023-05-07 09:31:51.263664+00	56	21	28	29
3731	2023-05-07 09:31:51.263664+00	57	23	29	29
3732	2023-05-07 09:31:51.263664+00	58	25	27	29
3733	2023-05-07 09:31:51.263664+00	59	1	6	29
3734	2023-05-07 09:31:51.263664+00	60	4	8	29
3735	2023-05-07 09:31:51.263664+00	61	2	10	29
3736	2023-05-07 09:31:51.263664+00	62	3	12	29
3737	2023-05-07 09:31:51.263664+00	63	5	14	29
3738	2023-05-07 09:31:51.263664+00	64	7	16	29
3739	2023-05-07 09:31:51.263664+00	65	9	18	29
3740	2023-05-07 09:31:51.263664+00	66	11	20	29
3741	2023-05-07 09:31:51.263664+00	67	13	22	29
3742	2023-05-07 09:31:51.263664+00	68	15	24	29
3743	2023-05-07 09:31:51.263664+00	69	17	26	29
3744	2023-05-07 09:31:51.263664+00	70	19	28	29
3745	2023-05-07 09:31:51.263664+00	71	21	29	29
3746	2023-05-07 09:31:51.263664+00	72	23	27	29
3747	2023-05-07 09:31:51.263664+00	73	1	25	29
3748	2023-05-07 09:31:51.263664+00	74	6	8	29
3749	2023-05-07 09:31:51.263664+00	75	4	10	29
3750	2023-05-07 09:31:51.263664+00	76	2	12	29
3751	2023-05-07 09:31:51.263664+00	77	3	14	29
3752	2023-05-07 09:31:51.263664+00	78	5	16	29
3753	2023-05-07 09:31:51.263664+00	79	7	18	29
3754	2023-05-07 09:31:51.263664+00	80	9	20	29
3755	2023-05-07 09:31:51.263664+00	81	11	22	29
3756	2023-05-07 09:31:51.263664+00	82	13	24	29
3757	2023-05-07 09:31:51.263664+00	83	15	26	29
3758	2023-05-07 09:31:51.263664+00	84	17	28	29
3759	2023-05-07 09:31:51.263664+00	85	19	29	29
3760	2023-05-07 09:31:51.263664+00	86	21	27	29
3761	2023-05-07 09:31:51.263664+00	87	23	25	29
3762	2023-05-07 09:31:51.263664+00	88	1	8	29
3763	2023-05-07 09:31:51.263664+00	89	6	10	29
3764	2023-05-07 09:31:51.263664+00	90	4	12	29
3765	2023-05-07 09:31:51.263664+00	91	2	14	29
3766	2023-05-07 09:31:51.263664+00	92	3	16	29
3767	2023-05-07 09:31:51.263664+00	93	5	18	29
3768	2023-05-07 09:31:51.263664+00	94	7	20	29
3769	2023-05-07 09:31:51.263664+00	95	9	22	29
3770	2023-05-07 09:31:51.263664+00	96	11	24	29
3771	2023-05-07 09:31:51.263664+00	97	13	26	29
3772	2023-05-07 09:31:51.263664+00	98	15	28	29
3773	2023-05-07 09:31:51.263664+00	99	17	29	29
3774	2023-05-07 09:31:51.263664+00	100	19	27	29
3775	2023-05-07 09:31:51.263664+00	101	21	25	29
3776	2023-05-07 09:31:51.263664+00	102	1	23	29
3777	2023-05-07 09:31:51.263664+00	103	8	10	29
3778	2023-05-07 09:31:51.263664+00	104	6	12	29
3779	2023-05-07 09:31:51.263664+00	105	4	14	29
3780	2023-05-07 09:31:51.263664+00	106	2	16	29
3781	2023-05-07 09:31:51.263664+00	107	3	18	29
3782	2023-05-07 09:31:51.263664+00	108	5	20	29
3783	2023-05-07 09:31:51.263664+00	109	7	22	29
3784	2023-05-07 09:31:51.263664+00	110	9	24	29
3785	2023-05-07 09:31:51.263664+00	111	11	26	29
3786	2023-05-07 09:31:51.263664+00	112	13	28	29
3787	2023-05-07 09:31:51.263664+00	113	15	29	29
3788	2023-05-07 09:31:51.263664+00	114	17	27	29
3789	2023-05-07 09:31:51.263664+00	115	19	25	29
3790	2023-05-07 09:31:51.263664+00	116	21	23	29
3791	2023-05-07 09:31:51.263664+00	117	1	10	29
3792	2023-05-07 09:31:51.263664+00	118	8	12	29
3793	2023-05-07 09:31:51.263664+00	119	6	14	29
3794	2023-05-07 09:31:51.263664+00	120	4	16	29
3795	2023-05-07 09:31:51.263664+00	121	2	18	29
3796	2023-05-07 09:31:51.263664+00	122	3	20	29
3797	2023-05-07 09:31:51.263664+00	123	5	22	29
3798	2023-05-07 09:31:51.263664+00	124	7	24	29
3799	2023-05-07 09:31:51.263664+00	125	9	26	29
3800	2023-05-07 09:31:51.263664+00	126	11	28	29
3801	2023-05-07 09:31:51.263664+00	127	13	29	29
3802	2023-05-07 09:31:51.263664+00	128	15	27	29
3803	2023-05-07 09:31:51.263664+00	129	17	25	29
3804	2023-05-07 09:31:51.263664+00	130	19	23	29
3805	2023-05-07 09:31:51.263664+00	131	1	21	29
3806	2023-05-07 09:31:51.263664+00	132	10	12	29
3807	2023-05-07 09:31:51.263664+00	133	8	14	29
3808	2023-05-07 09:31:51.263664+00	134	6	16	29
3809	2023-05-07 09:31:51.263664+00	135	4	18	29
3810	2023-05-07 09:31:51.263664+00	136	2	20	29
3811	2023-05-07 09:31:51.263664+00	137	3	22	29
3812	2023-05-07 09:31:51.263664+00	138	5	24	29
3813	2023-05-07 09:31:51.263664+00	139	7	26	29
3814	2023-05-07 09:31:51.263664+00	140	9	28	29
3815	2023-05-07 09:31:51.263664+00	141	11	29	29
3816	2023-05-07 09:31:51.263664+00	142	13	27	29
3817	2023-05-07 09:31:51.263664+00	143	15	25	29
3818	2023-05-07 09:31:51.263664+00	144	17	23	29
3819	2023-05-07 09:31:51.263664+00	145	19	21	29
3820	2023-05-07 09:31:51.263664+00	146	1	12	29
3821	2023-05-07 09:31:51.263664+00	147	10	14	29
3822	2023-05-07 09:31:51.263664+00	148	8	16	29
3823	2023-05-07 09:31:51.263664+00	149	6	18	29
3824	2023-05-07 09:31:51.263664+00	150	4	20	29
3825	2023-05-07 09:31:51.263664+00	151	2	22	29
3826	2023-05-07 09:31:51.263664+00	152	3	24	29
3827	2023-05-07 09:31:51.263664+00	153	5	26	29
3828	2023-05-07 09:31:51.263664+00	154	7	28	29
3829	2023-05-07 09:31:51.263664+00	155	9	29	29
3830	2023-05-07 09:31:51.263664+00	156	11	27	29
3831	2023-05-07 09:31:51.263664+00	157	13	25	29
3832	2023-05-07 09:31:51.263664+00	158	15	23	29
3833	2023-05-07 09:31:51.263664+00	159	17	21	29
3834	2023-05-07 09:31:51.263664+00	160	1	19	29
3835	2023-05-07 09:31:51.263664+00	161	12	14	29
3836	2023-05-07 09:31:51.263664+00	162	10	16	29
3837	2023-05-07 09:31:51.263664+00	163	8	18	29
3838	2023-05-07 09:31:51.263664+00	164	6	20	29
3839	2023-05-07 09:31:51.263664+00	165	4	22	29
3840	2023-05-07 09:31:51.263664+00	166	2	24	29
3841	2023-05-07 09:31:51.263664+00	167	3	26	29
3842	2023-05-07 09:31:51.263664+00	168	5	28	29
3843	2023-05-07 09:31:51.263664+00	169	7	29	29
3844	2023-05-07 09:31:51.263664+00	170	9	27	29
3845	2023-05-07 09:31:51.263664+00	171	11	25	29
3846	2023-05-07 09:31:51.263664+00	172	13	23	29
3847	2023-05-07 09:31:51.263664+00	173	15	21	29
3848	2023-05-07 09:31:51.263664+00	174	17	19	29
3849	2023-05-07 09:31:51.263664+00	175	1	14	29
3850	2023-05-07 09:31:51.263664+00	176	12	16	29
3851	2023-05-07 09:31:51.263664+00	177	10	18	29
3852	2023-05-07 09:31:51.263664+00	178	8	20	29
3853	2023-05-07 09:31:51.263664+00	179	6	22	29
3854	2023-05-07 09:31:51.263664+00	180	4	24	29
3855	2023-05-07 09:31:51.263664+00	181	2	26	29
3856	2023-05-07 09:31:51.263664+00	182	3	28	29
3857	2023-05-07 09:31:51.263664+00	183	5	29	29
3858	2023-05-07 09:31:51.263664+00	184	7	27	29
3859	2023-05-07 09:31:51.263664+00	185	9	25	29
3860	2023-05-07 09:31:51.263664+00	186	11	23	29
3861	2023-05-07 09:31:51.263664+00	187	13	21	29
3862	2023-05-07 09:31:51.263664+00	188	15	19	29
3863	2023-05-07 09:31:51.263664+00	189	1	17	29
3864	2023-05-07 09:31:51.263664+00	190	14	16	29
3865	2023-05-07 09:31:51.263664+00	191	12	18	29
3866	2023-05-07 09:31:51.263664+00	192	10	20	29
3867	2023-05-07 09:31:51.263664+00	193	8	22	29
3868	2023-05-07 09:31:51.263664+00	194	6	24	29
3869	2023-05-07 09:31:51.263664+00	195	4	26	29
3870	2023-05-07 09:31:51.263664+00	196	2	28	29
3871	2023-05-07 09:31:51.263664+00	197	3	29	29
3872	2023-05-07 09:31:51.263664+00	198	5	27	29
3873	2023-05-07 09:31:51.263664+00	199	7	25	29
3874	2023-05-07 09:31:51.263664+00	200	9	23	29
3875	2023-05-07 09:31:51.263664+00	201	11	21	29
3876	2023-05-07 09:31:51.263664+00	202	13	19	29
3877	2023-05-07 09:31:51.263664+00	203	15	17	29
3878	2023-05-07 09:31:51.263664+00	204	1	16	29
3879	2023-05-07 09:31:51.263664+00	205	14	18	29
3880	2023-05-07 09:31:51.263664+00	206	12	20	29
3881	2023-05-07 09:31:51.263664+00	207	10	22	29
3882	2023-05-07 09:31:51.263664+00	208	8	24	29
3883	2023-05-07 09:31:51.263664+00	209	6	26	29
3884	2023-05-07 09:31:51.263664+00	210	4	28	29
3885	2023-05-07 09:31:51.263664+00	211	2	29	29
3886	2023-05-07 09:31:51.263664+00	212	3	27	29
3887	2023-05-07 09:31:51.263664+00	213	5	25	29
3888	2023-05-07 09:31:51.263664+00	214	7	23	29
3889	2023-05-07 09:31:51.263664+00	215	9	21	29
3890	2023-05-07 09:31:51.263664+00	216	11	19	29
3891	2023-05-07 09:31:51.263664+00	217	13	17	29
3892	2023-05-07 09:31:51.263664+00	218	1	15	29
3893	2023-05-07 09:31:51.263664+00	219	16	18	29
3894	2023-05-07 09:31:51.263664+00	220	14	20	29
3895	2023-05-07 09:31:51.263664+00	221	12	22	29
3896	2023-05-07 09:31:51.263664+00	222	10	24	29
3897	2023-05-07 09:31:51.263664+00	223	8	26	29
3898	2023-05-07 09:31:51.263664+00	224	6	28	29
3899	2023-05-07 09:31:51.263664+00	225	4	29	29
3900	2023-05-07 09:31:51.263664+00	226	2	27	29
3901	2023-05-07 09:31:51.263664+00	227	3	25	29
3902	2023-05-07 09:31:51.263664+00	228	5	23	29
3903	2023-05-07 09:31:51.263664+00	229	7	21	29
3904	2023-05-07 09:31:51.263664+00	230	9	19	29
3905	2023-05-07 09:31:51.263664+00	231	11	17	29
3906	2023-05-07 09:31:51.263664+00	232	13	15	29
3907	2023-05-07 09:31:51.263664+00	233	1	18	29
3908	2023-05-07 09:31:51.263664+00	234	16	20	29
3909	2023-05-07 09:31:51.263664+00	235	14	22	29
3910	2023-05-07 09:31:51.263664+00	236	12	24	29
3911	2023-05-07 09:31:51.263664+00	237	10	26	29
3912	2023-05-07 09:31:51.263664+00	238	8	28	29
3913	2023-05-07 09:31:51.263664+00	239	6	29	29
3914	2023-05-07 09:31:51.263664+00	240	4	27	29
3915	2023-05-07 09:31:51.263664+00	241	2	25	29
3916	2023-05-07 09:31:51.263664+00	242	3	23	29
3917	2023-05-07 09:31:51.263664+00	243	5	21	29
3918	2023-05-07 09:31:51.263664+00	244	7	19	29
3919	2023-05-07 09:31:51.263664+00	245	9	17	29
3920	2023-05-07 09:31:51.263664+00	246	11	15	29
3921	2023-05-07 09:31:51.263664+00	247	1	13	29
3922	2023-05-07 09:31:51.263664+00	248	18	20	29
3923	2023-05-07 09:31:51.263664+00	249	16	22	29
3924	2023-05-07 09:31:51.263664+00	250	14	24	29
3925	2023-05-07 09:31:51.263664+00	251	12	26	29
3926	2023-05-07 09:31:51.263664+00	252	10	28	29
3927	2023-05-07 09:31:51.263664+00	253	8	29	29
3928	2023-05-07 09:31:51.263664+00	254	6	27	29
3929	2023-05-07 09:31:51.263664+00	255	4	25	29
3930	2023-05-07 09:31:51.263664+00	256	2	23	29
3931	2023-05-07 09:31:51.263664+00	257	3	21	29
3932	2023-05-07 09:31:51.263664+00	258	5	19	29
3933	2023-05-07 09:31:51.263664+00	259	7	17	29
3934	2023-05-07 09:31:51.263664+00	260	9	15	29
3935	2023-05-07 09:31:51.263664+00	261	11	13	29
3936	2023-05-07 09:31:51.263664+00	262	1	20	29
3937	2023-05-07 09:31:51.263664+00	263	18	22	29
3938	2023-05-07 09:31:51.263664+00	264	16	24	29
3939	2023-05-07 09:31:51.263664+00	265	14	26	29
3940	2023-05-07 09:31:51.263664+00	266	12	28	29
3941	2023-05-07 09:31:51.263664+00	267	10	29	29
3942	2023-05-07 09:31:51.263664+00	268	8	27	29
3943	2023-05-07 09:31:51.263664+00	269	6	25	29
3944	2023-05-07 09:31:51.263664+00	270	4	23	29
3945	2023-05-07 09:31:51.263664+00	271	2	21	29
3946	2023-05-07 09:31:51.263664+00	272	3	19	29
3947	2023-05-07 09:31:51.263664+00	273	5	17	29
3948	2023-05-07 09:31:51.263664+00	274	7	15	29
3949	2023-05-07 09:31:51.263664+00	275	9	13	29
3950	2023-05-07 09:31:51.263664+00	276	1	11	29
3951	2023-05-07 09:31:51.263664+00	277	20	22	29
3952	2023-05-07 09:31:51.263664+00	278	18	24	29
3953	2023-05-07 09:31:51.263664+00	279	16	26	29
3954	2023-05-07 09:31:51.263664+00	280	14	28	29
3955	2023-05-07 09:31:51.263664+00	281	12	29	29
3956	2023-05-07 09:31:51.263664+00	282	10	27	29
3957	2023-05-07 09:31:51.263664+00	283	8	25	29
3958	2023-05-07 09:31:51.263664+00	284	6	23	29
3959	2023-05-07 09:31:51.263664+00	285	4	21	29
3960	2023-05-07 09:31:51.263664+00	286	2	19	29
3961	2023-05-07 09:31:51.263664+00	287	3	17	29
3962	2023-05-07 09:31:51.263664+00	288	5	15	29
3963	2023-05-07 09:31:51.263664+00	289	7	13	29
3964	2023-05-07 09:31:51.263664+00	290	9	11	29
3965	2023-05-07 09:31:51.263664+00	291	1	22	29
3966	2023-05-07 09:31:51.263664+00	292	20	24	29
3967	2023-05-07 09:31:51.263664+00	293	18	26	29
3968	2023-05-07 09:31:51.263664+00	294	16	28	29
3969	2023-05-07 09:31:51.263664+00	295	14	29	29
3970	2023-05-07 09:31:51.263664+00	296	12	27	29
3971	2023-05-07 09:31:51.263664+00	297	10	25	29
3972	2023-05-07 09:31:51.263664+00	298	8	23	29
3973	2023-05-07 09:31:51.263664+00	299	6	21	29
3974	2023-05-07 09:31:51.263664+00	300	4	19	29
3975	2023-05-07 09:31:51.263664+00	301	2	17	29
3976	2023-05-07 09:31:51.263664+00	302	3	15	29
3977	2023-05-07 09:31:51.263664+00	303	5	13	29
3978	2023-05-07 09:31:51.263664+00	304	7	11	29
3979	2023-05-07 09:31:51.263664+00	305	1	9	29
3980	2023-05-07 09:31:51.263664+00	306	22	24	29
3981	2023-05-07 09:31:51.263664+00	307	20	26	29
3982	2023-05-07 09:31:51.263664+00	308	18	28	29
3983	2023-05-07 09:31:51.263664+00	309	16	29	29
3984	2023-05-07 09:31:51.263664+00	310	14	27	29
3985	2023-05-07 09:31:51.263664+00	311	12	25	29
3986	2023-05-07 09:31:51.263664+00	312	10	23	29
3987	2023-05-07 09:31:51.263664+00	313	8	21	29
3988	2023-05-07 09:31:51.263664+00	314	6	19	29
3989	2023-05-07 09:31:51.263664+00	315	4	17	29
3990	2023-05-07 09:31:51.263664+00	316	2	15	29
3991	2023-05-07 09:31:51.263664+00	317	3	13	29
3992	2023-05-07 09:31:51.263664+00	318	5	11	29
3993	2023-05-07 09:31:51.263664+00	319	7	9	29
3994	2023-05-07 09:31:51.263664+00	320	1	24	29
3995	2023-05-07 09:31:51.263664+00	321	22	26	29
3996	2023-05-07 09:31:51.263664+00	322	20	28	29
3997	2023-05-07 09:31:51.263664+00	323	18	29	29
3998	2023-05-07 09:31:51.263664+00	324	16	27	29
3999	2023-05-07 09:31:51.263664+00	325	14	25	29
4000	2023-05-07 09:31:51.263664+00	326	12	23	29
4001	2023-05-07 09:31:51.263664+00	327	10	21	29
4002	2023-05-07 09:31:51.263664+00	328	8	19	29
4003	2023-05-07 09:31:51.263664+00	329	6	17	29
4004	2023-05-07 09:31:51.263664+00	330	4	15	29
4005	2023-05-07 09:31:51.263664+00	331	2	13	29
4006	2023-05-07 09:31:51.263664+00	332	3	11	29
4007	2023-05-07 09:31:51.263664+00	333	5	9	29
4008	2023-05-07 09:31:51.263664+00	334	1	7	29
4009	2023-05-07 09:31:51.263664+00	335	24	26	29
4010	2023-05-07 09:31:51.263664+00	336	22	28	29
4011	2023-05-07 09:31:51.263664+00	337	20	29	29
4012	2023-05-07 09:31:51.263664+00	338	18	27	29
4013	2023-05-07 09:31:51.263664+00	339	16	25	29
4014	2023-05-07 09:31:51.263664+00	340	14	23	29
4015	2023-05-07 09:31:51.263664+00	341	12	21	29
4016	2023-05-07 09:31:51.263664+00	342	10	19	29
4017	2023-05-07 09:31:51.263664+00	343	8	17	29
4018	2023-05-07 09:31:51.263664+00	344	6	15	29
4019	2023-05-07 09:31:51.263664+00	345	4	13	29
4020	2023-05-07 09:31:51.263664+00	346	2	11	29
4021	2023-05-07 09:31:51.263664+00	347	3	9	29
4022	2023-05-07 09:31:51.263664+00	348	5	7	29
4023	2023-05-07 09:31:51.263664+00	349	1	26	29
4024	2023-05-07 09:31:51.263664+00	350	24	28	29
4025	2023-05-07 09:31:51.263664+00	351	22	29	29
4026	2023-05-07 09:31:51.263664+00	352	20	27	29
4027	2023-05-07 09:31:51.263664+00	353	18	25	29
4028	2023-05-07 09:31:51.263664+00	354	16	23	29
4029	2023-05-07 09:31:51.263664+00	355	14	21	29
4030	2023-05-07 09:31:51.263664+00	356	12	19	29
4031	2023-05-07 09:31:51.263664+00	357	10	17	29
4032	2023-05-07 09:31:51.263664+00	358	8	15	29
4033	2023-05-07 09:31:51.263664+00	359	6	13	29
4034	2023-05-07 09:31:51.263664+00	360	4	11	29
4035	2023-05-07 09:31:51.263664+00	361	2	9	29
4036	2023-05-07 09:31:51.263664+00	362	3	7	29
4037	2023-05-07 09:31:51.263664+00	363	1	5	29
4038	2023-05-07 09:31:51.263664+00	364	26	28	29
4039	2023-05-07 09:31:51.263664+00	365	24	29	29
4040	2023-05-07 09:31:51.263664+00	366	22	27	29
4041	2023-05-07 09:31:51.263664+00	367	20	25	29
4042	2023-05-07 09:31:51.263664+00	368	18	23	29
4043	2023-05-07 09:31:51.263664+00	369	16	21	29
4044	2023-05-07 09:31:51.263664+00	370	14	19	29
4045	2023-05-07 09:31:51.263664+00	371	12	17	29
4046	2023-05-07 09:31:51.263664+00	372	10	15	29
4047	2023-05-07 09:31:51.263664+00	373	8	13	29
4048	2023-05-07 09:31:51.263664+00	374	6	11	29
4049	2023-05-07 09:31:51.263664+00	375	4	9	29
4050	2023-05-07 09:31:51.263664+00	376	2	7	29
4051	2023-05-07 09:31:51.263664+00	377	3	5	29
4052	2023-05-07 09:31:51.263664+00	378	1	28	29
4053	2023-05-07 09:31:51.263664+00	379	26	29	29
4054	2023-05-07 09:31:51.263664+00	380	24	27	29
4055	2023-05-07 09:31:51.263664+00	381	22	25	29
4056	2023-05-07 09:31:51.263664+00	382	20	23	29
4057	2023-05-07 09:31:51.263664+00	383	18	21	29
4058	2023-05-07 09:31:51.263664+00	384	16	19	29
4059	2023-05-07 09:31:51.263664+00	385	14	17	29
4060	2023-05-07 09:31:51.263664+00	386	12	15	29
4061	2023-05-07 09:31:51.263664+00	387	10	13	29
4062	2023-05-07 09:31:51.263664+00	388	8	11	29
4063	2023-05-07 09:31:51.263664+00	389	6	9	29
4064	2023-05-07 09:31:51.263664+00	390	4	7	29
4065	2023-05-07 09:31:51.263664+00	391	2	5	29
4066	2023-05-07 09:31:51.263664+00	392	1	3	29
4067	2023-05-07 09:31:51.263664+00	393	28	29	29
4068	2023-05-07 09:31:51.263664+00	394	26	27	29
4069	2023-05-07 09:31:51.263664+00	395	24	25	29
4070	2023-05-07 09:31:51.263664+00	396	22	23	29
4071	2023-05-07 09:31:51.263664+00	397	20	21	29
4072	2023-05-07 09:31:51.263664+00	398	18	19	29
4073	2023-05-07 09:31:51.263664+00	399	16	17	29
4074	2023-05-07 09:31:51.263664+00	400	14	15	29
4075	2023-05-07 09:31:51.263664+00	401	12	13	29
4076	2023-05-07 09:31:51.263664+00	402	10	11	29
4077	2023-05-07 09:31:51.263664+00	403	8	9	29
4078	2023-05-07 09:31:51.263664+00	404	6	7	29
4079	2023-05-07 09:31:51.263664+00	405	4	5	29
4080	2023-05-07 09:31:51.263664+00	406	2	3	29
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, created_at, modified_at, loginid, login_type) FROM stdin;
7	2023-08-13 07:56:13.101781+00	2023-08-13 07:56:13.101781+00	Ufe9e746df649a4b36e12b70e87d30aa4	1
\.


--
-- Name: refresh_tokens_id_seq; Type: SEQUENCE SET; Schema: auth; Owner: supabase_auth_admin
--

SELECT pg_catalog.setval('auth.refresh_tokens_id_seq', 1, false);


--
-- Name: game_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_record_id_seq', 868, true);


--
-- Name: game_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.game_user_id_seq', 437, true);


--
-- Name: games_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.games_id_seq', 101, true);


--
-- Name: random_number_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.random_number_table_id_seq', 4080, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 78, true);


--
-- Name: mfa_amr_claims amr_id_pk; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT amr_id_pk PRIMARY KEY (id);


--
-- Name: audit_log_entries audit_log_entries_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.audit_log_entries
    ADD CONSTRAINT audit_log_entries_pkey PRIMARY KEY (id);


--
-- Name: flow_state flow_state_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.flow_state
    ADD CONSTRAINT flow_state_pkey PRIMARY KEY (id);


--
-- Name: identities identities_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_pkey PRIMARY KEY (provider, id);


--
-- Name: instances instances_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.instances
    ADD CONSTRAINT instances_pkey PRIMARY KEY (id);


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_authentication_method_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_authentication_method_pkey UNIQUE (session_id, authentication_method);


--
-- Name: mfa_challenges mfa_challenges_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_pkey PRIMARY KEY (id);


--
-- Name: mfa_factors mfa_factors_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_pkey PRIMARY KEY (id);


--
-- Name: refresh_tokens refresh_tokens_token_unique; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_token_unique UNIQUE (token);


--
-- Name: saml_providers saml_providers_entity_id_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_entity_id_key UNIQUE (entity_id);


--
-- Name: saml_providers saml_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_pkey PRIMARY KEY (id);


--
-- Name: saml_relay_states saml_relay_states_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: sso_domains sso_domains_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_pkey PRIMARY KEY (id);


--
-- Name: sso_providers sso_providers_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_providers
    ADD CONSTRAINT sso_providers_pkey PRIMARY KEY (id);


--
-- Name: users users_phone_key; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_phone_key UNIQUE (phone);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: game_record game_record_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_record
    ADD CONSTRAINT game_record_pkey PRIMARY KEY (id);


--
-- Name: game_user game_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_user
    ADD CONSTRAINT game_user_pkey PRIMARY KEY (id);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (id);


--
-- Name: random_number_table random_number_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.random_number_table
    ADD CONSTRAINT random_number_table_pkey PRIMARY KEY (id);


--
-- Name: users users_loginid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_loginid_key UNIQUE (loginid);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: audit_logs_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX audit_logs_instance_id_idx ON auth.audit_log_entries USING btree (instance_id);


--
-- Name: confirmation_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX confirmation_token_idx ON auth.users USING btree (confirmation_token) WHERE ((confirmation_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_current_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_current_idx ON auth.users USING btree (email_change_token_current) WHERE ((email_change_token_current)::text !~ '^[0-9 ]*$'::text);


--
-- Name: email_change_token_new_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX email_change_token_new_idx ON auth.users USING btree (email_change_token_new) WHERE ((email_change_token_new)::text !~ '^[0-9 ]*$'::text);


--
-- Name: factor_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX factor_id_created_at_idx ON auth.mfa_factors USING btree (user_id, created_at);


--
-- Name: flow_state_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX flow_state_created_at_idx ON auth.flow_state USING btree (created_at DESC);


--
-- Name: identities_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_email_idx ON auth.identities USING btree (email text_pattern_ops);


--
-- Name: INDEX identities_email_idx; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.identities_email_idx IS 'Auth: Ensures indexed queries on the email column';


--
-- Name: identities_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX identities_user_id_idx ON auth.identities USING btree (user_id);


--
-- Name: idx_auth_code; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_auth_code ON auth.flow_state USING btree (auth_code);


--
-- Name: idx_user_id_auth_method; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX idx_user_id_auth_method ON auth.flow_state USING btree (user_id, authentication_method);


--
-- Name: mfa_challenge_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX mfa_challenge_created_at_idx ON auth.mfa_challenges USING btree (created_at DESC);


--
-- Name: mfa_factors_user_friendly_name_unique; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX mfa_factors_user_friendly_name_unique ON auth.mfa_factors USING btree (friendly_name, user_id) WHERE (TRIM(BOTH FROM friendly_name) <> ''::text);


--
-- Name: reauthentication_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX reauthentication_token_idx ON auth.users USING btree (reauthentication_token) WHERE ((reauthentication_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: recovery_token_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX recovery_token_idx ON auth.users USING btree (recovery_token) WHERE ((recovery_token)::text !~ '^[0-9 ]*$'::text);


--
-- Name: refresh_tokens_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_idx ON auth.refresh_tokens USING btree (instance_id);


--
-- Name: refresh_tokens_instance_id_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_instance_id_user_id_idx ON auth.refresh_tokens USING btree (instance_id, user_id);


--
-- Name: refresh_tokens_parent_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_parent_idx ON auth.refresh_tokens USING btree (parent);


--
-- Name: refresh_tokens_session_id_revoked_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_session_id_revoked_idx ON auth.refresh_tokens USING btree (session_id, revoked);


--
-- Name: refresh_tokens_updated_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX refresh_tokens_updated_at_idx ON auth.refresh_tokens USING btree (updated_at DESC);


--
-- Name: saml_providers_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_providers_sso_provider_id_idx ON auth.saml_providers USING btree (sso_provider_id);


--
-- Name: saml_relay_states_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_created_at_idx ON auth.saml_relay_states USING btree (created_at DESC);


--
-- Name: saml_relay_states_for_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_for_email_idx ON auth.saml_relay_states USING btree (for_email);


--
-- Name: saml_relay_states_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX saml_relay_states_sso_provider_id_idx ON auth.saml_relay_states USING btree (sso_provider_id);


--
-- Name: sessions_not_after_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_not_after_idx ON auth.sessions USING btree (not_after DESC);


--
-- Name: sessions_user_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sessions_user_id_idx ON auth.sessions USING btree (user_id);


--
-- Name: sso_domains_domain_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_domains_domain_idx ON auth.sso_domains USING btree (lower(domain));


--
-- Name: sso_domains_sso_provider_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX sso_domains_sso_provider_id_idx ON auth.sso_domains USING btree (sso_provider_id);


--
-- Name: sso_providers_resource_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX sso_providers_resource_id_idx ON auth.sso_providers USING btree (lower(resource_id));


--
-- Name: user_id_created_at_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX user_id_created_at_idx ON auth.sessions USING btree (user_id, created_at);


--
-- Name: users_email_partial_key; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE UNIQUE INDEX users_email_partial_key ON auth.users USING btree (email) WHERE (is_sso_user = false);


--
-- Name: INDEX users_email_partial_key; Type: COMMENT; Schema: auth; Owner: supabase_auth_admin
--

COMMENT ON INDEX auth.users_email_partial_key IS 'Auth: A partial unique index that applies only when is_sso_user is false';


--
-- Name: users_instance_id_email_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_email_idx ON auth.users USING btree (instance_id, lower((email)::text));


--
-- Name: users_instance_id_idx; Type: INDEX; Schema: auth; Owner: supabase_auth_admin
--

CREATE INDEX users_instance_id_idx ON auth.users USING btree (instance_id);


--
-- Name: identities identities_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.identities
    ADD CONSTRAINT identities_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: mfa_amr_claims mfa_amr_claims_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_amr_claims
    ADD CONSTRAINT mfa_amr_claims_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: mfa_challenges mfa_challenges_auth_factor_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_challenges
    ADD CONSTRAINT mfa_challenges_auth_factor_id_fkey FOREIGN KEY (factor_id) REFERENCES auth.mfa_factors(id) ON DELETE CASCADE;


--
-- Name: mfa_factors mfa_factors_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.mfa_factors
    ADD CONSTRAINT mfa_factors_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: refresh_tokens refresh_tokens_session_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.refresh_tokens
    ADD CONSTRAINT refresh_tokens_session_id_fkey FOREIGN KEY (session_id) REFERENCES auth.sessions(id) ON DELETE CASCADE;


--
-- Name: saml_providers saml_providers_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_providers
    ADD CONSTRAINT saml_providers_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: saml_relay_states saml_relay_states_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.saml_relay_states
    ADD CONSTRAINT saml_relay_states_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sessions
    ADD CONSTRAINT sessions_user_id_fkey FOREIGN KEY (user_id) REFERENCES auth.users(id) ON DELETE CASCADE;


--
-- Name: sso_domains sso_domains_sso_provider_id_fkey; Type: FK CONSTRAINT; Schema: auth; Owner: supabase_auth_admin
--

ALTER TABLE ONLY auth.sso_domains
    ADD CONSTRAINT sso_domains_sso_provider_id_fkey FOREIGN KEY (sso_provider_id) REFERENCES auth.sso_providers(id) ON DELETE CASCADE;


--
-- Name: game_record game_record_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_record
    ADD CONSTRAINT game_record_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: game_user game_user_game_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.game_user
    ADD CONSTRAINT game_user_game_id_fkey FOREIGN KEY (game_id) REFERENCES public.games(id) ON DELETE CASCADE;


--
-- Name: SCHEMA auth; Type: ACL; Schema: -; Owner: supabase_admin
--

GRANT USAGE ON SCHEMA auth TO anon;
GRANT USAGE ON SCHEMA auth TO authenticated;
GRANT USAGE ON SCHEMA auth TO service_role;
GRANT ALL ON SCHEMA auth TO supabase_auth_admin;
GRANT ALL ON SCHEMA auth TO dashboard_user;
GRANT ALL ON SCHEMA auth TO postgres;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT USAGE ON SCHEMA public TO postgres;
GRANT USAGE ON SCHEMA public TO anon;
GRANT USAGE ON SCHEMA public TO authenticated;
GRANT USAGE ON SCHEMA public TO service_role;


--
-- Name: FUNCTION email(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.email() TO dashboard_user;


--
-- Name: FUNCTION jwt(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.jwt() TO postgres;
GRANT ALL ON FUNCTION auth.jwt() TO dashboard_user;


--
-- Name: FUNCTION role(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.role() TO dashboard_user;


--
-- Name: FUNCTION uid(); Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON FUNCTION auth.uid() TO dashboard_user;


--
-- Name: FUNCTION hello_world(); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.hello_world() TO anon;
GRANT ALL ON FUNCTION public.hello_world() TO authenticated;
GRANT ALL ON FUNCTION public.hello_world() TO service_role;


--
-- Name: FUNCTION makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO anon;
GRANT ALL ON FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO authenticated;
GRANT ALL ON FUNCTION public.makenewgame(_userid numeric, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO service_role;


--
-- Name: FUNCTION newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO anon;
GRANT ALL ON FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO authenticated;
GRANT ALL ON FUNCTION public.newmakenewgame(_userid text, _person_num numeric, _coat_num numeric, _dobules_flg boolean) TO service_role;


--
-- Name: PROCEDURE testfnc(IN numeric, IN numeric, IN numeric, IN boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean) TO anon;
GRANT ALL ON PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean) TO authenticated;
GRANT ALL ON PROCEDURE public.testfnc(IN numeric, IN numeric, IN numeric, IN boolean) TO service_role;


--
-- Name: PROCEDURE testfnc(IN text, IN numeric, IN numeric, IN boolean); Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean) TO anon;
GRANT ALL ON PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean) TO authenticated;
GRANT ALL ON PROCEDURE public.testfnc(IN text, IN numeric, IN numeric, IN boolean) TO service_role;


--
-- Name: TABLE audit_log_entries; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.audit_log_entries TO dashboard_user;
GRANT ALL ON TABLE auth.audit_log_entries TO postgres;


--
-- Name: TABLE flow_state; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.flow_state TO postgres;
GRANT ALL ON TABLE auth.flow_state TO dashboard_user;


--
-- Name: TABLE identities; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.identities TO postgres;
GRANT ALL ON TABLE auth.identities TO dashboard_user;


--
-- Name: TABLE instances; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.instances TO dashboard_user;
GRANT ALL ON TABLE auth.instances TO postgres;


--
-- Name: TABLE mfa_amr_claims; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_amr_claims TO postgres;
GRANT ALL ON TABLE auth.mfa_amr_claims TO dashboard_user;


--
-- Name: TABLE mfa_challenges; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_challenges TO postgres;
GRANT ALL ON TABLE auth.mfa_challenges TO dashboard_user;


--
-- Name: TABLE mfa_factors; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.mfa_factors TO postgres;
GRANT ALL ON TABLE auth.mfa_factors TO dashboard_user;


--
-- Name: TABLE refresh_tokens; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.refresh_tokens TO dashboard_user;
GRANT ALL ON TABLE auth.refresh_tokens TO postgres;


--
-- Name: SEQUENCE refresh_tokens_id_seq; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO dashboard_user;
GRANT ALL ON SEQUENCE auth.refresh_tokens_id_seq TO postgres;


--
-- Name: TABLE saml_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_providers TO postgres;
GRANT ALL ON TABLE auth.saml_providers TO dashboard_user;


--
-- Name: TABLE saml_relay_states; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.saml_relay_states TO postgres;
GRANT ALL ON TABLE auth.saml_relay_states TO dashboard_user;


--
-- Name: TABLE schema_migrations; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.schema_migrations TO dashboard_user;
GRANT ALL ON TABLE auth.schema_migrations TO postgres;


--
-- Name: TABLE sessions; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sessions TO postgres;
GRANT ALL ON TABLE auth.sessions TO dashboard_user;


--
-- Name: TABLE sso_domains; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_domains TO postgres;
GRANT ALL ON TABLE auth.sso_domains TO dashboard_user;


--
-- Name: TABLE sso_providers; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.sso_providers TO postgres;
GRANT ALL ON TABLE auth.sso_providers TO dashboard_user;


--
-- Name: TABLE users; Type: ACL; Schema: auth; Owner: supabase_auth_admin
--

GRANT ALL ON TABLE auth.users TO dashboard_user;
GRANT ALL ON TABLE auth.users TO postgres;


--
-- Name: TABLE game_record; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.game_record TO anon;
GRANT ALL ON TABLE public.game_record TO authenticated;
GRANT ALL ON TABLE public.game_record TO service_role;


--
-- Name: SEQUENCE game_record_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.game_record_id_seq TO anon;
GRANT ALL ON SEQUENCE public.game_record_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.game_record_id_seq TO service_role;


--
-- Name: TABLE game_user; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.game_user TO anon;
GRANT ALL ON TABLE public.game_user TO authenticated;
GRANT ALL ON TABLE public.game_user TO service_role;


--
-- Name: SEQUENCE game_user_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.game_user_id_seq TO anon;
GRANT ALL ON SEQUENCE public.game_user_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.game_user_id_seq TO service_role;


--
-- Name: TABLE games; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.games TO anon;
GRANT ALL ON TABLE public.games TO authenticated;
GRANT ALL ON TABLE public.games TO service_role;


--
-- Name: SEQUENCE games_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.games_id_seq TO anon;
GRANT ALL ON SEQUENCE public.games_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.games_id_seq TO service_role;


--
-- Name: TABLE random_number_table; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.random_number_table TO anon;
GRANT ALL ON TABLE public.random_number_table TO authenticated;
GRANT ALL ON TABLE public.random_number_table TO service_role;


--
-- Name: SEQUENCE random_number_table_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.random_number_table_id_seq TO anon;
GRANT ALL ON SEQUENCE public.random_number_table_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.random_number_table_id_seq TO service_role;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO anon;
GRANT ALL ON TABLE public.users TO authenticated;
GRANT ALL ON TABLE public.users TO service_role;


--
-- Name: SEQUENCE users_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON SEQUENCE public.users_id_seq TO anon;
GRANT ALL ON SEQUENCE public.users_id_seq TO authenticated;
GRANT ALL ON SEQUENCE public.users_id_seq TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON SEQUENCES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON FUNCTIONS  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: auth; Owner: supabase_auth_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_auth_admin IN SCHEMA auth GRANT ALL ON TABLES  TO dashboard_user;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON SEQUENCES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON FUNCTIONS  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: supabase_admin
--

ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO postgres;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO anon;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO authenticated;
ALTER DEFAULT PRIVILEGES FOR ROLE supabase_admin IN SCHEMA public GRANT ALL ON TABLES  TO service_role;


--
-- PostgreSQL database dump complete
--

