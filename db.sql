PGDMP         8                x           sql-challenge    12.3    12.3     '           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            (           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            )           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            *           1262    17223    sql-challenge    DATABASE     �   CREATE DATABASE "sql-challenge" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Mexico.1252' LC_CTYPE = 'Spanish_Mexico.1252';
    DROP DATABASE "sql-challenge";
                postgres    false            +           0    0    DATABASE "sql-challenge"    COMMENT     :   COMMENT ON DATABASE "sql-challenge" IS 'Homework week 9';
                   postgres    false    2858                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false            ,           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    3            �            1259    17310    departments    TABLE     d   CREATE TABLE public.departments (
    dept_no character varying,
    dept_name character varying
);
    DROP TABLE public.departments;
       public         heap    postgres    false    3            �            1259    17304    dept_emp    TABLE     T   CREATE TABLE public.dept_emp (
    emp_no integer,
    dept_no character varying
);
    DROP TABLE public.dept_emp;
       public         heap    postgres    false    3            �            1259    17274    dept_manager    TABLE     X   CREATE TABLE public.dept_manager (
    dept_no character varying,
    emp_no integer
);
     DROP TABLE public.dept_manager;
       public         heap    postgres    false    3            �            1259    17359 	   employees    TABLE       CREATE TABLE public.employees (
    emp_no integer NOT NULL,
    emp_title character varying,
    birth_date character varying,
    first_name character varying,
    last_name character varying,
    sex character varying,
    hire_date character varying
);
    DROP TABLE public.employees;
       public         heap    postgres    false    3            �            1259    17339    salaries    TABLE     I   CREATE TABLE public.salaries (
    emp_no integer,
    salary integer
);
    DROP TABLE public.salaries;
       public         heap    postgres    false    3            �            1259    17367    first_hw    VIEW     �   CREATE VIEW public.first_hw AS
 SELECT employees.emp_no,
    employees.last_name,
    employees.first_name,
    employees.sex,
    salaries.salary
   FROM (public.salaries
     JOIN public.employees ON ((salaries.emp_no = employees.emp_no)));
    DROP VIEW public.first_hw;
       public          postgres    false    206    206    207    207    207    207    3            �            1259    17371    sales    VIEW       CREATE VIEW public.sales AS
 SELECT a.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
   FROM ((public.employees e
     JOIN public.dept_emp a ON ((a.emp_no = e.emp_no)))
     JOIN public.departments d ON (((a.dept_no)::text = (d.dept_no)::text)));
    DROP VIEW public.sales;
       public          postgres    false    204    204    205    205    207    207    207    3            �            1259    17375 	   sales_dev    VIEW       CREATE VIEW public.sales_dev AS
 SELECT a.emp_no,
    e.last_name,
    e.first_name,
    d.dept_name
   FROM ((public.employees e
     JOIN public.dept_emp a ON ((a.emp_no = e.emp_no)))
     JOIN public.departments d ON (((a.dept_no)::text = (d.dept_no)::text)));
    DROP VIEW public.sales_dev;
       public          postgres    false    204    207    207    207    205    205    204    3            �            1259    17289    titles    TABLE     \   CREATE TABLE public.titles (
    title_id character varying,
    title character varying
);
    DROP TABLE public.titles;
       public         heap    postgres    false    3            �
           2606    17366    employees employees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_no);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    207           