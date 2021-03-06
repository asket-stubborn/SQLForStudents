PGDMP     7                    x            Bookshop    12.2    12.2 U    o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            r           1262    32958    Bookshop    DATABASE     �   CREATE DATABASE "Bookshop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bookshop";
                postgres    false            �            1259    33054    Доставка    TABLE     ,  CREATE TABLE public."Доставка" (
    "код_доставки" integer NOT NULL,
    "код_заказа" integer NOT NULL,
    "адрес_доставки" character varying(80) NOT NULL,
    "код_курьера" integer NOT NULL,
    "доставлен" integer DEFAULT 0 NOT NULL
);
 &   DROP TABLE public."Доставка";
       public         heap    postgres    false            �            1259    33050 ,   Доставка_код_доставки_seq    SEQUENCE     �   CREATE SEQUENCE public."Доставка_код_доставки_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE public."Доставка_код_доставки_seq";
       public          postgres    false    216            s           0    0 ,   Доставка_код_доставки_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Доставка_код_доставки_seq" OWNED BY public."Доставка"."код_доставки";
          public          postgres    false    214            �            1259    33052 (   Доставка_код_заказа_seq    SEQUENCE     �   CREATE SEQUENCE public."Доставка_код_заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 A   DROP SEQUENCE public."Доставка_код_заказа_seq";
       public          postgres    false    216            t           0    0 (   Доставка_код_заказа_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public."Доставка_код_заказа_seq" OWNED BY public."Доставка"."код_заказа";
          public          postgres    false    215            �            1259    41268 *   Доставка_код_курьера_seq    SEQUENCE     �   CREATE SEQUENCE public."Доставка_код_курьера_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public."Доставка_код_курьера_seq";
       public          postgres    false    216            u           0    0 *   Доставка_код_курьера_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Доставка_код_курьера_seq" OWNED BY public."Доставка"."код_курьера";
          public          postgres    false    217            �            1259    32985    Заказчики    TABLE     �   CREATE TABLE public."Заказчики" (
    "Код_заказчика" integer NOT NULL,
    "Имя" character varying(40),
    "Адрес" character varying(80),
    "Телефон" character(13)
);
 (   DROP TABLE public."Заказчики";
       public         heap    postgres    false            �            1259    32983 0   Заказчики_Код_заказчика_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказчики_Код_заказчика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 I   DROP SEQUENCE public."Заказчики_Код_заказчика_seq";
       public          postgres    false    211            v           0    0 0   Заказчики_Код_заказчика_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Заказчики_Код_заказчика_seq" OWNED BY public."Заказчики"."Код_заказчика";
          public          postgres    false    210            �            1259    32977    Заказы    TABLE     6  CREATE TABLE public."Заказы" (
    "код_заказа" integer NOT NULL,
    "код_книги" integer NOT NULL,
    "код_заказчика" integer NOT NULL,
    "Оплачен" character varying(3) NOT NULL,
    "Дата" date DEFAULT now() NOT NULL,
    "оформил" integer NOT NULL
);
 "   DROP TABLE public."Заказы";
       public         heap    postgres    false            �            1259    32971 $   Заказы_код_заказа_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказы_код_заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE public."Заказы_код_заказа_seq";
       public          postgres    false    209            w           0    0 $   Заказы_код_заказа_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."Заказы_код_заказа_seq" OWNED BY public."Заказы"."код_заказа";
          public          postgres    false    206            �            1259    32975 *   Заказы_код_заказчика_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказы_код_заказчика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE public."Заказы_код_заказчика_seq";
       public          postgres    false    209            x           0    0 *   Заказы_код_заказчика_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public."Заказы_код_заказчика_seq" OWNED BY public."Заказы"."код_заказчика";
          public          postgres    false    208            �            1259    32973 "   Заказы_код_книги_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказы_код_книги_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public."Заказы_код_книги_seq";
       public          postgres    false    209            y           0    0 "   Заказы_код_книги_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public."Заказы_код_книги_seq" OWNED BY public."Заказы"."код_книги";
          public          postgres    false    207            �            1259    49485    Заказы_оформил_seq    SEQUENCE     �   CREATE SEQUENCE public."Заказы_оформил_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Заказы_оформил_seq";
       public          postgres    false    209            z           0    0    Заказы_оформил_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Заказы_оформил_seq" OWNED BY public."Заказы"."оформил";
          public          postgres    false    220            �            1259    32961 
   Книги    TABLE       CREATE TABLE public."Книги" (
    "Код_книги" integer NOT NULL,
    "Автор" character varying(80),
    "Название" character varying(160),
    "Издательство" character varying(80),
    "Цена" money,
    "Остаток" smallint
);
     DROP TABLE public."Книги";
       public         heap    postgres    false            �            1259    32959     Книги_Код_книги_seq    SEQUENCE     �   CREATE SEQUENCE public."Книги_Код_книги_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public."Книги_Код_книги_seq";
       public          postgres    false    203            {           0    0     Книги_Код_книги_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public."Книги_Код_книги_seq" OWNED BY public."Книги"."Код_книги";
          public          postgres    false    202            �            1259    32991    Поставки    TABLE     �   CREATE TABLE public."Поставки" (
    "Номер" integer NOT NULL,
    "Код_книги" integer NOT NULL,
    "Код_поставщика" integer NOT NULL,
    "Количество" integer,
    "Дата" date
);
 &   DROP TABLE public."Поставки";
       public         heap    postgres    false            �            1259    32989    Поставки_Номер_seq    SEQUENCE     �   CREATE SEQUENCE public."Поставки_Номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public."Поставки_Номер_seq";
       public          postgres    false    213            |           0    0    Поставки_Номер_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE public."Поставки_Номер_seq" OWNED BY public."Поставки"."Номер";
          public          postgres    false    212            �            1259    32967    Поставщики    TABLE     .  CREATE TABLE public."Поставщики" (
    "код_поставщика" integer NOT NULL,
    "Название" character varying(40) NOT NULL,
    "Город" character varying(40),
    "Адрес" character varying(80),
    "Телефон" character(13) DEFAULT '000 111-11-11'::bpchar
);
 *   DROP TABLE public."Поставщики";
       public         heap    postgres    false            �            1259    32965 4   Поставщики_код_поставщика_seq    SEQUENCE     �   CREATE SEQUENCE public."Поставщики_код_поставщика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public."Поставщики_код_поставщика_seq";
       public          postgres    false    205            }           0    0 4   Поставщики_код_поставщика_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Поставщики_код_поставщика_seq" OWNED BY public."Поставщики"."код_поставщика";
          public          postgres    false    204            �            1259    41277    Сотрудники    TABLE     �   CREATE TABLE public."Сотрудники" (
    "код_сотрудника" integer NOT NULL,
    "ФИО" character varying(120) NOT NULL,
    "должность" character varying(120) NOT NULL,
    "стаж" double precision DEFAULT 0 NOT NULL
);
 *   DROP TABLE public."Сотрудники";
       public         heap    postgres    false            �            1259    41275 4   Сотрудники_код_сотрудника_seq    SEQUENCE     �   CREATE SEQUENCE public."Сотрудники_код_сотрудника_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 M   DROP SEQUENCE public."Сотрудники_код_сотрудника_seq";
       public          postgres    false    219            ~           0    0 4   Сотрудники_код_сотрудника_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."Сотрудники_код_сотрудника_seq" OWNED BY public."Сотрудники"."код_сотрудника";
          public          postgres    false    218            �
           2604    33057 (   Доставка код_доставки    DEFAULT     �   ALTER TABLE ONLY public."Доставка" ALTER COLUMN "код_доставки" SET DEFAULT nextval('public."Доставка_код_доставки_seq"'::regclass);
 [   ALTER TABLE public."Доставка" ALTER COLUMN "код_доставки" DROP DEFAULT;
       public          postgres    false    214    216    216            �
           2604    33058 $   Доставка код_заказа    DEFAULT     �   ALTER TABLE ONLY public."Доставка" ALTER COLUMN "код_заказа" SET DEFAULT nextval('public."Доставка_код_заказа_seq"'::regclass);
 W   ALTER TABLE public."Доставка" ALTER COLUMN "код_заказа" DROP DEFAULT;
       public          postgres    false    216    215    216            �
           2604    41270 &   Доставка код_курьера    DEFAULT     �   ALTER TABLE ONLY public."Доставка" ALTER COLUMN "код_курьера" SET DEFAULT nextval('public."Доставка_код_курьера_seq"'::regclass);
 Y   ALTER TABLE public."Доставка" ALTER COLUMN "код_курьера" DROP DEFAULT;
       public          postgres    false    217    216            �
           2604    32988 ,   Заказчики Код_заказчика    DEFAULT     �   ALTER TABLE ONLY public."Заказчики" ALTER COLUMN "Код_заказчика" SET DEFAULT nextval('public."Заказчики_Код_заказчика_seq"'::regclass);
 _   ALTER TABLE public."Заказчики" ALTER COLUMN "Код_заказчика" DROP DEFAULT;
       public          postgres    false    211    210    211            �
           2604    32980     Заказы код_заказа    DEFAULT     �   ALTER TABLE ONLY public."Заказы" ALTER COLUMN "код_заказа" SET DEFAULT nextval('public."Заказы_код_заказа_seq"'::regclass);
 S   ALTER TABLE public."Заказы" ALTER COLUMN "код_заказа" DROP DEFAULT;
       public          postgres    false    206    209    209            �
           2604    32981    Заказы код_книги    DEFAULT     �   ALTER TABLE ONLY public."Заказы" ALTER COLUMN "код_книги" SET DEFAULT nextval('public."Заказы_код_книги_seq"'::regclass);
 Q   ALTER TABLE public."Заказы" ALTER COLUMN "код_книги" DROP DEFAULT;
       public          postgres    false    209    207    209            �
           2604    32982 &   Заказы код_заказчика    DEFAULT     �   ALTER TABLE ONLY public."Заказы" ALTER COLUMN "код_заказчика" SET DEFAULT nextval('public."Заказы_код_заказчика_seq"'::regclass);
 Y   ALTER TABLE public."Заказы" ALTER COLUMN "код_заказчика" DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    49487    Заказы оформил    DEFAULT     �   ALTER TABLE ONLY public."Заказы" ALTER COLUMN "оформил" SET DEFAULT nextval('public."Заказы_оформил_seq"'::regclass);
 N   ALTER TABLE public."Заказы" ALTER COLUMN "оформил" DROP DEFAULT;
       public          postgres    false    220    209            �
           2604    32964    Книги Код_книги    DEFAULT     �   ALTER TABLE ONLY public."Книги" ALTER COLUMN "Код_книги" SET DEFAULT nextval('public."Книги_Код_книги_seq"'::regclass);
 O   ALTER TABLE public."Книги" ALTER COLUMN "Код_книги" DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    32994    Поставки Номер    DEFAULT     �   ALTER TABLE ONLY public."Поставки" ALTER COLUMN "Номер" SET DEFAULT nextval('public."Поставки_Номер_seq"'::regclass);
 N   ALTER TABLE public."Поставки" ALTER COLUMN "Номер" DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    32970 0   Поставщики код_поставщика    DEFAULT     �   ALTER TABLE ONLY public."Поставщики" ALTER COLUMN "код_поставщика" SET DEFAULT nextval('public."Поставщики_код_поставщика_seq"'::regclass);
 c   ALTER TABLE public."Поставщики" ALTER COLUMN "код_поставщика" DROP DEFAULT;
       public          postgres    false    204    205    205            �
           2604    41280 0   Сотрудники код_сотрудника    DEFAULT     �   ALTER TABLE ONLY public."Сотрудники" ALTER COLUMN "код_сотрудника" SET DEFAULT nextval('public."Сотрудники_код_сотрудника_seq"'::regclass);
 c   ALTER TABLE public."Сотрудники" ALTER COLUMN "код_сотрудника" DROP DEFAULT;
       public          postgres    false    219    218    219            h          0    33054    Доставка 
   TABLE DATA                 public          postgres    false    216   �q       c          0    32985    Заказчики 
   TABLE DATA                 public          postgres    false    211   �q       a          0    32977    Заказы 
   TABLE DATA                 public          postgres    false    209   &s       [          0    32961 
   Книги 
   TABLE DATA                 public          postgres    false    203   @s       e          0    32991    Поставки 
   TABLE DATA                 public          postgres    false    213   �t       ]          0    32967    Поставщики 
   TABLE DATA                 public          postgres    false    205   u       k          0    41277    Сотрудники 
   TABLE DATA                 public          postgres    false    219   $v                  0    0 ,   Доставка_код_доставки_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public."Доставка_код_доставки_seq"', 1, false);
          public          postgres    false    214            �           0    0 (   Доставка_код_заказа_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."Доставка_код_заказа_seq"', 1, false);
          public          postgres    false    215            �           0    0 *   Доставка_код_курьера_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."Доставка_код_курьера_seq"', 1, false);
          public          postgres    false    217            �           0    0 0   Заказчики_Код_заказчика_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public."Заказчики_Код_заказчика_seq"', 1, false);
          public          postgres    false    210            �           0    0 $   Заказы_код_заказа_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."Заказы_код_заказа_seq"', 3, true);
          public          postgres    false    206            �           0    0 *   Заказы_код_заказчика_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."Заказы_код_заказчика_seq"', 1, false);
          public          postgres    false    208            �           0    0 "   Заказы_код_книги_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Заказы_код_книги_seq"', 1, false);
          public          postgres    false    207            �           0    0    Заказы_оформил_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Заказы_оформил_seq"', 1, true);
          public          postgres    false    220            �           0    0     Книги_Код_книги_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Книги_Код_книги_seq"', 1, false);
          public          postgres    false    202            �           0    0    Поставки_Номер_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."Поставки_Номер_seq"', 1, false);
          public          postgres    false    212            �           0    0 4   Поставщики_код_поставщика_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public."Поставщики_код_поставщика_seq"', 1, false);
          public          postgres    false    204            �           0    0 4   Сотрудники_код_сотрудника_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public."Сотрудники_код_сотрудника_seq"', 6, true);
          public          postgres    false    218            �
           2606    33002    Книги book_unique 
   CONSTRAINT     b   ALTER TABLE ONLY public."Книги"
    ADD CONSTRAINT book_unique UNIQUE ("Код_книги");
 B   ALTER TABLE ONLY public."Книги" DROP CONSTRAINT book_unique;
       public            postgres    false    203            �
           2606    33049    Заказы check_oplata    CHECK CONSTRAINT     �   ALTER TABLE public."Заказы"
    ADD CONSTRAINT check_oplata CHECK ((("Оплачен")::text = ANY ((ARRAY['Да'::character varying, 'Нет'::character varying])::text[]))) NOT VALID;
 @   ALTER TABLE public."Заказы" DROP CONSTRAINT check_oplata;
       public          postgres    false    209    209            �
           2606    33022    Книги num_book_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public."Книги"
    ADD CONSTRAINT num_book_pkey PRIMARY KEY ("Код_книги");
 D   ALTER TABLE ONLY public."Книги" DROP CONSTRAINT num_book_pkey;
       public            postgres    false    203            �
           2606    33024    Поставки num_posk_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public."Поставки"
    ADD CONSTRAINT num_posk_pkey PRIMARY KEY ("Номер");
 J   ALTER TABLE ONLY public."Поставки" DROP CONSTRAINT num_posk_pkey;
       public            postgres    false    213            �
           2606    33004     Поставки num_post_unique 
   CONSTRAINT     e   ALTER TABLE ONLY public."Поставки"
    ADD CONSTRAINT num_post_unique UNIQUE ("Номер");
 L   ALTER TABLE ONLY public."Поставки" DROP CONSTRAINT num_post_unique;
       public            postgres    false    213            �
           2606    33006 )   Поставщики num_postavsch_unique 
   CONSTRAINT        ALTER TABLE ONLY public."Поставщики"
    ADD CONSTRAINT num_postavsch_unique UNIQUE ("код_поставщика");
 U   ALTER TABLE ONLY public."Поставщики" DROP CONSTRAINT num_postavsch_unique;
       public            postgres    false    205            �
           2606    33000    Заказы num_unique 
   CONSTRAINT     e   ALTER TABLE ONLY public."Заказы"
    ADD CONSTRAINT num_unique UNIQUE ("код_заказа");
 C   ALTER TABLE ONLY public."Заказы" DROP CONSTRAINT num_unique;
       public            postgres    false    209            �
           2606    33008    Заказы num_zakaz_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."Заказы"
    ADD CONSTRAINT num_zakaz_pkey PRIMARY KEY ("код_заказа");
 G   ALTER TABLE ONLY public."Заказы" DROP CONSTRAINT num_zakaz_pkey;
       public            postgres    false    209            �
           2606    33020 #   Заказчики num_zakazch_pley 
   CONSTRAINT     |   ALTER TABLE ONLY public."Заказчики"
    ADD CONSTRAINT num_zakazch_pley PRIMARY KEY ("Код_заказчика");
 O   ALTER TABLE ONLY public."Заказчики" DROP CONSTRAINT num_zakazch_pley;
       public            postgres    false    211            �
           2606    33037 %   Поставщики post_name_unique 
   CONSTRAINT     p   ALTER TABLE ONLY public."Поставщики"
    ADD CONSTRAINT post_name_unique UNIQUE ("Название");
 Q   ALTER TABLE ONLY public."Поставщики" DROP CONSTRAINT post_name_unique;
       public            postgres    false    205            �
           2606    41282 %   Сотрудники sotrudnik_unique 
   CONSTRAINT     �   ALTER TABLE ONLY public."Сотрудники"
    ADD CONSTRAINT sotrudnik_unique PRIMARY KEY ("код_сотрудника");
 Q   ALTER TABLE ONLY public."Сотрудники" DROP CONSTRAINT sotrudnik_unique;
       public            postgres    false    219            �
           2606    32996    Заказчики zak_unique 
   CONSTRAINT     q   ALTER TABLE ONLY public."Заказчики"
    ADD CONSTRAINT zak_unique UNIQUE ("Код_заказчика");
 I   ALTER TABLE ONLY public."Заказчики" DROP CONSTRAINT zak_unique;
       public            postgres    false    211            �
           2606    33060 &   Доставка Доставка_pkey 
   CONSTRAINT        ALTER TABLE ONLY public."Доставка"
    ADD CONSTRAINT "Доставка_pkey" PRIMARY KEY ("код_доставки");
 T   ALTER TABLE ONLY public."Доставка" DROP CONSTRAINT "Доставка_pkey";
       public            postgres    false    216            �
           2606    33009    Заказы code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Заказы"
    ADD CONSTRAINT code_book_fkey FOREIGN KEY ("код_книги") REFERENCES public."Книги"("Код_книги") NOT VALID;
 G   ALTER TABLE ONLY public."Заказы" DROP CONSTRAINT code_book_fkey;
       public          postgres    false    2751    209    203            �
           2606    33014    Заказы code_zakazch_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Заказы"
    ADD CONSTRAINT code_zakazch_fkey FOREIGN KEY ("код_заказчика") REFERENCES public."Заказчики"("Код_заказчика") NOT VALID;
 J   ALTER TABLE ONLY public."Заказы" DROP CONSTRAINT code_zakazch_fkey;
       public          postgres    false    211    209    2765            �
           2606    41283    Доставка kur_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Доставка"
    ADD CONSTRAINT kur_pkey FOREIGN KEY ("код_курьера") REFERENCES public."Сотрудники"("код_сотрудника") NOT VALID;
 E   ALTER TABLE ONLY public."Доставка" DROP CONSTRAINT kur_pkey;
       public          postgres    false    2773    216    219            �
           2606    33025    Поставки num_book_pley    FK CONSTRAINT     �   ALTER TABLE ONLY public."Поставки"
    ADD CONSTRAINT num_book_pley FOREIGN KEY ("Код_книги") REFERENCES public."Книги"("Код_книги") NOT VALID;
 J   ALTER TABLE ONLY public."Поставки" DROP CONSTRAINT num_book_pley;
       public          postgres    false    2751    213    203            �
           2606    33030 "   Поставки num_postavch_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Поставки"
    ADD CONSTRAINT num_postavch_pkey FOREIGN KEY ("Код_поставщика") REFERENCES public."Поставщики"("код_поставщика") NOT VALID;
 N   ALTER TABLE ONLY public."Поставки" DROP CONSTRAINT num_postavch_pkey;
       public          postgres    false    2755    205    213            �
           2606    33061    Доставка zak_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Доставка"
    ADD CONSTRAINT zak_pkey FOREIGN KEY ("код_заказа") REFERENCES public."Заказы"("код_заказа") ON UPDATE CASCADE ON DELETE CASCADE;
 E   ALTER TABLE ONLY public."Доставка" DROP CONSTRAINT zak_pkey;
       public          postgres    false    209    2759    216            h   
   x���          c   ^  x�͒�NA�{�bs��	wV$[�H,l��`4����'ǅ����}#����`}lr����?��l�٪�U��>T���ݳ]O��[D�"G<c��	f.}����0Ck�05=��o�w��ӻfr���A�Sk�B���x�L RJ�P����Ә�����eW�JU�'_���3j�]����P�A(�;Ed������A�7i<jz���E,�v��7��՞�����jǾ��H�BE��lB��z�o֋�`���m|�+�	p=WW~w�eK�Q�p"b��mp�-��V�����t���D3���4��	Ϙ/�;G���s����      a   
   x���          [   �  x��T=KA��+�k�@w�����`����`ac���B.V!��4Z	����]n��?���L��?��ٷ����^��m�T���W�'�g�U�&�RD�,UbO��1��`EY�Q`��+�#��AVƄ#�N>P!%���a�e���|��d�q�b���v�[]Ur*�H#sE	H}�k
�{ ����U)�]�`�8��<��q:^�uۮضځ�,oڹ�����Y��S!b_C�+��TL���ܚk�� |�O�;_S{�ޱs-��߭��҅L�>긁�Jֈ>��Υ½h"�����uV�
`��!��*y��P���	'5C�*Cd[b{ oa(G��K5i�g��iE��u+j\��J#��T�<���G�y� f���!?��\���F4~5`(�=���      e   
   x���          ]     x�͑�J�@��y�a6i!�L��ŕ�.!�m�
�\�qߪ���F�A�cB�1�μ��._��03߹w��$�x�?QI6�Sg�G�'�=�W,��]�"wר��J���Dq��a���Be��kC�l�{���ZK�(H����5��Fw��n:�U��g��R����Ҕ���Q
���6�hs+lC������<��!�BZ������Z�uO�e�a(Id#ӫ�XW��Xx@�%>y��^�!��/��i�R�Pc6�)�<�ݬXc      k   �   x���v
Q���W((M��L�S���¾�M.6_�ra�v]ء�����]��Cz����҅%f\�fm*�}aPv��F���(�uaÅmJ�
a�>���
�:
�@M���{`��Mv\lGP��u�hmυ��|Mk.�u��QK.Ni�ؠ�`"��"�� �Z��`�.l �o�x�xhǈ	�c��%.. � �!     