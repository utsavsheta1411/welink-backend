--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.14 (Ubuntu 12.14-0ubuntu0.20.04.1)

-- Started on 2023-03-27 14:43:12 PST

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

--
-- TOC entry 4292 (class 1262 OID 22158)
-- Name: production; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE production WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


ALTER DATABASE production OWNER TO postgres;

\connect production

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 202 (class 1259 OID 22159)
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    user_id character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    ip_address character varying(255) NOT NULL,
    audit_reference character varying(255) NOT NULL,
    tenant_id character varying(255) NOT NULL
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 22167)
-- Name: address; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.address (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    province character varying(255) NOT NULL,
    bld_or_apartment_no character varying(255),
    date_created timestamp without time zone,
    longitude bigint,
    last_updated timestamp without time zone,
    city character varying(255) NOT NULL,
    street character varying(255),
    zip_code character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    state character varying(255),
    latitude bigint
);


ALTER TABLE public.address OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 22175)
-- Name: applicant_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_profile (
    id character varying(255) NOT NULL,
    picture_url character varying(255),
    summary text,
    hobbies text,
    headline text,
    linked_in_id character varying(255)
);


ALTER TABLE public.applicant_profile OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 22183)
-- Name: applicant_profile_education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_profile_education (
    applicant_profile_educations_id character varying(255) NOT NULL,
    education_id character varying(255)
);


ALTER TABLE public.applicant_profile_education OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 22189)
-- Name: applicant_profile_experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_profile_experience (
    applicant_profile_experiences_id character varying(255) NOT NULL,
    experience_id character varying(255)
);


ALTER TABLE public.applicant_profile_experience OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 22195)
-- Name: applicant_profile_skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.applicant_profile_skills (
    applicant_profile_id character varying(255) NOT NULL,
    skills_string character varying(255)
);


ALTER TABLE public.applicant_profile_skills OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 22201)
-- Name: application; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    is_short_listed boolean NOT NULL,
    date_created timestamp without time zone,
    job_id character varying(255) NOT NULL,
    last_updated timestamp without time zone,
    applicant_id character varying(255) NOT NULL,
    achievements text NOT NULL,
    excels text NOT NULL,
    date_applied timestamp without time zone,
    competencies_id character varying(255) NOT NULL,
    push_factors text NOT NULL,
    status character varying(255) NOT NULL,
    pull_factors text NOT NULL,
    resume_id character varying(255)
);


ALTER TABLE public.application OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 22209)
-- Name: application_core_qualities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_core_qualities (
    application_id character varying(255) NOT NULL,
    core_qualities_string character varying(255)
);


ALTER TABLE public.application_core_qualities OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 22215)
-- Name: application_important_next_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_important_next_role (
    application_id character varying(255) NOT NULL,
    important_next_role_string character varying(255)
);


ALTER TABLE public.application_important_next_role OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 22221)
-- Name: application_qualification_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_qualification_question (
    application_qualification_answers_id character varying(255) NOT NULL,
    qualification_question_id character varying(255)
);


ALTER TABLE public.application_qualification_question OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 22227)
-- Name: application_required_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.application_required_language (
    application_language_answers_id character varying(255) NOT NULL,
    required_language_id character varying(255)
);


ALTER TABLE public.application_required_language OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 22233)
-- Name: auth_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_token (
    id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    username character varying(255) NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.auth_token OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 22241)
-- Name: company; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    nav_logo_resource_id character varying(255),
    icon_resource_id character varying(255),
    date_created timestamp without time zone,
    hero_banner text,
    logo text,
    linked_in_profile character varying(255),
    twitter_profile character varying(255),
    last_updated timestamp without time zone,
    logo_resource_id character varying(255),
    nav_logo text,
    facebook_profile character varying(255),
    hero_banner_resource_id character varying(255),
    about text NOT NULL,
    address_id character varying(255),
    icon text,
    email_address character varying(255),
    name character varying(255) NOT NULL,
    application_slots_for_all_jobs integer,
    status character varying(255) NOT NULL,
    fav_icon text,
    fav_icon_resource_id character varying(255),
    office_number character varying(255)
);


ALTER TABLE public.company OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 22249)
-- Name: company_brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_brands (
    company_id character varying(255) NOT NULL,
    brands_string character varying(255)
);


ALTER TABLE public.company_brands OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 22255)
-- Name: company_div_or_departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_div_or_departments (
    company_id character varying(255) NOT NULL,
    div_or_departments_string character varying(255)
);


ALTER TABLE public.company_div_or_departments OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 22261)
-- Name: company_industries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.company_industries (
    company_id character varying(255) NOT NULL,
    industries_string character varying(255)
);


ALTER TABLE public.company_industries OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 22267)
-- Name: competencies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.competencies (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    leadership character varying(255) NOT NULL,
    management character varying(255) NOT NULL,
    self_management character varying(255) NOT NULL,
    relationship character varying(255) NOT NULL,
    analytical character varying(255) NOT NULL
);


ALTER TABLE public.competencies OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 22275)
-- Name: core_quality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_quality (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    agree boolean NOT NULL,
    core_quality character varying(255) NOT NULL
);


ALTER TABLE public.core_quality OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 22283)
-- Name: education; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.education (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    field_of_study character varying(255),
    date_created timestamp without time zone,
    end_year timestamp without time zone,
    start_year timestamp without time zone,
    last_updated timestamp without time zone,
    degree character varying(255),
    school character varying(255) NOT NULL,
    share_with_network boolean NOT NULL,
    activities_and_societies text,
    description text
);


ALTER TABLE public.education OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 22291)
-- Name: email_template_signature; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.email_template_signature (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    template text NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    status character varying(255) NOT NULL,
    tenant_id character varying(255)
);


ALTER TABLE public.email_template_signature OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 22299)
-- Name: employer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    profile_id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    company_id character varying(255) NOT NULL,
    last_updated timestamp without time zone
);


ALTER TABLE public.employer OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 22307)
-- Name: employer_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employer_profile (
    id character varying(255) NOT NULL
);


ALTER TABLE public.employer_profile OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 22312)
-- Name: endorsement_email_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorsement_email_token (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    token character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    endorser_id character varying(255) NOT NULL,
    expiration_date timestamp without time zone
);


ALTER TABLE public.endorsement_email_token OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 22320)
-- Name: endorser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorser (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    linked_in_profile character varying(255),
    first_name character varying(255) NOT NULL,
    mobile_phone character varying(255),
    last_updated timestamp without time zone,
    application_id character varying(255) NOT NULL,
    gender character varying(255) NOT NULL,
    is_email_sent boolean NOT NULL,
    relationship character varying(255),
    current_company character varying(255),
    department character varying(255),
    email_address character varying(255) NOT NULL,
    end_year_of_working timestamp without time zone,
    personal_note text,
    start_year_of_working timestamp without time zone,
    status character varying(255) NOT NULL,
    current_position character varying(255),
    last_name character varying(255) NOT NULL,
    company_together character varying(255)
);


ALTER TABLE public.endorser OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 22328)
-- Name: endorser_feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorser_feedback (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    has_relationship_comment text,
    agree_on_rehire_comment text,
    candidate_performance character varying(255) NOT NULL,
    date_created timestamp without time zone,
    agree_on_excels boolean NOT NULL,
    agree_on_skills_comment text,
    competencies_answers_id character varying(255) NOT NULL,
    has_relationship boolean NOT NULL,
    agree_on_achievement_comment text,
    last_updated timestamp without time zone,
    agree_on_date_work boolean NOT NULL,
    pull_factors_comment text,
    agree_on_rehire boolean NOT NULL,
    key_responsibilities text,
    agree_on_achievements boolean NOT NULL,
    agree_on_report boolean NOT NULL,
    improvements text,
    excels_comment text,
    push_factors_comment text,
    agree_on_team_player_comment text,
    agree_on_company_comment text,
    agree_on_pull_factors boolean NOT NULL,
    agree_on_relation boolean NOT NULL,
    agree_on_team_player boolean NOT NULL,
    agree_on_date_work_comment text,
    agree_on_report_comment text,
    strengths text,
    show_in_application boolean NOT NULL,
    agree_on_push_factors boolean NOT NULL,
    agree_on_relation_comment text,
    agree_on_company boolean NOT NULL,
    endorser_id character varying(255),
    skills_rating integer NOT NULL
);


ALTER TABLE public.endorser_feedback OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 22336)
-- Name: endorser_feedback_core_quality; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorser_feedback_core_quality (
    endorser_feedback_core_quality_answers_id character varying(255) NOT NULL,
    core_quality_id character varying(255)
);


ALTER TABLE public.endorser_feedback_core_quality OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 22342)
-- Name: endorser_feedback_qualification_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorser_feedback_qualification_question (
    endorser_feedback_qualification_answers_id character varying(255) NOT NULL,
    qualification_question_id character varying(255)
);


ALTER TABLE public.endorser_feedback_qualification_question OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 22348)
-- Name: endorser_feedback_required_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.endorser_feedback_required_language (
    endorser_feedback_language_answers_id character varying(255) NOT NULL,
    required_language_id character varying(255)
);


ALTER TABLE public.endorser_feedback_required_language OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 22354)
-- Name: experience; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.experience (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    start_date timestamp without time zone NOT NULL,
    title character varying(255) NOT NULL,
    date_created timestamp without time zone,
    company character varying(255) NOT NULL,
    industry character varying(255),
    last_updated timestamp without time zone,
    location character varying(255) NOT NULL,
    is_currently_working boolean NOT NULL,
    share_with_network boolean NOT NULL,
    division_or_department character varying(255),
    description text,
    end_date timestamp without time zone,
    employment_type character varying(255) NOT NULL
);


ALTER TABLE public.experience OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 22362)
-- Name: fcmtoken; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fcmtoken (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    user_id character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.fcmtoken OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 22851)
-- Name: flyway_schema_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.flyway_schema_history (
    installed_rank integer NOT NULL,
    version character varying(50),
    description character varying(200) NOT NULL,
    type character varying(20) NOT NULL,
    script character varying(1000) NOT NULL,
    checksum integer,
    installed_by character varying(100) NOT NULL,
    installed_on timestamp without time zone DEFAULT now() NOT NULL,
    execution_time integer NOT NULL,
    success boolean NOT NULL
);


ALTER TABLE public.flyway_schema_history OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 23069)
-- Name: hiring_manager_invitation_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hiring_manager_invitation_token (
    id character varying(45) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    first_name character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    last_updated timestamp without time zone,
    token character varying(255) NOT NULL,
    date_expired timestamp without time zone,
    status character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    tenant_id character varying(45) NOT NULL,
    expiration_date timestamp without time zone
);


ALTER TABLE public.hiring_manager_invitation_token OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 22370)
-- Name: hiring_manager_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hiring_manager_profile (
    id character varying(255) NOT NULL,
    show_complete_applications boolean,
    show_incomplete_applications boolean,
    "position" character varying(255),
    brand_name character varying(255),
    division_or_department character varying(255)
);


ALTER TABLE public.hiring_manager_profile OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 22378)
-- Name: job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    location character varying(255),
    special_note text,
    salary numeric(19,2),
    is_resume_required boolean NOT NULL,
    job_type character varying(255) NOT NULL,
    seniority_level character varying(255) NOT NULL,
    hiring_manager_id character varying(255) NOT NULL,
    title character varying(255) NOT NULL,
    address_id character varying(255),
    selected_brand character varying(255),
    selected_div_or_department character varying(255),
    application_slots integer NOT NULL,
    status character varying(255) NOT NULL,
    description text NOT NULL,
    selected_industry character varying(255)
);


ALTER TABLE public.job OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 22386)
-- Name: job_qualification_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_qualification_question (
    job_qualification_questions_id character varying(255) NOT NULL,
    qualification_question_id character varying(255)
);


ALTER TABLE public.job_qualification_question OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 22392)
-- Name: job_required_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_required_language (
    job_required_languages_id character varying(255) NOT NULL,
    required_language_id character varying(255)
);


ALTER TABLE public.job_required_language OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 22398)
-- Name: job_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_tags (
    job_id character varying(255) NOT NULL,
    tags_string character varying(255)
);


ALTER TABLE public.job_tags OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 23099)
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_token (
    id character varying(45) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    user_id character varying(45) NOT NULL,
    token character varying(255) NOT NULL,
    date_expired timestamp without time zone,
    status character varying(255) NOT NULL
);


ALTER TABLE public.password_reset_token OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 22404)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    address_id character varying(255),
    date_created timestamp without time zone,
    first_name character varying(255) NOT NULL,
    last_updated timestamp without time zone,
    middle_name character varying(255),
    gender character varying(255),
    user_id character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    birth_date timestamp without time zone,
    last_name character varying(255) NOT NULL,
    phone_number character varying(255),
    linked_in_url character varying(255),
    mobile_number character varying(255),
    nationality character varying(255)
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 22412)
-- Name: qualification_question; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qualification_question (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    rate integer NOT NULL,
    question character varying(255) NOT NULL
);


ALTER TABLE public.qualification_question OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 22420)
-- Name: readable_notification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.readable_notification (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    title character varying(255) NOT NULL,
    message character varying(255) NOT NULL,
    is_read boolean NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    user_id character varying(255) NOT NULL,
    is_user_notified boolean NOT NULL,
    type character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.readable_notification OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 22428)
-- Name: registration_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registration_token (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    expiry_date timestamp without time zone NOT NULL,
    user_id character varying(255) NOT NULL,
    token character varying(255) NOT NULL
);


ALTER TABLE public.registration_token OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 22436)
-- Name: required_language; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_language (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    rate integer NOT NULL,
    language character varying(255) NOT NULL
);


ALTER TABLE public.required_language OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 22444)
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 22452)
-- Name: s3resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.s3resource (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    size numeric(19,2),
    type character varying(255) NOT NULL,
    bucket character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    content_type character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    tenant_id character varying(255) NOT NULL
);


ALTER TABLE public.s3resource OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 22460)
-- Name: schedule; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schedule (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    worker_id character varying(255),
    start_date timestamp without time zone NOT NULL,
    clock_out timestamp without time zone,
    date_created timestamp without time zone,
    clock_in timestamp without time zone,
    last_updated timestamp without time zone,
    status character varying(255) NOT NULL,
    end_date timestamp without time zone NOT NULL
);


ALTER TABLE public.schedule OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 22468)
-- Name: skill; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skill (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.skill OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 22476)
-- Name: super_user_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.super_user_profile (
    id character varying(255) NOT NULL
);


ALTER TABLE public.super_user_profile OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 22481)
-- Name: tenant; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tenant (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    company_id character varying(255) NOT NULL,
    subdomain character varying(255) NOT NULL,
    email_template_signature_id character varying(255),
    last_updated timestamp without time zone
);


ALTER TABLE public.tenant OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 22489)
-- Name: user_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role (
    user_id character varying(255) NOT NULL,
    role_id character varying(255) NOT NULL
);


ALTER TABLE public.user_role OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 22497)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    password_expired boolean NOT NULL,
    last_updated timestamp without time zone,
    account_expired boolean NOT NULL,
    tenant_id character varying(255) NOT NULL,
    email_address character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    account_locked boolean NOT NULL,
    password character varying(255) NOT NULL,
    enabled boolean NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 22505)
-- Name: worker; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    profile_id character varying(255) NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone
);


ALTER TABLE public.worker OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 22513)
-- Name: worker_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_license (
    id character varying(255) NOT NULL,
    version bigint NOT NULL,
    date_created timestamp without time zone,
    last_updated timestamp without time zone,
    license_number character varying(255),
    type character varying(255) NOT NULL,
    status character varying(255) NOT NULL
);


ALTER TABLE public.worker_license OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 22521)
-- Name: worker_profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_profile (
    id character varying(255) NOT NULL
);


ALTER TABLE public.worker_profile OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 22526)
-- Name: worker_profile_worker_license; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.worker_profile_worker_license (
    worker_profile_licenses_id character varying(255) NOT NULL,
    worker_license_id character varying(255)
);


ALTER TABLE public.worker_profile_worker_license OWNER TO postgres;

--
-- TOC entry 4232 (class 0 OID 22159)
-- Dependencies: 202
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4233 (class 0 OID 22167)
-- Dependencies: 203
-- Data for Name: address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('fc029f75-2a9f-4bd3-b7e7-57bec572050f', 0, 'Cebu', 'Unit II, E Building', '2021-05-21 15:07:36.983', NULL, '2021-05-21 15:07:36.983', 'Cebu', 'Salinas Drive', '6000', 'Philippines', 'Cebu', NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('4b091882-2afa-410e-9063-96637fe5eedb', 0, 'Cebussssss', 'Palvanub', '2021-07-02 06:20:22.462', NULL, '2021-07-02 06:20:22.462', 'Cebus', 'Salinas Drives', '6000++', 'Philippines', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('55a7c325-6a47-48e9-8473-f854253e6a40', 0, 'Cebussssss', 'Palvanub', '2021-07-06 08:44:00.61', NULL, '2021-07-06 08:44:00.61', 'Cebus', 'Salinas Drives', '6000', 'Philippines', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('167a6898-85fc-40c6-b996-a94d647de815', 0, 'Leyte', 'Palvanub', '2022-03-21 01:47:31.228', NULL, '2022-03-21 01:47:31.228', 'Cebus', NULL, '6000++', 'PH', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('2194d4b0-b2bb-4a54-aedd-cb300da26eb2', 0, 'Leyte', 'Myaddress', '2022-04-17 14:45:16.546', NULL, '2022-04-17 14:45:16.546', 'Buraw', 'M.L Quezon St', '65211', 'PH', 'State', NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('93324b2d-b5c1-4d07-ad70-3322fa770a8f', 0, 'N/A', 'Bldg 2 Centerville', '2022-04-22 16:09:13.585', NULL, '2022-04-22 16:09:13.585', 'Sydney', 'Main Street Rd', '00001', 'Australia', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('0aeaddc0-3c01-4003-9fe5-ac20ba6ef192', 0, 'NA', '914', '2022-05-09 11:22:43.71', NULL, '2022-05-09 11:22:43.71', 'Clarkston', 'Rockland St.', '48348', 'USA', 'Michigan', NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('45aacc4e-308b-4082-a883-0d04b675e214', 0, 'Leyte', NULL, '2022-09-04 13:27:30.155', NULL, '2022-09-04 13:27:30.155', 'Baybay', NULL, '6521', 'Philippines', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('c0ed9d40-63c2-4c05-98b3-3ea97302f786', 0, 'South East', '96 Robinson Road, #11-04 SIF Building', '2022-10-04 03:16:57.864', NULL, '2022-10-04 03:16:57.864', 'Singapore', NULL, '068899', 'Singapore', NULL, NULL);
INSERT INTO public.address (id, version, province, bld_or_apartment_no, date_created, longitude, last_updated, city, street, zip_code, country, state, latitude) VALUES ('3627d5e8-cbb0-4efc-aa97-63948411d41c', 0, 'South East', NULL, '2022-10-19 12:03:10.67', NULL, '2022-10-19 12:03:10.67', 'Singapore', '24 East Coast Avenue, Singapore', '459228', 'Singapore', 'South East', NULL);


--
-- TOC entry 4234 (class 0 OID 22175)
-- Dependencies: 204
-- Data for Name: applicant_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('9ad33ab2-6655-4854-83b5-1d96b216a479', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('83812389-827b-4014-a90b-9212613256a9', 'https://media-exp1.licdn.com/dms/image/C5103AQHhA3AvYTF-UA/profile-displayphoto-shrink_800_800/0/1526527890603?e=1630540800&v=beta&t=xLV0r04MAH7btWQKEM3i1K8OPND-_PiZiig4UJyuThg', NULL, NULL, NULL, 'EFHy2wH6fM');
INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('cc56c783-a7c9-4ecb-ae6e-e5d229a27651', 'https://media-exp1.licdn.com/dms/image/C5603AQGvR5C4aH3Keg/profile-displayphoto-shrink_800_800/0/1590643510242?e=1630540800&v=beta&t=yvqihJwtfppsVDMYThBTA9Nx2WF09mleDH835jCJvdw', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '9zfMArJ4xF');
INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('428097f3-5acf-4432-a75d-be9cfe82e18a', 'https://media-exp1.licdn.com/dms/image/C5603AQEPYXncUv3Vnw/profile-displayphoto-shrink_800_800/0/1614138806373?e=1652918400&v=beta&t=BD9lj5alNbobSgWT8KZXBxy9DW9Nyue07qzQZ0QKKXI', NULL, NULL, NULL, 'WmguAgdBFE');
INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('c18acbbc-dc4a-410a-8992-4ee1ba107871', 'https://media-exp1.licdn.com/dms/image/C5103AQGutrQt9bKw7A/profile-displayphoto-shrink_800_800/0/1556978977962?e=1655942400&v=beta&t=oaZAVCfMbjIaDIEckQW3JlmGTM5nAQQAOQxXTtiINmQ', NULL, NULL, NULL, 'DfjnqvjWlY');
INSERT INTO public.applicant_profile (id, picture_url, summary, hobbies, headline, linked_in_id) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'https://media-exp1.licdn.com/dms/image/C4E03AQEZfRlRsfPEhg/profile-displayphoto-shrink_800_800/0/1592755298281?e=1670457600&v=beta&t=d95qNlLxKs0vfSy0pivdzOpjI8AJU9_U9f8TpyXatl8', NULL, 'ukulele', NULL, '4jMKhUN3vB');


--
-- TOC entry 4235 (class 0 OID 22183)
-- Dependencies: 205
-- Data for Name: applicant_profile_education; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4236 (class 0 OID 22189)
-- Dependencies: 206
-- Data for Name: applicant_profile_experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.applicant_profile_experience (applicant_profile_experiences_id, experience_id) VALUES ('83812389-827b-4014-a90b-9212613256a9', '2f77698c-c713-4f2d-aa14-d85002c67de3');
INSERT INTO public.applicant_profile_experience (applicant_profile_experiences_id, experience_id) VALUES ('cc56c783-a7c9-4ecb-ae6e-e5d229a27651', '8386be58-fa3e-4fd3-b05b-2a3b5ecab3a0');
INSERT INTO public.applicant_profile_experience (applicant_profile_experiences_id, experience_id) VALUES ('c18acbbc-dc4a-410a-8992-4ee1ba107871', '60b9704f-3ab8-444a-88d1-96756c0985a4');
INSERT INTO public.applicant_profile_experience (applicant_profile_experiences_id, experience_id) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', '369312c3-7757-449b-8021-9da122b340d3');


--
-- TOC entry 4237 (class 0 OID 22195)
-- Dependencies: 207
-- Data for Name: applicant_profile_skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('cc56c783-a7c9-4ecb-ae6e-e5d229a27651', 'JAVA');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('cc56c783-a7c9-4ecb-ae6e-e5d229a27651', 'JAVASCRIPT');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Product management');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Strategic thinking');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Problem solving');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Flexibility');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Negotiation');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Effective Communication');
INSERT INTO public.applicant_profile_skills (applicant_profile_id, skills_string) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 'Critical thinking');


--
-- TOC entry 4238 (class 0 OID 22201)
-- Dependencies: 208
-- Data for Name: application; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 0, false, '2021-07-02 06:30:19.813', '26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', '2021-07-02 06:30:19.813', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, '754e126e-c66c-4a4d-8f17-a052efd0af91', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '7494b8d0-a231-48b6-8285-49a9cfe83bcd');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 0, false, '2021-07-06 06:05:07.258', '4d7d079c-deed-42f4-be86-05e61d258654', '2021-07-06 06:05:07.258', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 'a4e90ab2-7bb7-4c82-a37a-f9029b1e72a2', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'a62c748c-7bd7-476e-8370-78a19a709e9e');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 0, false, '2021-07-06 06:12:06.355', 'f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', '2021-07-06 06:12:06.355', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, '62d55085-c38a-4ea2-8d16-0d82dc23c7e9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'd74d77d7-7ca0-4682-957d-4730f28ae0c4');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 0, false, '2021-07-06 06:20:27.361', '09e0ee3d-884c-4a7e-99b0-c67753e6540c', '2021-07-06 06:20:27.361', 'cc56c783-a7c9-4ecb-ae6e-e5d229a27651', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 'b54c0bcf-fe56-4f4b-8054-3feda8325fa4', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '8654e443-3a04-4f13-806b-f73475efa992');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 0, false, '2021-07-06 07:30:44.595', 'dc9f9c08-a143-418d-b9ed-6a14c8864f45', '2021-07-06 07:30:44.595', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, '061f7591-1e15-4c81-947a-2a7439a548f0', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '02244579-c09f-4714-a206-9fb67b5a5197');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 0, false, '2021-07-06 09:08:42.454', '243e95d3-28d1-46f1-ab7b-8fffc4c02b57', '2021-07-06 09:08:42.454', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL, 'fd6e3e09-1dd4-4f15-8ba4-2e4f838870a3', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'INCOMPLETE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'cf00343a-46f9-4c4b-8b00-257d391edefe');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 2, false, '2021-08-03 09:08:17.314', 'ee2c21c4-fb2c-4892-954e-4dc8c504adcd', '2021-08-03 09:16:16.097', 'cc56c783-a7c9-4ecb-ae6e-e5d229a27651', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2021-08-03 09:16:16.096', '4cd7004d-15bb-453d-8e27-4cd03ade1b6b', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'SUBMITTED', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '3f4492e1-f0dd-45d1-8132-850a5b9077f1');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 2, false, '2022-03-18 09:50:17.03', 'dc9f9c08-a143-418d-b9ed-6a14c8864f45', '2022-03-21 02:35:18.428', '428097f3-5acf-4432-a75d-be9cfe82e18a', '<p>bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb</p>', '<p>lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll</p>', '2022-03-21 02:35:18.427', 'c496553f-8b62-4465-b857-d34167715145', '<p>lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll</p>', 'SUBMITTED', '<p>lllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll</p>', '9cf1129a-2039-4059-b499-6eb3f0a1f200');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 3, false, '2021-08-03 09:07:49.769', 'a4c5b805-093b-446a-aadd-9f42a6cc9fc9', '2022-09-04 13:51:52.516', '83812389-827b-4014-a90b-9212613256a9', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2021-08-03 09:16:50.774', 'd91e08b3-e0e2-46bc-b72c-9384983ee801', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'REJECTED', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'b7d872f2-6ebc-45b3-ae27-c5775ee5d8ac');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 2, false, '2022-04-17 14:50:42.355', 'd7e0477f-94d0-4f02-b2b4-c5fbd864864a', '2022-04-17 15:08:09.47', 'c18acbbc-dc4a-410a-8992-4ee1ba107871', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-04-17 15:08:09.468', '37d08e6b-b4a4-482a-8c3f-17cc9d2c0c95', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'SUBMITTED', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'b069dd4b-388d-4ff3-af5e-5e5d6709b3cc');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 1, false, '2022-04-22 16:28:06.194', '5a19a856-3084-4ae7-bfab-9bd8cf99e586', '2022-04-22 16:38:25.916', 'c18acbbc-dc4a-410a-8992-4ee1ba107871', '<p>Trained and onboarded new employees, and conducted orientations for new staff hires.</p>', '<p>Supported daily operations of busy human resources department.<br />
Mentored employees through personal and professional issues.</p>', NULL, '0c6b1b98-f9aa-4bea-adef-44371df5c3ad', '<p>Ensured confidentiality of all personnel, office, and employment records.</p>', 'COMPLETED', '<p>Provide administrative support with payroll, calendars, meetings, and training events.</p>', 'e8270a89-a275-41ca-8972-41a44bd2d643');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 2, false, '2022-05-09 11:57:57.539', '53444197-eda6-4adb-b1f4-5764eeacb458', '2022-05-09 12:23:44.585', 'c18acbbc-dc4a-410a-8992-4ee1ba107871', '<p>Mentored employees through personal and professional issues.Trained and onboarded new employees, and conducted orientations for new staff hires.Trained and onboarded new employees, and conducted orientations for new staff hires.</p>', '<p>Trained and onboarded new employees, and conducted orientations for new staff hires.</p>', '2022-05-09 12:23:44.584', '4beee2cc-3cc3-4421-9fba-2e280c86e10c', '<p>Ensured confidentiality of all personnel, office, and employment records.<br />
Provide administrative support with payroll, calendars, meetings, and training events.<br />
Trained and onboarded new employees, and conducted orientations for new staff hires.<br />
&nbsp;</p>', 'SUBMITTED', '<p>Administered payroll information, compensation materials, and benefits programs.<br />
Supported daily operations of busy human resources department.<br />
Mentored employees through personal and professional issues.<br />
&nbsp;</p>', '5299b4b2-af30-4e87-b6c0-8084c673327a');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 3, false, '2022-09-04 13:36:26.026', '26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', '2022-09-04 13:49:57.407', 'c18acbbc-dc4a-410a-8992-4ee1ba107871', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '2022-09-04 13:47:57.998', '4ab94025-3433-4fe0-935a-742845f08a36', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'HIRED', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', '04e2867d-d8b7-4b8d-9dfc-6c517f01ec1d');
INSERT INTO public.application (id, version, is_short_listed, date_created, job_id, last_updated, applicant_id, achievements, excels, date_applied, competencies_id, push_factors, status, pull_factors, resume_id) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 0, false, '2022-10-04 12:43:09.932', 'd7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', '2022-10-04 12:43:09.932', '0c96aecc-a481-481d-aabc-a3804455015f', '<p>Over the past eight years, I&#39;ve launched several significant HR technology-related features and projects. Such as the Workday recruitment module, which increased the internal mobility rate. I received an excellence award for building new employee experiences for that project.</p>

<p><br />
However, I&#39;ve personally proud of low-hanging fruits. Last year I implemented a simple Onboarding survey tool, which reduced the resignation rate among new joiners by half.</p>', '<p>My main areas of expertise is understanding user needs and requirements for digital HR products and customer success. I wish to grow in the business development field. I expect plenty of opportunities to acquire such knowledge as a Welinktalent Product manager.&nbsp;</p>', NULL, '23c1006b-6944-4cf6-8c83-d78de044d718', '<p>-Time to search for new challenges (I&#39;ve been working in the current copmay for 4.5 years)</p>

<p>-Desire for challenges</p>', 'INCOMPLETE', '<p>-Excitment about product - market fit journey</p>

<p>-Oppotunity to own and build HR tech product</p>

<p>-Oppotunity to Learning though action&nbsp;</p>

<p>-Startup enviroment</p>', NULL);


--
-- TOC entry 4239 (class 0 OID 22209)
-- Dependencies: 209
-- Data for Name: application_core_qualities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Optimistic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Confidence');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Optimistic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Confidence');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Optimistic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Confidence');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Transparency');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Leader');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Humble');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Creativity');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Optimistic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Confidence');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Flexible');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Determination');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Courageous');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Transparency');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Morality');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Listening');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Humble');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Creativity');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Creativity');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Honesty');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Work ethic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Flexible');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Determination');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Work ethic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Humble');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Negotiator');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Leader');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Creativity');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Optimistic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Transparency');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Empowerment');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Accountable');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Empathy');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Empowerment');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Confidence');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Leader');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Analytics');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Self-motivated');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Courageous');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Transparency');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Listening');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Problem-solving');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Strategic');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Empathy');
INSERT INTO public.application_core_qualities (application_id, core_qualities_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Accountable');


--
-- TOC entry 4240 (class 0 OID 22215)
-- Dependencies: 210
-- Data for Name: application_important_next_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Increase of Salary');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Recognition');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'Excitement');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Fit in to the corporate culture');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Work - life balance');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'Chemistry of co-workers');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Capacity of personal initiative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Fit in to the corporate culture');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Capacity to be Innovative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Capacity of personal initiative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Capacity of personal initiative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Capacity of personal initiative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Fit in to the corporate culture');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Chemistry of co-workers');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'Technology');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Fit in to the corporate culture');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Work - life balance');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'Chemistry of co-workers');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'Capacity of personal initiative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Fit in to the corporate culture');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Work - life balance');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'Chemistry of co-workers');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Vision Sharing');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Work - life balance');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'New geographical location');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Opportunity to grow');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'Capacity to be Innovative');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Opportunity to learn');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'New Challenges');
INSERT INTO public.application_important_next_role (application_id, important_next_role_string) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'Capacity to be Innovative');


--
-- TOC entry 4241 (class 0 OID 22221)
-- Dependencies: 211
-- Data for Name: application_qualification_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', '63efdf9b-562e-4922-b77a-51aa07a41f31');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', 'e07905a0-853a-40e5-aef2-5987d8b4ebab');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', '36f04a9f-3bc4-4d06-9f0b-9953e2357905');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', '0f543824-43ed-4543-8aa4-67c8a52461e0');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', 'f1635ba8-d42f-43a1-a650-d183c8c9899e');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', '35553674-e0f8-4c3e-a569-e200e22208e5');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', '4fef069e-a710-4f6d-bb88-483f4a8cfa95');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', 'b138b844-8bbf-45d1-aa56-2e5367079d55');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', '62ada879-208e-4d89-a18c-7d464bdc85ef');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', '34ef7768-cc90-4339-bafc-c30394c44aac');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', '60e1f50a-38ea-4f93-8346-63800b1dc3b8');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'ae55113d-b253-4a39-abc5-0667d7943afd');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', '2504fd39-f8f2-4eb5-9de3-31e23ed1d358');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'fe901047-0160-40ab-a9a7-2bda9ef606f0');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'a9924eaa-3559-4a40-9aa1-47f81ade885e');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', '200cfc5f-e735-4d25-aa99-beea0756ce00');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', '99aeab8a-4a8e-413e-b2c2-770282cec5e2');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', '5f1a8518-7f93-49f0-bd7b-dd2853603d86');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', '151355ea-6aed-4d84-b750-5ffc66ce6852');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'a38bb9fc-cdcd-4398-878b-8129d13fc973');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', '3f283c8a-e3d2-45de-a781-1129f42a7de0');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', '5cb5ec80-812e-4848-ab07-fa34a0f09e6f');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', 'e18ed149-7726-485a-844a-9df87fe5a541');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', '9ea7672b-9793-40fc-90a7-3b1ea0c95329');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', '68806231-7aad-4a14-8f41-0f0ef8cbc8b9');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', '3f8b7c0e-b254-4e99-9fbd-a2cbca1668e6');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', '9761fbcf-929d-4fa5-8a02-4a0a903ad9f4');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'bb33714c-f72b-4530-88c3-149382de3e6f');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', '47c60461-7327-4b60-84cb-41436ad2ffc4');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'bfba88f7-956b-4024-9eb7-73704c075a39');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', 'ab2e14d6-eae1-4817-af3d-9ca34ee77bd2');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', '9e0a0bf8-bc00-49df-a589-4986dd3499e2');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'ae58c3a2-4398-40f7-8f51-3f8a13e9a1ae');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'ebd5d4cc-b075-4a4b-9d35-65f72a16c9be');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', 'b4e3f6a5-e05a-410a-9a17-1084b2b2ce01');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', '244fc5b3-b4be-4e01-a6be-90d8f41fa0c8');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', '2165c2a1-ff54-4e91-9972-456076bfb441');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', '5c29ccab-690b-43d4-a79d-cbb5003b361f');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', '26256eb9-25b2-4d45-85d8-8e724e26be6e');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'c510b1be-8dd3-4e4a-9029-63b578298348');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', 'b99208fe-cc32-4d27-a448-df3427be3cc9');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', 'dc26b67b-3a38-4aa7-b1c2-5595bab390d4');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', '6e3c0f51-ac0f-4cf1-9976-5ae8669d659d');
INSERT INTO public.application_qualification_question (application_qualification_answers_id, qualification_question_id) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', '0f4a7c75-22a7-48bd-a2a9-d0f0bbda6420');


--
-- TOC entry 4242 (class 0 OID 22227)
-- Dependencies: 212
-- Data for Name: application_required_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('c6284d7d-a203-4955-afdb-8031c56705f3', '3c4f98ea-d673-46fc-b0d4-acf395f53911');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', '200ab7df-c23d-4eb2-a5a3-503e098219e0');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('4414194d-6be1-4eda-9953-e482aa05e268', '6538fc01-61b3-42b9-96dd-62cd65a29cc0');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('186b7e3a-ca09-4e98-b96c-6271c964286c', '9bc22ead-e4cb-4c28-92d9-253a912202b8');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('e7627abe-3d44-4cbb-bf76-c43b74df04f5', '5241b1b3-2dec-4782-9a28-83059223d92b');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', '6b7ba277-4b79-4af1-862f-87a1c580fdbd');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('9a58132a-bc23-41d3-a7ec-d0d55a920ae3', '224182f0-3583-4bf2-ad30-c99a04cd24aa');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('6e2ba515-ad7d-4997-9bf3-def8732c136e', 'fbc38872-9a17-4940-bfef-4407941fd4d6');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('3db75284-ec22-41c4-a7ae-efb20f99ce23', '0e1bd27f-6cf7-42c8-a6d2-42c12d66cde2');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', '15aba2a7-0278-4957-8666-6917c6f74d9d');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', '1132aeeb-2a65-4dc3-9e95-a77c3182fa5b');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'dd5535ba-0933-49b1-85b5-c5ce1889b98d');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('e9366eca-f0a1-4b46-9357-87ace5d836d6', '8d7123ca-cfa4-422b-8a25-58ecddcb25fb');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('52808ecf-3148-48f8-ad53-8e28b063017e', '81706697-dd39-4030-ae18-90fd106b72b3');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', '44cd7b6e-8765-465c-9fe2-9414d34d85f2');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('288f1731-5e30-49b7-959f-1e844de2b406', '0eb06b7a-83e3-4693-9431-86049952b080');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('fe527307-b3f1-4bb4-932b-9950a0eddc05', '972da6bf-1eb6-4fa0-a2c3-fdfc0f76f40d');
INSERT INTO public.application_required_language (application_language_answers_id, required_language_id) VALUES ('a1706587-f5f2-43de-901e-f55234f12cab', '461582d1-9db0-49a5-8b70-de5fa9e5f239');


--
-- TOC entry 4243 (class 0 OID 22233)
-- Dependencies: 213
-- Data for Name: auth_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('97e94f40-fc01-4d7b-8ead-0db7c4cdf454', '2022-02-14 03:33:29.523', 'ew@welinktalent.com', '49bbj71qtt0abfqhql43h237fanu94oc');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d3f8953a-6f2a-48fb-a55d-a9f566cf4e75', '2022-02-14 03:37:40.63', 'emmanuel.white@gmail.com', 'an7288o62pgunu8c1rokpv89p2rfmv6a');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('e39c466c-f1bc-4740-b17b-40f965a7e079', '2021-07-02 06:22:31.442', 'fernandezjaymar@gmail.com', 'cuhol4eb3g2h3k1hi1057ei2jv1d7pmF');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('f410d8dd-f937-4296-a0c2-b73a9705597c', '2021-07-05 01:55:06.708', 'ew@welinktalent.com', 'rimvgi4ibqrlmogpufvffutjpeo4o67r');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('9539c297-2985-4bb4-90e6-e9a674baa2eb', '2022-02-14 03:38:16.126', 'emmanuel.white@gmail.com', 'fdobplmttkm7g8brdumegn2bmr75e3c1');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('be9fc34d-0e3a-422e-ad88-257054692c5d', '2022-02-14 03:42:44.631', 'emmanuel.white@gmail.com', '5ei947um1vi9o95nm43tr0nfc5ofhsmn');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('140cf129-7647-4798-9e4f-3d1675a8b33c', '2021-07-05 08:20:12.95', 'ew@welinktalent.com', '429aelugto4j6iioge08qnpnjs6jupvi');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('7f1c594b-b5d4-4ccf-917c-2fcb04644738', '2022-02-14 04:35:02.866', 'emmanuel.white@gmail.com', '82a47bpmcavq1og3k5ljgnkf71rrblqp');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('8ca5d96f-1973-448b-8fdf-77a5074eb1db', '2022-02-14 04:43:41.715', 'emmanuel.white@gmail.com', 'uokvs359e4evs52afj2okatf1vuop7kt');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('007a8a11-1b3c-4db2-9052-37b1c9bbf70f', '2022-02-14 04:43:45.444', 'emmanuel.white@gmail.com', 'sp35rnep91uhkgvepd3k1gfgpi9nal1s');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4035db50-8ea8-4161-905b-696cd808c9f5', '2021-07-06 06:11:10.667', 'fernandezjaymar@gmail.com', '8g7aag7k6sf559ikgvhs07kdverv9hkp');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('2dc3a88b-01b1-4a0a-93be-b803ca6aa3c4', '2022-02-14 04:43:47.489', 'emmanuel.white@gmail.com', 'tu6mun95nq5lrsbhh3v9b9pr997jqh8u');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4d0e9628-cd62-433b-b425-4bf0d906b797', '2022-02-14 04:43:49.364', 'emmanuel.white@gmail.com', 'margm386uck5n79eg0486pn267ien9q9');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('3b0baed2-2826-4fb0-853b-c175286f5227', '2021-07-06 06:23:31.415', 'emmanuel.white@gmail.com', '9pa5ahdseeb76u0hucd37gv6mffcotfg');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('0d76d3c0-0ee8-4593-9569-aa40086d9884', '2022-02-14 04:43:51.326', 'emmanuel.white@gmail.com', 'jqrp5f5mnl35cpskuaohgq9vas808vvq');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ed08d39a-35fb-4d9c-aa51-a9f32f9751c8', '2022-02-14 04:43:53.504', 'emmanuel.white@gmail.com', '6a0njfk696c5iebhanmbd0lrfvs0dinj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('bd11baa5-bd09-43d3-93b4-91eca5ef1d31', '2022-02-14 04:43:55.649', 'emmanuel.white@gmail.com', '89ro3fmg20sqrda3kubehqda6smq64kj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('f15fc407-88aa-4e6a-9ea1-b58fe19d4721', '2022-02-14 05:25:13.114', 'emmanuel.white@gmail.com', 'haoceq84qc5q03660ltv6ibpmvjgdr9j');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('fcdcb699-bb6c-4c50-8786-d209a9ecdcaa', '2022-02-14 05:25:14.98', 'emmanuel.white@gmail.com', 'jklhnfu041fu57u9ddnrdhg0avbda6eg');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('71f23814-5228-41ba-8ddf-e92db8bf0562', '2022-02-14 05:25:16.517', 'emmanuel.white@gmail.com', 'jjkfqq7ltb3078n70flo8mnscn3k3m77');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c8096f68-b68e-4598-a86b-888af882fdfe', '2022-02-14 05:25:18.051', 'emmanuel.white@gmail.com', 'bh7pnnprrhcnu8uv86j2g2nl4q5v6uc5');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('706eb817-8c07-4e06-b139-b371e85fa265', '2022-02-14 05:25:19.589', 'emmanuel.white@gmail.com', 'v2oshocqnm10he448deteimp86jndces');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('fec3062e-1965-45a6-9667-24f450d00469', '2021-07-06 08:30:34.776', 'ew@welinktalent.com', 'kldb7aiq53dlvneth2qibsvesva9glk7');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c7433205-d076-4b77-aa9b-902d8e570111', '2022-02-14 05:25:27.679', 'emmanuel.white@gmail.com', 'omge0tefif7sbepbjhr3indcki8nn1g6');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4b602006-8ede-4a69-a8de-42052b0c7c8a', '2021-07-06 09:01:19.562', 'fernandezjaymar@gmail.com', 's28q9hpsd64cuplr0nvtf3r39ml6j5nj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('30f0996f-5978-443b-a6fd-1355671b85c3', '2022-02-14 05:25:50.858', 'emmanuel.white@gmail.com', 'tkqb84ru5uhcs5lhia06koett63r2j08');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c712bf8b-3ef6-4c90-85ca-34157714569f', '2021-07-27 06:11:32.955', 'ew@welinktalent.com', 'qbl1mtlbkvs7b1k71bokgfu75vgu41m5');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('221e1012-709b-4937-bf00-897fff4f5632', '2021-08-03 06:54:24.697', 'ew@welinktalent.com', 'iuar9id7crmldqm5mk9u32lcpcrga0pf');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('f5e51542-db35-40e7-8d07-937da8bcdb02', '2022-02-14 05:30:02.319', 'emmanuel.white@gmail.com', 'qnrdmoktpei5md66b7nt8g1clpcsg8n4');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('eb3c4536-cc31-46fd-8c03-95aaddee61f0', '2022-03-05 08:38:53.659', 'ew@welinktalent.com', 'qhkdm0c36mk1sbu3o4eta5pejmt23mpt');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('48451c38-92b0-4c8c-a011-67501a425ae0', '2022-03-05 08:52:00.481', 'ew@welinktalent.com', 'l3h2va0cl8u8epo7kv2r9km0q5kqa4l7');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d1a323b7-361f-4166-be14-71bdf3075a6e', '2022-03-07 02:36:32.835', 'ew@welinktalent.com', 'ggftovfu1ac6ivfd7qv7tti20cor02d7');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('87208aa2-189c-4757-bbd1-f1eca1ccbbac', '2021-08-03 09:06:33.881', 'fernandezjaymar@gmail.com', 'uhgpm4vug44nhlb9dd9afe4bl7396qbf');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('5a60401f-fe72-43a6-9f35-4543adb79d35', '2022-03-10 15:54:29.861', 'ew@welinktalent.com', '62rgsv6p9sc2aq98ir1l9ri8od8bra6s');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('7f795572-e1cc-41df-8711-cb9d66e89615', '2022-03-15 09:22:06.941', 'ew@welinktalent.com', 'bsbjel5tdjqoou0gf5er431mtnd6gavo');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('81a30b34-8264-4e2c-95f5-c766576706fd', '2022-03-16 02:10:09.302', 'ew@welinktalent.com', 'v299uefprgaqco9n445i6cohtnf4cuh6');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('153048b8-7266-4278-8000-0708556e97e8', '2022-03-18 09:44:39.429', 'ew@welinktalent.com', 'n00f98vtfvefn5lb36fnm8g3dqepj3n1');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('46484650-d960-4231-8b5e-d685d540257d', '2021-08-20 02:59:45.214', 'ew@welinktalent.com', '91ner238p9obo1n9mdcrghnl8fms8vul');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4ca9ee07-b44e-433a-a338-738b1aec122d', '2021-09-14 07:39:27.268', 'ew@welinktalent.com', 'j203tsfmfc5ov06mmf18mjd1rvodub9l');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ead19aa3-cf71-4289-99ff-f8f85c641f31', '2021-10-11 03:57:53.61', 'ew@welinktalent.com', 'qigr96plb2lcr3ki0fcr1np4v3uhtc6v');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('f46d8452-a18b-4d15-8a44-f87e1554d4a2', '2022-03-18 09:46:18.613', 'klkathleen@hotmail.com', 'kl5k8o2nrlhsjjuoms59tt84klqe5op9');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('84f22f8d-5d88-40fd-a888-58b20c02c4d0', '2022-03-21 01:44:24.309', 'ew@welinktalent.com', 'cqaqrh3lo46h4b9r7v2sobb11q5msfcb');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4210787a-5f89-48fb-880c-369ed36bede8', '2022-03-21 05:30:42.25', 'fernandezjaymar@gmail.com', 'qtet59ambu5bo5csdtvnvemvknut36hf');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4f4fed48-a90b-44ef-82d7-bfb76fd7e751', '2022-03-21 07:25:07.296', 'ew@welinktalent.com', '491a57vmih9omln6bd1h3ujviptbil5o');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c480a89e-b4cd-4ce7-8bbb-5377219d8c88', '2022-03-21 07:39:15.071', 'ew@welinktalent.com', 'fsmj7r8d690q2n8qif19mv7urbaacvnr');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('6c7b3e2a-3f90-40f7-8dde-6305eb7372f2', '2022-03-22 07:02:59.653', 'ew@welinktalent.com', 'b3a97gi0brs917dbaj4bvci9so61lbi8');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ff483b12-873c-4d4b-bb69-690bcc53ca8d', '2022-02-04 16:05:05.941', 'emmanuel.white@gmail.com', '1l806sbri07hvfu5t93268k5trqegunf');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('5ba3bd10-8a38-4a05-bd59-e72d37710bcb', '2022-04-01 08:34:07.775', 'ew@welinktalent.com', '1g29p8iject02mktcfcpci596fsquaem');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4dd7c491-e53f-4fde-8221-762b72f1736a', '2022-04-01 08:34:39.344', 'ew@welinktalent.com', '960eau92mh32cesftojf987bo41oa5dc');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('653d08b3-1e62-4db9-a5c5-49343d9000b3', '2022-02-07 07:13:17.026', 'ew@welinktalent.com', 'rhn9sukbk5jptfbka66drncqj86ckppl');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('f9e239e2-72bd-4757-9aa4-f619f53476e1', '2022-02-09 08:15:36.437', 'emmanuel.white@gmail.com', 'sb96ri6h9005vufgtic8mkob7c52ihff');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('e80ecf37-306c-47a7-98b8-142a74b1360c', '2022-02-09 08:16:20.127', 'emmanuel.white@gmail.com', '3dm8dud8qleu97ki0jpagm2qlveqh4u4');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('01ac7b6d-c61a-4e3d-bd7f-7fcf3023fd5a', '2022-02-09 08:19:59.088', 'ew@welinktalent.com', 'mvohta3eekdnfejpdc8j6h00be0d64dg');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ad89b315-7359-4629-b020-204fc273db91', '2022-02-09 08:44:17.863', 'emmanuel.white@gmail.com', 't4chsfs5qrqkaoqpb1jf4ml0l4vikhf7');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('349e24b5-9683-4794-8891-bca326849042', '2022-02-09 08:44:27.285', 'ew@welinktalent.com', 'kqj6lvpf0sljee4u71hppsqk5390ja22');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('3de2e160-6876-47da-9508-fb7b05c01060', '2022-02-09 08:44:56.686', 'ew@welinktalent.com', 'sge2aek56avnd677bdrqcah2f7b4hm5u');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('b7322110-6e2d-4fa5-b563-a794fd812c40', '2022-02-09 08:47:32.036', 'ew@welinktalent.com', 'b33cradf0vjmc0jlr240hg706m77chqg');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('cf43fe25-c898-43a4-adde-5863548b6724', '2022-02-14 03:02:09.026', 'emmanuel.white@gmail.com', 'ei84r1c7cjkq6tid4u6gmnc3pco048uk');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('7deb9d05-76ad-472c-a489-9ea866d3b447', '2022-04-04 06:44:45.865', 'ew@welinktalent.com', 'r0kvqb251urk1kigtldti3q9o4hcd3bj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('b6482278-b612-4d51-974f-14b801474f48', '2022-04-05 07:47:57.763', 'ew@welinktalent.com', '4821si82ae0uhdt617rj0668i76djbqr');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('0be012cb-316a-4f7e-a19f-bff46f9a15e1', '2022-04-06 08:51:02.368', 'ew@welinktalent.com', 'va2v5q2j3hig1rsofpl7fll0kvhia1q3');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('5a373f73-f740-417e-92ca-b288c1347ad3', '2022-04-07 02:17:38.359', 'ew@welinktalent.com', '76emlrce5ff2agarstpa2g3hkv3qhebu');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('7279b34e-a67f-46ea-96cf-70232618c7f1', '2022-04-07 07:59:39.123', 'emmanuel.white@gmail.com', '3ccrdm9oiieoj4c1tbpjm3nurofu0g1v');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('b024893f-37f9-4048-ae36-2d808e07f5c8', '2022-04-08 07:16:34.584', 'ew@welinktalent.com', '7rt9ikcm0b0soqdgaeu3365bhqbvm90q');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('9319dc45-08b6-491a-8e97-c1c2023016f7', '2022-04-12 08:39:41.969', 'ew@welinktalent.com', 'lq4svpm774so8r7o2g43n4gii1gv56lv');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('377fecfb-206b-46d3-bbd8-178df6d12280', '2022-04-13 07:38:25.512', 'emmanuel.white@gmail.com', '1uds5h3cfr7j6bnpc395cq24khlv5h8v');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('6c31bcbd-7e81-4dfa-be8f-062602adce87', '2022-06-20 05:50:45.34', 'ew@welinktalent.com', 'nivugv1fe60tvlj1asunhvifhq7ff4gi');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('9112f3c4-c303-44fa-8e72-bc010bd7d886', '2022-04-17 14:45:57.723', 'emmanuel.white@gmail.com', 'chleqn4h7r71ume6cpalstobb8i05g8j');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4d9a1dc5-9666-4f01-862a-6719574f9362', '2022-04-17 14:46:00.996', 'emmanuel.white@gmail.com', 'umuhp566v5t6hi3dubjq85b7tl3cuj4m');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('bdf04564-ba8b-41df-9143-81b0b508d59b', '2022-04-17 14:46:07.743', 'emmanuel.white@gmail.com', 'pogin16os9b5e9hn3d6ako8dv0sjpf6m');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('370260fa-0994-4290-aa77-de236054ed00', '2022-06-21 00:57:20.181', 'emmanuel.white@gmail.com', 'oq66kvq1j2kjg9bne5hthbn6ab7jf4aj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('5104c7ab-2838-41b4-945f-2becbfd5742f', '2022-08-31 00:48:28.008', 'ew@welinktalent.com', 'v8q0ea0vemcnu5dkoo0ol42v1tp6q5o2');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('fa42695f-b241-4ef1-9709-cf0a28308124', '2022-09-03 03:06:03.637', 'emmanuel.white@gmail.com', '78sloj1qlhdm9kconri11ii26fe91gtv');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('a70850b6-97cf-4171-ac4f-25f9488b3b72', '2022-09-04 09:15:05.339', 'ew@welinktalent.com', 'fd2c0dum2bb9c8a65fv2ljqrconic74k');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('9344864a-b26e-4b27-b09b-33b837160c35', '2022-04-17 15:09:17.539', 'gigi27', 'gs7ktdm2edem1amd7u7hmn7pgmritvf0');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('2051fdc0-e034-40b1-9ae4-d0d9f04c4f3b', '2022-04-18 05:26:31.099', 'emmanuel.white@gmail.com', 'ecthtpfvg2e7b6shbbq0me6lsiqtdcnk');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('12231f6a-a762-47fc-a10b-290a41aee20f', '2022-04-19 07:07:26.045', 'emmanuel.white@gmail.com', 'a2n9dk1enseh24hf96v3m1h767t7si0o');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('339343aa-6c38-4a64-805b-98df7d23140a', '2022-04-21 05:33:12.214', 'ew@welinktalent.com', 're34r8b9uh99gb4plcv8eisnabqdapsa');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('4147b649-3205-4172-bfc8-674a8f2e7d31', '2022-04-22 15:50:03.56', 'emmanuel.white@gmail.com', 'i0ng0enr0vrkjdefp4ou3qacja8sitgg');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('04ce005b-0c2b-4702-bf4c-4267ad762f3d', '2022-09-04 13:28:49.016', 'emmanuel.white@gmail.com', 'qvcbv912tks2v1du6ceqfmedkqeu23ej');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('1f92f684-5eee-4bf9-ab28-d087f2689ca2', '2022-04-22 16:17:02.263', 'ctc.maddy17@gmail.com', 'emh3kcbv4n0uo9jklb0p5eld7tqkiitZ');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('a51b568b-a0b8-4ce7-b173-8b9d79e8ea67', '2022-09-04 13:29:18.45', 'emmanuel.white@gmail.com', '6m9n3h928uitudm9j7ltt10lrqki2dga');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('0d20b197-46c6-4447-9b30-7e4df15e7c92', '2022-09-04 13:29:31.643', 'emmanuel.white@gmail.com', 'ka6iu7ok3e1vqhvt93raq2id0mgsq96i');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('35397254-5669-4153-afc6-815e98ca6877', '2022-04-30 16:04:10.501', 'maddy17', 'ms7p2ht2l64ugqj1g5u36oos81svk43i');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('b64ab00d-fb59-4d2d-b7f7-6006240db8d0', '2022-04-30 16:19:47.355', 'maddy17', 'tudecm5sk3jif4l5a2nlk3hmi6akum93');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('88894711-bd5c-4573-a7bf-88aa5cb71f5e', '2022-05-03 07:21:49.055', 'fernandezjaymar@gmail.com', '1hdurjgsotpfpe3capjdoq6hmp12f9qt');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('0f3e2161-ba9a-4fef-8705-54188a346bad', '2022-09-04 13:48:27.901', 'ew@welinktalent.com', 'r15k0pivq1doho58op0qlielfoma705s');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('6529a8d0-d713-4645-9f4d-b748a0bd3dca', '2022-05-09 11:25:55.771', 'emmanuel.white@gmail.com', 'q5ij7gq4sul4tg496nbc6hr2ee0p4iqr');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d335af32-0635-4507-9513-5aa87c7146f9', '2022-05-09 11:27:29.777', 'emmanuel.white@gmail.com', '1igrg48ncokbldccm8q5g0e8l7m66sa0');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('68c5577b-b473-473e-a9b9-ed1b4dd472a9', '2022-05-09 11:28:08.841', 'emmanuel.white@gmail.com', 's8j5uon0qpj79amjqqdms9am9uqd9d3s');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('5df4e869-4fae-47b6-b568-38b804d0cb4e', '2022-05-09 11:28:39.18', 'emmanuel.white@gmail.com', 'skgts0b6gj1iip8lig9tepfneje2sp4p');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('fbe41668-26e6-4ac2-a33d-3d68c850f499', '2022-09-04 14:33:52.061', 'emmanuel.white@gmail.com', '67bt54ttce43teptb1i2r2d7dph14sjd');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('0907f954-5c92-4f8f-b3b5-37dfd49cebf1', '2022-09-04 14:38:28.882', 'emmanuel.white@gmail.com', 'bdqb1lqrgpuhv8m4pmdnjt1dolo3tfeq');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d167a938-0746-4290-8443-b8dd8112ac99', '2022-05-09 11:37:59.848', 'emmanuel.white@gmail.com', '56aojtebd8pjkp3810nmcm19pl97gb3j');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('01153cf8-bd3e-453f-8845-431ce6c49156', '2022-09-05 00:33:51.356', 'emmanuel.white@gmail.com', 'sdqcrvlpj6vbmmsili3dn040vaqeope1');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('2aba7cbd-5c66-4c24-a681-9e67d608abe0', '2022-09-05 02:49:19.573', 'emmanuel.white@gmail.com', 'r1png4rkp6m0tsti73vuu0bmigvi62jc');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c4d40673-2b9e-440e-bfbc-c6afdd1d4b3c', '2022-05-09 12:11:51.46', 'fernandezjaymar@gmail.com', 'ou4dqmg0386grspbhusd604ddb16af65');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d36cddb4-0a1e-4161-8a2e-8c7dde45469d', '2022-05-09 12:21:54.077', 'ctc.maddy17@gmail.com', '15dn33a9pse1f3as7hkjonnci4nbmcci');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('b66cad57-9f96-4688-95bc-3f7801b8b339', '2022-05-09 12:25:42.553', 'maddy17', '7bent3iqrd20kg7efdpbiqvnl5ufq0co');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('a6edc53d-50ee-4ee7-a28c-4060fbf6ffde', '2022-09-05 04:36:09.739', 'ew@welinktalent.com', 'fpjdvk222moc3f1vn1s8lfl54q81g12q');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d3d770aa-15f7-4635-b3b5-6fe6129c343b', '2022-09-05 07:17:08.852', 'emmanuel.white@gmail.com', '58frpnd6khbdjij49rvhraa153dbria5');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ad1b8c23-1044-4d9a-98a5-c507d93e2830', '2022-09-06 00:26:58.069', 'ew@welinktalent.com', 'oke564n4jh95n8k45qvja7qo4u9lc67e');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('ab416349-64cc-4436-8b04-37e25e368bd2', '2022-09-06 01:14:52.261', 'ew@welinktalent.com', 'llirdhd1g9pude5sg48quk173j79rniq');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d47cd8dd-da65-488e-aed7-79eb8f668706', '2022-09-06 02:05:47.427', 'emmanuel.white@gmail.com', 'k3sk8icvs9va6i8g37umsilh09lohgl7');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('d5e131b4-a0e6-485b-a030-be34e58ce347', '2022-09-06 02:05:52.365', 'emmanuel.white@gmail.com', '24tnmnijhpal54bm97uvqa3rhld1hbj8');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('6dc67ee1-4582-4102-b015-87df2dbad66e', '2022-09-06 02:20:14.147', 'ew@welinktalent.com', 'p35dtlvqq9ha5l9s5o0dkimfnr2qqumv');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('70b87bbc-35ae-4978-b7f8-2ce2a2575b12', '2022-09-06 02:28:06.31', 'ew@welinktalent.com', 'cmubogsigl76rfvpu0qso1ds8hl3d27r');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c287b1e5-dca4-462d-899b-d6bd0ee7b405', '2022-09-07 03:58:19.209', 'ew@welinktalent.com', 'gmj56mqucg22rf02485boannr2ejjans');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('9e28e525-6788-4eb6-8e50-dd29533d7e58', '2022-09-07 08:50:15.474', 'emmanuel.white@gmail.com', 'rf22uf2eg5vg4som87fd82babf72rj4e');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('2b0aa5fc-f2a3-4561-9554-211df342fe79', '2022-09-26 00:45:04.546', 'ew@welinktalent.com', 'h73abe1rjh6b7r24v6n97m5s2ahtu1aj');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c8cee437-424c-433a-b788-24d07379691f', '2022-09-30 11:21:59.786', 'ew@welinktalent.com', 'n8ttn93evcl1oirrqkejo7976gk39peh');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('33123614-4c3a-45b6-b4a6-bcf2f367df87', '2022-10-03 07:18:02.486', 'ew@welinktalent.com', 'qo6luf5bfjvd5nvandli977torsjodkb');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('620d19ac-59e4-457a-8cf7-8ee56ebeae9d', '2022-10-05 08:51:49.971', 'emmanuel.white@gmail.com', 'ip011vumlk4qjca9a06h2860859949jm');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('eb40aa78-56be-44ce-a261-22eecd5630fa', '2022-10-20 03:57:46.199', 'ew@welinktalent.com', 'jao6q3hmrahu860gtdep3nd7v269l7d4');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('c3e7113d-e177-4d31-942f-cf0b6a035771', '2022-11-02 02:10:37.825', 'emmanuel.white@gmail.com', 'kgs48dltgnglql0oku3hjlrpa6gseofo');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('7473b874-7d36-41cc-9267-bb64a33a575c', '2022-11-14 04:13:11.628', 'emmanuel.white@gmail.com', 'p6g80di72juu04p7djp7ph7umd5djti4');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('483b9f1b-cb80-48bd-8465-a4196a3f57dc', '2022-11-22 02:59:45.036', 'nw@welinktalent.com', 'ojcg0g61lebomkp0q96gfqvsabmjtig3');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('8b4a75cf-1f45-4b08-a3ce-6dfa56111c7d', '2023-01-11 00:11:48.724', 'ew@welinktalent.com', 'vsr8oll9rt9ebcl73l0e252p3dudk8le');
INSERT INTO public.auth_token (id, date_created, username, token) VALUES ('edf85262-54d0-4329-9e4e-84d855355ed1', '2023-03-22 07:36:02.797', 'ew@welinktalent.com', 'kk39t3d580appf01pcn1k8m6dcj3iikd');


--
-- TOC entry 4244 (class 0 OID 22241)
-- Dependencies: 214
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company (id, version, nav_logo_resource_id, icon_resource_id, date_created, hero_banner, logo, linked_in_profile, twitter_profile, last_updated, logo_resource_id, nav_logo, facebook_profile, hero_banner_resource_id, about, address_id, icon, email_address, name, application_slots_for_all_jobs, status, fav_icon, fav_icon_resource_id, office_number) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 27, '8013a1df-2e45-442e-b628-6208c990dae5', 'dfa4d329-eff5-432b-b7f8-5ed2b0064722', '2021-05-21 15:07:37.278', 'https://welinktalent-production.s3-ap-southeast-1.amazonaws.com/tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/f7a5/hero_banner.png', 'https://welinktalent-production.s3-ap-southeast-1.amazonaws.com/tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/4540/logo.png', 'https://www.linkedin.com/profile', 'https://www.twitter.com/profile', '2022-10-05 08:49:51.29', '99fc1c50-4f81-4f9a-910a-5271990c2cfd', 'https://welinktalent-production.s3-ap-southeast-1.amazonaws.com/tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/240c/nav_logo.png', 'https://www.facebook.com/profile', '723040b5-e91c-406e-80c2-f2f35ef22d89', 'We help our client to build an exceptional business by linking them with the best talent available.
We understand your needs, attract and engage with the right people, and finally consult with you on the most efficient choice that will give you a competitive advantage.
Firstly, we understand your needs precisely through an in-depth job brief discussion.
Secondly, we will tailor an efficient recruitment strategy for you.
Thirdly, we search, screen, and interview candidates in person and introduce your company and role to them.
Our main focus is always to deliver the ideal candidate to your organisation.
We assess the capabilities, the potential and the personal drivers of all our candidates to think long term and deliver high potential assets to your organisation.', 'fc029f75-2a9f-4bd3-b7e7-57bec572050f', 'https://welinktalent-production.s3-ap-southeast-1.amazonaws.com/tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/1bf4/icon.png', 'donotreply@welinktalent.com', 'Welinktalent', 10, 'ACTIVE', 'https://welinktalent-production.s3-ap-southeast-1.amazonaws.com/tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/9d8f/favicon.png', 'cb45a6f8-a764-433e-a74e-b939af2ca821', NULL);


--
-- TOC entry 4245 (class 0 OID 22249)
-- Dependencies: 215
-- Data for Name: company_brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company_brands (company_id, brands_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'Return-on-Talent');
INSERT INTO public.company_brands (company_id, brands_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'WelinkTalent Singapore');
INSERT INTO public.company_brands (company_id, brands_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'WelinkTalent Dubai');


--
-- TOC entry 4246 (class 0 OID 22255)
-- Dependencies: 216
-- Data for Name: company_div_or_departments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company_div_or_departments (company_id, div_or_departments_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'Human Resource');
INSERT INTO public.company_div_or_departments (company_id, div_or_departments_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'Digital Team');
INSERT INTO public.company_div_or_departments (company_id, div_or_departments_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'Invoicing');


--
-- TOC entry 4247 (class 0 OID 22261)
-- Dependencies: 217
-- Data for Name: company_industries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.company_industries (company_id, industries_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'BPO');
INSERT INTO public.company_industries (company_id, industries_string) VALUES ('a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'Construction');


--
-- TOC entry 4248 (class 0 OID 22267)
-- Dependencies: 218
-- Data for Name: competencies; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('754e126e-c66c-4a4d-8f17-a052efd0af91', 0, 'Business Acumen', 'Project/Process Management', 'Drive for Results', 'Interpersonal Skills', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('a4e90ab2-7bb7-4c82-a37a-f9029b1e72a2', 0, 'Strategic Thinking', 'Managing Execution', 'Initiative & Risk Taking', 'Teamwork & Team Building', 'Decision Making');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('62d55085-c38a-4ea2-8d16-0d82dc23c7e9', 0, 'Strategic Thinking', 'Delegation & Performance Management', 'Drive for Results', 'Communication & Influencing', 'Problem Solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('b54c0bcf-fe56-4f4b-8054-3feda8325fa4', 0, 'Business Acumen', 'Project/Process Management', 'Drive for Results', 'Interpersonal Skills', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('061f7591-1e15-4c81-947a-2a7439a548f0', 0, 'Business Acumen', 'Delegation & Performance Management', 'Adaptability Management', 'Interpersonal Skills', 'Problem Solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('fd6e3e09-1dd4-4f15-8ba4-2e4f838870a3', 0, 'Strategic Thinking', 'Project/Process Management', 'Learning Agility / Development', 'Interpersonal Skills', 'Decision Making');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('d91e08b3-e0e2-46bc-b72c-9384983ee801', 0, 'Business Acumen', 'Project/Process Management', 'Learning Agility / Development', 'Interpersonal Skills', 'Problem Solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('4cd7004d-15bb-453d-8e27-4cd03ade1b6b', 0, 'Inspiring Others', 'Delegation & Performance Management', 'Drive for Results', 'Teamwork & Team Building', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('d680db1e-516c-47f2-86de-78714c70eede', 0, 'Business acumen', 'Project/process management', 'Initiative & risk taking', 'Teamwork & team building', 'Critical thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('3b486a77-ada2-456e-b09e-a34f575b9ebe', 0, 'Strategic thinking', 'Project/process management', 'Initiative & risk taking', 'Teamwork & team building', 'Decision making');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('c496553f-8b62-4465-b857-d34167715145', 0, 'Leading Courageously', 'Managing Execution', 'Initiative & Risk Taking', 'Interpersonal Skills', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('99fd5f79-c1d0-456c-9463-a365a3c88c9b', 0, 'Leading courageously', 'Delegation & performance management', 'Learning Agility / development', 'Communication & influencing', 'Critical thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('37d08e6b-b4a4-482a-8c3f-17cc9d2c0c95', 0, 'Business Acumen', 'Delegation & Performance Management', 'Initiative & Risk Taking', 'Communication & Influencing', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('da5b97bb-b0f0-424e-8e56-73371661b243', 0, 'Strategic thinking', 'Project/process management', 'Adaptability management', 'Cross-cultural agility', 'Critical thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('0c6b1b98-f9aa-4bea-adef-44371df5c3ad', 0, 'Leading Courageously', 'Delegation & Performance Management', 'Drive for Results', 'Interpersonal Skills', 'Problem Solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('eb2c62f9-b79c-4616-858d-d63a53ae454d', 0, 'Leading courageously', 'Delegation & performance management', 'Drive for results', 'Interpersonal skills', 'Problem solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('4beee2cc-3cc3-4421-9fba-2e280c86e10c', 0, 'Strategic Thinking', 'Delegation & Performance Management', 'Initiative & Risk Taking', 'Teamwork & Team Building', 'Problem Solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('d674d42e-27e0-4ead-bc35-544c4e3e176f', 0, 'Business acumen', 'Project/process management', 'Initiative & risk taking', 'Communication & influencing', 'Problem solving');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('4ab94025-3433-4fe0-935a-742845f08a36', 0, 'Strategic Thinking', 'Managing Execution', 'Initiative & Risk Taking', 'Communication & Influencing', 'Critical Thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('30e3ba37-9101-4b1d-b6eb-79d15287f574', 0, 'Leading courageously', 'Managing execution', 'Adaptability management', 'Customer focus', 'Critical thinking');
INSERT INTO public.competencies (id, version, leadership, management, self_management, relationship, analytical) VALUES ('23c1006b-6944-4cf6-8c83-d78de044d718', 0, 'Strategic Thinking', 'Project/Process Management', 'Drive for Results', 'Customer Focus', 'Problem Solving');


--
-- TOC entry 4249 (class 0 OID 22275)
-- Dependencies: 219
-- Data for Name: core_quality; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('45f9ed4b-8d95-496e-acba-4fb66a485cb0', 0, '2021-08-03 09:13:57.383', true, 'Analytics');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('e6adfecb-c701-47db-af78-905f040b6585', 0, '2021-08-03 09:13:57.387', true, 'Self-motivated');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('48512493-14f6-46b7-a1c2-4fe58c51a86f', 0, '2021-08-03 09:13:57.389', true, 'Courageous');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('a82ad095-ef1a-441b-9fdf-65358c80f58c', 0, '2021-08-03 09:13:57.391', true, 'Strategic');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('4ab6a067-c1cc-4584-a3ce-d49cd0ce3043', 0, '2021-08-03 09:13:57.393', true, 'Transparency');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('22fb88d7-feb5-49bc-8b9b-afce902e18c9', 0, '2021-08-03 09:15:27.816', true, 'Analytics');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('a40cb484-c37e-427a-be0a-6c0a14f1c27b', 0, '2021-08-03 09:15:27.819', true, 'Humble');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('3745c902-a78f-4782-84cb-04136d640e7e', 0, '2021-08-03 09:15:27.821', false, 'Creativity');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('a2d2b2e9-3ba0-42e9-bec7-515a1330e7d4', 0, '2021-08-03 09:15:27.823', true, 'Morality');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('97772724-e401-4457-9021-eecad8240897', 0, '2021-08-03 09:15:27.825', true, 'Listening');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('18216511-7af6-47eb-a638-d254121e01e8', 0, '2022-03-18 09:56:15.949', true, 'Work ethic');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('d87c22c7-06a9-4c98-8ee5-a9df89b7ce6e', 0, '2022-03-18 09:56:15.957', true, 'Flexible');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('69710892-dee2-40e5-b775-3981a32e0711', 0, '2022-03-18 09:56:15.965', true, 'Determination');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('e0b85d7c-45ed-49fb-a2e5-cb4958b062f0', 0, '2022-03-18 09:56:15.969', true, 'Honesty');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('bbbca4ed-400a-4213-9654-f899106102d0', 0, '2022-03-18 09:56:15.975', true, 'Creativity');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('c6e0b243-7bd5-4e41-882f-d088bd567a11', 0, '2022-04-17 15:05:26.347', true, 'Leader');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('3004ca71-6fe8-491e-8101-951612888c67', 0, '2022-04-17 15:05:26.351', true, 'Work ethic');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('1b345ea5-b90c-4d2f-bfe4-c0b3683e0c9f', 0, '2022-04-17 15:05:26.354', true, 'Self-motivated');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('6a48bdd9-39d6-431e-a19a-00606382a43c', 0, '2022-04-17 15:05:26.357', true, 'Negotiator');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('be043bbe-41a1-4d31-be50-677f06cce066', 0, '2022-04-17 15:05:26.366', true, 'Humble');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('1c253ef1-6c24-4cdd-a2bf-608077805988', 0, '2022-04-22 16:38:25.885', true, 'Accountable');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('c84c6c0d-7cb3-49eb-9466-23b7f8d9fef1', 0, '2022-04-22 16:38:25.889', true, 'Transparency');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('7c8be0e3-9d64-43d2-ad97-02d3754b1afa', 0, '2022-04-22 16:38:25.891', true, 'Empowerment');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('ec697ad7-1ee9-4f70-a2aa-1a79a6a39bc0', 0, '2022-04-22 16:38:25.894', true, 'Optimistic');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('8281f92f-cbd5-4d75-ae11-9ab9148f08f5', 0, '2022-04-22 16:38:25.897', true, 'Creativity');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('926199d9-6458-4428-b579-273d5b7ec954', 0, '2022-05-09 12:14:23.059', true, 'Confidence');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('a501e26d-5899-4b32-b57c-7de56a17f05e', 0, '2022-05-09 12:14:23.063', true, 'Empathy');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('68498f29-de44-4d33-8737-e62d4460fc84', 0, '2022-05-09 12:14:23.066', true, 'Leader');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('e60b9774-e23f-4306-889d-f1e71d05eee7', 0, '2022-05-09 12:14:23.069', false, 'Self-motivated');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('4b76cfd7-4b25-4e5a-931a-0c34b08fa2c8', 0, '2022-05-09 12:14:23.072', true, 'Empowerment');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('9fc03475-09c2-4b0b-9540-5b00c6171ceb', 0, '2022-09-04 13:46:17.307', false, 'Analytics');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('2f2c7aeb-ed10-41d6-98b2-d64961db8ae6', 0, '2022-09-04 13:46:17.312', true, 'Self-motivated');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('53117cb6-243f-424b-8e42-0b644c459f5b', 0, '2022-09-04 13:46:17.315', false, 'Transparency');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('1e2bfeec-c600-4301-85e4-d77fa1438878', 0, '2022-09-04 13:46:17.319', true, 'Strategic');
INSERT INTO public.core_quality (id, version, date_created, agree, core_quality) VALUES ('c038749f-4ebf-408a-8ae5-f433e34904d2', 0, '2022-09-04 13:46:17.322', true, 'Courageous');


--
-- TOC entry 4250 (class 0 OID 22283)
-- Dependencies: 220
-- Data for Name: education; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4251 (class 0 OID 22291)
-- Dependencies: 221
-- Data for Name: email_template_signature; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.email_template_signature (id, version, template, date_created, last_updated, status, tenant_id) VALUES ('cbf6d438-e647-4eda-bf0e-4d42dba97ace', 0, 'Example Pte Ltd<br>EA Licence № *******<br>This email is sent by Example Pte Ltd and may contain information that is privileged or confidential. If you are not the intended recipient, please delete the email and any attachments and notify us immediately.<br>', '2022-04-13 07:18:24.485', '2022-04-13 07:18:24.485', 'ACTIVE', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.email_template_signature (id, version, template, date_created, last_updated, status, tenant_id) VALUES ('cd28bb04-b937-47b7-aa88-dc02536971a6', 3, '<p>Example Pte Ltd<br />
EA Licence № *******<br />
This email is sent by Example Pte Ltd and may contain information that is privileged or confidential. If you are not the intended recipient, please delete the email and any attachments and notify us immediately.</p>

<p>Sample email signature&nbsp;</p>
', '2022-04-17 14:27:03.497', '2022-04-17 14:28:06.221', 'DELETED', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.email_template_signature (id, version, template, date_created, last_updated, status, tenant_id) VALUES ('533d08e9-7edd-43ef-9913-0f235befd86b', 1, '<div>
<div><span style="font-family:Arial,Helvetica,sans-serif"><strong><span style="font-family:verdana,sans-serif">Emmanuel WHITE</span></strong></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif">Co-Founder &amp; CEO</span></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif"><strong>ReturnOnTalent SaaS</strong></span></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif">m:&nbsp;+ 65 92 444 170&nbsp;(WhatsApp)<br />
e:&nbsp;<a href="mailto:ew@welinktalent.com" style="color:#1155cc; font-size:small" target="_blank">ew@welinktalent.com</a></span></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><a href="https://www.returnontalent.io/" style="color:#1155cc" target="_blank">www.returnontalent.io</a></span></div>
</div>

<div>&nbsp;</div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><strong>WeLinkTalent Pte Ltd&nbsp;</strong></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif">EA Licence&nbsp;</span><span style="font-family:Arial,sans-serif">№</span><span style="font-family:verdana,sans-serif">&nbsp;16S8272</span></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif">Registration&nbsp;</span><span style="font-family:Arial,sans-serif">№ </span><span style="font-family:verdana,sans-serif">R1324688</span></span></div>

<div><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:verdana,sans-serif">White Emmanuel Alexander</span></span></div>

<div>&nbsp;</div>

<div>
<p style="margin-left:0cm; margin-right:0cm"><span style="font-family:Arial,Helvetica,sans-serif"><span style="font-family:calibri,sans-serif"><em><span style="font-family:Arial,sans-serif">This email is sent by WeLinkTalent Pte Ltd and may contain information that is privileged or confidential. If you are not the intended recipient, please delete the email and any attachments and notify us immediately. O</span></em><em><span style="font-family:Arial,sans-serif">pening any attachments which contain personal data, you have agreed with WeLinkTalent&rsquo;s Data Protection Policy and if you are providing personal data to WeLinkTalent, you agreed to give WeLinkTalent the consent to collect, use and disclose the personal data. For more information regarding our personal data protection policy you may visit WeLinkTalent &lsquo;s website or email your queries to our Data Protection Officer at&nbsp;<a href="mailto:dpo@welinktalent.com" style="color:#1155cc" target="_blank">dpo@welinktalent.com</a></span></em></span></span></p>
</div>
', '2022-10-05 08:32:34.841', '2022-10-05 08:35:31.043', 'ACTIVE', '77c97464-8677-4d92-9bee-3d4293cc4b14');


--
-- TOC entry 4252 (class 0 OID 22299)
-- Dependencies: 222
-- Data for Name: employer; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4253 (class 0 OID 22307)
-- Dependencies: 223
-- Data for Name: employer_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4254 (class 0 OID 22312)
-- Dependencies: 224
-- Data for Name: endorsement_email_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('45004414-5cc4-45f1-b64a-69a38a070dc8', 0, '2021-07-06 06:45:46.387', '2021-07-06 06:45:46.387', 'mZt6uzmohUfyAe1dNBTOzUv0ahIBtF2on2VaqdoJlCjoRgip', 'ACTIVE', '3dfb1ad5-2ab3-425b-887c-4ab6f4450349', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('d4adf7b9-cf29-4297-a06f-6a86636ecccf', 0, '2021-07-06 07:31:14.195', '2021-07-06 07:31:14.195', 'nbrJcYqdIv6fL0eKlE74EXvPJB6QeelPEwdk0AHQbytgN1pE', 'ACTIVE', '4874ad32-216d-4505-ad18-492e5d4b9177', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('05ebebe5-1dfd-40c3-9f51-229ac2bb6a5e', 0, '2021-07-06 09:12:23.655', '2021-07-06 09:12:23.655', '8eI6kpH0XKO7o5e7k3w418NbWfWnBdQsT2snJPDPgPDqPPnL', 'ACTIVE', 'f70a8ad2-1ab3-4dc0-8d67-d820da74b82a', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('9e824094-ae3e-4841-a85f-1e7242fd9cf5', 1, '2021-08-03 09:08:32.511', '2021-08-03 09:13:57.403', 'yd8OfzqI3oQtwDEAioT6uWDJMslLumemYXTfT8zfNLNRVgMl', 'EXPIRED', '2d162513-6b98-442c-86ac-913038147e16', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('b5ec000c-8adf-4a24-b471-83120a6702dc', 1, '2021-08-03 09:08:51.493', '2021-08-03 09:15:27.835', 'mq7zY8yWLiIiBrJMlKJSZfpaLlIuI5Sa253QeAI2srpjoSA4', 'EXPIRED', '144d2d85-e0b2-4d8c-bc1f-561f5209b678', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('01cc21ec-637b-42e1-981c-d033f61318fd', 1, '2022-03-18 09:53:06.142', '2022-03-18 09:56:16.026', 'j7PNhJxkCYZO5YiohBpv8dwnGxVDxfzqtdTrtmdciD6HpgUi', 'EXPIRED', 'd64f9ae9-d572-4ee2-9985-4fa87985acb7', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('b52b421c-0eff-4246-9a77-b78d073d9ee8', 1, '2022-04-17 14:52:28.997', '2022-04-17 15:05:26.38', 'xywHr7pFJcW2qEdqRsyvbsRIsJlRrqQaiO0MOpc7Hv5FEXBl', 'EXPIRED', '0f9ba665-2b7f-4c92-9c1f-3de65379095b', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('04a16113-8a5f-4fde-9633-bf2587be92ca', 1, '2022-04-22 16:31:10.316', '2022-04-22 16:38:25.913', 'ozPKNRAUKb3wpFkL5x65BBl73yGPlp3DsmlkGGugiBF7oC85', 'EXPIRED', '7b2e360e-8ad1-4dc4-814e-380b0bfc7304', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('ebd87f11-ee5b-46f1-a3f0-de534712699d', 1, '2022-05-09 11:59:54.235', '2022-05-09 12:14:23.086', 'g7XoYfawDewgxP8UcbjdA5OTFyeMAskBDVo7KRvuXmR4MSHD', 'EXPIRED', '179f8470-a2da-4690-b0d5-4c3dd9d9877d', NULL);
INSERT INTO public.endorsement_email_token (id, version, date_created, last_updated, token, status, endorser_id, expiration_date) VALUES ('55895b7d-1778-46e1-8d4b-967ca1560e2b', 1, '2022-09-04 13:40:58.208', '2022-09-04 13:46:17.341', 'AyV8fINw2V7UUchVpPp3xvXcVQjh4d5V3JYfIH2TxcP6cIcV', 'EXPIRED', '05f984a8-1e79-4fe2-8da0-b66db664fd92', NULL);


--
-- TOC entry 4255 (class 0 OID 22320)
-- Dependencies: 225
-- Data for Name: endorser; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('e1c8f551-6327-4d63-b2c8-879c99081ca4', 0, '2021-07-02 06:31:30.453', NULL, 'Larry', '14654659878', '2021-07-02 06:31:30.453', 'c6284d7d-a203-4955-afdb-8031c56705f3', 'MALE', false, 'none', 'Larry Company', 'admin', 'jf@welinktalent.com', '2021-06-30 16:00:00', 'Something here', '2002-02-05 16:00:00', 'ACTIVE', 'CEO', 'Gwapo', 'Larry Company');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('f1a7bb3a-8b1c-4b6b-8df1-17ad0a0c63f6', 0, '2021-07-06 06:12:22.82', NULL, 'Larry', '14654659878', '2021-07-06 06:12:22.82', '186b7e3a-ca09-4e98-b96c-6271c964286c', 'MALE', false, 'none', 'Larry Company', 'admin', 'jf@welinktalent.com', '2021-06-30 16:00:00', 'Something here', '2002-02-05 16:00:00', 'ACTIVE', 'CEO', 'Gwapo', 'Larry Company');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('3dfb1ad5-2ab3-425b-887c-4ab6f4450349', 1, '2021-07-06 06:22:09.955', NULL, 'Jaymar', '061249581755', '2021-07-06 06:45:53.71', 'e7627abe-3d44-4cbb-bf76-c43b74df04f5', 'MALE', true, 'Co Developer', 'Welinktalent', 'Digital Team', 'jf@welinktalent.com', '2021-07-05 16:00:00', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-02-01 16:00:00', 'ACTIVE', 'Frontend Developer', 'Fernandez', 'Welinktalent');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('4874ad32-216d-4505-ad18-492e5d4b9177', 1, '2021-07-06 07:31:04.326', NULL, 'Larry', '14654659878', '2021-07-06 07:31:14.577', '9a58132a-bc23-41d3-a7ec-d0d55a920ae3', 'MALE', true, 'none', 'Larry Company', 'admin', 'jf@welinktalent.com', '2021-06-30 16:00:00', 'Something here', '2002-02-05 16:00:00', 'ACTIVE', 'CEO', 'Gwapo', 'Larry Company');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('f70a8ad2-1ab3-4dc0-8d67-d820da74b82a', 1, '2021-07-06 09:09:03.455', NULL, 'Larry', '14654659878', '2021-07-06 09:12:23.927', '6e2ba515-ad7d-4997-9bf3-def8732c136e', 'MALE', true, 'none', 'Larry Company', 'admin', 'jf@welinktalent.com', '2021-06-30 16:00:00', 'Something here', '2002-02-05 16:00:00', 'ACTIVE', 'CEO', 'Gwapo', 'Larry Company');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('2d162513-6b98-442c-86ac-913038147e16', 1, '2021-08-03 09:08:26.911', NULL, 'Larry', '14654659878', '2021-08-03 09:08:36.559', '3db75284-ec22-41c4-a7ae-efb20f99ce23', 'MALE', true, 'none', 'Larry Company', 'admin', 'lb@welinktalent.com', '2021-06-30 16:00:00', 'Something here', '2002-02-05 16:00:00', 'ACTIVE', 'CEO', 'Gwapo', 'Larry Company');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('144d2d85-e0b2-4d8c-bc1f-561f5209b678', 1, '2021-08-03 09:08:45.012', NULL, 'Jaymar', '061249581755', '2021-08-03 09:08:51.782', '51f73a2c-d206-4ec8-bbc9-5bdf7e6d529e', 'MALE', true, 'Co Developer', 'Welinktalent', 'Digital Team', 'jf@welinktalent.com', '2021-07-05 16:00:00', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', '2019-02-01 16:00:00', 'ACTIVE', 'Frontend Developer', 'Fernandez', 'Welinktalent');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('d64f9ae9-d572-4ee2-9985-4fa87985acb7', 1, '2022-03-18 09:53:06.009', NULL, 'Keav', '98374162', '2022-03-18 09:53:06.213', '8575b7ea-0fec-4a0c-9292-2071aaaed3c9', 'MALE', true, 'Manager', 'WLT', 'Recruitment', 'kl@welinktalent.com', '2022-03-16 16:00:00', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc

jlkllllllllllllllllllllllllllllllllllllllllllllllllllllllllll', '2022-02-28 16:00:00', 'ACTIVE', 'Consultant', 'Kho', 'Welinktalent');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('0f9ba665-2b7f-4c92-9c1f-3de65379095b', 1, '2022-04-17 14:52:28.958', NULL, 'Jay', '1234567', '2022-04-17 14:52:29.028', 'e9366eca-f0a1-4b46-9357-87ace5d836d6', 'MALE', true, 'Supervisor', 'WLT', 'IT Department', 'fernandezjaymar@gmail.com', '2022-04-10 16:00:00', 'note added', '1999-02-01 16:00:00', 'ACTIVE', 'Job', 'Lapac', 'WLT');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('7b2e360e-8ad1-4dc4-814e-380b0bfc7304', 1, '2022-04-22 16:31:10.301', NULL, 'Jerry', '123456789', '2022-04-22 16:31:10.328', '52808ecf-3148-48f8-ad53-8e28b063017e', 'MALE', true, 'My direct supervisor', 'WLT', 'IT Division', 'fernandezjaymar@gmail.com', '2016-07-04 16:00:00', 'Dear Jerry,  Kindly check your email and endorse me to this opportunity I am applying to. Thanks.', '2012-02-29 16:00:00', 'ACTIVE', 'Junior Software Developer', 'Fernandez', 'CompanyDirect');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('179f8470-a2da-4690-b0d5-4c3dd9d9877d', 1, '2022-05-09 11:59:54.171', NULL, 'Jay', '0535632589', '2022-05-09 11:59:54.262', '288f1731-5e30-49b7-959f-1e844de2b406', 'MALE', true, 'My supervisor', 'JobTarget', 'IT Division', 'fernandezjaymar@gmail.com', '2022-05-04 16:00:00', 'Kindly endorse me to this job opportunity. Thanks.', '2021-11-30 16:00:00', 'ACTIVE', 'Supervisor', 'Lorenzo', 'WLT');
INSERT INTO public.endorser (id, version, date_created, linked_in_profile, first_name, mobile_phone, last_updated, application_id, gender, is_email_sent, relationship, current_company, department, email_address, end_year_of_working, personal_note, start_year_of_working, status, current_position, last_name, company_together) VALUES ('05f984a8-1e79-4fe2-8da0-b66db664fd92', 1, '2022-09-04 13:40:58.034', NULL, 'Jason', '46465465465', '2022-09-04 13:40:58.295', 'fe527307-b3f1-4bb4-932b-9950a0eddc05', 'MALE', true, 'none', 'Mason company', 'Admin', 'jasonmason@yopmail.com', '2022-09-01 16:00:00', 'SOme personal message here', '2013-11-04 16:00:00', 'ACTIVE', 'CEO', 'Mason', 'Mason company');


--
-- TOC entry 4256 (class 0 OID 22328)
-- Dependencies: 226
-- Data for Name: endorser_feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', 1, NULL, NULL, 'HIGH PERFORMER HIGH POTENTIAL', '2021-08-03 09:15:27.812', true, 'Something here', '3b486a77-ada2-456e-b09e-a34f575b9ebe', true, NULL, '2021-08-03 09:16:14.61', true, NULL, true, 'Something Larry perform', true, true, 'something improvement', NULL, 'Something Push Factor here', NULL, 'Larry Company', true, true, true, NULL, NULL, 'Something strength', true, false, NULL, false, '144d2d85-e0b2-4d8c-bc1f-561f5209b678', 4);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 1, NULL, NULL, 'HIGH PERFORMER MODERATE POTENTIAL', '2021-08-03 09:13:57.36', true, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 'd680db1e-516c-47f2-86de-78714c70eede', true, NULL, '2021-08-03 09:16:47.485', true, NULL, true, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', true, true, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', NULL, NULL, NULL, NULL, true, true, true, NULL, NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', true, true, NULL, true, '2d162513-6b98-442c-86ac-913038147e16', 4);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', 0, NULL, NULL, 'MODERATE PERFORMER HIGH POTENTIAL', '2022-03-18 09:56:15.918', true, 'jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjkkkkkjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj', '99fd5f79-c1d0-456c-9463-a365a3c88c9b', true, NULL, '2022-03-18 09:56:15.918', true, NULL, true, 'llllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllllll', true, true, 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', NULL, NULL, NULL, NULL, true, true, true, NULL, NULL, 'mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm', true, true, NULL, true, 'd64f9ae9-d572-4ee2-9985-4fa87985acb7', 5);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', 0, NULL, NULL, 'MODERATE PERFORMER HIGH POTENTIAL', '2022-04-17 15:05:26.334', true, 'none', 'da5b97bb-b0f0-424e-8e56-73371661b243', true, NULL, '2022-04-17 15:05:26.334', true, NULL, true, 'text here', true, true, 'text here', NULL, NULL, NULL, NULL, true, true, true, NULL, NULL, 'text here', true, true, NULL, true, '0f9ba665-2b7f-4c92-9c1f-3de65379095b', 3);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', 0, NULL, NULL, 'HIGH PERFORMER HIGH POTENTIAL', '2022-04-22 16:38:25.879', true, 'She is a  best asset to the company.', 'eb2c62f9-b79c-4616-858d-d63a53ae454d', true, NULL, '2022-04-22 16:38:25.879', true, 'needs improvement', true, 'Supported daily operations of busy human resources department and mentored employees through personal and professional issues.', true, true, 'Delegating the task', NULL, NULL, NULL, NULL, false, true, true, NULL, NULL, 'Team player', true, true, NULL, true, '7b2e360e-8ad1-4dc4-814e-380b0bfc7304', 4);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 0, NULL, NULL, 'MODERATE PERFORMER HIGH POTENTIAL', '2022-05-09 12:14:23.047', true, 'She is an excellent employee.', 'd674d42e-27e0-4ead-bc35-544c4e3e176f', true, NULL, '2022-05-09 12:14:23.047', true, NULL, true, 'Hired and assisted the president of human resources in all areas of HR to support the employees.', true, true, 'Delegation of Task', NULL, NULL, NULL, NULL, true, true, true, NULL, NULL, 'Team Player', true, true, NULL, true, '179f8470-a2da-4690-b0d5-4c3dd9d9877d', 5);
INSERT INTO public.endorser_feedback (id, version, has_relationship_comment, agree_on_rehire_comment, candidate_performance, date_created, agree_on_excels, agree_on_skills_comment, competencies_answers_id, has_relationship, agree_on_achievement_comment, last_updated, agree_on_date_work, pull_factors_comment, agree_on_rehire, key_responsibilities, agree_on_achievements, agree_on_report, improvements, excels_comment, push_factors_comment, agree_on_team_player_comment, agree_on_company_comment, agree_on_pull_factors, agree_on_relation, agree_on_team_player, agree_on_date_work_comment, agree_on_report_comment, strengths, show_in_application, agree_on_push_factors, agree_on_relation_comment, agree_on_company, endorser_id, skills_rating) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', 0, NULL, NULL, 'MODERATE PERFORMER HIGH POTENTIAL', '2022-09-04 13:46:17.291', true, 'My comment here', '30e3ba37-9101-4b1d-b6eb-79d15287f574', true, NULL, '2022-09-04 13:46:17.291', true, NULL, true, 'Something Geraldine perform', true, true, 'Somethings Geraldines improvement', NULL, NULL, NULL, NULL, true, true, true, NULL, NULL, 'Something Geraldine''s strength', true, true, NULL, true, '05f984a8-1e79-4fe2-8da0-b66db664fd92', 4);


--
-- TOC entry 4257 (class 0 OID 22336)
-- Dependencies: 227
-- Data for Name: endorser_feedback_core_quality; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', '45f9ed4b-8d95-496e-acba-4fb66a485cb0');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 'e6adfecb-c701-47db-af78-905f040b6585');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', '48512493-14f6-46b7-a1c2-4fe58c51a86f');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 'a82ad095-ef1a-441b-9fdf-65358c80f58c');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', '4ab6a067-c1cc-4584-a3ce-d49cd0ce3043');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', '22fb88d7-feb5-49bc-8b9b-afce902e18c9');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', 'a40cb484-c37e-427a-be0a-6c0a14f1c27b');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', '3745c902-a78f-4782-84cb-04136d640e7e');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', 'a2d2b2e9-3ba0-42e9-bec7-515a1330e7d4');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', '97772724-e401-4457-9021-eecad8240897');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '18216511-7af6-47eb-a638-d254121e01e8');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', 'd87c22c7-06a9-4c98-8ee5-a9df89b7ce6e');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '69710892-dee2-40e5-b775-3981a32e0711');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', 'e0b85d7c-45ed-49fb-a2e5-cb4958b062f0');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', 'bbbca4ed-400a-4213-9654-f899106102d0');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', 'c6e0b243-7bd5-4e41-882f-d088bd567a11');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '3004ca71-6fe8-491e-8101-951612888c67');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '1b345ea5-b90c-4d2f-bfe4-c0b3683e0c9f');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '6a48bdd9-39d6-431e-a19a-00606382a43c');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', 'be043bbe-41a1-4d31-be50-677f06cce066');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', '1c253ef1-6c24-4cdd-a2bf-608077805988');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', 'c84c6c0d-7cb3-49eb-9466-23b7f8d9fef1');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', '7c8be0e3-9d64-43d2-ad97-02d3754b1afa');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', 'ec697ad7-1ee9-4f70-a2aa-1a79a6a39bc0');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', '8281f92f-cbd5-4d75-ae11-9ab9148f08f5');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', '926199d9-6458-4428-b579-273d5b7ec954');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 'a501e26d-5899-4b32-b57c-7de56a17f05e');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', '68498f29-de44-4d33-8737-e62d4460fc84');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 'e60b9774-e23f-4306-889d-f1e71d05eee7');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', '4b76cfd7-4b25-4e5a-931a-0c34b08fa2c8');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '9fc03475-09c2-4b0b-9540-5b00c6171ceb');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '2f2c7aeb-ed10-41d6-98b2-d64961db8ae6');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '53117cb6-243f-424b-8e42-0b644c459f5b');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '1e2bfeec-c600-4301-85e4-d77fa1438878');
INSERT INTO public.endorser_feedback_core_quality (endorser_feedback_core_quality_answers_id, core_quality_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', 'c038749f-4ebf-408a-8ae5-f433e34904d2');


--
-- TOC entry 4258 (class 0 OID 22342)
-- Dependencies: 228
-- Data for Name: endorser_feedback_qualification_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 'e4764834-e9a8-42c4-b172-0eeed3fd1dd5');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 'b0f1348d-cecb-4148-ae04-bdb9af4a01b7');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', '2c3fb0a8-63ee-4c6b-b2c7-47e787c7a910');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', '49cad1d4-35a9-464c-b31a-7a887108fd7b');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', 'ee625f73-b6d0-4a0c-9957-d8bd1ccd5a54');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', 'f301b2e9-40fd-4fab-ae44-723167a80832');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '29b32c86-8c66-47c9-aee9-8f89bef1945d');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '6d26c720-226a-451b-ad66-0a4d6a4f20cf');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', 'c7d0dfc3-d870-4a77-a38f-055842df51b3');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '9e00821a-bb2c-49bd-ac93-9b30f393b730');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '470dbd9f-9ce9-47d6-b069-fca21cdecdb5');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', 'a3e58e91-4a2a-4a4d-9bbd-747cf8139fa1');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', '8c7a344c-0683-4493-95b8-d27398b23660');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', 'a6cb9646-45e9-4342-a9c4-0d5b706b82fb');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 'b5bb282b-534b-4ade-8d28-b8535ba1946e');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', '993fda1a-f06a-4556-80ad-a9b65aa9466e');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 'f41d7a0e-0eab-4324-8e62-486230ccd0d7');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', 'c0bc33c3-41d8-4098-b11a-de449c80d60d');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '7e39fb4a-0cbd-4ad8-9124-b228a246d184');
INSERT INTO public.endorser_feedback_qualification_question (endorser_feedback_qualification_answers_id, qualification_question_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '19a0fb75-0605-448c-a3ec-38dede57c5d5');


--
-- TOC entry 4259 (class 0 OID 22348)
-- Dependencies: 229
-- Data for Name: endorser_feedback_required_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('005ba9cc-1fb5-4657-9919-c2d2ef0f7f8a', 'a4b7e3f7-ad6a-41f6-8f41-245c75565fa3');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('1a87c1ab-850f-41cb-8f9d-3c069e3a045f', 'ba552bcf-af1e-4522-bad6-87684f5da484');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '77f6810e-4612-4fa8-9bdf-436a98c0b7f9');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('b7ef67bf-6e30-416e-862f-0bd29c49b99d', '24a770d3-b2ce-4199-b965-d6699e2352e2');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('9b818a61-fe72-479a-8e5a-33a20730763f', '328c9f26-758b-4c01-866d-651e74222864');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('14dbf79a-340e-470c-a1b0-e4d2b92f26b3', '77e3064d-5739-4ac8-9dc9-633be3fd5e6c');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', 'ef0101cc-fcbc-4e56-b486-4e9871346ce6');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('ab673fd0-65e4-4131-be52-4421b9577369', '366d1d43-1cc5-47f1-9389-44d59795a66a');
INSERT INTO public.endorser_feedback_required_language (endorser_feedback_language_answers_id, required_language_id) VALUES ('97271d1a-641c-4348-9073-74c3efcd1d97', '9d6e934b-3d32-44b6-90f0-2cde0baec0f7');


--
-- TOC entry 4260 (class 0 OID 22354)
-- Dependencies: 230
-- Data for Name: experience; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('61dc9703-0703-4009-8fa6-96fea62c3939', 0, '1998-06-17 16:00:00', 'CEO', '2021-07-06 07:32:22.516', 'Larry Company', NULL, '2021-07-06 07:32:22.516', 'ALA', true, true, NULL, NULL, NULL, 'PROJECT_TEAM_RECRUITMENT');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('5362640c-7432-45be-94b9-e42fb903caff', 0, '1999-06-07 16:00:00', 'CEO', '2021-07-06 09:13:02.402', 'Larry Company', NULL, '2021-07-06 09:13:02.402', 'Albania', true, true, NULL, NULL, NULL, 'TEMPORARY_ASSIGNMENT');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('2f77698c-c713-4f2d-aa14-d85002c67de3', 0, '1998-01-05 16:00:00', 'CEO', '2021-08-03 09:09:16.985', 'Larry Company', NULL, '2021-08-03 09:09:16.985', 'American Samoa', true, true, NULL, NULL, NULL, 'PROJECT_TEAM_RECRUITMENT');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('8386be58-fa3e-4fd3-b05b-2a3b5ecab3a0', 0, '2018-12-31 16:00:00', 'Sr. Full Stack Developer', '2021-08-03 09:11:19.05', 'Welinktalent', 'IT Industry', '2021-08-03 09:11:19.05', 'Philippines', true, true, 'Digital Team', NULL, NULL, 'CAREER_MOBILITY');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('1a6b1f61-5f90-40f1-9ef5-efb546f9a17a', 0, '2006-12-31 16:00:00', 'Teacher', '2022-04-17 14:53:55.747', 'Division  of Leyteq', NULL, '2022-04-17 14:53:55.747', 'Austria', true, true, NULL, NULL, '2022-03-16 16:00:00', 'OTHERS');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('45950693-0d5f-4c5c-bbcc-f3520bd6742a', 0, '2006-12-31 16:00:00', 'Teacher', '2022-04-17 14:54:02.303', 'Division  of Leyteq', NULL, '2022-04-17 14:54:02.303', 'Austria', true, true, NULL, NULL, '2022-03-16 16:00:00', 'OTHERS');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('d53f8469-77bf-4495-bbf2-c9731e028217', 0, '2006-12-31 16:00:00', 'Teacher', '2022-04-17 14:54:02.619', 'Division  of Leyteq', NULL, '2022-04-17 14:54:02.619', 'Austria', true, true, NULL, NULL, '2022-03-16 16:00:00', 'OTHERS');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('4ea10d18-71f3-4173-a17e-5d09b2e70b98', 0, '2006-12-31 16:00:00', 'Teacher', '2022-04-17 14:54:02.765', 'Division  of Leyteq', NULL, '2022-04-17 14:54:02.765', 'Austria', true, true, NULL, NULL, '2022-03-16 16:00:00', 'OTHERS');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('81b91947-7c8c-4bb0-8d21-9a81273fa709', 0, '2006-12-31 16:00:00', 'Teacher', '2022-04-17 14:54:03.174', 'Division  of Leyteq', NULL, '2022-04-17 14:54:03.174', 'Austria', true, true, NULL, NULL, '2022-03-16 16:00:00', 'OTHERS');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('048f1adb-c3c2-40fb-b866-1e173ddc6542', 0, '2021-07-31 16:00:00', 'Secretary', '2022-05-09 12:01:06.127', 'JobTarget', NULL, '2022-05-09 12:01:06.127', 'Australia', true, true, 'IT Department', NULL, '2021-11-18 16:00:00', 'PROJECT_TEAM_RECRUITMENT');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('60b9704f-3ab8-444a-88d1-96756c0985a4', 0, '2022-08-01 16:00:00', 'CEO', '2022-09-04 13:42:19.552', 'Mason company', NULL, '2022-09-04 13:42:19.552', 'Antarctica', true, true, NULL, NULL, '2022-09-01 16:00:00', 'PROJECT_TEAM_RECRUITMENT');
INSERT INTO public.experience (id, version, start_date, title, date_created, company, industry, last_updated, location, is_currently_working, share_with_network, division_or_department, description, end_date, employment_type) VALUES ('369312c3-7757-449b-8021-9da122b340d3', 0, '2018-07-29 16:00:00', 'Regional HRIS lead', '2022-10-04 13:36:15.761', 'MUFG financial group', 'HR / Technology', '2022-10-04 13:36:15.761', 'Singapore', true, false, 'Human Resource Asia', NULL, '2022-10-03 16:00:00', 'OTHERS');


--
-- TOC entry 4261 (class 0 OID 22362)
-- Dependencies: 231
-- Data for Name: fcmtoken; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('2ebd106c-2961-4a84-81ce-c2b180346bdf', 1, '2021-07-05 01:55:16.05', '2021-07-05 01:55:25.993', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cgoT1TmibsmKLcvs8dTZis:APA91bGIgjVgSHPLv-yR7CQ0VyN_-B-IqAlynXoOdfccOp6a7tkPSm1LJHtmM7vzTUl5w6w4OORtmJc4Zwes5bg7QbstS0QRD8LOCCRAyC4u2oP6tSJK3EPDmzisBdkOnfsvWjlGW4_P', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('660ec54b-a427-4527-b83c-d6a9c47ca923', 0, '2021-07-05 01:55:33.057', '2021-07-05 01:55:33.057', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'cgoT1TmibsmKLcvs8dTZis:APA91bGIgjVgSHPLv-yR7CQ0VyN_-B-IqAlynXoOdfccOp6a7tkPSm1LJHtmM7vzTUl5w6w4OORtmJc4Zwes5bg7QbstS0QRD8LOCCRAyC4u2oP6tSJK3EPDmzisBdkOnfsvWjlGW4_P', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('bfff4013-3926-4ace-a1fb-f391636ae0c5', 1, '2021-07-05 10:23:07.691', '2021-07-05 10:23:26.225', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'cAWR3XOW0MwS9DZbPiitRU:APA91bGYpZYTVAKtEoMTL83-32jeETNtx8GF2U7VpZFDmwbhQ4JUBjsdfv2gjwslXac2kHAUEzHSftE1sXlnZURuG-WLX0iYa60qv9bT1c2oTCDngAZivfAY3zMM8t7vpB0GKfC0QY1h', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('87190932-d71c-4e4f-b893-0861be445566', 0, '2021-07-05 10:23:47.8', '2021-07-05 10:23:47.8', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cAWR3XOW0MwS9DZbPiitRU:APA91bGYpZYTVAKtEoMTL83-32jeETNtx8GF2U7VpZFDmwbhQ4JUBjsdfv2gjwslXac2kHAUEzHSftE1sXlnZURuG-WLX0iYa60qv9bT1c2oTCDngAZivfAY3zMM8t7vpB0GKfC0QY1h', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('ef3f56bd-648f-4a24-9ccf-170ac67ad38f', 1, '2021-07-02 03:31:31.504', '2021-07-06 06:17:24.698', '448dbcfe-6680-43c8-939d-aa09ed9ab387', 'ca6qZ55Imi6trfWa9I1Niu:APA91bEGT8YRn1nPZICaf-NxG4n0BW9_-1npJ6Itg4Y_Y5X8hExfP7ByVifqeH_gKAH8djOhEIhFxkrYSsNL3u5s4SMFlQXbaiYPbNLnvsISwwhC41zz0H666HZZl24bqlyxp-Un2jAy', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('6b9aa700-cc87-42e1-9b5b-950e545e96ac', 0, '2021-07-06 06:17:29.316', '2021-07-06 06:17:29.316', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'ca6qZ55Imi6trfWa9I1Niu:APA91bEGT8YRn1nPZICaf-NxG4n0BW9_-1npJ6Itg4Y_Y5X8hExfP7ByVifqeH_gKAH8djOhEIhFxkrYSsNL3u5s4SMFlQXbaiYPbNLnvsISwwhC41zz0H666HZZl24bqlyxp-Un2jAy', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('cc42b168-307d-452f-a0bd-65359072b3f7', 1, '2021-07-08 07:37:20.333', '2021-07-27 06:09:33.939', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cgoT1TmibsmKLcvs8dTZis:APA91bG7tLEmskGqvD68xaivGpgQ8cTh5Zdr7wW0_VKus5ZJ3MLo91ZUkRTYys1J1ZHKYBo0yRT0juRUbGc3Bqg3QKwShLD91zwxfGwfC1Mq6HrXiqqi8N45qESYQfMHQNxAbAQ3uOtA', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('b693fb27-a777-48f0-9933-4232a6d73044', 0, '2021-07-27 06:09:52.312', '2021-07-27 06:09:52.312', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'cgoT1TmibsmKLcvs8dTZis:APA91bG7tLEmskGqvD68xaivGpgQ8cTh5Zdr7wW0_VKus5ZJ3MLo91ZUkRTYys1J1ZHKYBo0yRT0juRUbGc3Bqg3QKwShLD91zwxfGwfC1Mq6HrXiqqi8N45qESYQfMHQNxAbAQ3uOtA', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('6228fa28-1c89-4472-a3bb-42807bb41bda', 0, '2021-08-03 06:54:26.227', '2021-08-03 06:54:26.227', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'fIZtzvrNsI0mr2ktmdpfgO:APA91bF039a94u5XPMxN5O86AheegDbV6PclW56x1GYPu2rhfnzJbr10hTYUsYD3tf6dM-AwWC0uXGxlSuvyFd8mVNiBn00aCeTo-LiCffKtoZBhr6Jh883XTd7dc-Uac13UB1-6iww2', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('db02572f-66b3-4514-aa76-a7b38b9d9e89', 1, '2021-08-03 09:04:36.728', '2021-08-03 09:04:52.311', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'dALqbG5UzKoEl_vduV2cQJ:APA91bHclxtBpRfor8aVdb2cR6eG4k0FFU8waYmchjEcLyU_LNsVqRnEKzQVsZTegWb6f7j3ZHydN197mejhMbm3aHb8p8vkTkJs_KpTc3Fkhpz0cWb6mp2iTWpd3Rus3IiaQtlE9BX9', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('4d27944e-e6c2-4cb1-85b4-9231f5ab4a1c', 0, '2021-08-03 09:05:22.061', '2021-08-03 09:05:22.061', 'bd560101-d0c6-48c3-89f4-90a8d5560474', 'dALqbG5UzKoEl_vduV2cQJ:APA91bHclxtBpRfor8aVdb2cR6eG4k0FFU8waYmchjEcLyU_LNsVqRnEKzQVsZTegWb6f7j3ZHydN197mejhMbm3aHb8p8vkTkJs_KpTc3Fkhpz0cWb6mp2iTWpd3Rus3IiaQtlE9BX9', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('685f9148-8cf5-4dea-9854-b3f310277cea', 0, '2021-08-03 09:16:54.982', '2021-08-03 09:16:54.982', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'ca6qZ55Imi6trfWa9I1Niu:APA91bEGT8YRn1nPZICaf-NxG4n0BW9_-1npJ6Itg4Y_Y5X8hExfP7ByVifqeH_gKAH8djOhEIhFxkrYSsNL3u5s4SMFlQXbaiYPbNLnvsISwwhC41zz0H666HZZl24bqlyxp-Un2jAy', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('70c2df16-f3dc-4018-952f-ff9aaf5a3e65', 0, '2021-08-20 02:59:46.363', '2021-08-20 02:59:46.363', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'ebiuwDoPLe5ML_67vjpZIL:APA91bGUk20Oh5A6MqbSVAfV0BxWEBcP5cQAtdQ_0qYR5U4zdyUS2Hda8PrU5kfCU1PJjzXXh8IrEHdFHyvj87cB7sqcSiNC-kX1qGDsN2eRSZt4hx9kVw3HMoLjpSBrSCe9j0cBGSY5', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('ec051204-bf4d-4538-946f-1aa137512324', 0, '2021-09-14 07:39:27.926', '2021-09-14 07:39:27.926', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'fCmj01iZsa4cKwPwgdbxfU:APA91bFXzHpOGnFK7pKSmkLD8iTyh-GY1nvErNNU5kmOY6C_A27PDD3h4L_5FBfwL8G4hJcW1f5bxEGqvQJ71zG_Di2TGPaOwEH-D17opJNOY2rZh5R7gDKGT6Namfgwh9QfL2MrxFFK', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('70435b5d-0532-424a-a0e4-cbf2bfdef3ee', 0, '2021-10-11 06:47:37.181', '2021-10-11 06:47:37.181', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'drffElbcZEUc7nbRcOfRan:APA91bHy8F-yWa1ZkCNic6ZOvYgucmun_WH3BHMFcsYWpt3Qn6_N0jh7DRXPSJn6BsqyoEQh7zR-9TCK0PjUN05nmrnYAs5traIg38hSOuzWNhm6IXngQL053ZeZrC_IBsvQJ71W8S-W', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('05dff008-eb03-4627-a94c-e00a1d5fb051', 0, '2021-11-30 06:18:50.336', '2021-11-30 06:18:50.336', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'dALqbG5UzKoEl_vduV2cQJ:APA91bHclxtBpRfor8aVdb2cR6eG4k0FFU8waYmchjEcLyU_LNsVqRnEKzQVsZTegWb6f7j3ZHydN197mejhMbm3aHb8p8vkTkJs_KpTc3Fkhpz0cWb6mp2iTWpd3Rus3IiaQtlE9BX9', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('68b21412-d0b9-48f8-9f93-b2b4479c7eec', 0, '2022-03-05 08:52:06.936', '2022-03-05 08:52:06.936', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'eLehsldZJuH83CXVvNVqkm:APA91bFQweGjk76tyjaHV02FYoZ5r56C_XV0lGkh64MQZ5b-V2Ra6mj0sKhxu1P47eS9oq0asHEzkHsMBf-u1rofzMs0mzgRO8IGyc66GVOi1m_prDz6n6FohQ73RiI2j6bBmu76uakM', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('622f0e18-1bd2-46a0-a79a-a092b7c43ced', 0, '2022-03-19 01:47:30.78', '2022-03-19 01:47:30.78', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'e6MBngvjK_IvRmbndb60Xw:APA91bFdYgcqibKnxXTJb1WMLLBQVGIP5GQspUoXmOc853Id3J6oxnlgzEpPhRotn0VNv6wEULcLCENhoJ7MxtlGpbC2LylEbHKs21O82hME1Cvl0e0ztUfvOmoWwgQMFe8bSpUm0QK-', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('9ae66a7c-6369-4426-a054-2d39585905c5', 0, '2022-03-22 07:03:00.268', '2022-03-22 07:03:00.268', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'c-6g-vqokiUcO1SETVX9MW:APA91bFuOPpRv8HbTlKzpgrgz5AxwQAABYicBRCYz-iUj9SIL58Yg_5ZleBp5z2Ln9eELcKLuRxfwNHqa836QvuP8asC1tkVMksrWI9bhUoVy9Om4uvMFW-pThm_Tmw5umaK-asI6YoT', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('06f0fc21-0bbc-4741-a83c-ee840d73e001', 0, '2022-04-12 08:39:43.353', '2022-04-12 08:39:43.353', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'd_3SIxeg8l4zQ1RPBuY9W5:APA91bG6PahX_T9d_ABLgNWl4euGl1tj_Izr5wyUj_6CnCwpgTOVndf8a_iJz0kUUKrVDms3elk5XPDvwAcSl6RsfEmiI26zoVMAmbfmd98iYrSeo_mdbkpvWN52zXfkL7IKjqgNK35x', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('350d256e-0c29-4ddd-a76b-8c119d42af24', 1, '2022-04-17 14:05:18.402', '2022-04-17 14:26:16.758', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'f1_BiuiOcEpwJud5CaN57q:APA91bHezuc4G0N1oX5GhV-uz70HrW3voLClCrLKM6tmJAr-NQrzoXeRyCq8qLrrXHaQ9AMM1EfPmk-6Er56PHhJQHBiUse2a3X6YQQ9emlnSlCoNsy09iOZh26h5KtrvouJQ8Fh8lHz', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('7cc5b36b-2520-437d-9f0e-a451c11e1930', 0, '2022-04-17 14:42:28.651', '2022-04-17 14:42:28.651', '9310cf45-ee01-4410-8c73-f979ea1c2f66', 'f1_BiuiOcEpwJud5CaN57q:APA91bHezuc4G0N1oX5GhV-uz70HrW3voLClCrLKM6tmJAr-NQrzoXeRyCq8qLrrXHaQ9AMM1EfPmk-6Er56PHhJQHBiUse2a3X6YQQ9emlnSlCoNsy09iOZh26h5KtrvouJQ8Fh8lHz', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('5794b89f-bcfe-44c3-9c04-e611ff1efff5', 0, '2022-04-17 14:47:32.878', '2022-04-17 14:47:32.878', '77b86a04-1eb7-486a-9db9-d39be85e0043', 'f1_BiuiOcEpwJud5CaN57q:APA91bHezuc4G0N1oX5GhV-uz70HrW3voLClCrLKM6tmJAr-NQrzoXeRyCq8qLrrXHaQ9AMM1EfPmk-6Er56PHhJQHBiUse2a3X6YQQ9emlnSlCoNsy09iOZh26h5KtrvouJQ8Fh8lHz', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('3e1fba55-9fd7-4794-b437-95b898a657ab', 0, '2022-04-17 15:03:17.286', '2022-04-17 15:03:17.286', 'bd560101-d0c6-48c3-89f4-90a8d5560474', 'f1_BiuiOcEpwJud5CaN57q:APA91bHezuc4G0N1oX5GhV-uz70HrW3voLClCrLKM6tmJAr-NQrzoXeRyCq8qLrrXHaQ9AMM1EfPmk-6Er56PHhJQHBiUse2a3X6YQQ9emlnSlCoNsy09iOZh26h5KtrvouJQ8Fh8lHz', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('046ec0d6-774e-43ca-a5ba-65f8be7aedb2', 0, '2022-04-30 16:04:11.339', '2022-04-30 16:04:11.339', '3fd37d90-08e2-49c2-abc6-0367b2fe30bc', 'f1_BiuiOcEpwJud5CaN57q:APA91bHezuc4G0N1oX5GhV-uz70HrW3voLClCrLKM6tmJAr-NQrzoXeRyCq8qLrrXHaQ9AMM1EfPmk-6Er56PHhJQHBiUse2a3X6YQQ9emlnSlCoNsy09iOZh26h5KtrvouJQ8Fh8lHz', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('f7d555db-3d5f-4cf8-a4ce-d10236f553e4', 1, '2022-04-17 15:07:50.255', '2022-04-30 16:23:33.11', '77b86a04-1eb7-486a-9db9-d39be85e0043', 'dTSBtyGpH00cgpsFIqq3zL:APA91bF5qTR-0vKZxRAU-ykXxSeHgITrQXYcRTvw4UV4ZSOnrQ2pcDibV5zyBT2D7uY98gOgiUT7M8m6oWT0kZXCpwPLdvBtQgjdITu3Ls0L83mukvSV1pn-v7cVotEHBsNiKIKgg6O1', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('7a7f595a-341b-4783-94a1-a29a2a67f698', 0, '2022-06-15 05:18:26.074', '2022-06-15 05:18:26.074', '77b86a04-1eb7-486a-9db9-d39be85e0043', 'dALqbG5UzKoEl_vduV2cQJ:APA91bHclxtBpRfor8aVdb2cR6eG4k0FFU8waYmchjEcLyU_LNsVqRnEKzQVsZTegWb6f7j3ZHydN197mejhMbm3aHb8p8vkTkJs_KpTc3Fkhpz0cWb6mp2iTWpd3Rus3IiaQtlE9BX9', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('a533cfff-03b9-4025-ad62-af444341ffda', 0, '2022-08-31 00:48:29.313', '2022-08-31 00:48:29.313', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'fi3_60j2iXyt5d219eSlEZ:APA91bHIm48Wkr0BhOM6DgRLhFz4Wbycl0JcRuf2DfVPsYDT6o2aBtKsV3NV2N76UK_5JrWTlGItmzOcEEzdpGymREG5TCgfTcvNoJP9E5E1suKfDIVv5hLMO_OtSOzxf39Stk_90Lvy', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('3106c04e-bf04-4282-a96a-c50ae35f95eb', 1, '2022-09-04 02:56:42.861', '2022-09-06 02:05:41.986', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'eR4XUHKUi6fhJKE0WrEPT0:APA91bEV7xbfXodoXhAy672DCYlgh8ZTMflbd9HpO0RB4IYi9AtfkEAGziptHQVWdbvp_qbjJfDEceyhlgbpOrGUWWRT5fXo-Qa5YCLo_AXShdT6iWqhdwZApall8IAsjsuCHIcb00V2', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('181cc86b-d423-4281-91ee-272237aaf148', 1, '2022-09-06 02:05:55.768', '2022-09-06 02:17:46.253', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'eR4XUHKUi6fhJKE0WrEPT0:APA91bE1td72g-SQ1jyXKi8DTQhiG9VSf0jjSt4CuGHk3D4goyZkbOHX3AbPK9iQo48x-Frs_UPz6-WPt5I4E9GkazVivKQOZH44v4qzHQ9hNqOItZ70rg9yzuDyPWkolIAg5KZCfA_N', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('4a9566a6-fb12-443c-ace1-6909e5ec15dc', 0, '2022-09-07 03:58:19.848', '2022-09-07 03:58:19.848', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'dOb00CndkC14WfbxBAyDwx:APA91bEnypSyoItntkBBm5mraPzSmnwM50W97dELZ9HN8IRfvh9auq62DYdtHzhUtRWS3gPEdsrvehK38wQPfhCyf7UTCdNHLaARrCc_-d4REuAX-9_085teOCWPFZK-GMpNcCggayYK', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('634d6988-de1a-4593-aa8e-fedf6ba03d52', 0, '2022-09-26 02:57:14.696', '2022-09-26 02:57:14.696', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cCczwUIpTObOLq0vAtpN2s:APA91bGWB2vPNfvWs2Z57HgCKbJ16HQiGW3ADKRXMj3Hc9Lqirof0VB_kmJMqCz-hyAZ3KhXgKkZLOg7nxXRSFeN8diVXGGEkfLYw4tPY8Y5jQJVYhjuytVLnyimTKy6KYOwq3BwcrVs', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('59a1eab8-d06c-4ba2-a79c-ad92f944f420', 0, '2022-10-03 01:11:18.01', '2022-10-03 01:11:18.01', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cUjLs-OCSu5qnrT1D4dMl-:APA91bGGT0qVFTzLOL2gibvBvLjBQGHwevIfpuA_I22O2coHbCo7QRgwvXTBT91NAkrw2j90BBa39GvboET3x6qN6vNSx8WANUtYh9Q4mhz84l1RARVC6aSBdRIbzjagQz8FZhDJ5LpL', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('0de0d183-c7ce-4bdc-9053-5edbbb1cd132', 0, '2022-10-03 13:17:06.893', '2022-10-03 13:17:06.893', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'fv3x4sHPRZnZKQSRzAAOnA:APA91bEv5eLrxeJo8vXJQ5AsoMHkJcMre7JC_mZqN4vCKpBHLtdgsJu1cNGJb9donu-gvy3xPTgPdnF3cF4ifxrvfsE46PwEVcpAZHnwgRxD4yx_gsIpVKraahVEiytShg94mEyheBnZ', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('ac32c724-6339-4843-ab72-27277ac22717', 1, '2022-10-04 02:59:32.203', '2022-10-05 08:21:27.851', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'd0ZI2h4QRT5IDHCc1blW6D:APA91bEWQVbbcnEXQ88zQBiwDqNOBHWMG3UM4cPp6CtHnFd3THMDzUiJzIr3YX_DwFwCPTsGFGrjQMAxQeJJASC0uiiUlhfjXGqEJsfTQeiFRn_dVDntnUZdNWrUsmO3CrBVkdAe4Btf', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('5aa0f2c8-2d74-4bfd-ad2d-65de7c3d3047', 0, '2022-10-05 08:24:57.829', '2022-10-05 08:24:57.829', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'd0ZI2h4QRT5IDHCc1blW6D:APA91bEWQVbbcnEXQ88zQBiwDqNOBHWMG3UM4cPp6CtHnFd3THMDzUiJzIr3YX_DwFwCPTsGFGrjQMAxQeJJASC0uiiUlhfjXGqEJsfTQeiFRn_dVDntnUZdNWrUsmO3CrBVkdAe4Btf', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('0c7fcda6-125e-4bc2-8add-b66926254a41', 1, '2022-10-19 10:18:15.199', '2022-10-19 10:30:57.628', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'cQukVZ_-YSEfP5iTqP1B2J:APA91bGMfqHudl6cGoQ6o6NESrVNgKWERyroLcOqHWpZezBULXQsVP6TnAYXuTwIE-1MZXa4E83-nQ9bcBhswFrd3YNJeyLk-5Cm-yLVxlnux_su-tP60ZzXKOx9ZF_Kpnr2yOBMqbe8', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('43e41928-4d2c-4196-9a71-edf0f1998d6e', 0, '2022-10-19 11:42:29.076', '2022-10-19 11:42:29.076', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'cQukVZ_-YSEfP5iTqP1B2J:APA91bGMfqHudl6cGoQ6o6NESrVNgKWERyroLcOqHWpZezBULXQsVP6TnAYXuTwIE-1MZXa4E83-nQ9bcBhswFrd3YNJeyLk-5Cm-yLVxlnux_su-tP60ZzXKOx9ZF_Kpnr2yOBMqbe8', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('9d8335f1-c0c9-4641-84ef-bdc2d2289579', 1, '2022-11-02 02:09:51.6', '2022-11-02 02:10:32.002', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'd4I9WHlDZviBzvNLOsRWcI:APA91bE2vdcWTxJdz1Y2KlbR13HfG6bIeLuFvaLigv7MeTi6lk5JlkxuTwqCOGqfgeYcUUPs3gCz1s_XXnYWJm1qxwJ3penBSUnsw934MUVxXamnTPZdXwuf2GHokJTM2wIXkq36yQ9Z', 'DELETED');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('3e446728-cb33-4116-9589-d0655a7fa353', 0, '2022-11-02 02:10:38.523', '2022-11-02 02:10:38.523', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'd4I9WHlDZviBzvNLOsRWcI:APA91bE2vdcWTxJdz1Y2KlbR13HfG6bIeLuFvaLigv7MeTi6lk5JlkxuTwqCOGqfgeYcUUPs3gCz1s_XXnYWJm1qxwJ3penBSUnsw934MUVxXamnTPZdXwuf2GHokJTM2wIXkq36yQ9Z', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('a2a2399e-d3be-46a5-8daa-ea09f48a4b53', 0, '2022-11-14 04:13:16.912', '2022-11-14 04:13:16.912', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'ciHx-1qvzn9NkTyToaTZJN:APA91bHKKH_JYXwx0TMeXAn19lxF5hQ6tZtEz3erOXlelSg852t13bXCkgyIPAVWXleRV4jheIsmvpzIjaHaARTfgvQq3Uq42r8_c1AELJ_s6XHwnYFdA4yc6KlqNPnjft67hfQBvw41', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('4fe27e5b-ac99-430d-b4b2-4d9ff1a98bd4', 0, '2023-01-11 00:11:50.394', '2023-01-11 00:11:50.394', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'f_Up-wXK7KT6YiUDSkFCWu:APA91bGjXI5MiGGXFQfNTWbVbcyVXeM81ZS1DKNE16K33D7rdPEiMmcmEOOaVOML1xV_dst8O3TXcZcwsvB-CreF-BzxaFXsqiiTrJu-PlIWOGRqNxDxcAoUZZdYseFHhpmhmx-knB4T', 'ACTIVE');
INSERT INTO public.fcmtoken (id, version, date_created, last_updated, user_id, token, status) VALUES ('b9cff049-b5c5-456c-8a59-4b4c211b2c64', 0, '2023-03-22 07:36:04.619', '2023-03-22 07:36:04.619', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'dCSgzUw3OqVf1hJgGr44ri:APA91bGLP_vxxhrNhtViQ0pv9aEyH8fEC_LxOqL92HkazQxjS9TU9p0QukBJh9M27Op6hF1V3G-Cl-C2fYUU2vh2KKQVngnJXF6Sz8pudAhJcIbco8B3suEpYpbuFU69Cm-3M7uqX-gm', 'ACTIVE');


--
-- TOC entry 4284 (class 0 OID 22851)
-- Dependencies: 254
-- Data for Name: flyway_schema_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'postgres', '2021-07-02 02:12:52.331578', 0, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (2, '002', 'initial data', 'SQL', 'V002__initial_data.sql', 278945403, 'postgres', '2021-07-02 02:12:52.407878', 33, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (3, '003', 'drop not null', 'SQL', 'V003__drop_not_null.sql', -946440664, 'postgres', '2021-07-02 02:12:52.465296', 9, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (4, '004', 'jobs data', 'SQL', 'V004__jobs_data.sql', -267804148, 'postgres', '2021-07-05 05:49:12.16974', 230, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (5, '005', 'jobs data second batch', 'SQL', 'V005__jobs_data_second_batch.sql', 743265586, 'postgres', '2021-07-05 08:42:44.746262', 55, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (6, '006', 'drop not null agree skill rating', 'SQL', 'V006__drop_not_null_agree_skill_rating.sql', 1339385595, 'postgres', '2021-07-08 01:41:24.332084', 25, true);
INSERT INTO public.flyway_schema_history (installed_rank, version, description, type, script, checksum, installed_by, installed_on, execution_time, success) VALUES (7, '007', 'drop agree on skills rating', 'SQL', 'V007__drop_agree_on_skills_rating.sql', -1811402200, 'postgres', '2021-07-12 10:04:12.129175', 29, true);


--
-- TOC entry 4285 (class 0 OID 23069)
-- Dependencies: 255
-- Data for Name: hiring_manager_invitation_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4262 (class 0 OID 22370)
-- Dependencies: 232
-- Data for Name: hiring_manager_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('6c50ae1f-8f98-491b-9489-e26652be53f7', true, true, 'Hr manager', 'Lucky Me', 'Digital Team');
INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('c3de28a6-88ff-4d8b-a7d2-a91ac5693a7a', true, true, 'Supervisor', 'Selecta', 'Human Resource');
INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('027e5cfd-de1c-47d2-b9ca-b5aad6055418', true, true, NULL, 'Selecta', 'Digital Team');
INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('4ce887cc-b59c-4020-bae5-f79e0460fa50', true, true, 'CEO', 'Return-on-Talent', 'Digital Team');
INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('04b7c54f-a606-4af0-a33f-b85eb1214064', true, true, 'UX', 'Return-on-Talent', 'Digital Team');
INSERT INTO public.hiring_manager_profile (id, show_complete_applications, show_incomplete_applications, "position", brand_name, division_or_department) VALUES ('0eac0c74-ea39-4399-a801-da3b02b9ccca', true, true, 'Director', 'Return-on-Talent', 'Human Resource');


--
-- TOC entry 4263 (class 0 OID 22378)
-- Dependencies: 233
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', 0, '2021-07-02 06:20:22.467', '2021-07-02 06:20:22.467', NULL, NULL, NULL, true, 'PROJECT_TEAM_RECRUITMENT', 'ENTRY', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Doctor', '4b091882-2afa-410e-9063-96637fe5eedb', 'Lucky Me', 'Digital Team', 25, 'ACTIVE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'BPO');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 0, '2021-07-05 11:05:17.149', '2021-07-05 11:05:17.149', 'Philippines', NULL, NULL, true, 'OTHERS', 'MANAGERIAL', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Java Developer', NULL, NULL, NULL, 10, 'ACTIVE', '<p>A Java Developer is responsible for the&nbsp;<a href=\"https://www.technojobs.co.uk/jobs/programmer\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>programming</strong></a>&nbsp;and&nbsp;<a href=\"https://www.technojobs.co.uk/jobs/developer\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>development</strong></a>&nbsp;of applications and software using the popular programming language, Java.</p><p>A&nbsp;<a href=\"https://www.technojobs.co.uk/jobs/java\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>Java developer</strong></a>&nbsp;is a specialised type of programmer who may collaborate with web developers and software engineers to integrate Java into business applications, software and websites.&nbsp;They are involved throughout the entire development life cycle of a product and must be able to identify and analyse any issues or problems and be able to come up with an efficient solution. Other duties may include collating and documenting user requirements, analysing data and quality assurance testing.</p><p>The role of a&nbsp;<a href=\"http://www.technojobs.co.uk/jobs/java\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>Java Developer</strong></a>&nbsp;is an in-demand role at the moment and Technojobs have a variety of Java Developer jobs available so click&nbsp;<a href=\"http://www.technojobs.co.uk/jobs/java\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>here</strong></a>&nbsp;to view all our vacancies.</p><h2><br></h2><h2><strong>What is Java?</strong></h2><p>The word Java may sound familiar to coffee lovers and Geography teachers but in the IT world, Java is one of the most popular programming languages in use with a reported 9 million developers. Not to be confused with Javascript, Java is known for its efficient processing speed in software, computer games and applications for both desktop and mobile. It is used to develop software and web-based applications for a variety of platforms and is very popular due to its ease of use for beginners though it can still take some time&nbsp;to master.</p><p>Java was developed in 1995 by Sun Microsystems (which has since been acquired by&nbsp;<a href=\"https://www.technojobs.co.uk/jobs/oracle\" target=\"_blank\" style=\"color: rgb(0, 167, 84);\"><strong>Oracle</strong></a>) and is a programming language that is concurrent, class-based, objected oriented and is based on the syntax of C and C++.</p><p><br></p><h2><strong>Roles and Responsibilities</strong></h2><p>A Java developer is responsible for many duties throughout the development lifecycle of applications, from concept and design right through to testing. Here are some other responsibilities they may have:</p><ul><li><strong>Design, implement and maintain java application phases</strong></li><li><strong>To take part in software and architectural development activities</strong></li><li><strong>Conduct software analysis, programming, testing and debugging</strong></li><li><strong>Identifying production and non-production application issues</strong></li><li><strong>Transforming requirements into stipulations</strong></li><li><strong>Develop, test, implement and maintain application software</strong></li><li><strong>Recommend changes to improve established java application processes</strong></li><li><strong>Develop technical designs for application development</strong></li><li><strong>Develop application code for java programs</strong></li></ul>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', 0, '2021-07-05 11:05:17.244', '2021-07-05 11:05:17.244', 'Philippines', NULL, NULL, false, 'OTHERS', 'MANAGERIAL', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'JAVA FULL STACK', NULL, NULL, NULL, 15, 'ACTIVE', '<p><strong style=\"color: rgb(0, 0, 0);\">Unlock Your Career Potential: Technology at ADP</strong><span style=\"color: rgb(0, 0, 0);\">. </span></p><p><span style=\"color: rgb(0, 0, 0);\">Do you enjoy exploring, identifying and inspiring the future of the workplace and the lives of millions of people? At ADP, the world''s largest B2B cloud company, our Technology team is comprised of brilliant engineers, architects, data scientists, infrastructure experts, and more. We were first in our industry to offer a SaaS solution and continue to push the envelope utilizing the latest operating platforms to deliver the highly automated, intelligent and predictive solutions that are redefining what is possible. Named one of Forbes'' \"Most Innovative Companies\" and one of Computerworld''s \"100 Best Places to Work in IT\", we are committed to leading the way in product development and research, empowering you to bring to life the latest innovations that will forever change the way businesses manage their most vital asset, employees.</span></p><p><br></p><p><strong>POSITION SUMMARY:</strong></p><p><strong>Key Skills:</strong></p><ul><li><strong>2 - 3 years</strong>&nbsp;dev experience</li><li><strong>Java</strong>&nbsp;- Full Stack</li><li><strong>Angular</strong>&nbsp;JS or&nbsp;<strong>React</strong>&nbsp;JS</li><li>Testing with&nbsp;<strong>Selenium</strong>&nbsp;or similar tool</li><li>Ability to do Dev &amp; QA</li></ul><p>The&nbsp;<strong>Application Developer</strong>&nbsp;is responsible for developing software applications solutions for ADP''s external and internal clients. Application Developers may be involved in all aspects of the software development life cycle (SDLC). Application Developers work with clients, product managers analysts, architects and engineers to plan, design, develop, test and implement information technology solutions consistent with the business objective.</p><p><strong>Application Developers</strong>&nbsp;may develop and review requirements, create design documents, write programs, package, test, configure and deploy software. Application Developers also participate and collaborate with other stakeholder including security, quality assurance, training, project management, engineering, hosting, &amp; procurement when required to assist in other aspects of their projects.</p><p><strong>Application Developers</strong>&nbsp;at ADP are expected to be results-oriented, have knowledge of new and legacy technologies, have knowledge of the relevant platforms and environments, and be familiar with business process, functions and data within their domain to provide innovative, insightful, and secure solutions.</p><p>We strive for every interaction to be driven by our&nbsp;<strong>CORE</strong>values:<strong>&nbsp;Insightful Expertise, Integrity is Everything, Service Excellence, Inspiring Innovation, Each Person Counts, Results-Driven, &amp; Social Responsibility.</strong></p><p><br></p><p><strong>RESPONSIBILITIES:</strong></p><ul><li>Develop &amp; enhance effective programs &amp; data structures that successfully meet the objective.</li><li>Participate effectively in relevant aspects of software development life cycle (SDLC) including planning, construction, testing, reviews and demonstrations.</li><li>Collaborate with team to design, develop, test and refine deliverables.</li><li>Investigate and resolve application issues as needed Package, configure and deploying software Collaborate with clients, Product Managers, Architects, &amp; Analysts to develop and review requirements &amp; design.</li><li>Review and create system, software and functional design specifications that address requirements.</li><li>Participate in project planning and release management.</li><li>Higher level jobs would be expected to manage broader or multiple projects at a time.</li><li>Acts as an expert source of technology and application knowledge within their domain. Research, recommend, and introduce new technologies and new uses of existing technologies Participating in Business planning, IT strategy and setting direction.</li><li>Performs other related duties as assigned. 10-20% Travel required.</li><li>Some situations may require more travels.</li><li>Must be available to work evenings and weekends as needed.</li></ul><p><br></p><p><strong>QUALIFICATIONS REQUIRED:</strong></p><ul><li>Technical Degree or equivalent in education &amp; experience.</li><li>2 - 3 years of directly related experience.</li><li><strong>Java Full Stack</strong></li><li><strong>Angular JS or React</strong></li><li>Technical experience with Object Oriented Design and Development</li><li>Web Technologies (<strong>HTML, CSS, JavaScript, JSP</strong>, etc.)</li><li>Knowledge of Automation tools Like&nbsp;<strong>QTP</strong>&nbsp;or&nbsp;<strong>Selenium</strong>&nbsp;is a plus</li><li>Able to do both&nbsp;<strong>Development</strong>&nbsp;and&nbsp;<strong>QA</strong></li></ul><p><br></p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', 0, '2021-07-05 11:05:17.305', '2021-07-05 11:05:17.305', 'Singapore', NULL, NULL, true, 'OTHERS', 'MANAGERIAL', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Manager MOM', NULL, NULL, NULL, 20, 'ACTIVE', '<p>JOB DESCRIPTION</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', 0, '2021-07-05 11:05:17.373', '2021-07-05 11:05:17.373', 'Cuba', NULL, NULL, true, 'OTHERS', 'ENTRY', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'System Quality Assurance', NULL, NULL, NULL, 5, 'ACTIVE', '<p><span style=\"color: rgb(34, 34, 34);\">The exact&nbsp;duties of&nbsp;a&nbsp;quality assurance&nbsp;manager vary from industry to industry. However, typical responsibilities&nbsp;of the&nbsp;job&nbsp;include: determining, negotiating and agreeing on in-house&nbsp;quality procedures, standards and specifications. ... acting as a catalyst for change and improvement in performance and&nbsp;quality.</span></p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', 0, '2021-07-05 11:05:17.497', '2021-07-05 11:05:17.497', 'Armenia', 'sample note', NULL, true, 'OTHERS', 'MID_SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Area Supervisor', NULL, NULL, NULL, 15, 'ACTIVE', '<p>Lorem ipsum</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', 0, '2021-07-05 11:05:17.547', '2021-07-05 11:05:17.547', 'Armenia', 'note for candidate', NULL, true, 'OTHERS', 'SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'System Analyst', NULL, NULL, NULL, 10, 'ACTIVE', '<p>say something here</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', 0, '2021-07-05 11:05:17.606', '2021-07-05 11:05:17.606', 'Australia', NULL, NULL, true, 'PROJECT_TEAM_RECRUITMENT', 'SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Full Stack Developer', NULL, NULL, NULL, 25, 'ACTIVE', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu</p>\n', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('2e781930-a4eb-4018-844c-fefbafc29a7a', 0, '2021-07-05 11:05:17.652', '2021-07-05 11:05:17.652', 'Bahamas', NULL, NULL, true, 'INTERNATIONAL_MOBILITY', 'MID_SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Network Manager', NULL, NULL, NULL, 15, 'ACTIVE', '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsu</p>\n', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', 0, '2021-07-05 11:05:17.707', '2021-07-05 11:05:17.707', 'American Samoa', NULL, NULL, true, 'INTERNATIONAL_MOBILITY', 'SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'test Opportunity', NULL, NULL, NULL, 25, 'ACTIVE', '<h2>What is Lorem Ipsum?</h2>\n\n<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>\n', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 0, '2021-07-05 11:05:17.766', '2021-07-05 11:05:17.766', 'Singapore', NULL, NULL, true, 'EXTERNAL_RECRUITMENT', 'MANAGERIAL', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Human Resources Director', NULL, NULL, NULL, 20, 'ACTIVE', '<p><!-- x-tinymce/html --></p>\n\n<p style=\"margin-left:11.0pt\"><strong>MISSION</strong></p>\n\n<p style=\"margin-left:11.0pt\">The HR Director is responsible for defining, managing and implementing the HR Strategy. As a member of the Executive Committee, he/she will be a close partner of the two Managing Partners of the Company by providing his / her expertise, support and advice.</p>\n\n<p>&nbsp;</p>\n\n<p style=\"margin-left:11.0pt\"><strong>RESPONSIBILITIES&nbsp;</strong></p>\n\n<p style=\"margin-left:11.0pt\"><strong>Responsible for the definition and implementation of the HR strategy:</strong></p>\n\n<ul>\n\t<li>Collect the Management&rsquo;s expectations and needs related to HR matters.</li>\n\t<li>Define and implement an HR Strategy supporting the Company&rsquo;s project realization in line with the Management view:</li>\n\t<li>Compensation and benefits strategy</li>\n\t<li>Recruitment and career</li>\n\t<li>Performance management</li>\n\t<li>Training</li>\n\t<li>Organization</li>\n\t<li>Company culture</li>\n\t<li>Definition of the annual HR budget in line with the Financial Department and the Management and regular follow up to ensure the respect</li>\n\t<li>Follow up and evolution of the HR KPIs and definition of the correction to implement</li>\n</ul>\n\n<p style=\"margin-left:11.0pt\"><strong>Responsible for the quality and follow up of all HR operations: </strong></p>\n\n<ul>\n\t<li>Oversee all the HR operations needed for the effective administration of the Company (payroll, taxes, contracts, recruitment, HR mobility, training&hellip;)</li>\n\t<li>Propose an efficient and qualitative HR Service for all the Employees</li>\n\t<li>Conduct the annual review process</li>\n\t<li>Management of the disciplinary processes</li>\n\t<li>Regular review of the HRIS to ensure its efficiency</li>\n\t<li>Guide the Managers in their organizations</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>Manage social communication and promote a peaceful climate of communication between the Employees and the Management</p>\n\n<p>Implement and promote a unique partnership with all the Managers</p>\n\n<p><strong>Play an essential role in the changes in support of the Company and actively contribute to internal communication. </strong></p>\n\n<p><strong>Be responsible for the local HR laws:</strong></p>\n\n<ul>\n\t<li>Ensure compliance of HR operations with local regulations, in particular through regular local monitoring</li>\n\t<li>Be responsible for all HR Maters and internal communication</li>\n\t<li>Ensure that contracts, internal documentation and HR procedures are up to date and compliant with the local regulations</li>\n</ul>\n\n<p><strong>Management:</strong></p>\n\n<p>Animate and develop a team of 4 HR employees</p>\n\n<p>&nbsp;</p>\n\n<p><strong>IDEAL TALENT</strong></p>\n\n<ul>\n\t<li>10+ years&rsquo; experience as an HR Manager or HR Director in an international environment</li>\n\t<li>Good knowledge in the HR local regulations</li>\n\t<li>Previous experience in the team management</li>\n\t<li>Qualities such as empathy, listening skills, assertiveness, out of the box thinking, ability to anticipate</li>\n\t<li>Master degree in HR Management or Psychology</li>\n\t<li>Fluent in English and French as a large part of operations needs to be done in French, and the regulator is French.</li>\n</ul>\n\n<p>&nbsp;</p>\n\n<p>WeLinkTalent | Executive Recruitment</p>\n\n<p>WE LINK THE RIGHT TALENT TO THE RIGHT OPPORTUNITY</p>\n\n<p>&nbsp;</p>\n\n<p><strong>&bull; Who are we?</strong></p>\n\n<p>WeLinkTalent is a boutique human capital&nbsp;consultancy&nbsp;firm specialising in senior-level executive search covering Singapore and Asean. We link skills, personality and potential to the right company to create value and synergies that benefit both parties.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>&bull; Why us?</strong></p>\n\n<p>We are a unique name when it comes to recruitment, and we provide the &ldquo;Best in League&rdquo; Talent from our well-established network. We have a very competitive and transparent system. We engage with you and design a personalised recruitment strategy.</p>\n\n<p>&nbsp;</p>\n\n<p><strong>To apply</strong></p>\n\n<p>&nbsp;</p>\n\n<p>Please send your CV in .doc format to&nbsp;<a href=\"mailto:talent@welinktalent.com\">talent@welinktalent.com</a>&nbsp;mentioning the job reference number&nbsp;<strong>WLT30015</strong></p>\n\n<p><strong>We thank you for your interest in this position and regret that only short-listed candidates will be notified.</strong></p>\n\n<p>&nbsp;</p>\n\n<p>Please follow WeLinkTalent on LinkedIn to access all our vacancies.</p>\n\n<p><a href=\"http://www.welinktalent.com/\">www.welinktalent.com</a></p>\n\n<p>&nbsp;</p>\n\n<p>WeLinkTalent Pte Ltd |&nbsp;Executive Recruitment |&nbsp;EA Licence № 16S8272</p>\n\n<p>Nathalie Marie-Claire White | Registration № R1658916</p>\n\n<p>&nbsp;</p>\n\n<p>WeLinkTalent will treat your interest with full confidence and will handle Privacy Statement Data collected for recruitment purposes only. Personal data provided will be used strictly under the relevant PDPA and Welinktalent&#39;s privacy policy.&nbsp;</p>\n\n<p>&nbsp;</p>\n', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', 0, '2021-07-05 11:05:17.831', '2021-07-05 11:05:17.831', 'Singapore', 'THIS IS A TEST JOB', NULL, false, 'CAREER_MOBILITY', 'SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Grab Test Job', NULL, NULL, NULL, 25, 'ACTIVE', '<p>We are living in dynamic times. Technology is reshaping how we live, and we want to use it to redefine how financial services are offered. Grab is the leading technology company in Southeast Asia offering everyday services to the masses. Singtel is Asia&rsquo;s leading communications group connecting millions of consumers and enterprises to essential digital services. This is why we are coming together to unlock big dreams, and financial inclusion for people in our region is just one of them. We want to build a digital bank with the right foundation - using data, technology and trust to solve problems and serve customers.</p>\n\n<p>We are seeking an experienced member to join the Design team for our new Digibank initiative in Singapore. This role will be based in Singapore, reporting into the Senior Design Manager for Digibank. This individual will also work closely with the engineering, business, and other stakeholders at Grab Financial Group and Singtel.</p>\n\n<p>Get to know the Team: We are a brand new Design team, formed to build out our digital bank - a joint venture between Grab and Singtel.</p>\n\n<p>As a Lead Product Designer for the digital bank, you will lead some of our highest impact, strategic projects. You&rsquo;ll be responsible for raising the bar, delivering projects that require complex stakeholder management and coordination across multiple cross-functional teams. You will have the opportunity to help define the overall Digibank design strategy as we progress from application to launch and beyond.</p>\n\n<p>We like creative hustlers, people who can think outside the box, motivate and get stuff done even if it seems impossible. We work fast, push the boundaries, try new things and sometimes they don&rsquo;t work, so we embrace failure and lifelong learning. We are nice, work together well, and believe in the Digibank mission.</p>\n\n<p>Get to know the Role:</p>\n\n<ul>\n\t<li>Understand the full scope of a typical user-centered design process with the ability to think strategically and creatively about the holistic vision for a product experience that solves real customer pain points.</li>\n\t<li>Ability to conceptualize and iterate many different creative solutions to bring innovative ideas to a market.</li>\n\t<li>Plan and conduct cross functional product strategy workshops to facilitate ideations and creations of UX related artefacts to help product scoping and delivery planning.</li>\n\t<li>Ability to build user flow charts, storyboards, wire frames, and related elements that play into the planning phase of an application.</li>\n\t<li>Strong focus on usability, interaction design and design system thinking.</li>\n\t<li>Strong ability to create polished, production level, world class visual design.</li>\n\t<li>Ability to prototype design solutions in your preferred design tool such as Figma, Framer or Protopie.</li>\n\t<li>Experienced in conducting user research to make trade offs backed up by validate user testings, data and experience.</li>\n\t<li>Regular review of usage data to analyze user behaviour, pain points and to inform design decisions.</li>\n\t<li>Able to handle expectations of stakeholders and setting clear vision and get buy in cross functional.</li>\n\t<li>Able to evangelize Design across the organization.</li>\n\t<li>Researching and analyzing industry UX/UI trends and competitor sites and strategies.</li>\n</ul>\n\n<p>The must haves:</p>\n\n<ul>\n\t<li>8+ years working experience as a UX Designer.</li>\n\t<li>BA/BS degree in Design (e.g. graphic, interaction, visual communications, product, industrial), HCI, or a related field or equivalent practical experience.</li>\n\t<li>Familiarity with design techniques, such as, running ideation workshops, building user personas, storyboarding, wireframes, visual directions and prototyping.</li>\n\t<li>Fluent in responsive design, native mobile/tablet UI UX design for both iOS and Android.</li>\n\t<li>Expert knowledge of major mobile platforms.</li>\n\t<li>Strong design portfolio with projects in the consumer space. Having shipped Apps in an App Store is helpful.</li>\n\t<li>Healthy blend of strategic thinking capabilities with an innate &quot;dream big, start small&quot; mindset and an eagle eye for detail.</li>\n\t<li>Empathy for users and a drive to discover and resolve their pain points.</li>\n\t<li>An owner&rsquo;s mindset - you don&rsquo;t shy away from the hard stuff.</li>\n\t<li>Passion for building delightful design experiences.</li>\n\t<li>Excellent communication and presentation skills with an ability to quickly command trust and respect from executives and partners</li>\n</ul>\n\n<p>&nbsp;</p>\n', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', 0, '2021-07-05 15:10:58.695', '2021-07-05 15:10:58.695', 'American Samoa', NULL, NULL, false, 'INTERNATIONAL_MOBILITY', 'SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Test job opportunity', NULL, NULL, NULL, 25, 'ACTIVE', '<h2>What is Lorem Ipsum? Test job description</h2><p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 0, '2021-07-05 15:10:58.724', '2021-07-05 15:10:58.724', 'Argentina', NULL, NULL, false, 'OTHERS', 'MANAGERIAL', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'TEST Human Resource Intern', NULL, NULL, NULL, 25, 'ACTIVE', '<p>a&nbsp;<em>plouf</em>-<em>plouf</em>&nbsp;(ou pouf-pouf, ou ploum-ploum, ou pia-pia, ou trou-trou, ou troum-troum etc.) permet de choisir un joueur en &eacute;liminant successivement tous les&nbsp;...</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', 0, '2021-07-06 08:44:00.627', '2021-07-06 08:44:00.627', NULL, NULL, NULL, true, 'INTERNATIONAL_MOBILITY', 'ENTRY', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Frog assasin', '55a7c325-6a47-48e9-8473-f854253e6a40', 'Lucky Me', 'Digital Team', 20, 'ACTIVE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Construction');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('2303daac-d87d-4c4e-8661-552e16c45c76', 0, '2022-03-21 01:47:31.24', '2022-03-21 01:47:31.24', 'Andorra', NULL, NULL, false, 'INTERNATIONAL_MOBILITY', 'ASSOCIATE', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Human resource manager', '167a6898-85fc-40c6-b996-a94d647de815', 'Lucky Me', 'Digital Team', 25, 'ACTIVE', '<h2>What is Lorem Ipsum?</h2>

<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>', 'Construction');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', 1, '2021-07-05 11:05:17.437', '2022-04-08 07:36:58.959', 'Argentina', NULL, NULL, true, 'OTHERS', 'MID_SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'PHP Developer', NULL, NULL, NULL, 5, 'DELETED', '<p>is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry''s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\t\t</p>', NULL);
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', 0, '2022-04-17 14:45:16.559', '2022-04-17 14:45:16.559', 'Angola', NULL, 30000.00, true, 'INTERNATIONAL_MOBILITY', 'ENTRY', '6c50ae1f-8f98-491b-9489-e26652be53f7', 'Sample Test Job', '2194d4b0-b2bb-4a54-aedd-cb300da26eb2', 'Selecta', 'Human Resource', 25, 'ACTIVE', '<h2><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</h2>', 'BPO');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', 0, '2022-04-22 16:09:13.599', '2022-04-22 16:09:13.599', 'Australia', 'Must be computer literate and proficient in using Microsoft Outlook and Office.', 15.00, true, 'DEVELOPMENT_PROGRAM', 'MID_SENIOR', 'c3de28a6-88ff-4d8b-a7d2-a91ac5693a7a', 'HR Assistant Manager', '93324b2d-b5c1-4d07-ad70-3322fa770a8f', 'Selecta', 'Human Resource', 5, 'ACTIVE', '<p style="margin-left:0in; margin-right:0in"><span style="font-family:Arial,sans-serif"><span style="font-family:&quot;Calibri&quot;,sans-serif">The HR Assistant Manager assists the human resource director in performing HR tasks, including the administrative ones. He/she also takes part in recruiting, hiring, assessing, and training applicants based on the company&rsquo;s standards. Moreover, he/she collaborates with other human resource specialists in ensuring that all employees follow the operation policies and regulations implemented by the company.</span></span></p>', 'BPO');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', 1, '2022-05-09 11:22:43.717', '2022-05-09 11:47:54.134', 'United States of America', NULL, 300000.00, true, 'INTERNATIONAL_MOBILITY', 'MID_SENIOR', 'c3de28a6-88ff-4d8b-a7d2-a91ac5693a7a', 'Human Resource Manager', '0aeaddc0-3c01-4003-9fe5-ac20ba6ef192', 'Lucky Me', 'Human Resource', 25, 'ACTIVE', '<p>Maintained employee data and kept updated accounts of all employment records.<br />
Assisted in recruiting and training of new employees for the marketing and IT teams.<br />
Administered payroll information, compensation materials, and benefits programs.<br />
Supported daily operations of busy human resources department.<br />
Mentored employees through personal and professional issues.</p>', 'BPO');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', 0, '2022-09-04 13:27:30.171', '2022-09-04 13:27:30.171', 'Anguilla', 'Something here', 2562156.00, true, 'PROJECT_TEAM_RECRUITMENT', 'MID_SENIOR', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Web Developer', '45aacc4e-308b-4082-a883-0d04b675e214', 'WelinkTalent Singapore', 'Digital Team', 20, 'ACTIVE', '<h2>Web Developer Job Description Template</h2>

<p>We are looking for a skilled web developer who will be responsible for developing and/or designing websites for our company. You will be working alongside a team of other developers in creating, maintaining, and updating our websites.</p>

<p>In order for you to succeed in this role, you will need to be proficient in JavaScript, HTML, CSS, and have solid knowledge and experience in programming applications.</p>

<h3>Web Developer Responsibilities:</h3>

<ul>
	<li>Website and software application designing, building, or maintaining.</li>
	<li>Using scripting or authoring languages, management tools, content creation tools, applications, and digital media.</li>
	<li>Conferring with teams to resolve conflicts, prioritize needs, develop content criteria, or choose solutions.</li>
	<li>Directing or performing Website updates.</li>
	<li>Developing or validating test routines and schedules to ensure that test cases mimic external interfaces and address all browser and device types.</li>
	<li>Editing, writing, or designing Website content, and directing team members who produce content.</li>
	<li>Maintaining an understanding of the latest Web applications and programming practices through education, study, and participation in conferences, workshops, and groups.</li>
	<li>Back up files from Web sites to local directories for recovery.</li>
	<li>Identifying problems uncovered by customer feedback and testing, and correcting or referring problems to appropriate personnel for correction.</li>
	<li>Evaluating code to ensure it meets industry standards, is valid, is properly structured, and is compatible with browsers, devices, or operating systems.</li>
	<li>Determining user needs by analyzing technical requirements.</li>
</ul>

<h3>Web Developer Requirements:</h3>

<ul>
	<li>Bachelor&#39;s degree in Web development or related field, or relevant experience.</li>
	<li>Solid knowledge and experience in programming applications.</li>
	<li>Proficient in JavaScript, HTML, CSS.</li>
	<li>Proficient in My SQL.</li>
	<li>Dedicated team player.</li>
	<li>Ability to thrive in a fast-paced environment.</li>
	<li>Solid ability in both written and verbal communication.</li>
	<li>Knowledge of programming language and technical terminology.</li>
	<li>Able to develop ideas and processes and clearly express them.</li>
	<li>High degree of independent judgment.</li>
	<li>Able to solve complex problems.</li>
</ul>', 'Construction');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 0, '2022-10-04 03:16:57.889', '2022-10-04 03:16:57.889', 'Singapore', 'THIS IS TO TEST ReturnOnTalent SaaS product. Please do the full application process till sending your application to the Hiring Manager.', 44000.00, false, 'EXTERNAL_RECRUITMENT', 'ASSOCIATE', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'Product Manager / Operations Manager | HR Tech', 'c0ed9d40-63c2-4c05-98b3-3ea97302f786', 'Return-on-Talent', 'Digital Team', 25, 'ACTIVE', '<h1>Job Description</h1>

<h2>OUR BUSINESS</h2>

<p>WeLinkTalent is a boutique human capital consultancy firm, part of the IESF International Federation, specialising in the senior-level executive search covering Singapore and Asean. We are the 1st recruitment agency and executive search firm in Singapore to be Data Protection Trustmark (DPTM) certified. &nbsp;We link skills, personality and potential to the right company to create value and synergies that benefit both parties. We deliver Recruitment, HR Consultancy, Transition Management and onboarding services to support our clients and candidates from the initial request till the full integration of the candidates.</p>

<p>Based on our first 6 years of activity we are now looking to expand our offering, and we are seeking a Product Manager / Operations Manager to lead the development of our HR Internal recruitment service to entreprise: Return-On-Talent SaaS. This tool s helps corporates to maximise their internal recruitment process, improve retention of existing employeees and lower cost of recruitment.</p>

<h2>ROLE MISSION</h2>

<p>We&#39;re looking for a team player to join us on the product management side to drive product/feature launches as well as growth and adoption of our B2B SaaS solution.</p>

<p>As the Product Manager / Operations Manager, you will develop &amp; manage the product roadmap according to customers request.</p>

<p>You will manage a software development team and drive new feature rollouts and ensure security and quality critaeria</p>

<p>You will act as the project manager and customer success lead to liaise with clients.</p>

<p>&nbsp;</p>

<h2>&nbsp;KEY RESPONSIBILITIES&nbsp;</h2>

<ul style="list-style-type:disc">
	<li>Ownership of the overall product strategy with the customer needs</li>
	<li>Responsible for Market Intelligence, Competitive Analysis, and Marketing Strategy</li>
	<li>Product positioning &amp; Pricing</li>
	<li>Customer Success: Ensure the proper adoption of SaaS by partners</li>
	<li>Develop product concepts, technical evaluation, feasibility, product design, and architecture</li>
	<li>Creates and maintains the product roadmap</li>
	<li>Involvement of all stakeholders on key decisions</li>
	<li>Manages and prioritizes objectives relating to the product</li>
	<li>Hands-on involvement with end to end product life cycle expertise and exposure to different project management methodologies&nbsp;</li>
	<li>Leadership of the product team</li>
</ul>

<p>&nbsp;</p>

<h2>IDEAL TALENT&nbsp;</h2>

<ul style="list-style-type:disc">
	<li>Being a great communicator, both written and verbal. You can explain anything to anyone at any time.</li>
	<li>Analytics and solving problems, from simple to the most complex</li>
	<li>Meticulous and thrive when working independently</li>
	<li>Caring about the user experience</li>
	<li>Pulling people from different parts of the organization and make them work in harmony to achieve a common goal</li>
	<li>Seeing the BIG picture!</li>
	<li>Excellent communications skills (verbal and written) &amp; interpersonal skills</li>
	<li>Interest in HR Tech and optimisation software</li>
	<li>Founding / Start up Mindset</li>
</ul>

<p>&nbsp;</p>

<p>&nbsp;</p>

<h2><strong>WeLinkTalent | Executive Recruitment</strong></h2>

<p>WE LINK THE RIGHT TALENT TO THE RIGHT OPPORTUNITY</p>

<p>&nbsp;</p>

<p><strong>&bull; Who are we?</strong></p>

<p>WeLinkTalent is a boutique human capital&nbsp;consultancy&nbsp;firm specialising in the senior-level executive search covering Singapore and Asean. We link skills, personality and potential to the right company to create value and synergies that benefit both parties.</p>

<p>&nbsp;</p>

<p><strong>&bull; Why us?</strong></p>

<p>We are a unique name when it comes to recruitment, and we provide the &quot;Best in League&quot; Talent from our well-established network. We have a very competitive and transparent system. We engage with you and design a personalised recruitment strategy.</p>

<p>&nbsp;</p>

<p><strong>We thank you for your interest in this position and regret that only short-listed candidates will be notified.</strong></p>

<p>&nbsp;</p>

<p>Please follow&nbsp;<a href="https://www.linkedin.com/company/welinktalent-com">WeLinkTalent</a>&nbsp;on LinkedIn to access all our vacancies.</p>

<p><a href="http://www.welinktalent.com/">www.welinktalent.com</a></p>

<p>&nbsp;</p>

<p>WeLinkTalent Pte Ltd |&nbsp;Executive Recruitment |&nbsp;EA Licence&nbsp;№&nbsp;16S8272</p>

<p>White Emmanuel Alexander| Registration&nbsp;№&nbsp;R1324688</p>

<p>&nbsp;</p>

<p>WeLinkTalent is DPTM (Data Protection TradeMark) certified!</p>

<p>WeLinkTalent will treat your interest with full confidence and will handle Privacy Statement Data collected for recruitment purposes only.</p>', 'BPO');
INSERT INTO public.job (id, version, date_created, last_updated, location, special_note, salary, is_resume_required, job_type, seniority_level, hiring_manager_id, title, address_id, selected_brand, selected_div_or_department, application_slots, status, description, selected_industry) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 0, '2022-10-19 12:03:10.685', '2022-10-19 12:03:10.685', 'Antarctica', 'THANKS YOU', 5000.00, true, 'EXTERNAL_REFERRAL_SCHEME', 'ASSOCIATE', '4ce887cc-b59c-4020-bae5-f79e0460fa50', 'dfgdsgesgga', '3627d5e8-cbb0-4efc-aa97-63948411d41c', 'Return-on-Talent', 'Invoicing', 25, 'ACTIVE', '<h3><a href="https://www.lvmh.com/">LVMH, world leader in high-quality products</a></h3>

<p><a href="https://www.lvmh.com/"><cite>https://www.lvmh.com</cite></a></p>

<p>As the world leader in luxury, LVMH has been setting an example through its dynamic growth since its creation in 1987. Learn more about our prestigious&nbsp;...</p>

<p>&nbsp;</p>

<h3><a href="https://www.brandsoftheworld.com/logo/moet-hennessy">Moet Hennessy | Download vector logos and logotypes</a></h3>

<p><a href="https://www.brandsoftheworld.com/logo/moet-hennessy"><cite>https://www.brandsoftheworld.com&nbsp;&rsaquo; logo &rsaquo; moet-henn...</cite></a></p>

<p>&nbsp;</p>

<p>10 Oct 2016&nbsp;&mdash;&nbsp;Download the vector&nbsp;<em>logo</em>&nbsp;of the&nbsp;<em>Moet Hennessy</em>&nbsp;brand designed by in Portable Document Format (PDF) format. The current status of the&nbsp;<em>logo</em>&nbsp;is&nbsp;...</p>

<p>&nbsp;</p>

<h3><a href="https://www.logolynx.com/topic/moet+hennessy">Moet hennessy Logos - The Logo Discovery Engine</a></h3>

<p><a href="https://www.logolynx.com/topic/moet+hennessy"><cite>https://www.logolynx.com&nbsp;&rsaquo; topic &rsaquo; moet+hennessy</cite></a></p>

<p>&nbsp;</p>

<p>10&nbsp;<em>Moet hennessy Logos</em>&nbsp;ranked in order of popularity and relevancy. At LogoLynx.com find thousands of logos categorized into thousands of categories.</p>

<p>&nbsp;</p>

<h3><a href="https://www.pngitem.com/middle/TxRwixi_moet-hennessy-logo-png-moet-hennessy-logo-transparent/">Moet Hennessy Logo Transparent, Png Download - PNGitem</a></h3>', 'BPO');


--
-- TOC entry 4264 (class 0 OID 22386)
-- Dependencies: 234
-- Data for Name: job_qualification_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', '17ece13d-8b5a-4df5-9757-6bff9196135f');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', '18973338-30a9-4cce-ae82-e8ed94d43843');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', 'b111c4b1-e14a-467f-9e3c-66be8a2fc7ea');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', '08487b59-699d-4c00-9262-f39f1000ec39');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'de0d62f7-b244-40fb-90cb-166dc9d57429');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'cd9bcdaa-fbb0-462f-a3a7-0c475ee54525');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'aa66ee40-edf8-48db-a007-08faffaf5364');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'ecc36cbe-ad27-450f-af1d-e9d4e3e2d1a6');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'd2376078-61ad-4f29-b7de-4ba4c3cbc29b');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', '69da82aa-27e2-4c59-ba2d-fb17fffa67d8');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', '1d720b4b-ebbd-4c8f-95b3-9b5e7d8fa5d1');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', '1a400b97-e6b7-4902-9086-875a76da38d8');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', '61cb01b7-b658-46d0-af76-fabce2f9cb0c');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', 'c41acd0e-5e7e-4213-bb7e-2c15fcb0c9c9');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', '8e09795d-38aa-448d-892a-072bb7d2aa3f');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', '3ae65424-b42f-44d0-8d29-b3c92f7874cb');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', 'bfa9c0cb-ee8d-41a1-b0c6-9e3b96627457');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', '12782688-64b1-4a5f-b0a9-806b109997f5');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', '8d139907-4d34-44fc-b894-d40a9b800fde');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', 'e54be8fb-3ed4-4697-98cf-7cc7fcc7a3fa');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', '41e3575f-3b48-4bed-b4e5-bf32542cc8aa');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', 'cd40bc31-06d6-4877-a457-79e487b8e2cc');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', 'afc030cb-e0d6-4719-9b13-dcf2d942ff3e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', 'ac5a06a3-9d51-4338-a703-98897274f41a');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', '3063247f-fb9e-4a20-bf19-f60f4b4d4e14');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', '71004b6e-6e73-46fa-8862-ae57000f6b50');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', 'a69032c1-6b0a-4acf-b36d-b67c62a94e97');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', '4674f320-beae-43e4-9e8f-38ed1c455815');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', 'c787d4e7-c2d6-4868-bf3b-f514ee7a721c');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2e781930-a4eb-4018-844c-fefbafc29a7a', 'c97e667c-8bd7-470d-aeb9-0141a2f2f3d2');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2e781930-a4eb-4018-844c-fefbafc29a7a', '1a915e4f-65e5-4370-bcc3-14535af34ef7');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', 'facfc569-2200-4d88-b672-b837af5f3ffd');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', 'abb9d41f-173b-4c6b-8958-3eca1928594e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', '190f1041-aae6-420a-aebc-26265d71ce6b');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'f21d4339-703f-4aee-b855-421aa672d41f');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'b9ca978c-a763-4fa9-be6e-fa6f4a5dba6c');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', '742f5549-0307-4112-8212-69255782fd0c');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', '2f212b09-b1a2-400a-9438-f942bf18acd7');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', '1f12a4e4-563c-4b68-8db2-9dc5b8aff562');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', '624084e2-e0e3-48ff-9a06-2295d5fd50d9');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', '12d0c0ba-ad80-4cf5-855d-392970dc27bd');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', 'cf47f6a7-26c5-4728-88a9-5e2f100a83f2');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', '19d9772f-47be-46e8-8d20-a4d7667156ef');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', '2bea09e2-193a-49b2-b274-8456e22a043e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', '5957cf5e-9eb3-4dff-8772-311f556d6d25');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 'ed788cc2-7150-4756-a735-fc9357eed4a0');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', 'b1a245fd-51ec-4b92-ab2a-4280ff18b45c');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', 'f84ad3e9-8fa8-4e4e-81ab-4ca258e456cf');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', '4c345d24-fdea-4235-9062-b55a249c237a');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('2303daac-d87d-4c4e-8661-552e16c45c76', '7acdf404-dc80-44a9-b7b1-3718e9439f78');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', '104b18ff-c719-4ff8-8b9a-9e4229fd0e98');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', '71d64a91-938b-4c0c-a10e-d4006ff04b65');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', '33a23298-4564-45ef-8f64-73cbbaefd44e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', '03fab0d4-0fed-45e3-9359-ea9e2f442f78');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', 'dc76f18a-402e-4d40-9745-a70b7c916b0f');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', '46aa60af-ac30-4ed2-a601-13dd4f7ec250');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', '3af99cc0-c92d-4daa-8fdf-0bce804dee3d');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', '9c458c67-7897-4a0f-95c4-f9853e1ab13b');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', 'dc6e21b9-cdce-4de5-b41e-4c9398ee7762');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', 'd05db023-8e53-48d8-832d-8edc0b6c4a2e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', '4f1e6f58-95f6-468d-9d97-1db11b970076');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', '753fc33e-2c1d-48eb-b87e-2f86460a3f1f');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', '60f92434-4ef0-482d-915f-07999eee8222');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', '017ea7c5-4982-486a-b891-f5a166610a0e');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', '182550ff-a894-421b-80cc-7e33c868b3dd');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 'd593413f-feb2-43de-84a2-027fa2c69898');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 'f7cea30e-2e07-4b2e-8b0d-e20e09281179');
INSERT INTO public.job_qualification_question (job_qualification_questions_id, qualification_question_id) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', '09d46c43-6714-46bf-9736-1f4895d55423');


--
-- TOC entry 4265 (class 0 OID 22392)
-- Dependencies: 235
-- Data for Name: job_required_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', '146e3c5d-fc9a-4fa6-be1d-473a4b12f862');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', '89bd59bd-ad8d-45b9-bfd7-2b6e3a27f12d');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', 'e9ebdc5f-affc-4e0d-9627-7225e364aefd');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', '851040a8-6a65-443e-88ec-942225e7b6ea');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', '773224be-2453-4e89-97c5-1c8516b77b2d');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', '5eda0d74-3b50-404c-8e1e-616198f3f6da');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', '65eefac4-9426-48a0-a96f-ba420853c8d1');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', '617aa99a-a91c-40c4-8d40-f5f527df6b66');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', '94f5b720-c986-40cb-a8d3-7fe688176fee');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', '300d7f97-4cac-4018-b9df-dd73999bf6a7');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', 'a79ee4ba-4e41-4f74-8124-4673289f58a6');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('2e781930-a4eb-4018-844c-fefbafc29a7a', '6a0c695c-e0ab-48fc-a879-777ede143682');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', '70ab2762-b1a1-4ac2-a5d2-926023fbbecb');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'b409ccba-6b02-42d7-8194-ad0681ee2a2e');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', '325e9d65-e116-4a0b-81aa-34811cb27fe4');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', '614c40dc-1a8a-452c-a285-8d20b913c713');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', '4ee8662a-69ba-4179-aa8b-27b28adaed29');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', '71c4efcc-4688-4aec-af3f-29b8ddadfd13');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 'd81bbf34-4697-4a43-b1fd-81a02dd53dc3');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 'ce1b7c01-5385-45d0-ac31-47384301767c');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', '62c3d0a2-9fee-495c-aa75-13f5da927b04');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('2303daac-d87d-4c4e-8661-552e16c45c76', 'f7300d17-15a6-4fe3-aaab-236b191a4acc');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', '551cc4aa-7880-445e-af37-8403b1473cc7');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', '4181f212-9b77-45a9-8209-bb06082616c2');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', 'c92047bc-4044-48c7-bc33-e458ca875fd5');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', '008e596b-da0e-4c6c-8f9f-54d675448f83');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', 'afeb47be-4b91-4cc8-9de9-df2f1378f58a');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', '7f58fb9c-ae13-4af9-8c33-2e5529b13212');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', '3c4a8e72-b5a8-43fb-a77f-8a2dc560598e');
INSERT INTO public.job_required_language (job_required_languages_id, required_language_id) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 'a5de5246-05ae-4108-8a41-35aecdb63d6f');


--
-- TOC entry 4266 (class 0 OID 22398)
-- Dependencies: 236
-- Data for Name: job_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.job_tags (job_id, tags_string) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', 'sampel');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('26d62c37-e7bd-4a3b-bc0a-436d68d0f6ef', 'tags');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'JAVA');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'OOP');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'REST API');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'REDUX');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'REACTJS');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'HTML');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('09e0ee3d-884c-4a7e-99b0-c67753e6540c', 'ANGULAR');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', 'full stock');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('ee2c21c4-fb2c-4892-954e-4dc8c504adcd', 'programming');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', 'MOM');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('508127d9-d084-416d-9963-fb104e2faf0c', 'HR');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('64015979-8e0f-4a28-ad33-cbe8ae83c4ea', 'IT, QA');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', 'dev');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4d0cc928-d4e5-4dc6-b5bd-18b154ca0b21', 'php');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('2e690370-5a87-4d9f-8943-847bc521e80a', 'supervisor');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('a4c5b805-093b-446a-aadd-9f42a6cc9fc9', 'analyst');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('850b962f-4ee9-47f4-82c8-f8de84ef1c53', 'Dev');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('2e781930-a4eb-4018-844c-fefbafc29a7a', 'networkexpert');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('ffe4274b-1728-4c6a-92d4-ac722720835f', 'job tags');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'People management');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'HR transformation');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('dc9f9c08-a143-418d-b9ed-6a14c8864f45', 'HR strategy');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', 'Finance');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', 'AI');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('3cd58c47-666d-4466-8665-45d2a4ca4803', 'Grab');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('f7bd87c3-51dd-4bf5-a841-f11f74dbf28c', 'Sample tags here');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 'dev');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4d7d079c-deed-42f4-be86-05e61d258654', 'c+');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', 'skills');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('243e95d3-28d1-46f1-ab7b-8fffc4c02b57', 'survival');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('2303daac-d87d-4c4e-8661-552e16c45c76', 'sample');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7e0477f-94d0-4f02-b2b4-c5fbd864864a', 'Sample');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('5a19a856-3084-4ae7-bfab-9bd8cf99e586', 'Human Resource');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('53444197-eda6-4adb-b1f4-5764eeacb458', 'HumanResourceManager');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', 'Web developer');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('4db11866-d98b-4618-b695-a7fc9bb5bb48', 'Web Designer');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 'Product Management');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 'Customer Success');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 'Project Management');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 'SaaS');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('d7aca89c-ab02-4c89-bc1b-8f9f5ca7b42f', 'Business Development');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 'UX');
INSERT INTO public.job_tags (job_id, tags_string) VALUES ('6dfc4759-0cf9-46b8-987d-bda52bc64d66', 'UI');


--
-- TOC entry 4286 (class 0 OID 23099)
-- Dependencies: 256
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.password_reset_token (id, version, date_created, last_updated, user_id, token, date_expired, status) VALUES ('ba7de05d-fc2d-48c2-9579-a0678d144b90', 0, '2022-02-09 08:14:33.814', '2022-02-09 08:14:33.814', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', '7P6104fauk5SNiDN4w4wHe7wl3a5m3ckImgNDFmoIYgYDBgB', NULL, 'ACTIVE');


--
-- TOC entry 4267 (class 0 OID 22404)
-- Dependencies: 237
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('9ad33ab2-6655-4854-83b5-1d96b216a479', 0, NULL, '2021-05-21 15:07:38.825', 'Test', '2021-05-21 15:07:38.825', 'Dummy', 'MALE', '2fead6f9-93ba-488d-9e7e-f04ad4f145d2', 'ACTIVE', NULL, 'Applicant', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('97403a15-2217-4295-aaed-0c683df60ed6', 0, NULL, '2021-05-21 15:07:39.035', 'Emmanuel', '2021-05-21 15:07:39.035', NULL, 'MALE', '24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'ACTIVE', NULL, 'White', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('83812389-827b-4014-a90b-9212613256a9', 3, NULL, '2021-07-02 06:22:29.497', 'Jaymar', '2021-08-03 09:09:17.022', NULL, 'MALE', 'bd560101-d0c6-48c3-89f4-90a8d5560474', 'ACTIVE', '1992-06-09 16:00:00', 'Fernandez', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('cc56c783-a7c9-4ecb-ae6e-e5d229a27651', 1, NULL, '2021-07-02 03:31:24.93', 'Larry', '2021-08-03 09:11:19.057', NULL, 'MALE', '448dbcfe-6680-43c8-939d-aa09ed9ab387', 'ACTIVE', '1990-06-10 16:00:00', 'Borrero', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('027e5cfd-de1c-47d2-b9ca-b5aad6055418', 0, NULL, '2022-05-09 11:44:28.894', 'Mary', '2022-05-09 11:44:28.894', 'Claire', 'FEMALE', '2c826caf-5f86-4478-80bf-ad7486191130', 'ACTIVE', NULL, 'Loren', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('428097f3-5acf-4432-a75d-be9cfe82e18a', 0, NULL, '2022-03-18 09:46:17.665', 'Kathleen', '2022-03-18 09:46:17.665', NULL, NULL, '25d48f09-7943-469b-96ac-d836ca819e54', 'ACTIVE', NULL, 'Lee', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('c3de28a6-88ff-4d8b-a7d2-a91ac5693a7a', 10, NULL, '2022-04-22 15:54:09.01', 'Madeline', '2022-05-09 11:47:41.48', NULL, 'FEMALE', '3fd37d90-08e2-49c2-abc6-0367b2fe30bc', 'ACTIVE', '1990-07-12 16:00:00', 'Smith', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('c18acbbc-dc4a-410a-8992-4ee1ba107871', 7, NULL, '2022-04-17 14:47:31.917', 'Geraldine', '2022-09-04 13:42:19.575', NULL, 'FEMALE', '77b86a04-1eb7-486a-9db9-d39be85e0043', 'ACTIVE', '1990-04-03 16:00:00', 'Fernandez', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('4ce887cc-b59c-4020-bae5-f79e0460fa50', 15, NULL, '2021-05-21 15:07:39.252', 'Emmanuel', '2022-10-04 03:15:27.03', NULL, 'MALE', '7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'ACTIVE', '1978-02-26 16:30:00', 'White', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('0c96aecc-a481-481d-aabc-a3804455015f', 1, NULL, '2022-10-04 11:50:53.837', 'Evelina', '2022-10-04 13:36:15.78', '', 'FEMALE', '0c7cc8aa-44e3-4d38-b8bb-4a5506ea2c39', 'ACTIVE', '1990-11-06 16:00:00', 'Shimonite', NULL, 'https://www.linkedin.com/in/evelina-shimonite/', '+6594673458', 'Other');
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('04b7c54f-a606-4af0-a33f-b85eb1214064', 2, NULL, '2022-10-19 10:35:59.452', 'Samantha', '2022-10-19 11:57:41.051', NULL, 'FEMALE', '1377c7df-3ec7-4363-99b5-1e07efb84810', 'ACTIVE', NULL, 'Fam', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('0eac0c74-ea39-4399-a801-da3b02b9ccca', 1, NULL, '2022-11-14 04:14:09.553', 'Nathalie', '2022-11-14 04:14:56.76', NULL, 'FEMALE', '268f408a-f528-4432-b40c-d869dcbf6bd2', 'ACTIVE', NULL, 'White', NULL, NULL, NULL, NULL);
INSERT INTO public.profile (id, version, address_id, date_created, first_name, last_updated, middle_name, gender, user_id, status, birth_date, last_name, phone_number, linked_in_url, mobile_number, nationality) VALUES ('6c50ae1f-8f98-491b-9489-e26652be53f7', 12, NULL, '2022-04-17 14:08:39.609', 'Gi', '2022-04-22 15:45:02.704', NULL, 'FEMALE', '9310cf45-ee01-4410-8c73-f979ea1c2f66', 'DELETED', NULL, 'Ferns', NULL, NULL, NULL, NULL);


--
-- TOC entry 4268 (class 0 OID 22412)
-- Dependencies: 238
-- Data for Name: qualification_question; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('17ece13d-8b5a-4df5-9757-6bff9196135f', 0, '2021-07-02 06:20:22.482', '2021-07-02 06:20:22.482', 5, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('18973338-30a9-4cce-ae82-e8ed94d43843', 0, '2021-07-02 06:20:22.487', '2021-07-02 06:20:22.487', 4, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b111c4b1-e14a-467f-9e3c-66be8a2fc7ea', 0, '2021-07-02 06:20:22.492', '2021-07-02 06:20:22.492', 4, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('63efdf9b-562e-4922-b77a-51aa07a41f31', 0, '2021-07-02 06:30:19.825', '2021-07-02 06:30:19.825', 4, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('e07905a0-853a-40e5-aef2-5987d8b4ebab', 0, '2021-07-02 06:30:19.83', '2021-07-02 06:30:19.83', 4, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('36f04a9f-3bc4-4d06-9f0b-9953e2357905', 0, '2021-07-02 06:30:19.836', '2021-07-02 06:30:19.836', 5, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('08487b59-699d-4c00-9262-f39f1000ec39', 0, '2021-07-05 11:05:17.168', '2021-07-05 11:05:17.168', 3, 'REST API');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('de0d62f7-b244-40fb-90cb-166dc9d57429', 0, '2021-07-05 11:05:17.173', '2021-07-05 11:05:17.173', 3, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('cd9bcdaa-fbb0-462f-a3a7-0c475ee54525', 0, '2021-07-05 11:05:17.177', '2021-07-05 11:05:17.177', 4, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('aa66ee40-edf8-48db-a007-08faffaf5364', 0, '2021-07-05 11:05:17.181', '2021-07-05 11:05:17.181', 4, 'REDUX');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ecc36cbe-ad27-450f-af1d-e9d4e3e2d1a6', 0, '2021-07-05 11:05:17.186', '2021-07-05 11:05:17.186', 5, 'ANGULAR');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('d2376078-61ad-4f29-b7de-4ba4c3cbc29b', 0, '2021-07-05 11:05:17.191', '2021-07-05 11:05:17.191', 3, 'REACTJS');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('69da82aa-27e2-4c59-ba2d-fb17fffa67d8', 0, '2021-07-05 11:05:17.253', '2021-07-05 11:05:17.253', 5, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('1d720b4b-ebbd-4c8f-95b3-9b5e7d8fa5d1', 0, '2021-07-05 11:05:17.257', '2021-07-05 11:05:17.257', 5, 'Java');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('1a400b97-e6b7-4902-9086-875a76da38d8', 0, '2021-07-05 11:05:17.318', '2021-07-05 11:05:17.318', 5, 'YOUR ABILITY TO MANAGE PROJECT REMOTELY');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('61cb01b7-b658-46d0-af76-fabce2f9cb0c', 0, '2021-07-05 11:05:17.322', '2021-07-05 11:05:17.322', 5, 'Ha ve you worked with other government bodies?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c41acd0e-5e7e-4213-bb7e-2c15fcb0c9c9', 0, '2021-07-05 11:05:17.325', '2021-07-05 11:05:17.325', 3, 'Question 3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('8e09795d-38aa-448d-892a-072bb7d2aa3f', 0, '2021-07-05 11:05:17.381', '2021-07-05 11:05:17.381', 5, 'Advance knowledge about Computer');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('3ae65424-b42f-44d0-8d29-b3c92f7874cb', 0, '2021-07-05 11:05:17.385', '2021-07-05 11:05:17.385', 5, 'Ability to handle clients professionally');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('bfa9c0cb-ee8d-41a1-b0c6-9e3b96627457', 0, '2021-07-05 11:05:17.389', '2021-07-05 11:05:17.389', 5, 'Has an excellent understanding of the IT Service Desk Operations');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('12782688-64b1-4a5f-b0a9-806b109997f5', 0, '2021-07-05 11:05:17.45', '2021-07-05 11:05:17.45', 5, 'q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('8d139907-4d34-44fc-b894-d40a9b800fde', 0, '2021-07-05 11:05:17.454', '2021-07-05 11:05:17.454', 5, 'q3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('e54be8fb-3ed4-4697-98cf-7cc7fcc7a3fa', 0, '2021-07-05 11:05:17.458', '2021-07-05 11:05:17.458', 5, 'q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('41e3575f-3b48-4bed-b4e5-bf32542cc8aa', 0, '2021-07-05 11:05:17.505', '2021-07-05 11:05:17.505', 5, 'Q4');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('cd40bc31-06d6-4877-a457-79e487b8e2cc', 0, '2021-07-05 11:05:17.508', '2021-07-05 11:05:17.508', 5, 'Q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('afc030cb-e0d6-4719-9b13-dcf2d942ff3e', 0, '2021-07-05 11:05:17.511', '2021-07-05 11:05:17.511', 5, 'Q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ac5a06a3-9d51-4338-a703-98897274f41a', 0, '2021-07-05 11:05:17.553', '2021-07-05 11:05:17.553', 5, 'q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('3063247f-fb9e-4a20-bf19-f60f4b4d4e14', 0, '2021-07-05 11:05:17.557', '2021-07-05 11:05:17.557', 5, 'q3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('71004b6e-6e73-46fa-8862-ae57000f6b50', 0, '2021-07-05 11:05:17.561', '2021-07-05 11:05:17.561', 5, 'q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('a69032c1-6b0a-4acf-b36d-b67c62a94e97', 0, '2021-07-05 11:05:17.614', '2021-07-05 11:05:17.614', 5, 'Q3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('4674f320-beae-43e4-9e8f-38ed1c455815', 0, '2021-07-05 11:05:17.618', '2021-07-05 11:05:17.618', 5, 'Q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c787d4e7-c2d6-4868-bf3b-f514ee7a721c', 0, '2021-07-05 11:05:17.621', '2021-07-05 11:05:17.621', 5, 'Q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c97e667c-8bd7-470d-aeb9-0141a2f2f3d2', 0, '2021-07-05 11:05:17.657', '2021-07-05 11:05:17.657', 5, 'Q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('1a915e4f-65e5-4370-bcc3-14535af34ef7', 0, '2021-07-05 11:05:17.66', '2021-07-05 11:05:17.66', 5, 'Q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('facfc569-2200-4d88-b672-b837af5f3ffd', 0, '2021-07-05 11:05:17.713', '2021-07-05 11:05:17.713', 4, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('abb9d41f-173b-4c6b-8958-3eca1928594e', 0, '2021-07-05 11:05:17.717', '2021-07-05 11:05:17.717', 4, 'HPH');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('190f1041-aae6-420a-aebc-26265d71ce6b', 0, '2021-07-05 11:05:17.721', '2021-07-05 11:05:17.721', 5, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f21d4339-703f-4aee-b855-421aa672d41f', 0, '2021-07-05 11:05:17.776', '2021-07-05 11:05:17.776', 5, 'Do you have at least 10 years of experience as HR generalist?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b9ca978c-a763-4fa9-be6e-fa6f4a5dba6c', 0, '2021-07-05 11:05:17.78', '2021-07-05 11:05:17.78', 4, 'Do you have at least 3 years of experience in HR strategy implementation?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('742f5549-0307-4112-8212-69255782fd0c', 0, '2021-07-05 11:05:17.784', '2021-07-05 11:05:17.784', 5, 'Do you have experience in HR Transformation project?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('2f212b09-b1a2-400a-9438-f942bf18acd7', 0, '2021-07-05 11:05:17.84', '2021-07-05 11:05:17.84', 3, 'On a level of five, how strong is your remote management skills?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('1f12a4e4-563c-4b68-8db2-9dc5b8aff562', 0, '2021-07-05 11:05:17.844', '2021-07-05 11:05:17.844', 4, 'How much are you willing to work in a fast paced environment?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('624084e2-e0e3-48ff-9a06-2295d5fd50d9', 0, '2021-07-05 11:05:17.847', '2021-07-05 11:05:17.847', 5, 'How strong is your capacity to do project management?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('cf47f6a7-26c5-4728-88a9-5e2f100a83f2', 0, '2021-07-05 15:10:58.704', '2021-07-05 15:10:58.704', 5, 'PHP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('19d9772f-47be-46e8-8d20-a4d7667156ef', 0, '2021-07-05 15:10:58.706', '2021-07-05 15:10:58.706', 5, 'HTML');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('2bea09e2-193a-49b2-b274-8456e22a043e', 0, '2021-07-05 15:10:58.731', '2021-07-05 15:10:58.731', 5, 'jkhejfhkerhfkhrekfhk?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('12d0c0ba-ad80-4cf5-855d-392970dc27bd', 0, '2021-07-05 15:10:58.701', '2021-07-05 15:10:58.701', 4, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('5957cf5e-9eb3-4dff-8772-311f556d6d25', 0, '2021-07-05 15:10:58.734', '2021-07-05 15:10:58.734', 3, 'revfvfv');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ed788cc2-7150-4756-a735-fc9357eed4a0', 0, '2021-07-05 15:10:58.737', '2021-07-05 15:10:58.737', 3, 'rhnzuuju');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('0f543824-43ed-4543-8aa4-67c8a52461e0', 0, '2021-07-06 06:05:07.303', '2021-07-06 06:05:07.303', 4, 'revfvfv');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f1635ba8-d42f-43a1-a650-d183c8c9899e', 0, '2021-07-06 06:05:07.312', '2021-07-06 06:05:07.312', 5, 'jkhejfhkerhfkhrekfhk?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('35553674-e0f8-4c3e-a569-e200e22208e5', 0, '2021-07-06 06:05:07.316', '2021-07-06 06:05:07.316', 4, 'rhnzuuju');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('4fef069e-a710-4f6d-bb88-483f4a8cfa95', 0, '2021-07-06 06:12:06.369', '2021-07-06 06:12:06.369', 5, 'PHP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b138b844-8bbf-45d1-aa56-2e5367079d55', 0, '2021-07-06 06:12:06.373', '2021-07-06 06:12:06.373', 4, 'HTML');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('62ada879-208e-4d89-a18c-7d464bdc85ef', 0, '2021-07-06 06:12:06.377', '2021-07-06 06:12:06.377', 4, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('34ef7768-cc90-4339-bafc-c30394c44aac', 0, '2021-07-06 06:20:27.369', '2021-07-06 06:20:27.369', 4, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('60e1f50a-38ea-4f93-8346-63800b1dc3b8', 0, '2021-07-06 06:20:27.374', '2021-07-06 06:20:27.374', 3, 'ANGULAR');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ae55113d-b253-4a39-abc5-0667d7943afd', 0, '2021-07-06 06:20:27.394', '2021-07-06 06:20:27.394', 2, 'REACTJS');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('2504fd39-f8f2-4eb5-9de3-31e23ed1d358', 0, '2021-07-06 06:20:27.417', '2021-07-06 06:20:27.417', 3, 'REDUX');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('fe901047-0160-40ab-a9a7-2bda9ef606f0', 0, '2021-07-06 06:20:27.423', '2021-07-06 06:20:27.423', 4, 'REST API');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('a9924eaa-3559-4a40-9aa1-47f81ade885e', 0, '2021-07-06 06:20:27.43', '2021-07-06 06:20:27.43', 4, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('200cfc5f-e735-4d25-aa99-beea0756ce00', 0, '2021-07-06 07:30:44.646', '2021-07-06 07:30:44.646', 4, 'Do you have at least 10 years of experience as HR generalist?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('99aeab8a-4a8e-413e-b2c2-770282cec5e2', 0, '2021-07-06 07:30:44.655', '2021-07-06 07:30:44.655', 4, 'Do you have experience in HR Transformation project?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('5f1a8518-7f93-49f0-bd7b-dd2853603d86', 0, '2021-07-06 07:30:44.661', '2021-07-06 07:30:44.661', 5, 'Do you have at least 3 years of experience in HR strategy implementation?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b1a245fd-51ec-4b92-ab2a-4280ff18b45c', 0, '2021-07-06 08:44:00.638', '2021-07-06 08:44:00.638', 4, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f84ad3e9-8fa8-4e4e-81ab-4ca258e456cf', 0, '2021-07-06 08:44:00.642', '2021-07-06 08:44:00.642', 5, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('4c345d24-fdea-4235-9062-b55a249c237a', 0, '2021-07-06 08:44:00.647', '2021-07-06 08:44:00.647', 5, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('151355ea-6aed-4d84-b750-5ffc66ce6852', 0, '2021-07-06 09:08:42.461', '2021-07-06 09:08:42.461', 5, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('a38bb9fc-cdcd-4398-878b-8129d13fc973', 0, '2021-07-06 09:08:42.464', '2021-07-06 09:08:42.464', 4, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('3f283c8a-e3d2-45de-a781-1129f42a7de0', 0, '2021-07-06 09:08:42.473', '2021-07-06 09:08:42.473', 4, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('5cb5ec80-812e-4848-ab07-fa34a0f09e6f', 0, '2021-08-03 09:07:49.797', '2021-08-03 09:07:49.797', 4, 'q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('e18ed149-7726-485a-844a-9df87fe5a541', 0, '2021-08-03 09:07:49.804', '2021-08-03 09:07:49.804', 5, 'q3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('9ea7672b-9793-40fc-90a7-3b1ea0c95329', 0, '2021-08-03 09:07:49.806', '2021-08-03 09:07:49.806', 4, 'q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('68806231-7aad-4a14-8f41-0f0ef8cbc8b9', 0, '2021-08-03 09:08:17.318', '2021-08-03 09:08:17.318', 4, 'Java');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('3f8b7c0e-b254-4e99-9fbd-a2cbca1668e6', 0, '2021-08-03 09:08:17.321', '2021-08-03 09:08:17.321', 4, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('e4764834-e9a8-42c4-b172-0eeed3fd1dd5', 0, '2021-08-03 09:13:57.395', '2021-08-03 09:13:57.395', 4, 'q3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b0f1348d-cecb-4148-ae04-bdb9af4a01b7', 0, '2021-08-03 09:13:57.398', '2021-08-03 09:13:57.398', 4, 'q2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('2c3fb0a8-63ee-4c6b-b2c7-47e787c7a910', 0, '2021-08-03 09:13:57.401', '2021-08-03 09:13:57.401', 4, 'q1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('49cad1d4-35a9-464c-b31a-7a887108fd7b', 0, '2021-08-03 09:15:27.831', '2021-08-03 09:15:27.831', 4, 'Java');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ee625f73-b6d0-4a0c-9957-d8bd1ccd5a54', 0, '2021-08-03 09:15:27.833', '2021-08-03 09:15:27.833', 5, 'OOP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('9761fbcf-929d-4fa5-8a02-4a0a903ad9f4', 0, '2022-03-18 09:50:17.057', '2022-03-18 09:50:17.057', 3, 'Do you have at least 10 years of experience as HR generalist?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('bb33714c-f72b-4530-88c3-149382de3e6f', 0, '2022-03-18 09:50:17.064', '2022-03-18 09:50:17.064', 5, 'Do you have at least 3 years of experience in HR strategy implementation?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('47c60461-7327-4b60-84cb-41436ad2ffc4', 0, '2022-03-18 09:50:17.072', '2022-03-18 09:50:17.072', 3, 'Do you have experience in HR Transformation project?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f301b2e9-40fd-4fab-ae44-723167a80832', 0, '2022-03-18 09:56:15.983', '2022-03-18 09:56:15.983', 5, 'Do you have at least 10 years of experience as HR generalist?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('29b32c86-8c66-47c9-aee9-8f89bef1945d', 0, '2022-03-18 09:56:15.988', '2022-03-18 09:56:15.988', 5, 'Do you have experience in HR Transformation project?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('6d26c720-226a-451b-ad66-0a4d6a4f20cf', 0, '2022-03-18 09:56:15.995', '2022-03-18 09:56:15.995', 5, 'Do you have at least 3 years of experience in HR strategy implementation?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('7acdf404-dc80-44a9-b7b1-3718e9439f78', 0, '2022-03-21 01:47:31.251', '2022-03-21 01:47:31.251', 4, 'Sample question');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('104b18ff-c719-4ff8-8b9a-9e4229fd0e98', 0, '2022-04-17 14:45:16.585', '2022-04-17 14:45:16.585', 3, 'Question 2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('71d64a91-938b-4c0c-a10e-d4006ff04b65', 0, '2022-04-17 14:45:16.597', '2022-04-17 14:45:16.597', 2, 'Question 3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('33a23298-4564-45ef-8f64-73cbbaefd44e', 0, '2022-04-17 14:45:16.608', '2022-04-17 14:45:16.608', 5, 'Question 1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('bfba88f7-956b-4024-9eb7-73704c075a39', 0, '2022-04-17 14:50:42.393', '2022-04-17 14:50:42.393', 5, 'Question 3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ab2e14d6-eae1-4817-af3d-9ca34ee77bd2', 0, '2022-04-17 14:50:42.397', '2022-04-17 14:50:42.397', 2, 'Question 1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('9e0a0bf8-bc00-49df-a589-4986dd3499e2', 0, '2022-04-17 14:50:42.4', '2022-04-17 14:50:42.4', 2, 'Question 2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c7d0dfc3-d870-4a77-a38f-055842df51b3', 0, '2022-04-17 15:05:26.369', '2022-04-17 15:05:26.369', 4, 'Question 1');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('9e00821a-bb2c-49bd-ac93-9b30f393b730', 0, '2022-04-17 15:05:26.373', '2022-04-17 15:05:26.373', 2, 'Question 3');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('470dbd9f-9ce9-47d6-b069-fca21cdecdb5', 0, '2022-04-17 15:05:26.376', '2022-04-17 15:05:26.376', 4, 'Question 2');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('03fab0d4-0fed-45e3-9359-ea9e2f442f78', 0, '2022-04-22 16:09:13.605', '2022-04-22 16:09:13.605', 4, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('dc76f18a-402e-4d40-9745-a70b7c916b0f', 0, '2022-04-22 16:09:13.608', '2022-04-22 16:09:13.608', 3, 'Are you able to process payrolls and handles the documentation of compensation benefits?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('46aa60af-ac30-4ed2-a601-13dd4f7ec250', 0, '2022-04-22 16:09:13.611', '2022-04-22 16:09:13.611', 5, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ae58c3a2-4398-40f7-8f51-3f8a13e9a1ae', 0, '2022-04-22 16:28:06.208', '2022-04-22 16:28:06.208', 4, 'Are you able to process payrolls and handles the documentation of compensation benefits?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ebd5d4cc-b075-4a4b-9d35-65f72a16c9be', 0, '2022-04-22 16:28:06.224', '2022-04-22 16:28:06.224', 5, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b4e3f6a5-e05a-410a-9a17-1084b2b2ce01', 0, '2022-04-22 16:28:06.233', '2022-04-22 16:28:06.233', 3, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('a3e58e91-4a2a-4a4d-9bbd-747cf8139fa1', 0, '2022-04-22 16:38:25.9', '2022-04-22 16:38:25.9', 4, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('8c7a344c-0683-4493-95b8-d27398b23660', 0, '2022-04-22 16:38:25.903', '2022-04-22 16:38:25.903', 5, 'Are you able to process payrolls and handles the documentation of compensation benefits?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('a6cb9646-45e9-4342-a9c4-0d5b706b82fb', 0, '2022-04-22 16:38:25.906', '2022-04-22 16:38:25.906', 5, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('37445e5d-dd28-483b-a585-19d9a67784b6', 0, '2022-05-09 11:22:43.725', '2022-05-09 11:22:43.725', 5, 'Are you able to process payrolls and handles the documentation of compensation benefits.');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('e48cbf3f-2f6e-4e2c-8a3d-d0e307e65f0e', 0, '2022-05-09 11:22:43.729', '2022-05-09 11:22:43.729', 4, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('ecf1e2ed-3c5d-4de5-b6a1-c2cfc3106446', 0, '2022-05-09 11:22:43.733', '2022-05-09 11:22:43.733', 5, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('3af99cc0-c92d-4daa-8fdf-0bce804dee3d', 0, '2022-05-09 11:47:54.117', '2022-05-09 11:47:54.117', 5, 'Are you able to process payrolls and handles the documentation of compensation benefits.');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('9c458c67-7897-4a0f-95c4-f9853e1ab13b', 0, '2022-05-09 11:47:54.121', '2022-05-09 11:47:54.121', 4, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('dc6e21b9-cdce-4de5-b41e-4c9398ee7762', 0, '2022-05-09 11:47:54.124', '2022-05-09 11:47:54.124', 5, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('244fc5b3-b4be-4e01-a6be-90d8f41fa0c8', 0, '2022-05-09 11:57:57.548', '2022-05-09 11:57:57.548', 5, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('2165c2a1-ff54-4e91-9972-456076bfb441', 0, '2022-05-09 11:57:57.557', '2022-05-09 11:57:57.557', 4, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('5c29ccab-690b-43d4-a79d-cbb5003b361f', 0, '2022-05-09 11:57:57.564', '2022-05-09 11:57:57.564', 5, 'Are you able to process payrolls and handles the documentation of compensation benefits.');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b5bb282b-534b-4ade-8d28-b8535ba1946e', 0, '2022-05-09 12:14:23.075', '2022-05-09 12:14:23.075', 4, 'Are you knowledgeable in various functions and practices of a human resource manager?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('993fda1a-f06a-4556-80ad-a9b65aa9466e', 0, '2022-05-09 12:14:23.079', '2022-05-09 12:14:23.079', 3, 'Can you support the HR manager in the recruitment process by identifying clients, doing background checks, and issuing job orders?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f41d7a0e-0eab-4324-8e62-486230ccd0d7', 0, '2022-05-09 12:14:23.083', '2022-05-09 12:14:23.083', 4, 'Are you able to process payrolls and handles the documentation of compensation benefits.');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('d05db023-8e53-48d8-832d-8edc0b6c4a2e', 0, '2022-09-04 13:27:30.195', '2022-09-04 13:27:30.195', 4, 'HTML');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('4f1e6f58-95f6-468d-9d97-1db11b970076', 0, '2022-09-04 13:27:30.2', '2022-09-04 13:27:30.2', 5, 'JAVA');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('753fc33e-2c1d-48eb-b87e-2f86460a3f1f', 0, '2022-09-04 13:27:30.204', '2022-09-04 13:27:30.204', 5, 'PHP');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('26256eb9-25b2-4d45-85d8-8e724e26be6e', 0, '2022-09-04 13:36:26.037', '2022-09-04 13:36:26.037', 5, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c510b1be-8dd3-4e4a-9029-63b578298348', 0, '2022-09-04 13:36:26.04', '2022-09-04 13:36:26.04', 4, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('b99208fe-cc32-4d27-a448-df3427be3cc9', 0, '2022-09-04 13:36:26.043', '2022-09-04 13:36:26.043', 5, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('c0bc33c3-41d8-4098-b11a-de449c80d60d', 0, '2022-09-04 13:46:17.33', '2022-09-04 13:46:17.33', 3, 'ECQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('7e39fb4a-0cbd-4ad8-9124-b228a246d184', 0, '2022-09-04 13:46:17.333', '2022-09-04 13:46:17.333', 5, 'MCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('19a0fb75-0605-448c-a3ec-38dede57c5d5', 0, '2022-09-04 13:46:17.337', '2022-09-04 13:46:17.337', 5, 'MGCQ');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('60f92434-4ef0-482d-915f-07999eee8222', 0, '2022-10-04 03:16:57.91', '2022-10-04 03:16:57.91', 4, 'What is your level of interest in HR Tech?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('017ea7c5-4982-486a-b891-f5a166610a0e', 0, '2022-10-04 03:16:57.915', '2022-10-04 03:16:57.915', 3, 'How much do you know about selling a B2B SaaS ?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('182550ff-a894-421b-80cc-7e33c868b3dd', 0, '2022-10-04 03:16:57.919', '2022-10-04 03:16:57.919', 4, 'From 1 to 5, how would you rank yourself in project management?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('dc26b67b-3a38-4aa7-b1c2-5595bab390d4', 0, '2022-10-04 12:43:09.959', '2022-10-04 12:43:09.959', 5, 'What is your level of interest in HR Tech?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('6e3c0f51-ac0f-4cf1-9976-5ae8669d659d', 0, '2022-10-04 12:43:09.966', '2022-10-04 12:43:09.966', 5, 'From 1 to 5, how would you rank yourself in project management?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('0f4a7c75-22a7-48bd-a2a9-d0f0bbda6420', 0, '2022-10-04 12:43:09.971', '2022-10-04 12:43:09.971', 3, 'How much do you know about selling a B2B SaaS ?');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('d593413f-feb2-43de-84a2-027fa2c69898', 0, '2022-10-19 12:03:10.718', '2022-10-19 12:03:10.718', 3, 'How many interviews have you personnaly');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('f7cea30e-2e07-4b2e-8b0d-e20e09281179', 0, '2022-10-19 12:03:10.723', '2022-10-19 12:03:10.723', 5, 'How strong are you in remote management');
INSERT INTO public.qualification_question (id, version, date_created, last_updated, rate, question) VALUES ('09d46c43-6714-46bf-9736-1f4895d55423', 0, '2022-10-19 12:03:10.733', '2022-10-19 12:03:10.733', 4, 'How strong yre you in Design Thinking?');


--
-- TOC entry 4269 (class 0 OID 22420)
-- Dependencies: 239
-- Data for Name: readable_notification; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4270 (class 0 OID 22428)
-- Dependencies: 240
-- Data for Name: registration_token; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4271 (class 0 OID 22436)
-- Dependencies: 241
-- Data for Name: required_language; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('146e3c5d-fc9a-4fa6-be1d-473a4b12f862', 0, '2021-07-02 06:20:22.475', '2021-07-02 06:20:22.475', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('3c4f98ea-d673-46fc-b0d4-acf395f53911', 0, '2021-07-02 06:30:19.819', '2021-07-02 06:30:19.819', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('89bd59bd-ad8d-45b9-bfd7-2b6e3a27f12d', 0, '2021-07-05 11:05:17.157', '2021-07-05 11:05:17.157', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('e9ebdc5f-affc-4e0d-9627-7225e364aefd', 0, '2021-07-05 11:05:17.248', '2021-07-05 11:05:17.248', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('851040a8-6a65-443e-88ec-942225e7b6ea', 0, '2021-07-05 11:05:17.308', '2021-07-05 11:05:17.308', 5, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('773224be-2453-4e89-97c5-1c8516b77b2d', 0, '2021-07-05 11:05:17.313', '2021-07-05 11:05:17.313', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('5eda0d74-3b50-404c-8e1e-616198f3f6da', 0, '2021-07-05 11:05:17.376', '2021-07-05 11:05:17.376', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('65eefac4-9426-48a0-a96f-ba420853c8d1', 0, '2021-07-05 11:05:17.44', '2021-07-05 11:05:17.44', 5, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('617aa99a-a91c-40c4-8d40-f5f527df6b66', 0, '2021-07-05 11:05:17.445', '2021-07-05 11:05:17.445', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('94f5b720-c986-40cb-a8d3-7fe688176fee', 0, '2021-07-05 11:05:17.5', '2021-07-05 11:05:17.5', 4, 'Japanese');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('300d7f97-4cac-4018-b9df-dd73999bf6a7', 0, '2021-07-05 11:05:17.549', '2021-07-05 11:05:17.549', 5, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('a79ee4ba-4e41-4f74-8124-4673289f58a6', 0, '2021-07-05 11:05:17.609', '2021-07-05 11:05:17.609', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('6a0c695c-e0ab-48fc-a879-777ede143682', 0, '2021-07-05 11:05:17.654', '2021-07-05 11:05:17.654', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('70ab2762-b1a1-4ac2-a5d2-926023fbbecb', 0, '2021-07-05 11:05:17.71', '2021-07-05 11:05:17.71', 3, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('b409ccba-6b02-42d7-8194-ad0681ee2a2e', 0, '2021-07-05 11:05:17.769', '2021-07-05 11:05:17.769', 5, 'French');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('325e9d65-e116-4a0b-81aa-34811cb27fe4', 0, '2021-07-05 11:05:17.773', '2021-07-05 11:05:17.773', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('614c40dc-1a8a-452c-a285-8d20b913c713', 0, '2021-07-05 11:05:17.833', '2021-07-05 11:05:17.833', 3, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('4ee8662a-69ba-4179-aa8b-27b28adaed29', 0, '2021-07-05 11:05:17.837', '2021-07-05 11:05:17.837', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('71c4efcc-4688-4aec-af3f-29b8ddadfd13', 0, '2021-07-05 15:10:58.697', '2021-07-05 15:10:58.697', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('d81bbf34-4697-4a43-b1fd-81a02dd53dc3', 0, '2021-07-05 15:10:58.726', '2021-07-05 15:10:58.726', 2, 'Spanish');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('ce1b7c01-5385-45d0-ac31-47384301767c', 0, '2021-07-05 15:10:58.729', '2021-07-05 15:10:58.729', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('200ab7df-c23d-4eb2-a5a3-503e098219e0', 0, '2021-07-06 06:05:07.276', '2021-07-06 06:05:07.276', 4, 'Spanish');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('6538fc01-61b3-42b9-96dd-62cd65a29cc0', 0, '2021-07-06 06:05:07.283', '2021-07-06 06:05:07.283', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('9bc22ead-e4cb-4c28-92d9-253a912202b8', 0, '2021-07-06 06:12:06.357', '2021-07-06 06:12:06.357', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('5241b1b3-2dec-4782-9a28-83059223d92b', 0, '2021-07-06 06:20:27.364', '2021-07-06 06:20:27.364', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('6b7ba277-4b79-4af1-862f-87a1c580fdbd', 0, '2021-07-06 07:30:44.618', '2021-07-06 07:30:44.618', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('224182f0-3583-4bf2-ad30-c99a04cd24aa', 0, '2021-07-06 07:30:44.625', '2021-07-06 07:30:44.625', 4, 'French');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('62c3d0a2-9fee-495c-aa75-13f5da927b04', 0, '2021-07-06 08:44:00.632', '2021-07-06 08:44:00.632', 4, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('fbc38872-9a17-4940-bfef-4407941fd4d6', 0, '2021-07-06 09:08:42.457', '2021-07-06 09:08:42.457', 4, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('0e1bd27f-6cf7-42c8-a6d2-42c12d66cde2', 0, '2021-08-03 09:07:49.778', '2021-08-03 09:07:49.778', 4, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('15aba2a7-0278-4957-8666-6917c6f74d9d', 0, '2021-08-03 09:08:17.316', '2021-08-03 09:08:17.316', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('a4b7e3f7-ad6a-41f6-8f41-245c75565fa3', 0, '2021-08-03 09:13:57.369', '2021-08-03 09:13:57.369', 1, 'Chinese - Simplified');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('ba552bcf-af1e-4522-bad6-87684f5da484', 0, '2021-08-03 09:15:27.813', '2021-08-03 09:15:27.813', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('1132aeeb-2a65-4dc3-9e95-a77c3182fa5b', 0, '2022-03-18 09:50:17.04', '2022-03-18 09:50:17.04', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('dd5535ba-0933-49b1-85b5-c5ce1889b98d', 0, '2022-03-18 09:50:17.046', '2022-03-18 09:50:17.046', 1, 'French');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('77f6810e-4612-4fa8-9bdf-436a98c0b7f9', 0, '2022-03-18 09:56:15.927', '2022-03-18 09:56:15.927', 5, 'French');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('24a770d3-b2ce-4199-b965-d6699e2352e2', 0, '2022-03-18 09:56:15.937', '2022-03-18 09:56:15.937', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('f7300d17-15a6-4fe3-aaab-236b191a4acc', 0, '2022-03-21 01:47:31.247', '2022-03-21 01:47:31.247', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('551cc4aa-7880-445e-af37-8403b1473cc7', 0, '2022-04-17 14:45:16.576', '2022-04-17 14:45:16.576', 3, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('8d7123ca-cfa4-422b-8a25-58ecddcb25fb', 0, '2022-04-17 14:50:42.372', '2022-04-17 14:50:42.372', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('328c9f26-758b-4c01-866d-651e74222864', 0, '2022-04-17 15:05:26.337', '2022-04-17 15:05:26.337', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('4181f212-9b77-45a9-8209-bb06082616c2', 0, '2022-04-22 16:09:13.601', '2022-04-22 16:09:13.601', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('81706697-dd39-4030-ae18-90fd106b72b3', 0, '2022-04-22 16:28:06.2', '2022-04-22 16:28:06.2', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('77e3064d-5739-4ac8-9dc9-633be3fd5e6c', 0, '2022-04-22 16:38:25.881', '2022-04-22 16:38:25.881', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('5fcc6004-fd1b-4765-b437-9a9c294e1e76', 0, '2022-05-09 11:22:43.722', '2022-05-09 11:22:43.722', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('c92047bc-4044-48c7-bc33-e458ca875fd5', 0, '2022-05-09 11:47:54.108', '2022-05-09 11:47:54.108', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('008e596b-da0e-4c6c-8f9f-54d675448f83', 0, '2022-05-09 11:47:54.114', '2022-05-09 11:47:54.114', 3, 'Japanese');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('44cd7b6e-8765-465c-9fe2-9414d34d85f2', 0, '2022-05-09 11:57:57.541', '2022-05-09 11:57:57.541', 3, 'Japanese');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('0eb06b7a-83e3-4693-9431-86049952b080', 0, '2022-05-09 11:57:57.544', '2022-05-09 11:57:57.544', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('ef0101cc-fcbc-4e56-b486-4e9871346ce6', 0, '2022-05-09 12:14:23.049', '2022-05-09 12:14:23.049', 3, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('366d1d43-1cc5-47f1-9389-44d59795a66a', 0, '2022-05-09 12:14:23.055', '2022-05-09 12:14:23.055', 3, 'Japanese');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('afeb47be-4b91-4cc8-9de9-df2f1378f58a', 0, '2022-09-04 13:27:30.181', '2022-09-04 13:27:30.181', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('972da6bf-1eb6-4fa0-a2c3-fdfc0f76f40d', 0, '2022-09-04 13:36:26.033', '2022-09-04 13:36:26.033', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('9d6e934b-3d32-44b6-90f0-2cde0baec0f7', 0, '2022-09-04 13:46:17.298', '2022-09-04 13:46:17.298', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('7f58fb9c-ae13-4af9-8c33-2e5529b13212', 0, '2022-10-04 03:16:57.902', '2022-10-04 03:16:57.902', 4, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('461582d1-9db0-49a5-8b70-de5fa9e5f239', 0, '2022-10-04 12:43:09.943', '2022-10-04 12:43:09.943', 5, 'English');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('3c4a8e72-b5a8-43fb-a77f-8a2dc560598e', 0, '2022-10-19 12:03:10.699', '2022-10-19 12:03:10.699', 3, 'Arabic');
INSERT INTO public.required_language (id, version, date_created, last_updated, rate, language) VALUES ('a5de5246-05ae-4108-8a41-35aecdb63d6f', 0, '2022-10-19 12:03:10.707', '2022-10-19 12:03:10.707', 5, 'English');


--
-- TOC entry 4272 (class 0 OID 22444)
-- Dependencies: 242
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.role (id, version, authority) VALUES ('2fcbe52f-14c2-489e-9c47-8b72addecb56', 0, 'ROLE_SUPER_USER');
INSERT INTO public.role (id, version, authority) VALUES ('c927153d-9026-4dec-821d-71622978a131', 0, 'ROLE_ADMIN');
INSERT INTO public.role (id, version, authority) VALUES ('35f031e2-a442-46d0-b969-a50c32a9bbf6', 0, 'ROLE_OWNER');
INSERT INTO public.role (id, version, authority) VALUES ('b9a0f2b8-f4bd-450e-8318-304920f3781e', 0, 'ROLE_HIRING_MANAGER');
INSERT INTO public.role (id, version, authority) VALUES ('01ee6dd1-a974-4dac-965a-b30aefb4ff8c', 0, 'ROLE_EMPLOYER');
INSERT INTO public.role (id, version, authority) VALUES ('a38a94fe-70f6-43df-8f95-b95246fe76cf', 0, 'ROLE_WORKER');
INSERT INTO public.role (id, version, authority) VALUES ('48e92031-57d7-4c2a-ae00-7e091d06aa0d', 0, 'ROLE_APPLICANT');


--
-- TOC entry 4273 (class 0 OID 22452)
-- Dependencies: 243
-- Data for Name: s3resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('7494b8d0-a231-48b6-8285-49a9cfe83bcd', 0, '2021-07-02 06:27:31.832', '2021-07-02 06:27:31.832', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/e648/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('a62c748c-7bd7-476e-8370-78a19a709e9e', 0, '2021-07-06 06:03:07.084', '2021-07-06 06:03:07.084', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/a8e2/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('d74d77d7-7ca0-4682-957d-4730f28ae0c4', 0, '2021-07-06 06:12:04.089', '2021-07-06 06:12:04.089', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/0ecf/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('8654e443-3a04-4f13-806b-f73475efa992', 0, '2021-07-06 06:20:15.137', '2021-07-06 06:20:15.137', 80926.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/abfd/Advantages and Disadvantages Of Using Postgres_SQL Vs Mongo_NoSql Database.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('02244579-c09f-4714-a206-9fb67b5a5197', 0, '2021-07-06 07:30:33.65', '2021-07-06 07:30:33.65', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/0c2e/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('cf00343a-46f9-4c4b-8b00-257d391edefe', 0, '2021-07-06 09:08:39.6', '2021-07-06 09:08:39.6', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/37ed/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('35df3eac-6b98-4300-8f0a-6dcb039a660d', 0, '2021-07-06 09:26:44.46', '2021-07-06 09:26:44.46', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/932e/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('b7d872f2-6ebc-45b3-ae27-c5775ee5d8ac', 0, '2021-08-03 09:07:42.195', '2021-08-03 09:07:42.195', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/9374/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('3f4492e1-f0dd-45d1-8132-850a5b9077f1', 0, '2021-08-03 09:08:11.47', '2021-08-03 09:08:11.47', 80926.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/7f74/Advantages and Disadvantages Of Using Postgres_SQL Vs Mongo_NoSql Database.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('9cf1129a-2039-4059-b499-6eb3f0a1f200', 0, '2022-03-18 09:49:55.762', '2022-03-18 09:49:55.762', 173978.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/663a/OnBoarding Booster Poster (4).pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('2ebb456c-7c6c-4968-8961-17a85e99b63d', 0, '2022-03-21 06:38:59.669', '2022-03-21 06:38:59.669', 173978.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/7875/OnBoarding Booster Poster (4).pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('0797cbc2-c602-4ea0-a0ba-2c94c03eb0cd', 0, '2022-04-17 14:50:27.034', '2022-04-17 14:50:27.034', 10158823.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/1070/TEEN TALK 1.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('b069dd4b-388d-4ff3-af5e-5e5d6709b3cc', 0, '2022-04-17 14:50:39.288', '2022-04-17 14:50:39.288', 2160016.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/ef5a/CamScanner 03-28-2022 17.26 (1).pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('c4ca863a-f1ff-4e53-aff8-d795fdb8e0c9', 0, '2022-04-22 16:24:09.736', '2022-04-22 16:24:09.736', 222000.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/8e79/CV_Fernandez_Geraldine.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('e8270a89-a275-41ca-8972-41a44bd2d643', 0, '2022-04-22 16:28:02.884', '2022-04-22 16:28:02.884', 222000.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/9e4f/CV_Fernandez_Geraldine.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('5299b4b2-af30-4e87-b6c0-8084c673327a', 0, '2022-05-09 11:57:53.391', '2022-05-09 11:57:53.391', 222000.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/2e05/CV_Fernandez_Geraldine.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('c2a28d76-0db9-41e7-852c-05d2b97bebce', 0, '2022-09-04 13:12:47.462', '2022-09-04 13:12:47.462', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/e428/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('6b40ad08-c426-4e18-bc99-3bbe9f0e84c8', 0, '2022-09-04 13:13:12.161', '2022-09-04 13:13:12.161', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/d66b/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('8f568f00-7499-49a6-bdc7-646d9f5a5dc4', 0, '2022-09-04 13:14:04.137', '2022-09-04 13:14:04.137', 13469.00, 'COMPANY_ICON', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/cf78/icon.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('51375576-1505-4ab8-b66f-d83e39f889f0', 0, '2022-09-04 13:14:22.919', '2022-09-04 13:14:22.919', 13469.00, 'COMPANY_NAV_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/4125/nav_logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('dda1cc0f-eae0-45cd-a2b8-c49e9ecbdc79', 0, '2022-09-04 13:14:34.566', '2022-09-04 13:14:34.566', 4603.00, 'COMPANY_FAVICON', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/1669/favicon.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('c9eb1403-fc44-4d24-86a6-6f089d3fc3bf', 0, '2022-09-04 13:20:34.213', '2022-09-04 13:20:34.213', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/8fc7/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('04e2867d-d8b7-4b8d-9dfc-6c517f01ec1d', 0, '2022-09-04 13:36:12.737', '2022-09-04 13:36:12.737', 1996578.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/f8a2/02 CS4_EDM_EN.pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('e2b1b8bd-5c54-4229-b140-ecb2aecba45f', 0, '2022-09-04 14:35:21.447', '2022-09-04 14:35:21.447', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/08d9/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('6297228f-ae34-4ddb-91dc-97f965db325a', 0, '2022-09-05 00:41:10.35', '2022-09-05 00:41:10.35', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/6381/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('5a6ad388-0d23-4ecc-bf3c-3af0a65da1db', 0, '2022-09-05 02:49:36.445', '2022-09-05 02:49:36.445', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/80ca/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('52fdd679-cff8-40f8-8c25-63b45a56978d', 0, '2022-09-05 06:00:47.592', '2022-09-05 06:00:47.592', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/edb2/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('5e46c7c0-9120-409a-aa5d-297e11fa0c38', 0, '2022-09-05 06:31:02.573', '2022-09-05 06:31:02.573', 4603.00, 'COMPANY_FAVICON', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/8c37/favicon.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('bc462b67-7d54-4f69-a617-720039441ccf', 0, '2022-09-05 07:45:23.918', '2022-09-05 07:45:23.918', 36794.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/jpeg', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/ef96/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('efa45616-863e-44d5-923d-7fe0e805f504', 0, '2022-09-05 07:45:33.713', '2022-09-05 07:45:33.713', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/ff0c/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('b5670a05-8d4c-4f38-8c71-6a1ace2ab628', 0, '2022-09-05 11:44:40.301', '2022-09-05 11:44:40.301', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/b18b/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('08bb7794-0105-43c7-9f69-7a7578e034f0', 0, '2022-09-05 12:29:49.39', '2022-09-05 12:29:49.39', 36794.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/jpeg', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/dfa4/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('77cd65b1-6bd7-4000-9ac7-ef044215fb3e', 0, '2022-09-05 12:54:30.546', '2022-09-05 12:54:30.546', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/1e21/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('331cd5e1-6ca8-4cdf-bb5f-32145e15a7d6', 0, '2022-09-05 12:55:27.427', '2022-09-05 12:55:27.427', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/bf80/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('5dca5a81-4d2d-4bd9-90d6-956df8c1cdda', 0, '2022-09-05 12:56:56.399', '2022-09-05 12:56:56.399', 13469.00, 'COMPANY_NAV_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/b23d/nav_logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('86d54d11-0c96-41bb-80ae-415b9a4e15ee', 0, '2022-09-05 12:57:46.984', '2022-09-05 12:57:46.984', 13469.00, 'COMPANY_NAV_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/a9e7/nav_logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('99fc1c50-4f81-4f9a-910a-5271990c2cfd', 0, '2022-09-05 13:18:35.877', '2022-09-05 13:18:35.877', 19376.00, 'COMPANY_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/4540/logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('8013a1df-2e45-442e-b628-6208c990dae5', 0, '2022-09-05 13:18:55.456', '2022-09-05 13:18:55.456', 13469.00, 'COMPANY_NAV_LOGO', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/240c/nav_logo.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('dfa4d329-eff5-432b-b7f8-5ed2b0064722', 0, '2022-09-05 13:19:27.114', '2022-09-05 13:19:27.114', 13469.00, 'COMPANY_ICON', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/1bf4/icon.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('cb45a6f8-a764-433e-a74e-b939af2ca821', 0, '2022-09-05 13:19:33.388', '2022-09-05 13:19:33.388', 4603.00, 'COMPANY_FAVICON', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/9d8f/favicon.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('73ff24cf-ef84-430e-bd7b-354cc90c247f', 0, '2022-10-04 12:48:40.827', '2022-10-04 12:48:40.827', 114926.00, 'RESUME', 'PRODUCTION', 'READY', 'application/pdf', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/resume/4c4a/Resume_Evelina Shimonite .pdf', '77c97464-8677-4d92-9bee-3d4293cc4b14');
INSERT INTO public.s3resource (id, version, date_created, last_updated, size, type, bucket, status, content_type, key, tenant_id) VALUES ('723040b5-e91c-406e-80c2-f2f35ef22d89', 0, '2022-10-05 08:49:51.273', '2022-10-05 08:49:51.273', 619270.00, 'COMPANY_BANNER', 'PRODUCTION', 'READY', 'image/png', 'tenant/77c97464-8677-4d92-9bee-3d4293cc4b14/company/Welinktalent/f7a5/hero_banner.png', '77c97464-8677-4d92-9bee-3d4293cc4b14');


--
-- TOC entry 4274 (class 0 OID 22460)
-- Dependencies: 244
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4275 (class 0 OID 22468)
-- Dependencies: 245
-- Data for Name: skill; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4276 (class 0 OID 22476)
-- Dependencies: 246
-- Data for Name: super_user_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.super_user_profile (id) VALUES ('97403a15-2217-4295-aaed-0c683df60ed6');


--
-- TOC entry 4277 (class 0 OID 22481)
-- Dependencies: 247
-- Data for Name: tenant; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tenant (id, version, date_created, company_id, subdomain, email_template_signature_id, last_updated) VALUES ('77c97464-8677-4d92-9bee-3d4293cc4b14', 4, '2021-05-21 15:07:37.635', 'a6429e11-4d4f-483f-ae0f-2bedfcccb444', 'apply.welinktalent.com', '533d08e9-7edd-43ef-9913-0f235befd86b', '2022-10-05 08:32:34.857');


--
-- TOC entry 4278 (class 0 OID 22489)
-- Dependencies: 248
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_role (user_id, role_id) VALUES ('24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', '35f031e2-a442-46d0-b969-a50c32a9bbf6');
INSERT INTO public.user_role (user_id, role_id) VALUES ('24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 'c927153d-9026-4dec-821d-71622978a131');
INSERT INTO public.user_role (user_id, role_id) VALUES ('24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', '2fcbe52f-14c2-489e-9c47-8b72addecb56');
INSERT INTO public.user_role (user_id, role_id) VALUES ('7ca0d32d-ea03-42c1-8c18-9aacf853c629', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');
INSERT INTO public.user_role (user_id, role_id) VALUES ('2fead6f9-93ba-488d-9e7e-f04ad4f145d2', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('448dbcfe-6680-43c8-939d-aa09ed9ab387', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('bd560101-d0c6-48c3-89f4-90a8d5560474', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('25d48f09-7943-469b-96ac-d836ca819e54', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('9310cf45-ee01-4410-8c73-f979ea1c2f66', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');
INSERT INTO public.user_role (user_id, role_id) VALUES ('77b86a04-1eb7-486a-9db9-d39be85e0043', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('3fd37d90-08e2-49c2-abc6-0367b2fe30bc', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');
INSERT INTO public.user_role (user_id, role_id) VALUES ('2c826caf-5f86-4478-80bf-ad7486191130', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');
INSERT INTO public.user_role (user_id, role_id) VALUES ('0c7cc8aa-44e3-4d38-b8bb-4a5506ea2c39', '48e92031-57d7-4c2a-ae00-7e091d06aa0d');
INSERT INTO public.user_role (user_id, role_id) VALUES ('1377c7df-3ec7-4363-99b5-1e07efb84810', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');
INSERT INTO public.user_role (user_id, role_id) VALUES ('268f408a-f528-4432-b40c-d869dcbf6bd2', 'b9a0f2b8-f4bd-450e-8318-304920f3781e');


--
-- TOC entry 4279 (class 0 OID 22497)
-- Dependencies: 249
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('24d64b7c-0d0d-4631-9f7a-fb4226bd80bb', 0, '2021-05-21 15:07:37.89', false, '2021-05-21 15:07:37.89', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'emmanuel.white@gmail.com', 'emmanuel.white@gmail.com', false, '{bcrypt}$2a$10$bw/t6KarG/wKVf57xdiZJOpEDhqpZ.qw5X9uvT/MlgKBN2Vapgydy', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('2fead6f9-93ba-488d-9e7e-f04ad4f145d2', 0, '2021-05-21 15:07:38.346', false, '2021-05-21 15:07:38.346', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'testdummy574@yopmail.com', 'testdummy', false, '{bcrypt}$2a$10$hCr2e8D3dwAJ3JH9DPIEdOUtGJrrmtk8ct./ZpCsrLe4CK2lQMfuu', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('448dbcfe-6680-43c8-939d-aa09ed9ab387', 0, '2021-07-02 03:31:24.589', false, '2021-07-02 03:31:24.589', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'redwolfgang20@gmail.com', 'redwolfgang20@gmail.com', false, '{bcrypt}$2a$10$M8NwlvLiTML4HstoWwNUn.3OIBrvqms0FPYipi7V29ZPDd4J6NlM2', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('bd560101-d0c6-48c3-89f4-90a8d5560474', 0, '2021-07-02 06:22:29.369', false, '2021-07-02 06:22:29.369', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'fernandezjaymar@gmail.com', 'fernandezjaymar@gmail.com', false, '{bcrypt}$2a$10$NmciKc53vIUU9NqKUjy/n.KKQUQa2VNrbCF6x8kuzizyCi20LkXJe', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('25d48f09-7943-469b-96ac-d836ca819e54', 0, '2022-03-18 09:46:17.495', false, '2022-03-18 09:46:17.495', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'klkathleen@hotmail.com', 'klkathleen@hotmail.com', false, '{bcrypt}$2a$10$6jSP5lyraIbFe7XpIKpwr.dOsyHo.dJ5hHzDGz2jPF4f.WUlyWonq', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('7ca0d32d-ea03-42c1-8c18-9aacf853c629', 2, '2021-05-21 15:07:38.157', false, '2022-04-17 14:05:39.846', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'ew@welinktalent.com', 'ew@welinktalent.com', false, '{bcrypt}$2a$10$Im1w5DqN/zdWfkUinQoiZec4PJuu6T9xk4O2Wd4sZ3MaMtOJRRox.', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('77b86a04-1eb7-486a-9db9-d39be85e0043', 0, '2022-04-17 14:47:31.767', false, '2022-04-17 14:47:31.767', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'ctc.maddy17@gmail.com', 'ctc.maddy17@gmail.com', false, '{bcrypt}$2a$10$MwzuE9INt7D5KBUJamkwp.14exkLglg2C2bvfPKbAOK8lkibyFU0C', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('9310cf45-ee01-4410-8c73-f979ea1c2f66', 3, '2022-04-17 14:08:39.468', false, '2022-04-22 15:45:02.714', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'jkrfsjx347@couldmail.com', 'gigi27', true, '{bcrypt}$2a$10$iX23DQqERB4rB7tWtCtKMeCiac2tvjoJtbhhPWu6c6AjVUe25aSV2', false);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('3fd37d90-08e2-49c2-abc6-0367b2fe30bc', 2, '2022-04-22 15:54:08.882', false, '2022-05-09 11:32:57.294', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'madeline17@yopmail.com', 'maddy17', false, '{bcrypt}$2a$10$4803zyQIMYsWRqx8AT1xn.XA1lQCthZtnUTBYIx8VdVO81jJ2UDr2', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('2c826caf-5f86-4478-80bf-ad7486191130', 0, '2022-05-09 11:44:28.727', false, '2022-05-09 11:44:28.727', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'mary18@yopmail.com', 'mary18', false, '{bcrypt}$2a$10$crsFszQtvRloj2HX4bbghO0mRD0/pvatvaVITXjMARvKgwbLDxKaK', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('0c7cc8aa-44e3-4d38-b8bb-4a5506ea2c39', 0, '2022-10-04 11:50:50.742', false, '2022-10-04 11:50:50.742', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'evelina.shimonite@gmail.com', 'evelina.shimonite@gmail.com', false, '{bcrypt}$2a$10$4ol8pd9po8Cgj53oqS255OJjZJfCR13bSpzvk5asZ.ydUdYbmEgXC', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('1377c7df-3ec7-4363-99b5-1e07efb84810', 0, '2022-10-19 10:35:59.039', false, '2022-10-19 10:35:59.039', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'samanthafam.sl@gmail.com', 'samanthafam.sl@gmail.com', false, '{bcrypt}$2a$10$ZyF4iEPlZp7GyFQYvP4gdeFomA2jHnEuEOrSMxD1wn686kugWwQRi', true);
INSERT INTO public.users (id, version, date_created, password_expired, last_updated, account_expired, tenant_id, email_address, username, account_locked, password, enabled) VALUES ('268f408a-f528-4432-b40c-d869dcbf6bd2', 0, '2022-11-14 04:14:09.393', false, '2022-11-14 04:14:09.393', false, '77c97464-8677-4d92-9bee-3d4293cc4b14', 'nw@welinktalent.com', 'nw@welinktalent.com', false, '{bcrypt}$2a$10$pwf7pA.D78JFsU2BB1nThujqxmq9YwgBnSc1CWSrGYP6fdFxepAI2', true);


--
-- TOC entry 4280 (class 0 OID 22505)
-- Dependencies: 250
-- Data for Name: worker; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4281 (class 0 OID 22513)
-- Dependencies: 251
-- Data for Name: worker_license; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4282 (class 0 OID 22521)
-- Dependencies: 252
-- Data for Name: worker_profile; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4283 (class 0 OID 22526)
-- Dependencies: 253
-- Data for Name: worker_profile_worker_license; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3951 (class 2606 OID 22166)
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- TOC entry 3953 (class 2606 OID 22174)
-- Name: address address_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- TOC entry 3955 (class 2606 OID 22182)
-- Name: applicant_profile applicant_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile
    ADD CONSTRAINT applicant_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3957 (class 2606 OID 22208)
-- Name: application application_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT application_pkey PRIMARY KEY (id);


--
-- TOC entry 3959 (class 2606 OID 22240)
-- Name: auth_token auth_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_token
    ADD CONSTRAINT auth_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3961 (class 2606 OID 22248)
-- Name: company company_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT company_pkey PRIMARY KEY (id);


--
-- TOC entry 3965 (class 2606 OID 22274)
-- Name: competencies competencies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.competencies
    ADD CONSTRAINT competencies_pkey PRIMARY KEY (id);


--
-- TOC entry 3967 (class 2606 OID 22282)
-- Name: core_quality core_quality_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_quality
    ADD CONSTRAINT core_quality_pkey PRIMARY KEY (id);


--
-- TOC entry 3969 (class 2606 OID 22290)
-- Name: education education_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);


--
-- TOC entry 3971 (class 2606 OID 22298)
-- Name: email_template_signature email_template_signature_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_template_signature
    ADD CONSTRAINT email_template_signature_pkey PRIMARY KEY (id);


--
-- TOC entry 3973 (class 2606 OID 22306)
-- Name: employer employer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT employer_pkey PRIMARY KEY (id);


--
-- TOC entry 3975 (class 2606 OID 22311)
-- Name: employer_profile employer_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer_profile
    ADD CONSTRAINT employer_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3977 (class 2606 OID 22319)
-- Name: endorsement_email_token endorsement_email_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorsement_email_token
    ADD CONSTRAINT endorsement_email_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3983 (class 2606 OID 22335)
-- Name: endorser_feedback endorser_feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback
    ADD CONSTRAINT endorser_feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 3981 (class 2606 OID 22327)
-- Name: endorser endorser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser
    ADD CONSTRAINT endorser_pkey PRIMARY KEY (id);


--
-- TOC entry 3985 (class 2606 OID 22361)
-- Name: experience experience_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.experience
    ADD CONSTRAINT experience_pkey PRIMARY KEY (id);


--
-- TOC entry 3987 (class 2606 OID 22369)
-- Name: fcmtoken fcmtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fcmtoken
    ADD CONSTRAINT fcmtoken_pkey PRIMARY KEY (id);


--
-- TOC entry 4033 (class 2606 OID 22859)
-- Name: flyway_schema_history flyway_schema_history_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.flyway_schema_history
    ADD CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank);


--
-- TOC entry 4036 (class 2606 OID 23076)
-- Name: hiring_manager_invitation_token hiring_manager_invitation_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_manager_invitation_token
    ADD CONSTRAINT hiring_manager_invitation_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3989 (class 2606 OID 22377)
-- Name: hiring_manager_profile hiring_manager_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_manager_profile
    ADD CONSTRAINT hiring_manager_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3991 (class 2606 OID 22385)
-- Name: job job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- TOC entry 4040 (class 2606 OID 23106)
-- Name: password_reset_token password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (id);


--
-- TOC entry 3993 (class 2606 OID 22411)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id);


--
-- TOC entry 3995 (class 2606 OID 22419)
-- Name: qualification_question qualification_question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qualification_question
    ADD CONSTRAINT qualification_question_pkey PRIMARY KEY (id);


--
-- TOC entry 3997 (class 2606 OID 22427)
-- Name: readable_notification readable_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readable_notification
    ADD CONSTRAINT readable_notification_pkey PRIMARY KEY (id);


--
-- TOC entry 3999 (class 2606 OID 22435)
-- Name: registration_token registration_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_token
    ADD CONSTRAINT registration_token_pkey PRIMARY KEY (id);


--
-- TOC entry 4001 (class 2606 OID 22443)
-- Name: required_language required_language_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_language
    ADD CONSTRAINT required_language_pkey PRIMARY KEY (id);


--
-- TOC entry 4003 (class 2606 OID 22451)
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- TOC entry 4007 (class 2606 OID 22459)
-- Name: s3resource s3resource_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s3resource
    ADD CONSTRAINT s3resource_pkey PRIMARY KEY (id);


--
-- TOC entry 4009 (class 2606 OID 22467)
-- Name: schedule schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- TOC entry 4011 (class 2606 OID 22475)
-- Name: skill skill_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skill
    ADD CONSTRAINT skill_pkey PRIMARY KEY (id);


--
-- TOC entry 4013 (class 2606 OID 22480)
-- Name: super_user_profile super_user_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.super_user_profile
    ADD CONSTRAINT super_user_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 4015 (class 2606 OID 22488)
-- Name: tenant tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT tenant_pkey PRIMARY KEY (id);


--
-- TOC entry 4021 (class 2606 OID 22541)
-- Name: users uk_1ar956vx8jufbghpyi09yr16l; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_1ar956vx8jufbghpyi09yr16l UNIQUE (email_address);


--
-- TOC entry 4042 (class 2606 OID 23108)
-- Name: password_reset_token uk_g0guo4k8krgpwuagos61oc06j; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT uk_g0guo4k8krgpwuagos61oc06j UNIQUE (token);


--
-- TOC entry 4005 (class 2606 OID 22537)
-- Name: role uk_irsamgnera6angm0prq1kemt2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT uk_irsamgnera6angm0prq1kemt2 UNIQUE (authority);


--
-- TOC entry 4038 (class 2606 OID 23078)
-- Name: hiring_manager_invitation_token uk_m9usc67ic93g8ieypdkun1p4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_manager_invitation_token
    ADD CONSTRAINT uk_m9usc67ic93g8ieypdkun1p4 UNIQUE (token);


--
-- TOC entry 3963 (class 2606 OID 22533)
-- Name: company uk_niu8sfil2gxywcru9ah3r4ec5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT uk_niu8sfil2gxywcru9ah3r4ec5 UNIQUE (name);


--
-- TOC entry 4017 (class 2606 OID 22539)
-- Name: tenant uk_qo6yudrhpcwyxw2kthhqwu3nl; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT uk_qo6yudrhpcwyxw2kthhqwu3nl UNIQUE (subdomain);


--
-- TOC entry 4023 (class 2606 OID 22543)
-- Name: users uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- TOC entry 3979 (class 2606 OID 22535)
-- Name: endorsement_email_token uk_t1ta1scvw6x3cn72i7lqur6it; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorsement_email_token
    ADD CONSTRAINT uk_t1ta1scvw6x3cn72i7lqur6it UNIQUE (token);


--
-- TOC entry 4019 (class 2606 OID 22496)
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (id);


--
-- TOC entry 4025 (class 2606 OID 22504)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4029 (class 2606 OID 22520)
-- Name: worker_license worker_license_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_license
    ADD CONSTRAINT worker_license_pkey PRIMARY KEY (id);


--
-- TOC entry 4027 (class 2606 OID 22512)
-- Name: worker worker_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT worker_pkey PRIMARY KEY (id);


--
-- TOC entry 4031 (class 2606 OID 22525)
-- Name: worker_profile worker_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_profile
    ADD CONSTRAINT worker_profile_pkey PRIMARY KEY (id);


--
-- TOC entry 4034 (class 1259 OID 22860)
-- Name: flyway_schema_history_s_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX flyway_schema_history_s_idx ON public.flyway_schema_history USING btree (success);


--
-- TOC entry 4101 (class 2606 OID 22834)
-- Name: worker fk2an2e5gh23sapr1whx2revqde; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker
    ADD CONSTRAINT fk2an2e5gh23sapr1whx2revqde FOREIGN KEY (profile_id) REFERENCES public.worker_profile(id);


--
-- TOC entry 4090 (class 2606 OID 22779)
-- Name: profile fk2hsdsntwy25qr73fsvd7l3wu7; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fk2hsdsntwy25qr73fsvd7l3wu7 FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 4065 (class 2606 OID 22654)
-- Name: company fk2kih4dqkp0ib3ihxiqxjtuvd3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk2kih4dqkp0ib3ihxiqxjtuvd3 FOREIGN KEY (fav_icon_resource_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4045 (class 2606 OID 22554)
-- Name: applicant_profile_education fk2nd66la3ydonso67jk9in1trm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile_education
    ADD CONSTRAINT fk2nd66la3ydonso67jk9in1trm FOREIGN KEY (education_id) REFERENCES public.education(id);


--
-- TOC entry 4051 (class 2606 OID 22584)
-- Name: application fk2sniydeew18bkn0ijllokwcr3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk2sniydeew18bkn0ijllokwcr3 FOREIGN KEY (applicant_id) REFERENCES public.profile(id);


--
-- TOC entry 4052 (class 2606 OID 22589)
-- Name: application fk35l67lny3n2tpdrc9hwx9khit; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fk35l67lny3n2tpdrc9hwx9khit FOREIGN KEY (competencies_id) REFERENCES public.competencies(id);


--
-- TOC entry 4049 (class 2606 OID 22574)
-- Name: applicant_profile_skills fk3eq80jbjyvk621ke9w01l40rc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile_skills
    ADD CONSTRAINT fk3eq80jbjyvk621ke9w01l40rc FOREIGN KEY (applicant_profile_id) REFERENCES public.applicant_profile(id);


--
-- TOC entry 4071 (class 2606 OID 22684)
-- Name: employer fk3luwbqakuiaakdwdg16hknopx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT fk3luwbqakuiaakdwdg16hknopx FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 4102 (class 2606 OID 22839)
-- Name: worker_profile_worker_license fk45g4u70i524dhnglsrugrnpgi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_profile_worker_license
    ADD CONSTRAINT fk45g4u70i524dhnglsrugrnpgi FOREIGN KEY (worker_license_id) REFERENCES public.worker_license(id);


--
-- TOC entry 4076 (class 2606 OID 22709)
-- Name: endorser_feedback_core_quality fk4tetkpdjr91n8taa18uhvnmg1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_core_quality
    ADD CONSTRAINT fk4tetkpdjr91n8taa18uhvnmg1 FOREIGN KEY (core_quality_id) REFERENCES public.core_quality(id);


--
-- TOC entry 4085 (class 2606 OID 22754)
-- Name: job_qualification_question fk54r2irrta8l7lcxu5geqhocll; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_qualification_question
    ADD CONSTRAINT fk54r2irrta8l7lcxu5geqhocll FOREIGN KEY (qualification_question_id) REFERENCES public.qualification_question(id);


--
-- TOC entry 4088 (class 2606 OID 22769)
-- Name: job_required_language fk5bimhdsryhnuuahgwh9p5t2tf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_required_language
    ADD CONSTRAINT fk5bimhdsryhnuuahgwh9p5t2tf FOREIGN KEY (job_required_languages_id) REFERENCES public.job(id);


--
-- TOC entry 4079 (class 2606 OID 22724)
-- Name: endorser_feedback_qualification_question fk5mm0hvx774171socc4nidaon0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_qualification_question
    ADD CONSTRAINT fk5mm0hvx774171socc4nidaon0 FOREIGN KEY (endorser_feedback_qualification_answers_id) REFERENCES public.endorser_feedback(id);


--
-- TOC entry 4060 (class 2606 OID 22629)
-- Name: company fk5vabuxsjhmncqvcyycdoincug; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk5vabuxsjhmncqvcyycdoincug FOREIGN KEY (nav_logo_resource_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4056 (class 2606 OID 22609)
-- Name: application_qualification_question fk7m3nvbxqy1cpu8swaxtrfgx07; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_qualification_question
    ADD CONSTRAINT fk7m3nvbxqy1cpu8swaxtrfgx07 FOREIGN KEY (qualification_question_id) REFERENCES public.qualification_question(id);


--
-- TOC entry 4048 (class 2606 OID 22569)
-- Name: applicant_profile_experience fk7n9qixfnqrdns5qxq0be5c19n; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile_experience
    ADD CONSTRAINT fk7n9qixfnqrdns5qxq0be5c19n FOREIGN KEY (applicant_profile_experiences_id) REFERENCES public.applicant_profile(id);


--
-- TOC entry 4087 (class 2606 OID 22764)
-- Name: job_required_language fk7w2451ln0603p4o1fuw3warbw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_required_language
    ADD CONSTRAINT fk7w2451ln0603p4o1fuw3warbw FOREIGN KEY (required_language_id) REFERENCES public.required_language(id);


--
-- TOC entry 4105 (class 2606 OID 23109)
-- Name: password_reset_token fk83nsrttkwkb6ym0anu051mtxn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_token
    ADD CONSTRAINT fk83nsrttkwkb6ym0anu051mtxn FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4067 (class 2606 OID 22664)
-- Name: company_div_or_departments fk8sw0r24fmkff5d0ew2h1xk8x1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_div_or_departments
    ADD CONSTRAINT fk8sw0r24fmkff5d0ew2h1xk8x1 FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 4094 (class 2606 OID 22799)
-- Name: s3resource fk9cchxgf3eb3cu9j4w07cgf4dm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.s3resource
    ADD CONSTRAINT fk9cchxgf3eb3cu9j4w07cgf4dm FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- TOC entry 4099 (class 2606 OID 22824)
-- Name: user_role fka68196081fvovjhkek5m97n3y; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fka68196081fvovjhkek5m97n3y FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- TOC entry 4062 (class 2606 OID 22639)
-- Name: company fkatea5a29qvjd36p7mea6xv6y8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fkatea5a29qvjd36p7mea6xv6y8 FOREIGN KEY (logo_resource_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4070 (class 2606 OID 22679)
-- Name: employer fkb9lv9o6uq1m9yp3ir7pws3799; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employer
    ADD CONSTRAINT fkb9lv9o6uq1m9yp3ir7pws3799 FOREIGN KEY (profile_id) REFERENCES public.employer_profile(id);


--
-- TOC entry 4095 (class 2606 OID 22804)
-- Name: schedule fkbblq3odl9u1ckx7tajwri939u; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schedule
    ADD CONSTRAINT fkbblq3odl9u1ckx7tajwri939u FOREIGN KEY (worker_id) REFERENCES public.worker(id);


--
-- TOC entry 4075 (class 2606 OID 22704)
-- Name: endorser_feedback fkbtgcfgcf81ryqltxwysmxj2lt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback
    ADD CONSTRAINT fkbtgcfgcf81ryqltxwysmxj2lt FOREIGN KEY (endorser_id) REFERENCES public.endorser(id);


--
-- TOC entry 4068 (class 2606 OID 22669)
-- Name: company_industries fkcklcc292wbat3nnn25yb2f1vb; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_industries
    ADD CONSTRAINT fkcklcc292wbat3nnn25yb2f1vb FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 4082 (class 2606 OID 22739)
-- Name: fcmtoken fkd9k3vly5wq8nbk0q3jtf6jlow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fcmtoken
    ADD CONSTRAINT fkd9k3vly5wq8nbk0q3jtf6jlow FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4089 (class 2606 OID 22774)
-- Name: job_tags fkdcfwlgp4estlj6fu2btxlm9p6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_tags
    ADD CONSTRAINT fkdcfwlgp4estlj6fu2btxlm9p6 FOREIGN KEY (job_id) REFERENCES public.job(id);


--
-- TOC entry 4043 (class 2606 OID 22544)
-- Name: activity fkdlw7jbugyjqx8prk4p95okqtq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fkdlw7jbugyjqx8prk4p95okqtq FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4047 (class 2606 OID 22564)
-- Name: applicant_profile_experience fkdvc7fs9xf345mrjohuf3tu5hf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile_experience
    ADD CONSTRAINT fkdvc7fs9xf345mrjohuf3tu5hf FOREIGN KEY (experience_id) REFERENCES public.experience(id);


--
-- TOC entry 4057 (class 2606 OID 22614)
-- Name: application_qualification_question fkf3wpjnv26utgsa5raxae0ca4c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_qualification_question
    ADD CONSTRAINT fkf3wpjnv26utgsa5raxae0ca4c FOREIGN KEY (application_qualification_answers_id) REFERENCES public.application(id);


--
-- TOC entry 4072 (class 2606 OID 22689)
-- Name: endorsement_email_token fkfg4r1pq731e7mfpmsioifn51k; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorsement_email_token
    ADD CONSTRAINT fkfg4r1pq731e7mfpmsioifn51k FOREIGN KEY (endorser_id) REFERENCES public.endorser(id);


--
-- TOC entry 4073 (class 2606 OID 22694)
-- Name: endorser fkfg8x7rxe8rasg5bgjgdorgmcj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser
    ADD CONSTRAINT fkfg8x7rxe8rasg5bgjgdorgmcj FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- TOC entry 4080 (class 2606 OID 22729)
-- Name: endorser_feedback_required_language fkfgtg1n4qhr5d1yumiw8sqigrt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_required_language
    ADD CONSTRAINT fkfgtg1n4qhr5d1yumiw8sqigrt FOREIGN KEY (required_language_id) REFERENCES public.required_language(id);


--
-- TOC entry 4086 (class 2606 OID 22759)
-- Name: job_qualification_question fkfmp883vwa82owr51bgtdirise; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_qualification_question
    ADD CONSTRAINT fkfmp883vwa82owr51bgtdirise FOREIGN KEY (job_qualification_questions_id) REFERENCES public.job(id);


--
-- TOC entry 4064 (class 2606 OID 22649)
-- Name: company fkgfifm4874ce6mecwj54wdb3ma; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fkgfifm4874ce6mecwj54wdb3ma FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 4059 (class 2606 OID 22624)
-- Name: application_required_language fkhbmcwrlrodrxqf17u7madca5g; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_required_language
    ADD CONSTRAINT fkhbmcwrlrodrxqf17u7madca5g FOREIGN KEY (application_language_answers_id) REFERENCES public.application(id);


--
-- TOC entry 4058 (class 2606 OID 22619)
-- Name: application_required_language fkivkb29s24sq0cfihx34hr22ii; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_required_language
    ADD CONSTRAINT fkivkb29s24sq0cfihx34hr22ii FOREIGN KEY (required_language_id) REFERENCES public.required_language(id);


--
-- TOC entry 4066 (class 2606 OID 22659)
-- Name: company_brands fkj1k6fn60wt9rx0avrfxcmadb4; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company_brands
    ADD CONSTRAINT fkj1k6fn60wt9rx0avrfxcmadb4 FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 4098 (class 2606 OID 22819)
-- Name: user_role fkj345gk1bovqvfame88rcx7yyx; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT fkj345gk1bovqvfame88rcx7yyx FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4083 (class 2606 OID 22744)
-- Name: job fkjbp27yyey9632uafg0v2801pf; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT fkjbp27yyey9632uafg0v2801pf FOREIGN KEY (hiring_manager_id) REFERENCES public.profile(id);


--
-- TOC entry 4054 (class 2606 OID 22599)
-- Name: application_core_qualities fkjq84ooq3xq1ypvupx8nnk1p5m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_core_qualities
    ADD CONSTRAINT fkjq84ooq3xq1ypvupx8nnk1p5m FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- TOC entry 4100 (class 2606 OID 22829)
-- Name: users fkl68ecas1t5bsdsdkq9m1yy4eo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fkl68ecas1t5bsdsdkq9m1yy4eo FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- TOC entry 4050 (class 2606 OID 22579)
-- Name: application fkls6sryk64ga8o5t4bym8qu3vm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fkls6sryk64ga8o5t4bym8qu3vm FOREIGN KEY (job_id) REFERENCES public.job(id);


--
-- TOC entry 4104 (class 2606 OID 23079)
-- Name: hiring_manager_invitation_token fklu9tv2txpkk3tikdrvrtmfmpc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hiring_manager_invitation_token
    ADD CONSTRAINT fklu9tv2txpkk3tikdrvrtmfmpc FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- TOC entry 4074 (class 2606 OID 22699)
-- Name: endorser_feedback fkm3iix7vfkc8rfoc1fep1tiof6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback
    ADD CONSTRAINT fkm3iix7vfkc8rfoc1fep1tiof6 FOREIGN KEY (competencies_answers_id) REFERENCES public.competencies(id);


--
-- TOC entry 4092 (class 2606 OID 22789)
-- Name: readable_notification fkm3v6t3h6j69qx738u7rpjiv8x; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.readable_notification
    ADD CONSTRAINT fkm3v6t3h6j69qx738u7rpjiv8x FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4084 (class 2606 OID 22749)
-- Name: job fkm7qamwx91t03sgq0p93gm8kri; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job
    ADD CONSTRAINT fkm7qamwx91t03sgq0p93gm8kri FOREIGN KEY (address_id) REFERENCES public.address(id);


--
-- TOC entry 4061 (class 2606 OID 22634)
-- Name: company fkmsi4q9bops7jritomcsaaq0j3; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fkmsi4q9bops7jritomcsaaq0j3 FOREIGN KEY (icon_resource_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4096 (class 2606 OID 22809)
-- Name: tenant fkmwx7bp8feu635fqsbe8u822sp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT fkmwx7bp8feu635fqsbe8u822sp FOREIGN KEY (company_id) REFERENCES public.company(id);


--
-- TOC entry 4077 (class 2606 OID 22714)
-- Name: endorser_feedback_core_quality fkn1u25fuk2mrkq82tv67288sij; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_core_quality
    ADD CONSTRAINT fkn1u25fuk2mrkq82tv67288sij FOREIGN KEY (endorser_feedback_core_quality_answers_id) REFERENCES public.endorser_feedback(id);


--
-- TOC entry 4044 (class 2606 OID 22549)
-- Name: activity fkn5bcm412ces2rsy8ykc5gf2ty; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fkn5bcm412ces2rsy8ykc5gf2ty FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- TOC entry 4063 (class 2606 OID 22644)
-- Name: company fknnnojga31gor69v1l5ohtl1li; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fknnnojga31gor69v1l5ohtl1li FOREIGN KEY (hero_banner_resource_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4097 (class 2606 OID 22814)
-- Name: tenant fkoktka3y1gxhhpxear9tislf2m; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tenant
    ADD CONSTRAINT fkoktka3y1gxhhpxear9tislf2m FOREIGN KEY (email_template_signature_id) REFERENCES public.email_template_signature(id);


--
-- TOC entry 4055 (class 2606 OID 22604)
-- Name: application_important_next_role fkowc7orj05bnd2o8hbbikm7h2s; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application_important_next_role
    ADD CONSTRAINT fkowc7orj05bnd2o8hbbikm7h2s FOREIGN KEY (application_id) REFERENCES public.application(id);


--
-- TOC entry 4103 (class 2606 OID 22844)
-- Name: worker_profile_worker_license fkp95ky8l4144vfm0ntusblal4q; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.worker_profile_worker_license
    ADD CONSTRAINT fkp95ky8l4144vfm0ntusblal4q FOREIGN KEY (worker_profile_licenses_id) REFERENCES public.worker_profile(id);


--
-- TOC entry 4093 (class 2606 OID 22794)
-- Name: registration_token fkpmf52fk27bywm8is5s2jv3xam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registration_token
    ADD CONSTRAINT fkpmf52fk27bywm8is5s2jv3xam FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4081 (class 2606 OID 22734)
-- Name: endorser_feedback_required_language fkpv2tvn9blr8h71ofb63k1sbkq; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_required_language
    ADD CONSTRAINT fkpv2tvn9blr8h71ofb63k1sbkq FOREIGN KEY (endorser_feedback_language_answers_id) REFERENCES public.endorser_feedback(id);


--
-- TOC entry 4078 (class 2606 OID 22719)
-- Name: endorser_feedback_qualification_question fkqvwq7eoaar9oxxwbxdqxit107; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.endorser_feedback_qualification_question
    ADD CONSTRAINT fkqvwq7eoaar9oxxwbxdqxit107 FOREIGN KEY (qualification_question_id) REFERENCES public.qualification_question(id);


--
-- TOC entry 4069 (class 2606 OID 22674)
-- Name: email_template_signature fkrkq9x6qmpf49fyp6axtfi7ksn; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.email_template_signature
    ADD CONSTRAINT fkrkq9x6qmpf49fyp6axtfi7ksn FOREIGN KEY (tenant_id) REFERENCES public.tenant(id);


--
-- TOC entry 4091 (class 2606 OID 22784)
-- Name: profile fks14jvsf9tqrcnly0afsv0ngwv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT fks14jvsf9tqrcnly0afsv0ngwv FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- TOC entry 4046 (class 2606 OID 22559)
-- Name: applicant_profile_education fks9fo1mqk8ttf2cb7a2macp1sk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.applicant_profile_education
    ADD CONSTRAINT fks9fo1mqk8ttf2cb7a2macp1sk FOREIGN KEY (applicant_profile_educations_id) REFERENCES public.applicant_profile(id);


--
-- TOC entry 4053 (class 2606 OID 22594)
-- Name: application fkyce1w2jaqo9qy7ich0foli06; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.application
    ADD CONSTRAINT fkyce1w2jaqo9qy7ich0foli06 FOREIGN KEY (resume_id) REFERENCES public.s3resource(id);


--
-- TOC entry 4293 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2023-03-27 14:43:42 PST

--
-- PostgreSQL database dump complete
--

