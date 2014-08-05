--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    is_superuser boolean NOT NULL,
    username character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(75) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_groups_id_seq OWNED BY auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_id_seq OWNED BY auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE auth_user_user_permissions_id_seq OWNED BY auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    user_id integer NOT NULL,
    content_type_id integer,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: reporting_queries_EmailAddress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "reporting_queries_EmailAddress" (
    id integer NOT NULL,
    address character varying(254) NOT NULL,
    address_type character varying(255) NOT NULL
);


ALTER TABLE public."reporting_queries_EmailAddress" OWNER TO postgres;

--
-- Name: reporting_queries_EmailAddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "reporting_queries_EmailAddress_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."reporting_queries_EmailAddress_id_seq" OWNER TO postgres;

--
-- Name: reporting_queries_EmailAddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "reporting_queries_EmailAddress_id_seq" OWNED BY "reporting_queries_EmailAddress".id;


--
-- Name: reporting_queries_FundraisingPage; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "reporting_queries_FundraisingPage" (
    id integer NOT NULL,
    identifiers text NOT NULL,
    originating_system character varying(255) NOT NULL,
    modified_at timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    summary character varying(1023) NOT NULL,
    description text NOT NULL,
    url character varying(200) NOT NULL,
    currency character varying(255) NOT NULL,
    creator_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public."reporting_queries_FundraisingPage" OWNER TO postgres;

--
-- Name: reporting_queries_FundraisingPage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "reporting_queries_FundraisingPage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."reporting_queries_FundraisingPage_id_seq" OWNER TO postgres;

--
-- Name: reporting_queries_FundraisingPage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "reporting_queries_FundraisingPage_id_seq" OWNED BY "reporting_queries_FundraisingPage".id;


--
-- Name: reporting_queries_attendance; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_attendance (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    event_id integer NOT NULL,
    person_id integer NOT NULL,
    status character varying(127) NOT NULL,
    attended boolean,
    comment text NOT NULL,
    invited_by_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_attendance OWNER TO postgres;

--
-- Name: reporting_queries_attendance_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_attendance_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_attendance_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_attendance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_attendance_id_seq OWNED BY reporting_queries_attendance.id;


--
-- Name: reporting_queries_donation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_donation (
    id integer NOT NULL,
    identifiers text NOT NULL,
    originating_system character varying(255) NOT NULL,
    donor_id integer NOT NULL,
    donated_at date NOT NULL,
    amount numeric(11,2) NOT NULL,
    credited_amount numeric(11,2),
    credited_at timestamp with time zone,
    currency character varying(255) NOT NULL,
    payment text NOT NULL,
    subscription_instance character varying(255),
    voided boolean NOT NULL,
    voided_at date,
    url character varying(200) NOT NULL,
    sources text,
    attributions text,
    fundraising_page_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_donation OWNER TO postgres;

--
-- Name: reporting_queries_donation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_donation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_donation_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_donation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_donation_id_seq OWNED BY reporting_queries_donation.id;


--
-- Name: reporting_queries_event; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_event (
    id integer NOT NULL,
    identifier character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    summary character varying(1023) NOT NULL,
    description text NOT NULL,
    location_id integer NOT NULL,
    creator_id integer NOT NULL,
    organizer_id integer,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    all_day_date date,
    all_day boolean NOT NULL,
    transparence character varying(255) NOT NULL,
    visibility character varying(255) NOT NULL,
    guests_allowed boolean NOT NULL,
    reminders text,
    method character varying(127),
    minutes integer,
    capacity integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_event OWNER TO postgres;

--
-- Name: reporting_queries_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_event_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_event_id_seq OWNED BY reporting_queries_event.id;


--
-- Name: reporting_queries_form; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_form (
    id integer NOT NULL,
    identifiers character varying(1024) NOT NULL,
    name character varying(512) NOT NULL,
    title character varying(512) NOT NULL,
    summary text NOT NULL,
    description text NOT NULL,
    call_to_action text NOT NULL,
    url character varying(200) NOT NULL,
    creator_id integer,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.reporting_queries_form OWNER TO postgres;

--
-- Name: reporting_queries_form_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_form_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_form_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_form_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_form_id_seq OWNED BY reporting_queries_form.id;


--
-- Name: reporting_queries_list; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_list (
    id integer NOT NULL,
    identifier character varying(1023) NOT NULL,
    name character varying(1023) NOT NULL,
    description text,
    type character varying(127) NOT NULL,
    is_dynamic boolean,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_list OWNER TO postgres;

--
-- Name: reporting_queries_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_list_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_list_id_seq OWNED BY reporting_queries_list.id;


--
-- Name: reporting_queries_listitem; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_listitem (
    id integer NOT NULL,
    list_id integer NOT NULL,
    content_type_id integer NOT NULL,
    object_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    CONSTRAINT reporting_queries_listitem_object_id_check CHECK ((object_id >= 0))
);


ALTER TABLE public.reporting_queries_listitem OWNER TO postgres;

--
-- Name: reporting_queries_listitem_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_listitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_listitem_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_listitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_listitem_id_seq OWNED BY reporting_queries_listitem.id;


--
-- Name: reporting_queries_organization; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_organization (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    abbreviation character varying(31) NOT NULL,
    parent_id integer NOT NULL,
    address_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_organization OWNER TO postgres;

--
-- Name: reporting_queries_organization_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_organization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_organization_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_organization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_organization_id_seq OWNED BY reporting_queries_organization.id;


--
-- Name: reporting_queries_person; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_person (
    id integer NOT NULL,
    family_name character varying(255),
    given_name character varying(255),
    additional_name character varying(255),
    honorific_prefix character varying(255),
    honorific_suffix character varying(255),
    gender character varying(7),
    gender_identity character varying(255),
    party_identification character varying(127),
    source character varying(255) NOT NULL,
    birthdate text,
    birthdate_month integer,
    birthdate_day integer,
    birthdate_year integer,
    ethnilocality character varying(255),
    languages_spoken text,
    employer character varying(255),
    occupation character varying(255),
    identifiers text,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_person OWNER TO postgres;

--
-- Name: reporting_queries_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_person_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_person_id_seq OWNED BY reporting_queries_person.id;


--
-- Name: reporting_queries_personemailaddress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_personemailaddress (
    id integer NOT NULL,
    person_id integer NOT NULL,
    email_address_id integer NOT NULL,
    "primary" boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_personemailaddress OWNER TO postgres;

--
-- Name: reporting_queries_personemailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_personemailaddress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_personemailaddress_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_personemailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_personemailaddress_id_seq OWNED BY reporting_queries_personemailaddress.id;


--
-- Name: reporting_queries_personphonenumber; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_personphonenumber (
    id integer NOT NULL,
    person_id integer NOT NULL,
    phone_number_id integer NOT NULL,
    "primary" boolean NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_personphonenumber OWNER TO postgres;

--
-- Name: reporting_queries_personphonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_personphonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_personphonenumber_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_personphonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_personphonenumber_id_seq OWNED BY reporting_queries_personphonenumber.id;


--
-- Name: reporting_queries_personpostaladdress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_personpostaladdress (
    id integer NOT NULL,
    person_id integer NOT NULL,
    postal_address_id integer NOT NULL,
    "primary" boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_personpostaladdress OWNER TO postgres;

--
-- Name: reporting_queries_personpostaladdress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_personpostaladdress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_personpostaladdress_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_personpostaladdress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_personpostaladdress_id_seq OWNED BY reporting_queries_personpostaladdress.id;


--
-- Name: reporting_queries_phonenumber; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_phonenumber (
    id integer NOT NULL,
    number character varying(15) NOT NULL,
    extension character varying(4),
    number_type character varying(31),
    operator character varying(63),
    country character varying(2) NOT NULL,
    sms_capable boolean NOT NULL,
    do_not_call boolean NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_phonenumber OWNER TO postgres;

--
-- Name: reporting_queries_phonenumber_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_phonenumber_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_phonenumber_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_phonenumber_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_phonenumber_id_seq OWNED BY reporting_queries_phonenumber.id;


--
-- Name: reporting_queries_postaladdress; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_postaladdress (
    id integer NOT NULL,
    address_type character varying(255) NOT NULL,
    address_line text,
    locality character varying(255) NOT NULL,
    region character varying(2) NOT NULL,
    postal_code character varying(63) NOT NULL,
    country character varying(2) NOT NULL,
    language character varying(63),
    location text,
    latitude double precision,
    longitude double precision,
    accuracy character varying(31),
    status character varying(31) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_postaladdress OWNER TO postgres;

--
-- Name: reporting_queries_postaladdress_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_postaladdress_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_postaladdress_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_postaladdress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_postaladdress_id_seq OWNED BY reporting_queries_postaladdress.id;


--
-- Name: reporting_queries_profile; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_profile (
    id integer NOT NULL,
    person_id integer NOT NULL,
    provider character varying(63) NOT NULL,
    identifier character varying(255) NOT NULL,
    url character varying(200) NOT NULL,
    handle character varying(127) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_profile OWNER TO postgres;

--
-- Name: reporting_queries_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_profile_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_profile_id_seq OWNED BY reporting_queries_profile.id;


--
-- Name: reporting_queries_query; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_query (
    id integer NOT NULL,
    query character varying(500) NOT NULL,
    name character varying(120) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.reporting_queries_query OWNER TO postgres;

--
-- Name: reporting_queries_query_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_query_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_query_id_seq OWNED BY reporting_queries_query.id;


--
-- Name: reporting_queries_recipient; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_recipient (
    id integer NOT NULL,
    display_name character varying(255) NOT NULL,
    legal_name character varying(255),
    amount numeric(11,2) NOT NULL,
    donation_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_recipient OWNER TO postgres;

--
-- Name: reporting_queries_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_recipient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_recipient_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_recipient_id_seq OWNED BY reporting_queries_recipient.id;


--
-- Name: reporting_queries_submission; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_submission (
    id integer NOT NULL,
    identifiers character varying(1024) NOT NULL,
    person_id integer NOT NULL,
    form_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.reporting_queries_submission OWNER TO postgres;

--
-- Name: reporting_queries_submission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_submission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_submission_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_submission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_submission_id_seq OWNED BY reporting_queries_submission.id;


--
-- Name: reporting_queries_syncoperation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reporting_queries_syncoperation (
    id integer NOT NULL,
    sync_at timestamp with time zone NOT NULL,
    type character varying(255) NOT NULL,
    current_record integer NOT NULL,
    total_records integer NOT NULL,
    errors text NOT NULL,
    organization_id integer NOT NULL,
    status character varying(255) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reporting_queries_syncoperation OWNER TO postgres;

--
-- Name: reporting_queries_syncoperation_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reporting_queries_syncoperation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporting_queries_syncoperation_id_seq OWNER TO postgres;

--
-- Name: reporting_queries_syncoperation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reporting_queries_syncoperation_id_seq OWNED BY reporting_queries_syncoperation.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user ALTER COLUMN id SET DEFAULT nextval('auth_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups ALTER COLUMN id SET DEFAULT nextval('auth_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auth_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "reporting_queries_EmailAddress" ALTER COLUMN id SET DEFAULT nextval('"reporting_queries_EmailAddress_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "reporting_queries_FundraisingPage" ALTER COLUMN id SET DEFAULT nextval('"reporting_queries_FundraisingPage_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_attendance ALTER COLUMN id SET DEFAULT nextval('reporting_queries_attendance_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_donation ALTER COLUMN id SET DEFAULT nextval('reporting_queries_donation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_event ALTER COLUMN id SET DEFAULT nextval('reporting_queries_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_form ALTER COLUMN id SET DEFAULT nextval('reporting_queries_form_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_list ALTER COLUMN id SET DEFAULT nextval('reporting_queries_list_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_listitem ALTER COLUMN id SET DEFAULT nextval('reporting_queries_listitem_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_organization ALTER COLUMN id SET DEFAULT nextval('reporting_queries_organization_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_person ALTER COLUMN id SET DEFAULT nextval('reporting_queries_person_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personemailaddress ALTER COLUMN id SET DEFAULT nextval('reporting_queries_personemailaddress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personphonenumber ALTER COLUMN id SET DEFAULT nextval('reporting_queries_personphonenumber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personpostaladdress ALTER COLUMN id SET DEFAULT nextval('reporting_queries_personpostaladdress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_phonenumber ALTER COLUMN id SET DEFAULT nextval('reporting_queries_phonenumber_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_postaladdress ALTER COLUMN id SET DEFAULT nextval('reporting_queries_postaladdress_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_profile ALTER COLUMN id SET DEFAULT nextval('reporting_queries_profile_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_query ALTER COLUMN id SET DEFAULT nextval('reporting_queries_query_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_recipient ALTER COLUMN id SET DEFAULT nextval('reporting_queries_recipient_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_submission ALTER COLUMN id SET DEFAULT nextval('reporting_queries_submission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_syncoperation ALTER COLUMN id SET DEFAULT nextval('reporting_queries_syncoperation_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add sync operation	7	add_syncoperation
20	Can change sync operation	7	change_syncoperation
21	Can delete sync operation	7	delete_syncoperation
22	Can add organization	8	add_organization
23	Can change organization	8	change_organization
24	Can delete organization	8	delete_organization
25	Can add recipient	9	add_recipient
26	Can change recipient	9	change_recipient
27	Can delete recipient	9	delete_recipient
28	Can add fundraising page	10	add_fundraisingpage
29	Can change fundraising page	10	change_fundraisingpage
30	Can delete fundraising page	10	delete_fundraisingpage
31	Can add donation	11	add_donation
32	Can change donation	11	change_donation
33	Can delete donation	11	delete_donation
34	Can add event	12	add_event
35	Can change event	12	change_event
36	Can delete event	12	delete_event
37	Can add attendance	13	add_attendance
38	Can change attendance	13	change_attendance
39	Can delete attendance	13	delete_attendance
40	Can add form	14	add_form
41	Can change form	14	change_form
42	Can delete form	14	delete_form
43	Can add submission	15	add_submission
44	Can change submission	15	change_submission
45	Can delete submission	15	delete_submission
46	Can add list	16	add_list
47	Can change list	16	change_list
48	Can delete list	16	delete_list
49	Can add list item	17	add_listitem
50	Can change list item	17	change_listitem
51	Can delete list item	17	delete_listitem
52	Can add person	18	add_person
53	Can change person	18	change_person
54	Can delete person	18	delete_person
55	Can add postal address	19	add_postaladdress
56	Can change postal address	19	change_postaladdress
57	Can delete postal address	19	delete_postaladdress
58	Can add person postal address	20	add_personpostaladdress
59	Can change person postal address	20	change_personpostaladdress
60	Can delete person postal address	20	delete_personpostaladdress
61	Can add email address	21	add_emailaddress
62	Can change email address	21	change_emailaddress
63	Can delete email address	21	delete_emailaddress
64	Can add person email address	22	add_personemailaddress
65	Can change person email address	22	change_personemailaddress
66	Can delete person email address	22	delete_personemailaddress
67	Can add phone number	23	add_phonenumber
68	Can change phone number	23	change_phonenumber
69	Can delete phone number	23	delete_phonenumber
70	Can add person phone number	24	add_personphonenumber
71	Can change person phone number	24	change_personphonenumber
72	Can delete person phone number	24	delete_personphonenumber
73	Can add profile	25	add_profile
74	Can change profile	25	change_profile
75	Can delete profile	25	delete_profile
76	Can add query	26	add_query
77	Can change query	26	change_query
78	Can delete query	26	delete_query
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_permission_id_seq', 78, true);


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$12000$C4AegpTagWeB$vRuSKNFH5IkOe2EWcr8gu83oRr9SE2g9Tb6TQpbrPAU=	2014-07-31 13:26:14.033957-04	t	dagobailon			dago@codeforprogress.org	t	t	2014-07-31 10:43:30.839173-04
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_id_seq', 1, true);


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('auth_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_admin_log (id, action_time, user_id, content_type_id, object_id, object_repr, action_flag, change_message) FROM stdin;
1	2014-07-31 13:28:45.081967-04	1	18	1	Dago Bailon	1	
2	2014-07-31 13:30:09.747101-04	1	18	1	Dago Bailon	2	Changed birthdate.
3	2014-07-31 13:36:38.797175-04	1	21	1	dago@codeforprogress.org (Personal)	1	
4	2014-07-31 13:44:58.494495-04	1	18	2	Kathy Ortiz	1	
5	2014-07-31 13:45:52.937457-04	1	18	3	Elaine Kamlley 	1	
6	2014-07-31 13:52:48.782308-04	1	18	4	Mariella Pulido 	1	
7	2014-07-31 13:53:26.596695-04	1	18	5	Cassidy Henderson	1	
8	2014-07-31 13:54:39.337968-04	1	18	6	Pam Davis	1	
9	2014-07-31 13:55:11.29346-04	1	18	7	Bobby Joe Smith	1	
10	2014-07-31 13:55:24.84491-04	1	21	1	dago@codeforprogress.org (Personal)	2	No fields changed.
11	2014-07-31 13:57:55.893364-04	1	18	8	Terry Acker	1	
12	2014-07-31 13:58:29.872511-04	1	18	9	Jason Towns	1	
13	2014-07-31 13:59:07.298798-04	1	18	10	Selina Masuta	1	
14	2014-07-31 13:59:40.646695-04	1	18	11	Aurea Martinez	1	
15	2014-07-31 14:01:03.593429-04	1	18	12	Angie Brilliance	1	
16	2014-07-31 14:01:36.876073-04	1	21	2	kathy@codeforprogress.org (Pers)	1	
17	2014-07-31 14:01:49.440734-04	1	21	2	kathy@codeforprogress.org (Personal)	2	Changed address_type.
18	2014-07-31 14:02:26.715414-04	1	21	3	pam@codeforprogress.org (Personal)	1	
19	2014-07-31 14:02:45.459514-04	1	21	4	jason@codeforprogress.org (Personal)	1	
20	2014-07-31 14:03:06.096519-04	1	21	5	elaine@codeforprogress.org (Personal)	1	
21	2014-07-31 14:03:21.708526-04	1	21	6	selina@codeforprogress.org (Personal)	1	
22	2014-07-31 14:03:42.060362-04	1	21	7	aurea@codeforprogress.org (Personal)	1	
23	2014-07-31 14:04:07.371175-04	1	21	8	bobbyjoe@codeforprogress.org (Personal)	1	
24	2014-07-31 14:04:26.561274-04	1	21	9	terry@codeforprogress.org (Personal)	1	
25	2014-07-31 14:04:40.895222-04	1	21	10	angie@codeforprogress.org (Personal)	1	
26	2014-07-31 14:05:08.515202-04	1	21	11	mariella@codeforprogress.org (Personal)	1	
27	2014-07-31 14:06:02.196637-04	1	21	12	cassidy@codeforprogress.org (Personal)	1	
28	2014-07-31 14:07:30.300736-04	1	23	1	PhoneNumber object	1	
29	2014-07-31 14:07:43.55903-04	1	23	1	PhoneNumber object	2	Changed number.
30	2014-07-31 15:03:08.977492-04	1	23	2	PhoneNumber object	1	
31	2014-07-31 15:04:05.742373-04	1	23	3	PhoneNumber object	1	
32	2014-07-31 15:04:43.750613-04	1	23	4	PhoneNumber object	1	
33	2014-07-31 15:05:13.229097-04	1	23	5	PhoneNumber object	1	
34	2014-07-31 15:05:56.674711-04	1	23	6	PhoneNumber object	1	
35	2014-07-31 15:06:38.249256-04	1	23	7	PhoneNumber object	1	
36	2014-07-31 15:08:04.827201-04	1	23	8	PhoneNumber object	1	
37	2014-07-31 15:08:30.665937-04	1	23	9	PhoneNumber object	1	
38	2014-07-31 15:08:55.038921-04	1	23	10	PhoneNumber object	1	
39	2014-07-31 15:09:28.562129-04	1	23	11	PhoneNumber object	1	
40	2014-07-31 15:09:49.263219-04	1	23	12	PhoneNumber object	1	
41	2014-07-31 15:31:03.18621-04	1	19	1	None	1	
42	2014-07-31 15:33:59.443007-04	1	19	1	{u'address': u'1234 Kamlley St NW'}	2	Changed address_line and location.
43	2014-07-31 15:37:31.106197-04	1	19	2	{u'address': u'1234 E Paulino St'}	1	
44	2014-07-31 15:42:07.611186-04	1	19	3	{u'address': u'2543 W. Martinez St'}	1	
45	2014-07-31 15:43:47.94341-04	1	19	4	{u'address': u'12343 Ortiz St NW'}	1	
46	2014-07-31 15:45:20.64305-04	1	19	5	{u'address': u'1234 Brilliance St NW'}	1	
47	2014-07-31 15:46:49.286804-04	1	19	6	{u'address': u'4647 Davis St NW'}	1	
48	2014-07-31 15:51:50.953525-04	1	19	7	{u'address': u'1234 Towns St NW'}	1	
49	2014-07-31 15:52:54.673616-04	1	19	8	{u'address': u'1234 Acker St NW'}	1	
50	2014-07-31 15:57:15.860695-04	1	19	9	{u'address': u'1234 Smith St W'}	1	
51	2014-07-31 15:58:27.665749-04	1	19	10	{u'address': u'1234 Bailon St NW'}	1	
52	2014-07-31 15:59:39.241092-04	1	19	11	{u'address': u'1234 Henderson St NW'}	1	
53	2014-07-31 16:01:04.984847-04	1	19	12	{u'address': u'1234 Masuta St NW'}	1	
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 53, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_content_type (id, name, app_label, model) FROM stdin;
1	log entry	admin	logentry
2	permission	auth	permission
3	group	auth	group
4	user	auth	user
5	content type	contenttypes	contenttype
6	session	sessions	session
7	sync operation	reporting_queries	syncoperation
8	organization	reporting_queries	organization
9	recipient	reporting_queries	recipient
10	fundraising page	reporting_queries	fundraisingpage
11	donation	reporting_queries	donation
12	event	reporting_queries	event
13	attendance	reporting_queries	attendance
14	form	reporting_queries	form
15	submission	reporting_queries	submission
16	list	reporting_queries	list
17	list item	reporting_queries	listitem
18	person	reporting_queries	person
19	postal address	reporting_queries	postaladdress
20	person postal address	reporting_queries	personpostaladdress
21	email address	reporting_queries	emailaddress
22	person email address	reporting_queries	personemailaddress
23	phone number	reporting_queries	phonenumber
24	person phone number	reporting_queries	personphonenumber
25	profile	reporting_queries	profile
26	query	reporting_queries	query
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('django_content_type_id_seq', 26, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
bvni6wal5bykurbaby9uoun4x4131obd	OTg3YTg3NzE4YzA2OTZhMWJmMjFmYzYzNTRjNzViZjAzNzViNDAxZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=	2014-08-14 13:26:14.040017-04
\.


--
-- Data for Name: reporting_queries_EmailAddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "reporting_queries_EmailAddress" (id, address, address_type) FROM stdin;
1	dago@codeforprogress.org	Personal
2	kathy@codeforprogress.org	Personal
3	pam@codeforprogress.org	Personal
4	jason@codeforprogress.org	Personal
5	elaine@codeforprogress.org	Personal
6	selina@codeforprogress.org	Personal
7	aurea@codeforprogress.org	Personal
8	bobbyjoe@codeforprogress.org	Personal
9	terry@codeforprogress.org	Personal
10	angie@codeforprogress.org	Personal
11	mariella@codeforprogress.org	Personal
12	cassidy@codeforprogress.org	Personal
\.


--
-- Name: reporting_queries_EmailAddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"reporting_queries_EmailAddress_id_seq"', 12, true);


--
-- Data for Name: reporting_queries_FundraisingPage; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "reporting_queries_FundraisingPage" (id, identifiers, originating_system, modified_at, name, title, summary, description, url, currency, creator_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_FundraisingPage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"reporting_queries_FundraisingPage_id_seq"', 1, false);


--
-- Data for Name: reporting_queries_attendance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_attendance (id, identifier, event_id, person_id, status, attended, comment, invited_by_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_attendance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_attendance_id_seq', 1, false);


--
-- Data for Name: reporting_queries_donation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_donation (id, identifiers, originating_system, donor_id, donated_at, amount, credited_amount, credited_at, currency, payment, subscription_instance, voided, voided_at, url, sources, attributions, fundraising_page_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_donation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_donation_id_seq', 1, false);


--
-- Data for Name: reporting_queries_event; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_event (id, identifier, status, summary, description, location_id, creator_id, organizer_id, start, "end", all_day_date, all_day, transparence, visibility, guests_allowed, reminders, method, minutes, capacity, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_event_id_seq', 1, false);


--
-- Data for Name: reporting_queries_form; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_form (id, identifiers, name, title, summary, description, call_to_action, url, creator_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_form_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_form_id_seq', 1, false);


--
-- Data for Name: reporting_queries_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_list (id, identifier, name, description, type, is_dynamic, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_list_id_seq', 1, false);


--
-- Data for Name: reporting_queries_listitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_listitem (id, list_id, content_type_id, object_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_listitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_listitem_id_seq', 1, false);


--
-- Data for Name: reporting_queries_organization; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_organization (id, name, abbreviation, parent_id, address_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_organization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_organization_id_seq', 1, false);


--
-- Data for Name: reporting_queries_person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_person (id, family_name, given_name, additional_name, honorific_prefix, honorific_suffix, gender, gender_identity, party_identification, source, birthdate, birthdate_month, birthdate_day, birthdate_year, ethnilocality, languages_spoken, employer, occupation, identifiers, created_at, updated_at) FROM stdin;
1	Bailon	Dago				male	Queer	none	cfp	\N	12	31	1986						2014-07-31 09:28:22-04	\N
2	Ortiz	Kathy				female		none	CFP	\N	6	12	1990						2014-07-31 09:44:56-04	\N
3	Kamlley 	Elaine				other		independent	CFP	\N	9	24	1983						2014-07-31 09:45:50-04	\N
4	Pulido 	Mariella				female		none	CFP	\N	\N	\N	\N						2014-07-31 09:52:41-04	\N
5	Henderson	Cassidy				female		\N	CFP	\N	\N	\N	\N						\N	\N
6	Davis	Pam				female		\N	CFP	\N	\N	\N	\N						\N	\N
7	Smith	Bobby Joe				male		\N	CFP	\N	\N	\N	\N						\N	\N
8	Acker	Terry				female		democrat	CFP	\N	\N	\N	\N						\N	\N
9	Towns	Jason				male		democrat	CFP	\N	\N	\N	\N						\N	\N
10	Masuta	Selina				other		independent	CFP	\N	\N	\N	\N						\N	\N
11	Martinez	Aurea				female		none	CFP	\N	\N	\N	\N						\N	\N
12	Brilliance	Angie				female		none	CFP	\N	\N	\N	\N						\N	\N
\.


--
-- Name: reporting_queries_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_person_id_seq', 12, true);


--
-- Data for Name: reporting_queries_personemailaddress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_personemailaddress (id, person_id, email_address_id, "primary", created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_personemailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_personemailaddress_id_seq', 1, false);


--
-- Data for Name: reporting_queries_personphonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_personphonenumber (id, person_id, phone_number_id, "primary", description, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_personphonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_personphonenumber_id_seq', 1, false);


--
-- Data for Name: reporting_queries_personpostaladdress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_personpostaladdress (id, person_id, postal_address_id, "primary", created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_personpostaladdress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_personpostaladdress_id_seq', 1, false);


--
-- Data for Name: reporting_queries_phonenumber; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_phonenumber (id, number, extension, number_type, operator, country, sms_capable, do_not_call, created_at, updated_at) FROM stdin;
1	929-500-8040		mobile		US	f	f	\N	\N
2	602-459-0542		mobile		US	f	f	\N	\N
3	949-355-1591		other		US	f	f	\N	\N
4	202-596-4972		mobile		US	f	f	\N	\N
5	925-719-5860		mobile		US	f	f	\N	\N
6	202-250-4939		mobile		US	f	f	\N	\N
7	773-551-3673		mobile		US	f	f	\N	\N
8	555-555-4657		mobile		US	f	f	\N	\N
9	555-555-2346		mobile		US	f	f	\N	\N
10	555-555-7243		mobile		US	f	f	\N	\N
11	555-555-1654		mobile		US	f	f	\N	\N
12	555-555-3453		mobile		US	f	f	\N	\N
\.


--
-- Name: reporting_queries_phonenumber_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_phonenumber_id_seq', 12, true);


--
-- Data for Name: reporting_queries_postaladdress; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_postaladdress (id, address_type, address_line, locality, region, postal_code, country, language, location, latitude, longitude, accuracy, status, created_at, updated_at) FROM stdin;
1	home	{"address":"1234 Kamlley St NW"}	Adams Morgan	E	20017	US		\N	\N	\N	\N	verified	\N	\N
2	home	{"address":"1234 E Paulino St"}	Van Ness	E	20008	US		\N	\N	\N	approximate	verified	2014-07-31 11:37:26-04	\N
3	home	{"address":"2543 W. Martinez St"}	Tenly Town	W	20010	US		\N	\N	\N	\N	verified	2014-07-31 11:42:04-04	\N
4	home	{"address":"12343 Ortiz St NW"}	Columbia Heights	E	20011	US		\N	\N	\N	\N	verified	\N	\N
5	home	{"address":"1234 Brilliance St NW"}	Petworth	W	20008	US		\N	\N	\N	\N	verified	\N	\N
6	home	{"address":"4647 Davis St NW"}	Pentagon City	W	20645	US		\N	\N	\N	\N	verified	\N	\N
7	home	{"address":"1234 Towns St NW"}	Petworth	E	20010	US		\N	\N	\N	\N	verified	\N	\N
8	home	{"address":"1234 Acker St NW"}	Anacostia	SE	20023	US		\N	\N	\N	\N	verified	\N	\N
9	home	{"address":"1234 Smith St W"}	Columbia Heights	DC	20011	US		\N	\N	\N	\N	verified	\N	\N
10	home	{"address":"1234 Bailon St NW"}	Mount Pleasant	DC	20011	US		\N	\N	\N	\N	verified	\N	\N
11	home	{"address":"1234 Henderson St NW"}	Columbia Heights	SE	20009	US		\N	\N	\N	\N	verified	\N	\N
12	home	{"address":"1234 Masuta St NW"}	Columbia Heights	NW	20012	US		\N	\N	\N	\N	verified	\N	\N
\.


--
-- Name: reporting_queries_postaladdress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_postaladdress_id_seq', 12, true);


--
-- Data for Name: reporting_queries_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_profile (id, person_id, provider, identifier, url, handle, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_profile_id_seq', 1, false);


--
-- Data for Name: reporting_queries_query; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_query (id, query, name, description) FROM stdin;
\.


--
-- Name: reporting_queries_query_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_query_id_seq', 1, false);


--
-- Data for Name: reporting_queries_recipient; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_recipient (id, display_name, legal_name, amount, donation_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_recipient_id_seq', 1, false);


--
-- Data for Name: reporting_queries_submission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_submission (id, identifiers, person_id, form_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_submission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_submission_id_seq', 1, false);


--
-- Data for Name: reporting_queries_syncoperation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reporting_queries_syncoperation (id, sync_at, type, current_record, total_records, errors, organization_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: reporting_queries_syncoperation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reporting_queries_syncoperation_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_key UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_key UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups_user_id_group_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_key UNIQUE (user_id, group_id);


--
-- Name: auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions_user_id_permission_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_key UNIQUE (user_id, permission_id);


--
-- Name: auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_key UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: reporting_queries_EmailAddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "reporting_queries_EmailAddress"
    ADD CONSTRAINT "reporting_queries_EmailAddress_pkey" PRIMARY KEY (id);


--
-- Name: reporting_queries_FundraisingPage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "reporting_queries_FundraisingPage"
    ADD CONSTRAINT "reporting_queries_FundraisingPage_pkey" PRIMARY KEY (id);


--
-- Name: reporting_queries_attendance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_attendance
    ADD CONSTRAINT reporting_queries_attendance_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_donation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_donation
    ADD CONSTRAINT reporting_queries_donation_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_event_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_event
    ADD CONSTRAINT reporting_queries_event_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_form_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_form
    ADD CONSTRAINT reporting_queries_form_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_list
    ADD CONSTRAINT reporting_queries_list_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_listitem_list_id_content_type_id_object_i_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_listitem
    ADD CONSTRAINT reporting_queries_listitem_list_id_content_type_id_object_i_key UNIQUE (list_id, content_type_id, object_id);


--
-- Name: reporting_queries_listitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_listitem
    ADD CONSTRAINT reporting_queries_listitem_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_organization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_organization
    ADD CONSTRAINT reporting_queries_organization_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_person
    ADD CONSTRAINT reporting_queries_person_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_personemailadd_person_id_email_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personemailaddress
    ADD CONSTRAINT reporting_queries_personemailadd_person_id_email_address_id_key UNIQUE (person_id, email_address_id);


--
-- Name: reporting_queries_personemailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personemailaddress
    ADD CONSTRAINT reporting_queries_personemailaddress_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_personphonenumb_person_id_phone_number_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personphonenumber
    ADD CONSTRAINT reporting_queries_personphonenumb_person_id_phone_number_id_key UNIQUE (person_id, phone_number_id);


--
-- Name: reporting_queries_personphonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personphonenumber
    ADD CONSTRAINT reporting_queries_personphonenumber_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_personpostala_person_id_postal_address_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personpostaladdress
    ADD CONSTRAINT reporting_queries_personpostala_person_id_postal_address_id_key UNIQUE (person_id, postal_address_id);


--
-- Name: reporting_queries_personpostaladdress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_personpostaladdress
    ADD CONSTRAINT reporting_queries_personpostaladdress_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_phonenumber_number_extension_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_phonenumber
    ADD CONSTRAINT reporting_queries_phonenumber_number_extension_key UNIQUE (number, extension);


--
-- Name: reporting_queries_phonenumber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_phonenumber
    ADD CONSTRAINT reporting_queries_phonenumber_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_postaladdress_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_postaladdress
    ADD CONSTRAINT reporting_queries_postaladdress_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_profile_person_id_provider_identifier_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_profile
    ADD CONSTRAINT reporting_queries_profile_person_id_provider_identifier_key UNIQUE (person_id, provider, identifier);


--
-- Name: reporting_queries_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_profile
    ADD CONSTRAINT reporting_queries_profile_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_query
    ADD CONSTRAINT reporting_queries_query_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_recipient
    ADD CONSTRAINT reporting_queries_recipient_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_submission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_submission
    ADD CONSTRAINT reporting_queries_submission_pkey PRIMARY KEY (id);


--
-- Name: reporting_queries_syncoperation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reporting_queries_syncoperation
    ADD CONSTRAINT reporting_queries_syncoperation_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_name_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id ON auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_group_id ON auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_groups_user_id ON auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_permission_id ON auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_user_permissions_user_id ON auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX auth_user_username_like ON auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_admin_log_user_id ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_expire_date ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_like; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX django_session_session_key_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reporting_queries_FundraisingPage_creator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX "reporting_queries_FundraisingPage_creator_id" ON "reporting_queries_FundraisingPage" USING btree (creator_id);


--
-- Name: reporting_queries_attendance_event_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_attendance_event_id ON reporting_queries_attendance USING btree (event_id);


--
-- Name: reporting_queries_attendance_invited_by_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_attendance_invited_by_id ON reporting_queries_attendance USING btree (invited_by_id);


--
-- Name: reporting_queries_attendance_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_attendance_person_id ON reporting_queries_attendance USING btree (person_id);


--
-- Name: reporting_queries_donation_donor_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_donation_donor_id ON reporting_queries_donation USING btree (donor_id);


--
-- Name: reporting_queries_donation_fundraising_page_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_donation_fundraising_page_id ON reporting_queries_donation USING btree (fundraising_page_id);


--
-- Name: reporting_queries_event_creator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_event_creator_id ON reporting_queries_event USING btree (creator_id);


--
-- Name: reporting_queries_event_location_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_event_location_id ON reporting_queries_event USING btree (location_id);


--
-- Name: reporting_queries_event_organizer_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_event_organizer_id ON reporting_queries_event USING btree (organizer_id);


--
-- Name: reporting_queries_form_creator_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_form_creator_id ON reporting_queries_form USING btree (creator_id);


--
-- Name: reporting_queries_listitem_content_type_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_listitem_content_type_id ON reporting_queries_listitem USING btree (content_type_id);


--
-- Name: reporting_queries_listitem_list_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_listitem_list_id ON reporting_queries_listitem USING btree (list_id);


--
-- Name: reporting_queries_organization_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_organization_address_id ON reporting_queries_organization USING btree (address_id);


--
-- Name: reporting_queries_organization_parent_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_organization_parent_id ON reporting_queries_organization USING btree (parent_id);


--
-- Name: reporting_queries_personemailaddress_email_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personemailaddress_email_address_id ON reporting_queries_personemailaddress USING btree (email_address_id);


--
-- Name: reporting_queries_personemailaddress_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personemailaddress_person_id ON reporting_queries_personemailaddress USING btree (person_id);


--
-- Name: reporting_queries_personphonenumber_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personphonenumber_person_id ON reporting_queries_personphonenumber USING btree (person_id);


--
-- Name: reporting_queries_personphonenumber_phone_number_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personphonenumber_phone_number_id ON reporting_queries_personphonenumber USING btree (phone_number_id);


--
-- Name: reporting_queries_personpostaladdress_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personpostaladdress_person_id ON reporting_queries_personpostaladdress USING btree (person_id);


--
-- Name: reporting_queries_personpostaladdress_postal_address_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_personpostaladdress_postal_address_id ON reporting_queries_personpostaladdress USING btree (postal_address_id);


--
-- Name: reporting_queries_profile_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_profile_person_id ON reporting_queries_profile USING btree (person_id);


--
-- Name: reporting_queries_recipient_donation_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_recipient_donation_id ON reporting_queries_recipient USING btree (donation_id);


--
-- Name: reporting_queries_submission_form_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_submission_form_id ON reporting_queries_submission USING btree (form_id);


--
-- Name: reporting_queries_submission_person_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_submission_person_id ON reporting_queries_submission USING btree (person_id);


--
-- Name: reporting_queries_syncoperation_organization_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX reporting_queries_syncoperation_organization_id ON reporting_queries_syncoperation USING btree (organization_id);


--
-- Name: address_id_refs_id_08a2b305; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_organization
    ADD CONSTRAINT address_id_refs_id_08a2b305 FOREIGN KEY (address_id) REFERENCES reporting_queries_postaladdress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_fkey FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_93d2d1f8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT content_type_id_refs_id_93d2d1f8 FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: content_type_id_refs_id_d043b34a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT content_type_id_refs_id_d043b34a FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creator_id_refs_id_8d98266b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_event
    ADD CONSTRAINT creator_id_refs_id_8d98266b FOREIGN KEY (creator_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creator_id_refs_id_bf1295e6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_form
    ADD CONSTRAINT creator_id_refs_id_bf1295e6 FOREIGN KEY (creator_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: creator_id_refs_id_f3f7c880; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "reporting_queries_FundraisingPage"
    ADD CONSTRAINT creator_id_refs_id_f3f7c880 FOREIGN KEY (creator_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: donation_id_refs_id_2999ec9c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_recipient
    ADD CONSTRAINT donation_id_refs_id_2999ec9c FOREIGN KEY (donation_id) REFERENCES reporting_queries_donation(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: donor_id_refs_id_cf9def3e; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_donation
    ADD CONSTRAINT donor_id_refs_id_cf9def3e FOREIGN KEY (donor_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: group_id_refs_id_f4b32aac; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT group_id_refs_id_f4b32aac FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: invited_by_id_refs_id_f43b6062; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_attendance
    ADD CONSTRAINT invited_by_id_refs_id_f43b6062 FOREIGN KEY (invited_by_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: location_id_refs_id_ce345a27; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_event
    ADD CONSTRAINT location_id_refs_id_ce345a27 FOREIGN KEY (location_id) REFERENCES reporting_queries_postaladdress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organization_id_refs_id_d681bf7d; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_syncoperation
    ADD CONSTRAINT organization_id_refs_id_d681bf7d FOREIGN KEY (organization_id) REFERENCES reporting_queries_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: organizer_id_refs_id_8d98266b; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_event
    ADD CONSTRAINT organizer_id_refs_id_8d98266b FOREIGN KEY (organizer_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_id_refs_id_37d856a9; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_submission
    ADD CONSTRAINT person_id_refs_id_37d856a9 FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: person_id_refs_id_f43b6062; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_attendance
    ADD CONSTRAINT person_id_refs_id_f43b6062 FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_attendance_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_attendance
    ADD CONSTRAINT reporting_queries_attendance_event_id_fkey FOREIGN KEY (event_id) REFERENCES reporting_queries_event(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_donation_fundraising_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_donation
    ADD CONSTRAINT reporting_queries_donation_fundraising_page_id_fkey FOREIGN KEY (fundraising_page_id) REFERENCES "reporting_queries_FundraisingPage"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_listitem_content_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_listitem
    ADD CONSTRAINT reporting_queries_listitem_content_type_id_fkey FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_listitem_list_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_listitem
    ADD CONSTRAINT reporting_queries_listitem_list_id_fkey FOREIGN KEY (list_id) REFERENCES reporting_queries_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_organization_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_organization
    ADD CONSTRAINT reporting_queries_organization_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES reporting_queries_organization(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personemailaddress_email_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personemailaddress
    ADD CONSTRAINT reporting_queries_personemailaddress_email_address_id_fkey FOREIGN KEY (email_address_id) REFERENCES "reporting_queries_EmailAddress"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personemailaddress_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personemailaddress
    ADD CONSTRAINT reporting_queries_personemailaddress_person_id_fkey FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personphonenumber_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personphonenumber
    ADD CONSTRAINT reporting_queries_personphonenumber_person_id_fkey FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personphonenumber_phone_number_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personphonenumber
    ADD CONSTRAINT reporting_queries_personphonenumber_phone_number_id_fkey FOREIGN KEY (phone_number_id) REFERENCES reporting_queries_phonenumber(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personpostaladdress_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personpostaladdress
    ADD CONSTRAINT reporting_queries_personpostaladdress_person_id_fkey FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_personpostaladdress_postal_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_personpostaladdress
    ADD CONSTRAINT reporting_queries_personpostaladdress_postal_address_id_fkey FOREIGN KEY (postal_address_id) REFERENCES reporting_queries_postaladdress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_profile_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_profile
    ADD CONSTRAINT reporting_queries_profile_person_id_fkey FOREIGN KEY (person_id) REFERENCES reporting_queries_person(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reporting_queries_submission_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reporting_queries_submission
    ADD CONSTRAINT reporting_queries_submission_form_id_fkey FOREIGN KEY (form_id) REFERENCES reporting_queries_form(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_40c41112; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_groups
    ADD CONSTRAINT user_id_refs_id_40c41112 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_4dc23c39; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY auth_user_user_permissions
    ADD CONSTRAINT user_id_refs_id_4dc23c39 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: user_id_refs_id_c0d12874; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT user_id_refs_id_c0d12874 FOREIGN KEY (user_id) REFERENCES auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

