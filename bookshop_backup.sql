PGDMP         0                x            Bookshop    12.2    12.2 E    Y           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Z           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            [           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            \           1262    32958    Bookshop    DATABASE     �   CREATE DATABASE "Bookshop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bookshop";
                postgres    false            �            1259    33054    Доставка    TABLE     �   CREATE TABLE "public"."Доставка" (
    "код_доставки" integer NOT NULL,
    "код_заказа" integer NOT NULL,
    "адрес_доставки" character varying(80) NOT NULL
);
 (   DROP TABLE "public"."Доставка";
       public         heap    postgres    false            �            1259    33050 ,   Доставка_код_доставки_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Доставка_код_доставки_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 G   DROP SEQUENCE "public"."Доставка_код_доставки_seq";
       public          postgres    false    216            ]           0    0 ,   Доставка_код_доставки_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."Доставка_код_доставки_seq" OWNED BY "public"."Доставка"."код_доставки";
          public          postgres    false    214            �            1259    33052 (   Доставка_код_заказа_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Доставка_код_заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 C   DROP SEQUENCE "public"."Доставка_код_заказа_seq";
       public          postgres    false    216            ^           0    0 (   Доставка_код_заказа_seq    SEQUENCE OWNED BY        ALTER SEQUENCE "public"."Доставка_код_заказа_seq" OWNED BY "public"."Доставка"."код_заказа";
          public          postgres    false    215            �            1259    32985    Заказчики    TABLE     �   CREATE TABLE "public"."Заказчики" (
    "Код_заказчика" integer NOT NULL,
    "Имя" character varying(40),
    "Адрес" character varying(80),
    "Телефон" character(13)
);
 *   DROP TABLE "public"."Заказчики";
       public         heap    postgres    false            �            1259    32983 0   Заказчики_Код_заказчика_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Заказчики_Код_заказчика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 K   DROP SEQUENCE "public"."Заказчики_Код_заказчика_seq";
       public          postgres    false    211            _           0    0 0   Заказчики_Код_заказчика_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."Заказчики_Код_заказчика_seq" OWNED BY "public"."Заказчики"."Код_заказчика";
          public          postgres    false    210            �            1259    32977    Заказы    TABLE       CREATE TABLE "public"."Заказы" (
    "код_заказа" integer NOT NULL,
    "код_книги" integer NOT NULL,
    "код_заказчика" integer NOT NULL,
    "Оплачен" character varying(3) NOT NULL,
    "Дата" "date" DEFAULT "now"() NOT NULL
);
 $   DROP TABLE "public"."Заказы";
       public         heap    postgres    false            �            1259    32971 $   Заказы_код_заказа_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Заказы_код_заказа_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "public"."Заказы_код_заказа_seq";
       public          postgres    false    209            `           0    0 $   Заказы_код_заказа_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE "public"."Заказы_код_заказа_seq" OWNED BY "public"."Заказы"."код_заказа";
          public          postgres    false    206            �            1259    32975 *   Заказы_код_заказчика_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Заказы_код_заказчика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 E   DROP SEQUENCE "public"."Заказы_код_заказчика_seq";
       public          postgres    false    209            a           0    0 *   Заказы_код_заказчика_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."Заказы_код_заказчика_seq" OWNED BY "public"."Заказы"."код_заказчика";
          public          postgres    false    208            �            1259    32973 "   Заказы_код_книги_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Заказы_код_книги_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE "public"."Заказы_код_книги_seq";
       public          postgres    false    209            b           0    0 "   Заказы_код_книги_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE "public"."Заказы_код_книги_seq" OWNED BY "public"."Заказы"."код_книги";
          public          postgres    false    207            �            1259    32961 
   Книги    TABLE       CREATE TABLE "public"."Книги" (
    "Код_книги" integer NOT NULL,
    "Автор" character varying(80),
    "Название" character varying(160),
    "Издательство" character varying(80),
    "Цена" "money",
    "Остаток" smallint
);
 "   DROP TABLE "public"."Книги";
       public         heap    postgres    false            �            1259    32959     Книги_Код_книги_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Книги_Код_книги_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "public"."Книги_Код_книги_seq";
       public          postgres    false    203            c           0    0     Книги_Код_книги_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE "public"."Книги_Код_книги_seq" OWNED BY "public"."Книги"."Код_книги";
          public          postgres    false    202            �            1259    32991    Поставки    TABLE     �   CREATE TABLE "public"."Поставки" (
    "Номер" integer NOT NULL,
    "Код_книги" integer NOT NULL,
    "Код_поставщика" integer NOT NULL,
    "Количество" integer,
    "Дата" "date"
);
 (   DROP TABLE "public"."Поставки";
       public         heap    postgres    false            �            1259    32989    Поставки_Номер_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Поставки_Номер_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE "public"."Поставки_Номер_seq";
       public          postgres    false    213            d           0    0    Поставки_Номер_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "public"."Поставки_Номер_seq" OWNED BY "public"."Поставки"."Номер";
          public          postgres    false    212            �            1259    32967    Поставщики    TABLE     2  CREATE TABLE "public"."Поставщики" (
    "код_поставщика" integer NOT NULL,
    "Название" character varying(40) NOT NULL,
    "Город" character varying(40),
    "Адрес" character varying(80),
    "Телефон" character(13) DEFAULT '000 111-11-11'::"bpchar"
);
 ,   DROP TABLE "public"."Поставщики";
       public         heap    postgres    false            �            1259    32965 4   Поставщики_код_поставщика_seq    SEQUENCE     �   CREATE SEQUENCE "public"."Поставщики_код_поставщика_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 O   DROP SEQUENCE "public"."Поставщики_код_поставщика_seq";
       public          postgres    false    205            e           0    0 4   Поставщики_код_поставщика_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE "public"."Поставщики_код_поставщика_seq" OWNED BY "public"."Поставщики"."код_поставщика";
          public          postgres    false    204            �
           2604    33057 (   Доставка код_доставки    DEFAULT     �   ALTER TABLE ONLY "public"."Доставка" ALTER COLUMN "код_доставки" SET DEFAULT "nextval"('"public"."Доставка_код_доставки_seq"'::"regclass");
 ]   ALTER TABLE "public"."Доставка" ALTER COLUMN "код_доставки" DROP DEFAULT;
       public          postgres    false    216    214    216            �
           2604    33058 $   Доставка код_заказа    DEFAULT     �   ALTER TABLE ONLY "public"."Доставка" ALTER COLUMN "код_заказа" SET DEFAULT "nextval"('"public"."Доставка_код_заказа_seq"'::"regclass");
 Y   ALTER TABLE "public"."Доставка" ALTER COLUMN "код_заказа" DROP DEFAULT;
       public          postgres    false    216    215    216            �
           2604    32988 ,   Заказчики Код_заказчика    DEFAULT     �   ALTER TABLE ONLY "public"."Заказчики" ALTER COLUMN "Код_заказчика" SET DEFAULT "nextval"('"public"."Заказчики_Код_заказчика_seq"'::"regclass");
 a   ALTER TABLE "public"."Заказчики" ALTER COLUMN "Код_заказчика" DROP DEFAULT;
       public          postgres    false    211    210    211            �
           2604    32980     Заказы код_заказа    DEFAULT     �   ALTER TABLE ONLY "public"."Заказы" ALTER COLUMN "код_заказа" SET DEFAULT "nextval"('"public"."Заказы_код_заказа_seq"'::"regclass");
 U   ALTER TABLE "public"."Заказы" ALTER COLUMN "код_заказа" DROP DEFAULT;
       public          postgres    false    206    209    209            �
           2604    32981    Заказы код_книги    DEFAULT     �   ALTER TABLE ONLY "public"."Заказы" ALTER COLUMN "код_книги" SET DEFAULT "nextval"('"public"."Заказы_код_книги_seq"'::"regclass");
 S   ALTER TABLE "public"."Заказы" ALTER COLUMN "код_книги" DROP DEFAULT;
       public          postgres    false    207    209    209            �
           2604    32982 &   Заказы код_заказчика    DEFAULT     �   ALTER TABLE ONLY "public"."Заказы" ALTER COLUMN "код_заказчика" SET DEFAULT "nextval"('"public"."Заказы_код_заказчика_seq"'::"regclass");
 [   ALTER TABLE "public"."Заказы" ALTER COLUMN "код_заказчика" DROP DEFAULT;
       public          postgres    false    209    208    209            �
           2604    32964    Книги Код_книги    DEFAULT     �   ALTER TABLE ONLY "public"."Книги" ALTER COLUMN "Код_книги" SET DEFAULT "nextval"('"public"."Книги_Код_книги_seq"'::"regclass");
 Q   ALTER TABLE "public"."Книги" ALTER COLUMN "Код_книги" DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    32994    Поставки Номер    DEFAULT     �   ALTER TABLE ONLY "public"."Поставки" ALTER COLUMN "Номер" SET DEFAULT "nextval"('"public"."Поставки_Номер_seq"'::"regclass");
 P   ALTER TABLE "public"."Поставки" ALTER COLUMN "Номер" DROP DEFAULT;
       public          postgres    false    213    212    213            �
           2604    32970 0   Поставщики код_поставщика    DEFAULT     �   ALTER TABLE ONLY "public"."Поставщики" ALTER COLUMN "код_поставщика" SET DEFAULT "nextval"('"public"."Поставщики_код_поставщика_seq"'::"regclass");
 e   ALTER TABLE "public"."Поставщики" ALTER COLUMN "код_поставщика" DROP DEFAULT;
       public          postgres    false    204    205    205            V          0    33054    Доставка 
   TABLE DATA                 public          postgres    false    216   �\       Q          0    32985    Заказчики 
   TABLE DATA                 public          postgres    false    211   �\       O          0    32977    Заказы 
   TABLE DATA                 public          postgres    false    209   �\       I          0    32961 
   Книги 
   TABLE DATA                 public          postgres    false    203   �\       S          0    32991    Поставки 
   TABLE DATA                 public          postgres    false    213   �\       K          0    32967    Поставщики 
   TABLE DATA                 public          postgres    false    205   ]       f           0    0 ,   Доставка_код_доставки_seq    SEQUENCE SET     _   SELECT pg_catalog.setval('"public"."Доставка_код_доставки_seq"', 1, false);
          public          postgres    false    214            g           0    0 (   Доставка_код_заказа_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('"public"."Доставка_код_заказа_seq"', 1, false);
          public          postgres    false    215            h           0    0 0   Заказчики_Код_заказчика_seq    SEQUENCE SET     c   SELECT pg_catalog.setval('"public"."Заказчики_Код_заказчика_seq"', 1, false);
          public          postgres    false    210            i           0    0 $   Заказы_код_заказа_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"public"."Заказы_код_заказа_seq"', 1, false);
          public          postgres    false    206            j           0    0 *   Заказы_код_заказчика_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('"public"."Заказы_код_заказчика_seq"', 1, false);
          public          postgres    false    208            k           0    0 "   Заказы_код_книги_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('"public"."Заказы_код_книги_seq"', 1, false);
          public          postgres    false    207            l           0    0     Книги_Код_книги_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"public"."Книги_Код_книги_seq"', 1, false);
          public          postgres    false    202            m           0    0    Поставки_Номер_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('"public"."Поставки_Номер_seq"', 1, false);
          public          postgres    false    212            n           0    0 4   Поставщики_код_поставщика_seq    SEQUENCE SET     g   SELECT pg_catalog.setval('"public"."Поставщики_код_поставщика_seq"', 1, false);
          public          postgres    false    204            �
           2606    33002    Книги book_unique 
   CONSTRAINT     f   ALTER TABLE ONLY "public"."Книги"
    ADD CONSTRAINT "book_unique" UNIQUE ("Код_книги");
 F   ALTER TABLE ONLY "public"."Книги" DROP CONSTRAINT "book_unique";
       public            postgres    false    203            �
           2606    33049    Заказы check_oplata    CHECK CONSTRAINT     �   ALTER TABLE "public"."Заказы"
    ADD CONSTRAINT "check_oplata" CHECK ((("Оплачен")::"text" = ANY ((ARRAY['Да'::character varying, 'Нет'::character varying])::"text"[]))) NOT VALID;
 D   ALTER TABLE "public"."Заказы" DROP CONSTRAINT "check_oplata";
       public          postgres    false    209    209            �
           2606    33022    Книги num_book_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY "public"."Книги"
    ADD CONSTRAINT "num_book_pkey" PRIMARY KEY ("Код_книги");
 H   ALTER TABLE ONLY "public"."Книги" DROP CONSTRAINT "num_book_pkey";
       public            postgres    false    203            �
           2606    33024    Поставки num_posk_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY "public"."Поставки"
    ADD CONSTRAINT "num_posk_pkey" PRIMARY KEY ("Номер");
 N   ALTER TABLE ONLY "public"."Поставки" DROP CONSTRAINT "num_posk_pkey";
       public            postgres    false    213            �
           2606    33004     Поставки num_post_unique 
   CONSTRAINT     i   ALTER TABLE ONLY "public"."Поставки"
    ADD CONSTRAINT "num_post_unique" UNIQUE ("Номер");
 P   ALTER TABLE ONLY "public"."Поставки" DROP CONSTRAINT "num_post_unique";
       public            postgres    false    213            �
           2606    33006 )   Поставщики num_postavsch_unique 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."Поставщики"
    ADD CONSTRAINT "num_postavsch_unique" UNIQUE ("код_поставщика");
 Y   ALTER TABLE ONLY "public"."Поставщики" DROP CONSTRAINT "num_postavsch_unique";
       public            postgres    false    205            �
           2606    33000    Заказы num_unique 
   CONSTRAINT     i   ALTER TABLE ONLY "public"."Заказы"
    ADD CONSTRAINT "num_unique" UNIQUE ("код_заказа");
 G   ALTER TABLE ONLY "public"."Заказы" DROP CONSTRAINT "num_unique";
       public            postgres    false    209            �
           2606    33008    Заказы num_zakaz_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY "public"."Заказы"
    ADD CONSTRAINT "num_zakaz_pkey" PRIMARY KEY ("код_заказа");
 K   ALTER TABLE ONLY "public"."Заказы" DROP CONSTRAINT "num_zakaz_pkey";
       public            postgres    false    209            �
           2606    33020 #   Заказчики num_zakazch_pley 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."Заказчики"
    ADD CONSTRAINT "num_zakazch_pley" PRIMARY KEY ("Код_заказчика");
 S   ALTER TABLE ONLY "public"."Заказчики" DROP CONSTRAINT "num_zakazch_pley";
       public            postgres    false    211            �
           2606    33037 %   Поставщики post_name_unique 
   CONSTRAINT     t   ALTER TABLE ONLY "public"."Поставщики"
    ADD CONSTRAINT "post_name_unique" UNIQUE ("Название");
 U   ALTER TABLE ONLY "public"."Поставщики" DROP CONSTRAINT "post_name_unique";
       public            postgres    false    205            �
           2606    32996    Заказчики zak_unique 
   CONSTRAINT     u   ALTER TABLE ONLY "public"."Заказчики"
    ADD CONSTRAINT "zak_unique" UNIQUE ("Код_заказчика");
 M   ALTER TABLE ONLY "public"."Заказчики" DROP CONSTRAINT "zak_unique";
       public            postgres    false    211            �
           2606    33060 &   Доставка Доставка_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "public"."Доставка"
    ADD CONSTRAINT "Доставка_pkey" PRIMARY KEY ("код_доставки");
 V   ALTER TABLE ONLY "public"."Доставка" DROP CONSTRAINT "Доставка_pkey";
       public            postgres    false    216            �
           2606    33009    Заказы code_book_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Заказы"
    ADD CONSTRAINT "code_book_fkey" FOREIGN KEY ("код_книги") REFERENCES "public"."Книги"("Код_книги") NOT VALID;
 K   ALTER TABLE ONLY "public"."Заказы" DROP CONSTRAINT "code_book_fkey";
       public          postgres    false    209    203    2736            �
           2606    33014    Заказы code_zakazch_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Заказы"
    ADD CONSTRAINT "code_zakazch_fkey" FOREIGN KEY ("код_заказчика") REFERENCES "public"."Заказчики"("Код_заказчика") NOT VALID;
 N   ALTER TABLE ONLY "public"."Заказы" DROP CONSTRAINT "code_zakazch_fkey";
       public          postgres    false    2750    209    211            �
           2606    33025    Поставки num_book_pley    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Поставки"
    ADD CONSTRAINT "num_book_pley" FOREIGN KEY ("Код_книги") REFERENCES "public"."Книги"("Код_книги") NOT VALID;
 N   ALTER TABLE ONLY "public"."Поставки" DROP CONSTRAINT "num_book_pley";
       public          postgres    false    213    2736    203            �
           2606    33030 "   Поставки num_postavch_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Поставки"
    ADD CONSTRAINT "num_postavch_pkey" FOREIGN KEY ("Код_поставщика") REFERENCES "public"."Поставщики"("код_поставщика") NOT VALID;
 R   ALTER TABLE ONLY "public"."Поставки" DROP CONSTRAINT "num_postavch_pkey";
       public          postgres    false    213    205    2740            �
           2606    33061    Доставка zak_pkey    FK CONSTRAINT     �   ALTER TABLE ONLY "public"."Доставка"
    ADD CONSTRAINT "zak_pkey" FOREIGN KEY ("код_заказа") REFERENCES "public"."Заказы"("код_заказа") ON UPDATE CASCADE ON DELETE CASCADE;
 I   ALTER TABLE ONLY "public"."Доставка" DROP CONSTRAINT "zak_pkey";
       public          postgres    false    209    2744    216            V   
   x���          Q   
   x���          O   
   x���          I   
   x���          S   
   x���          K   
   x���         