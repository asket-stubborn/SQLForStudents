PGDMP                          x         
   otdel_kadr    12.2    12.2 D    U           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            V           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            W           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            X           1262    237975 
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
       public          postgres    false    217            Y           0    0 6   взыскания_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."взыскания_внутренний_номер_seq" OWNED BY public."взыскания"."внутренний_номер";
          public          postgres    false    215            �            1259    238103 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE     �   CREATE SEQUENCE public."взыскания_личный_номер_сотрудни_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."взыскания_личный_номер_сотрудни_seq";
       public          postgres    false    217            Z           0    0 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."взыскания_личный_номер_сотрудни_seq" OWNED BY public."взыскания"."личный_номер_сотрудника";
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
       public          postgres    false    208            [           0    0 6   должности_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."должности_внутренний_номер_seq" OWNED BY public."должности"."внутренний_номер";
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
       public          postgres    false    206            \           0    0 >   допо_данные_сот_внутренний_номе_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."допо_данные_сот_внутренний_номе_seq" OWNED BY public."доп_данные_сотрудников"."внутренний_номер";
          public          postgres    false    204            �            1259    238037 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE     �   CREATE SEQUENCE public."допо_данные_сот_личный_номер_со_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 V   DROP SEQUENCE public."допо_данные_сот_личный_номер_со_seq";
       public          postgres    false    206            ]           0    0 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."допо_данные_сот_личный_номер_со_seq" OWNED BY public."доп_данные_сотрудников"."личный_номер_сотрудника";
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
       public          postgres    false    203            ^           0    0 >   основные_данные_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."основные_данные_личный_номер_со_seq" OWNED BY public."основные_данные_сотрудников"."личный_номер_сотрудника";
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
       public          postgres    false    211            _           0    0 ?   повышение_квали_внутренний_номе_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."повышение_квали_внутренний_номе_seq" OWNED BY public."повышение_квалификации"."внутренний_номер";
          public          postgres    false    209            �            1259    238066 >   повышение_квали_личный_номер_со_seq    SEQUENCE     �   CREATE SEQUENCE public."повышение_квали_личный_номер_со_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 W   DROP SEQUENCE public."повышение_квали_личный_номер_со_seq";
       public          postgres    false    211            `           0    0 >   повышение_квали_личный_номер_со_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."повышение_квали_личный_номер_со_seq" OWNED BY public."повышение_квалификации"."личный_номер_сотрудника";
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
       public          postgres    false    214            a           0    0 6   поощрения_внутренний_номер_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."поощрения_внутренний_номер_seq" OWNED BY public."поощрения"."внутренний_номер";
          public          postgres    false    212            �            1259    238085 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE     �   CREATE SEQUENCE public."поощрения_личный_номер_сотрудни_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 X   DROP SEQUENCE public."поощрения_личный_номер_сотрудни_seq";
       public          postgres    false    214            b           0    0 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."поощрения_личный_номер_сотрудни_seq" OWNED BY public."поощрения"."личный_номер_сотрудника";
          public          postgres    false    213            �
           2604    238108 2   взыскания внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."взыскания" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."взыскания_внутренний_номер_seq"'::regclass);
 e   ALTER TABLE public."взыскания" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    215    217    217            �
           2604    238109 ?   взыскания личный_номер_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."взыскания" ALTER COLUMN "личный_номер_сотрудника" SET DEFAULT nextval('public."взыскания_личный_номер_сотрудни_seq"'::regclass);
 r   ALTER TABLE public."взыскания" ALTER COLUMN "личный_номер_сотрудника" DROP DEFAULT;
       public          postgres    false    217    216    217            �
           2604    238059 2   должности внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."должности" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."должности_внутренний_номер_seq"'::regclass);
 e   ALTER TABLE public."должности" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    208    207    208            �
           2604    238042 J   доп_данные_сотрудников внутренний_номер    DEFAULT     �   ALTER TABLE ONLY public."доп_данные_сотрудников" ALTER COLUMN "внутренний_номер" SET DEFAULT nextval('public."допо_данные_сот_внутренний_номе_seq"'::regclass);
 }   ALTER TABLE public."доп_данные_сотрудников" ALTER COLUMN "внутренний_номер" DROP DEFAULT;
       public          postgres    false    206    204    206            �
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
       public          postgres    false    213    214    214            R          0    238105    взыскания 
   TABLE DATA                 public          postgres    false    217   �l       I          0    238056    должности 
   TABLE DATA                 public          postgres    false    208   m       G          0    238039 *   доп_данные_сотрудников 
   TABLE DATA                 public          postgres    false    206   !m       D          0    237978 4   основные_данные_сотрудников 
   TABLE DATA                 public          postgres    false    203   ;m       L          0    238068 +   повышение_квалификации 
   TABLE DATA                 public          postgres    false    211   Um       O          0    238087    поощрения 
   TABLE DATA                 public          postgres    false    214   om       c           0    0 6   взыскания_внутренний_номер_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."взыскания_внутренний_номер_seq"', 1, false);
          public          postgres    false    215            d           0    0 ?   взыскания_личный_номер_сотрудни_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."взыскания_личный_номер_сотрудни_seq"', 1, false);
          public          postgres    false    216            e           0    0 6   должности_внутренний_номер_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."должности_внутренний_номер_seq"', 1, false);
          public          postgres    false    207            f           0    0 >   допо_данные_сот_внутренний_номе_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public."допо_данные_сот_внутренний_номе_seq"', 1, false);
          public          postgres    false    204            g           0    0 =   допо_данные_сот_личный_номер_со_seq    SEQUENCE SET     n   SELECT pg_catalog.setval('public."допо_данные_сот_личный_номер_со_seq"', 1, false);
          public          postgres    false    205            h           0    0 >   основные_данные_личный_номер_со_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public."основные_данные_личный_номер_со_seq"', 1, false);
          public          postgres    false    202            i           0    0 ?   повышение_квали_внутренний_номе_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."повышение_квали_внутренний_номе_seq"', 1, false);
          public          postgres    false    209            j           0    0 >   повышение_квали_личный_номер_со_seq    SEQUENCE SET     o   SELECT pg_catalog.setval('public."повышение_квали_личный_номер_со_seq"', 1, false);
          public          postgres    false    210            k           0    0 6   поощрения_внутренний_номер_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('public."поощрения_внутренний_номер_seq"', 1, false);
          public          postgres    false    212            l           0    0 ?   поощрения_личный_номер_сотрудни_seq    SEQUENCE SET     p   SELECT pg_catalog.setval('public."поощрения_личный_номер_сотрудни_seq"', 1, false);
          public          postgres    false    213            �
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
           2606    238046 7   доп_данные_сотрудников lich_num_key    FK CONSTRAINT       ALTER TABLE ONLY public."доп_данные_сотрудников"
    ADD CONSTRAINT lich_num_key FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 c   ALTER TABLE ONLY public."доп_данные_сотрудников" DROP CONSTRAINT lich_num_key;
       public          postgres    false    206    2738    203            �
           2606    238096 &   поощрения lich_num_pochr_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."поощрения"
    ADD CONSTRAINT lich_num_pochr_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника") NOT VALID;
 R   ALTER TABLE ONLY public."поощрения" DROP CONSTRAINT lich_num_pochr_fkey;
       public          postgres    false    203    214    2738            �
           2606    238078 =   повышение_квалификации lich_num_pov_fkey    FK CONSTRAINT     "  ALTER TABLE ONLY public."повышение_квалификации"
    ADD CONSTRAINT lich_num_pov_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 i   ALTER TABLE ONLY public."повышение_квалификации" DROP CONSTRAINT lich_num_pov_fkey;
       public          postgres    false    203    211    2738            �
           2606    238112 &   взыскания lich_num_vzisk_fkey    FK CONSTRAINT       ALTER TABLE ONLY public."взыскания"
    ADD CONSTRAINT lich_num_vzisk_fkey FOREIGN KEY ("личный_номер_сотрудника") REFERENCES public."основные_данные_сотрудников"("личный_номер_сотрудника");
 R   ALTER TABLE ONLY public."взыскания" DROP CONSTRAINT lich_num_vzisk_fkey;
       public          postgres    false    217    2738    203            R   
   x���          I   
   x���          G   
   x���          D   
   x���          L   
   x���          O   
   x���         