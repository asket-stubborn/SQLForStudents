PGDMP     6    9                x         
   otdel_kadr    12.2    12.2 U    j           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            k           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            l           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            m           1262    237975 
   otdel_kadr    DATABASE     �   CREATE DATABASE otdel_kadr WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE otdel_kadr;
                postgres    false            �            1259    238105    взыскания    TABLE       CREATE TABLE public."взыскания" (
    "внутренний_номер" integer NOT NULL,
    "личный_номер_сотрудника" integer NOT NULL,
    "дата_взыскания" date NOT NULL,
    "вид_взыскания" character varying(300) NOT NULL
);
 (   DROP TABLE public."взыскания";
       public         heap    postgres    false            �            1259    238101 6   взыскания_внутренний_номер_seq    SEQUENCE     �   CREATE SEQUENCE public."взыскания_внутренний_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public."взыскания_внутренний_номер_seq";
       public          postgres    false    217            n           0    0 6   взыскания_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."взыскания_внутренний_номер_seq" OWNED BY public."взыскания"."внутренний_номер";
          public          postgres    false    215            �            1259    238103 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE     �   CREATE SEQUENCE public."взыскания_личный_номер_сотрудни_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."взыскания_личный_номер_сотрудни_seq";
       public          postgres    false    217            o           0    0 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."взыскания_личный_номер_сотрудни_seq" OWNED BY public."взыскания"."личный_номер_сотрудника";
          public          postgres    false    216            �            1259    238056    должности    TABLE       CREATE TABLE public."должности" (
    "внутренний_номер" integer NOT NULL,
    "код_должности" integer NOT NULL,
    "наименование_должности" character varying(200),
    "должностной_оклад" double precision
);
 (   DROP TABLE public."должности";
       public         heap    postgres    false            �            1259    238054 6   должности_внутренний_номер_seq    SEQUENCE     �   CREATE SEQUENCE public."должности_внутренний_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public."должности_внутренний_номер_seq";
       public          postgres    false    208            p           0    0 6   должности_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."должности_внутренний_номер_seq" OWNED BY public."должности"."внутренний_номер";
          public          postgres    false    207            �            1259    238039 *   доп_данные_сотрудников    TABLE     M  CREATE TABLE public."доп_данные_сотрудников" (
    "внутренний_номер" integer NOT NULL,
    "личный_номер_сотрудника" integer NOT NULL,
    "домашний_адрес" character varying(200) NOT NULL,
    "домашний_телефон" integer,
    "образование" character varying(200),
    "номер_диплома" integer,
    "код_специальности" integer,
    "название_специальности" character varying(200),
    "квалификация" character varying(200) NOT NULL
);
 @   DROP TABLE public."доп_данные_сотрудников";
       public         heap    postgres    false            �            1259    238035 >   допо_данные_сот_внутренний_номе_seq    SEQUENCE     �   CREATE SEQUENCE public."допо_данные_сот_внутренний_номе_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."допо_данные_сот_внутренний_номе_seq";
       public          postgres    false    206            q           0    0 >   допо_данные_сот_внутренний_номе_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."допо_данные_сот_внутренний_номе_seq" OWNED BY public."доп_данные_сотрудников"."внутренний_номер";
          public          postgres    false    204            �            1259    238037 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE     �   CREATE SEQUENCE public."допо_данные_сот_личный_номер_со_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public."допо_данные_сот_личный_номер_со_seq";
       public          postgres    false    206            r           0    0 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."допо_данные_сот_личный_номер_со_seq" OWNED BY public."доп_данные_сотрудников"."личный_номер_сотрудника";
          public          postgres    false    205            �            1259    237978 4   основные_данные_сотрудников    TABLE     :  CREATE TABLE public."основные_данные_сотрудников" (
    "личный_номер_сотрудника" integer NOT NULL,
    "ФИО_сотрудника" character varying(100) NOT NULL,
    "номер_паспорта" integer NOT NULL,
    "дата_рождения" date NOT NULL
);
 J   DROP TABLE public."основные_данные_сотрудников";
       public         heap    postgres    false            �            1259    237976 >   основные_данные_личный_номер_со_seq    SEQUENCE     �   CREATE SEQUENCE public."основные_данные_личный_номер_со_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."основные_данные_личный_номер_со_seq";
       public          postgres    false    203            s           0    0 >   основные_данные_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."основные_данные_личный_номер_со_seq" OWNED BY public."основные_данные_сотрудников"."личный_номер_сотрудника";
          public          postgres    false    202            �            1259    238068 +   повышение_квалификации    TABLE     �  CREATE TABLE public."повышение_квалификации" (
    "внутренний_номер" integer NOT NULL,
    "личный_номер_сотрудника" integer NOT NULL,
    "дата_повышения_прохождения_квалиф" date NOT NULL,
    "присвоена_квалификация" character varying,
    "свидетельство_о_повышении_квалифи" integer
);
 A   DROP TABLE public."повышение_квалификации";
       public         heap    postgres    false            �            1259    238064 ?   повышение_квали_внутренний_номе_seq    SEQUENCE     �   CREATE SEQUENCE public."повышение_квали_внутренний_номе_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."повышение_квали_внутренний_номе_seq";
       public          postgres    false    211            t           0    0 ?   повышение_квали_внутренний_номе_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."повышение_квали_внутренний_номе_seq" OWNED BY public."повышение_квалификации"."внутренний_номер";
          public          postgres    false    209            �            1259    238066 >   повышение_квали_личный_номер_со_seq    SEQUENCE     �   CREATE SEQUENCE public."повышение_квали_личный_номер_со_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."повышение_квали_личный_номер_со_seq";
       public          postgres    false    211            u           0    0 >   повышение_квали_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."повышение_квали_личный_номер_со_seq" OWNED BY public."повышение_квалификации"."личный_номер_сотрудника";
          public          postgres    false    210            �            1259    238087    поощрения    TABLE       CREATE TABLE public."поощрения" (
    "внутренний_номер" integer NOT NULL,
    "личный_номер_сотрудника" integer NOT NULL,
    "дата_поощрения" date NOT NULL,
    "вид_поощрения" character varying(400) NOT NULL
);
 (   DROP TABLE public."поощрения";
       public         heap    postgres    false            �            1259    238083 6   поощрения_внутренний_номер_seq    SEQUENCE     �   CREATE SEQUENCE public."поощрения_внутренний_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE public."поощрения_внутренний_номер_seq";
       public          postgres    false    214            v           0    0 6   поощрения_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."поощрения_внутренний_номер_seq" OWNED BY public."поощрения"."внутренний_номер";
          public          postgres    false    212            �            1259    238085 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE     �   CREATE SEQUENCE public."поощрения_личный_номер_сотрудни_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."поощрения_личный_номер_сотрудни_seq";
       public          postgres    false    214            w           0    0 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."поощрения_личный_номер_сотрудни_seq" OWNED BY public."поощрения"."личный_номер_сотрудника";
          public          postgres    false    213            �            1259    262708    работники    TABLE     �   CREATE TABLE public."работники" (
    "внутрений_номер" integer NOT NULL,
    "личный_номер_сотрудника" integer NOT NULL,
    "должность" integer NOT NULL
);
 (   DROP TABLE public."работники";
       public         heap    postgres    false            �            1259    262702 4   работники_внутрений_номер_seq    SEQUENCE     �   CREATE SEQUENCE public."работники_внутрений_номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public."работники_внутрений_номер_seq";
       public          postgres    false    221            x           0    0 4   работники_внутрений_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."работники_внутрений_номер_seq" OWNED BY public."работники"."внутрений_номер";
          public          postgres    false    218            �            1259    262706 )   работники_должность_seq    SEQUENCE     �   CREATE SEQUENCE public."работники_должность_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public."работники_должность_seq";
       public          postgres    false    221            y           0    0 )   работники_должность_seq    SEQUENCE OWNED BY     }   ALTER SEQUENCE public."работники_должность_seq" OWNED BY public."работники"."должность";
          public          postgres    false    220            �            1259    262704 ?   работники_личный_номер_сотрудни_seq    SEQUENCE     �   CREATE SEQUENCE public."работники_личный_номер_сотрудни_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."работники_личный_номер_сотрудни_seq";
       public          postgres    false    221            z           0    0 ?   работники_личный_номер_сотрудни_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."работники_личный_номер_сотрудни_seq" OWNED BY public."работники"."личный_номер_сотрудника";
          public          postgres    false    219            �
           2604    238108 2   взыскания внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."взыскания" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."взыскания_внутренний_номер_seq"'::regclass);
 e   ALTER TABLE public."взыскания" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    215    217    217            �
           2604    238109 ?   взыскания личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."взыскания" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."взыскания_личный_номер_сотрудни_seq"'::regclass);
 r   ALTER TABLE public."взыскания" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    217    216    217            �
           2604    238059 2   должности внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."должности" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."должности_внутренний_номер_seq"'::regclass);
 e   ALTER TABLE public."должности" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    207    208    208            �
           2604    238042 J   доп_данные_сотрудников внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."доп_данные_сотрудников" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."допо_данные_сот_внутренний_номе_seq"'::regclass);
 }   ALTER TABLE public."доп_данные_сотрудников" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    204    206    206            �
           2604    238043 W   доп_данные_сотрудников личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."доп_данные_сотрудников" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."допо_данные_сот_личный_номер_со_seq"'::regclass);
 �   ALTER TABLE public."доп_данные_сотрудников" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    205    206    206            �
           2604    237981 a   основные_данные_сотрудников личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."основные_данные_сотрудников" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."основные_данные_личный_номер_со_seq"'::regclass);
 �   ALTER TABLE public."основные_данные_сотрудников" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    238071 K   повышение_квалификации внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."повышение_квалификации" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."повышение_квали_внутренний_номе_seq"'::regclass);
 ~   ALTER TABLE public."повышение_квалификации" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    209    211    211            �
           2604    238072 X   повышение_квалификации личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."повышение_квалификации" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."повышение_квали_личный_номер_со_seq"'::regclass);
 �   ALTER TABLE public."повышение_квалификации" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    238090 2   поощрения внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."поощрения" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."поощрения_внутренний_номер_seq"'::regclass);
 e   ALTER TABLE public."поощрения" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    212    214    214            �
           2604    238091 ?   поощрения личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."поощрения" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."поощрения_личный_номер_сотрудни_seq"'::regclass);
 r   ALTER TABLE public."поощрения" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    213    214    214            �
           2604    262711 0   работники внутрений_номер    DEFAULT     �   ALTER TABLE ONLY public."работники" ALTER COLUMN "внутрений_номер" SET DEFAULT nextval('public."работники_внутрений_номер_seq"'::regclass);
 c   ALTER TABLE public."работники" ALTER COLUMN "внутрений_номер" DROP DEFAULT;
       public          postgres    false    218    221    221            �
           2604    262712 ?   работники личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."работники" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."работники_личный_номер_сотрудни_seq"'::regclass);
 r   ALTER TABLE public."работники" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    219    221    221            �
           2604    262713 %   работники должность    DEFAULT     �   ALTER TABLE ONLY public."работники" ALTER COLUMN "должность" SET DEFAULT nextval('public."работники_должность_seq"'::regclass);
 X   ALTER TABLE public."работники" ALTER COLUMN "должность" DROP DEFAULT;
       public          postgres    false    221    220    221            c          0    238105    взыскания 
   TABLE DATA                 public          postgres    false    217   `�       Z          0    238056    должности 
   TABLE DATA                 public          postgres    false    208   '�       X          0    238039 *   доп_данные_сотрудников 
   TABLE DATA                 public          postgres    false    206   )�       U          0    237978 4   основные_данные_сотрудников 
   TABLE DATA                 public          postgres    false    203   �       ]          0    238068 +   повышение_квалификации 
   TABLE DATA                 public          postgres    false    211   G�       `          0    238087    поощрения 
   TABLE DATA                 public          postgres    false    214   a�       g          0    262708    работники 
   TABLE DATA                 public          postgres    false    221   "�       {           0    0 6   взыскания_внутренний_номер_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public."взыскания_внутренний_номер_seq"', 1, true);
          public          postgres    false    215            |           0    0 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."взыскания_личный_номер_сотрудни_seq"', 1, false);
          public          postgres    false    216            }           0    0 6   должности_внутренний_номер_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public."должности_внутренний_номер_seq"', 4, true);
          public          postgres    false    207            ~           0    0 >   допо_данные_сот_внутренний_номе_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public."допо_данные_сот_внутренний_номе_seq"', 4, true);
          public          postgres    false    204                       0    0 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public."допо_данные_сот_личный_номер_со_seq"', 1, false);
          public          postgres    false    205            �           0    0 >   основные_данные_личный_номер_со_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public."основные_данные_личный_номер_со_seq"', 4, true);
          public          postgres    false    202            �           0    0 ?   повышение_квали_внутренний_номе_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."повышение_квали_внутренний_номе_seq"', 1, false);
          public          postgres    false    209            �           0    0 >   повышение_квали_личный_номер_со_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public."повышение_квали_личный_номер_со_seq"', 1, false);
          public          postgres    false    210            �           0    0 6   поощрения_внутренний_номер_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public."поощрения_внутренний_номер_seq"', 3, true);
          public          postgres    false    212            �           0    0 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."поощрения_личный_номер_сотрудни_seq"', 1, false);
          public          postgres    false    213            �           0    0 4   работники_внутрений_номер_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public."работники_внутрений_номер_seq"', 1, false);
          public          postgres    false    218            �           0    0 )   работники_должность_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public."работники_должность_seq"', 1, false);
          public          postgres    false    220            �           0    0 ?   работники_личный_номер_сотрудни_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."работники_личный_номер_сотрудни_seq"', 1, false);
          public          postgres    false    219            �
           2606    238063 "   должности cod_dolj_unique 
   CONSTRAINT     v   ALTER TABLE ONLY public."должности"
    ADD CONSTRAINT cod_dolj_unique UNIQUE ("код_должности");
 N   ALTER TABLE ONLY public."должности" DROP CONSTRAINT cod_dolj_unique;
       public            postgres    false    208            �
           2606    238045 <   доп_данные_сотрудников num_dop_sotr_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."доп_данные_сотрудников"
    ADD CONSTRAINT num_dop_sotr_pkey PRIMARY KEY ("внутренний_номер");
 h   ALTER TABLE ONLY public."доп_данные_сотрудников" DROP CONSTRAINT num_dop_sotr_pkey;
       public            postgres    false    206            �
           2606    237983 =   основные_данные_сотрудников num_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."основные_данные_сотрудников"
    ADD CONSTRAINT num_pkey PRIMARY KEY ("личный_номер_сотрудника");
 i   ALTER TABLE ONLY public."основные_данные_сотрудников" DROP CONSTRAINT num_pkey;
       public            postgres    false    203            �
           2606    238061 *   должности vnutr_dolzh_pkey_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public."должности"
    ADD CONSTRAINT vnutr_dolzh_pkey_unique PRIMARY KEY ("внутренний_номер");
 V   ALTER TABLE ONLY public."должности" DROP CONSTRAINT vnutr_dolzh_pkey_unique;
       public            postgres    false    208            �
           2606    262715 #   работники vnutr_dolzh_uniq 
   CONSTRAINT     �   ALTER TABLE ONLY public."работники"
    ADD CONSTRAINT vnutr_dolzh_uniq PRIMARY KEY ("внутрений_номер");
 O   ALTER TABLE ONLY public."работники" DROP CONSTRAINT vnutr_dolzh_uniq;
       public            postgres    false    221            �
           2606    238111 &   взыскания vnutr_num_vzsk_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."взыскания"
    ADD CONSTRAINT vnutr_num_vzsk_pkey PRIMARY KEY ("внутренний_номер");
 R   ALTER TABLE ONLY public."взыскания" DROP CONSTRAINT vnutr_num_vzsk_pkey;
       public            postgres    false    217            �
           2606    238077 :   повышение_квалификации vnutr_pov_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."повышение_квалификации"
    ADD CONSTRAINT vnutr_pov_pkey PRIMARY KEY ("внутренний_номер");
 f   ALTER TABLE ONLY public."повышение_квалификации" DROP CONSTRAINT vnutr_pov_pkey;
       public            postgres    false    211            �
           2606    238093 *   поощрения поощрения_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."поощрения"
    ADD CONSTRAINT "поощрения_pkey" PRIMARY KEY ("внутренний_номер");
 X   ALTER TABLE ONLY public."поощрения" DROP CONSTRAINT "поощрения_pkey";
       public            postgres    false    214            �
           2606    238095 I   поощрения поощрения_внутренний_номер_key 
   CONSTRAINT     �   ALTER TABLE ONLY public."поощрения"
    ADD CONSTRAINT "поощрения_внутренний_номер_key" UNIQUE ("внутренний_номер");
 w   ALTER TABLE ONLY public."поощрения" DROP CONSTRAINT "поощрения_внутренний_номер_key";
       public            postgres    false    214            �
           2606    262721 !   работники dolzh_num_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."работники"
    ADD CONSTRAINT dolzh_num_fkey FOREIGN KEY ("должность") REFERENCES public."должности"("код_должности");
 M   ALTER TABLE ONLY public."работники" DROP CONSTRAINT dolzh_num_fkey;
       public          postgres    false    221    2755    208            �
           2606    238046 7   доп_данные_сотрудников lich_num_key    FK CONSTRAINT       ALTER TABLE ONLY public."доп_данные_сотрудников"
    ADD CONSTRAINT lich_num_key FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 c   ALTER TABLE ONLY public."доп_данные_сотрудников" DROP CONSTRAINT lich_num_key;
       public          postgres    false    2751    203    206            �
           2606    238096 &   поощрения lich_num_pochr_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."поощрения"
    ADD CONSTRAINT lich_num_pochr_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника") NOT VALID;
 R   ALTER TABLE ONLY public."поощрения" DROP CONSTRAINT lich_num_pochr_fkey;
       public          postgres    false    214    203    2751            �
           2606    238078 =   повышение_квалификации lich_num_pov_fkey    FK CONSTRAINT     "  ALTER TABLE ONLY public."повышение_квалификации"
    ADD CONSTRAINT lich_num_pov_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 i   ALTER TABLE ONLY public."повышение_квалификации" DROP CONSTRAINT lich_num_pov_fkey;
       public          postgres    false    203    2751    211            �
           2606    238112 &   взыскания lich_num_vzisk_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."взыскания"
    ADD CONSTRAINT lich_num_vzisk_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 R   ALTER TABLE ONLY public."взыскания" DROP CONSTRAINT lich_num_vzisk_fkey;
       public          postgres    false    217    2751    203            �
           2606    262716    работники rab_num_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."работники"
    ADD CONSTRAINT rab_num_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 K   ALTER TABLE ONLY public."работники" DROP CONSTRAINT rab_num_fkey;
       public          postgres    false    203    221    2751            c   �   x�m�=�P�{N�y��A��ʂ��`"hK��	��=B��Wy��vo�>:���|��A���0^��O����
[*�o�����vTPN6�����G�_l(�0|c���>ի XA><�5J�Q&#�ʮ��Lv��֏��Z�Y���3����z:o�2��G���V��ts�i�ci��      Z   �   x�ݒ���@��<�e�D�be�"�(����V���}T|��v_��dɪ�}�3o�`��/�a����s��G�p,q<���}>�6R���Y�5r%u��٘�I�����gbGpCf��t��65��JuA�C�=�[�".,��Jm���{y�FRo��[��4��έ��r��4�N\ζ+m��� ���BF��aU}�X�/9�����*��+���e6`��H;��=����t�      X   �  x��TMKQ��+�	�U�.1Hm+�*hѦ��f�B�� �L�Ԥ����G�{g,�e.a�s�y���^�V/4L���7g�G�'�;M(�y�"�xHA�;��m�b9�����-��hJW0
�죅OL�p���f�*-C�D}�O���`!��D���f�3�= �RbzA�O�M�#�@�{�4G��)(]Md_s0��}��Hj��0U�oտ�S��zI���++g���r�dy��MR��36֜��J�����$�`i���t�hʖ�@�yd�v3�m�����7��r���R�5��_��/���(��S@�n�� �t���]̛��r�uO6,A.%����I�0�!'}� ��� �;��d
�˾��㚺�>�r��+�_�C�EXW�IĮ<�i1�J_a���JЙ�B���      U   T  x�ݒ�J�`��>ő�-4��Kb��C��T��5���������Q
>@���i_����w_#U�(!����?w?.��:'}���c��9���س���X!G��Q$�"��&��Ju�o9]b��(-jX��L��<1K:��#�Zd�Ox���u���,L��*�P��u�ҭGV���N;=j�-��?r3>OI���T��W6��\�������R��F����v�z��4"OM���c����f�E�bf�[X��\?��з����Ò��q9��؈��X�s�o�l�Jy~�6���\����d�oHd�� ���H�Rz����/~�k�L�vB�V�}���@      ]   
   x���          `   �   x�m��
�p�w���_T�ukjp� �U�)hhi7"
z��^��7�&-A���;��0��yBa��h�_m7��=z>q�Z�*2*t\p�UE�-��㉆3e��C�`�+僜� ������(9G��i�ؕ��?Ӥ�d�b2<�|�t�q��m��e�D#��jus�i���T      g   
   x���         