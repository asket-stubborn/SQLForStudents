PGDMP                         x         
   otdel_kadr    12.2    12.2 D    U           0    0    ENCODING    ENCODING        SET client_encoding = 'KOI8R';
                      false            V           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            W           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            X           1262    237975 
   otdel_kadr    DATABASE     �   CREATE DATABASE otdel_kadr WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE otdel_kadr;
                postgres    false            �            1259    238056 	   ���������    TABLE     �   CREATE TABLE public."���������" (
    "����������_�����" integer NOT NULL,
    "���_���������" integer NOT NULL,
    "������������_���������" character varying(200),
    "�����������_�����" double precision
);
    DROP TABLE public."���������";
       public         heap    postgres    false            �            1259    238054    ���������_����������_�����_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_����������_�����_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."���������_����������_�����_seq";
       public          postgres    false    208            Y           0    0    ���������_����������_�����_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."���������_����������_�����_seq" OWNED BY public."���������"."����������_�����";
          public          postgres    false    207            �            1259    238039    ���_������_�����������    TABLE     �  CREATE TABLE public."���_������_�����������" (
    "����������_�����" integer NOT NULL,
    "������_�����_����������" integer NOT NULL,
    "��������_�����" character varying(200) NOT NULL,
    "��������_�������" integer,
    "�����������" character varying(200),
    "�����_�������" integer,
    "���_�������������" integer,
    "��������_�������������" character varying(200),
    "������������" character varying(200)
);
 ,   DROP TABLE public."���_������_�����������";
       public         heap    postgres    false            �            1259    238037 #   ����_������_���_������_�����_��_seq    SEQUENCE     �   CREATE SEQUENCE public."����_������_���_������_�����_��_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."����_������_���_������_�����_��_seq";
       public          postgres    false    206            Z           0    0 #   ����_������_���_������_�����_��_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."����_������_���_������_�����_��_seq" OWNED BY public."���_������_�����������"."������_�����_����������";
          public          postgres    false    205            �            1259    238035 #   ����_������_���_����������_����_seq    SEQUENCE     �   CREATE SEQUENCE public."����_������_���_����������_����_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."����_������_���_����������_����_seq";
       public          postgres    false    206            [           0    0 #   ����_������_���_����������_����_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."����_������_���_����������_����_seq" OWNED BY public."���_������_�����������"."����������_�����";
          public          postgres    false    204            �            1259    237978    ��������_������_�����������    TABLE     �   CREATE TABLE public."��������_������_�����������" (
    "������_�����_����������" integer NOT NULL,
    "���_����������" character varying(100) NOT NULL,
    "�����_��������" integer NOT NULL,
    "���� ��������" date
);
 1   DROP TABLE public."��������_������_�����������";
       public         heap    postgres    false            �            1259    237976 #   ��������_������_������_�����_��_seq    SEQUENCE     �   CREATE SEQUENCE public."��������_������_������_�����_��_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."��������_������_������_�����_��_seq";
       public          postgres    false    203            \           0    0 #   ��������_������_������_�����_��_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."��������_������_������_�����_��_seq" OWNED BY public."��������_������_�����������"."������_�����_����������";
          public          postgres    false    202            �            1259    238087 	   ���������    TABLE     �   CREATE TABLE public."���������" (
    "����������_�����" integer NOT NULL,
    "������_�����_����������" integer NOT NULL,
    "����_���������" date NOT NULL,
    "���_���������" character varying(400) NOT NULL
);
    DROP TABLE public."���������";
       public         heap    postgres    false            �            1259    238085 #   ���������_������_�����_��������_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_������_�����_��������_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."���������_������_�����_��������_seq";
       public          postgres    false    214            ]           0    0 #   ���������_������_�����_��������_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."���������_������_�����_��������_seq" OWNED BY public."���������"."������_�����_����������";
          public          postgres    false    213            �            1259    238083    ���������_����������_�����_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_����������_�����_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."���������_����������_�����_seq";
       public          postgres    false    214            ^           0    0    ���������_����������_�����_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."���������_����������_�����_seq" OWNED BY public."���������"."����������_�����";
          public          postgres    false    212            �            1259    238068    ���������_������������    TABLE     "  CREATE TABLE public."���������_������������" (
    "����������_�����" integer NOT NULL,
    "������_�����_����������" integer NOT NULL,
    "����_���������_�����������_������" date NOT NULL,
    "���������_������������" character varying,
    "�������������_�_���������_�������" integer
);
 ,   DROP TABLE public."���������_������������";
       public         heap    postgres    false            �            1259    238066 #   ���������_�����_������_�����_��_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_�����_������_�����_��_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."���������_�����_������_�����_��_seq";
       public          postgres    false    211            _           0    0 #   ���������_�����_������_�����_��_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public."���������_�����_������_�����_��_seq" OWNED BY public."���������_������������"."������_�����_����������";
          public          postgres    false    210            �            1259    238064 #   ���������_�����_����������_����_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_�����_����������_����_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."���������_�����_����������_����_seq";
       public          postgres    false    211            `           0    0 #   ���������_�����_����������_����_seq    SEQUENCE OWNED BY     y   ALTER SEQUENCE public."���������_�����_����������_����_seq" OWNED BY public."���������_������������"."����������_�����";
          public          postgres    false    209            �            1259    238105 	   ���������    TABLE     �   CREATE TABLE public."���������" (
    "����������_�����" integer NOT NULL,
    "������_�����_����������" integer NOT NULL,
    "����_���������" date NOT NULL,
    "���_���������" character varying(300) NOT NULL
);
    DROP TABLE public."���������";
       public         heap    postgres    false            �            1259    238103 #   ���������_������_�����_��������_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_������_�����_��������_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public."���������_������_�����_��������_seq";
       public          postgres    false    217            a           0    0 #   ���������_������_�����_��������_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public."���������_������_�����_��������_seq" OWNED BY public."���������"."������_�����_����������";
          public          postgres    false    216            �            1259    238101    ���������_����������_�����_seq    SEQUENCE     �   CREATE SEQUENCE public."���������_����������_�����_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public."���������_����������_�����_seq";
       public          postgres    false    217            b           0    0    ���������_����������_�����_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public."���������_����������_�����_seq" OWNED BY public."���������"."����������_�����";
          public          postgres    false    215            �
           2604    238059    ��������� ����������_�����    DEFAULT     �   ALTER TABLE ONLY public."���������" ALTER COLUMN "����������_�����" SET DEFAULT nextval('public."���������_����������_�����_seq"'::regclass);
 M   ALTER TABLE public."���������" ALTER COLUMN "����������_�����" DROP DEFAULT;
       public          postgres    false    208    207    208            �
           2604    238042 '   ���_������_����������� ����������_�����    DEFAULT     �   ALTER TABLE ONLY public."���_������_�����������" ALTER COLUMN "����������_�����" SET DEFAULT nextval('public."����_������_���_����������_����_seq"'::regclass);
 Z   ALTER TABLE public."���_������_�����������" ALTER COLUMN "����������_�����" DROP DEFAULT;
       public          postgres    false    206    204    206            �
           2604    238043 .   ���_������_����������� ������_�����_����������    DEFAULT     �   ALTER TABLE ONLY public."���_������_�����������" ALTER COLUMN "������_�����_����������" SET DEFAULT nextval('public."����_������_���_������_�����_��_seq"'::regclass);
 a   ALTER TABLE public."���_������_�����������" ALTER COLUMN "������_�����_����������" DROP DEFAULT;
       public          postgres    false    205    206    206            �
           2604    237981 3   ��������_������_����������� ������_�����_����������    DEFAULT     �   ALTER TABLE ONLY public."��������_������_�����������" ALTER COLUMN "������_�����_����������" SET DEFAULT nextval('public."��������_������_������_�����_��_seq"'::regclass);
 f   ALTER TABLE public."��������_������_�����������" ALTER COLUMN "������_�����_����������" DROP DEFAULT;
       public          postgres    false    203    202    203            �
           2604    238090    ��������� ����������_�����    DEFAULT     �   ALTER TABLE ONLY public."���������" ALTER COLUMN "����������_�����" SET DEFAULT nextval('public."���������_����������_�����_seq"'::regclass);
 M   ALTER TABLE public."���������" ALTER COLUMN "����������_�����" DROP DEFAULT;
       public          postgres    false    212    214    214            �
           2604    238091 !   ��������� ������_�����_����������    DEFAULT     �   ALTER TABLE ONLY public."���������" ALTER COLUMN "������_�����_����������" SET DEFAULT nextval('public."���������_������_�����_��������_seq"'::regclass);
 T   ALTER TABLE public."���������" ALTER COLUMN "������_�����_����������" DROP DEFAULT;
       public          postgres    false    213    214    214            �
           2604    238071 '   ���������_������������ ����������_�����    DEFAULT     �   ALTER TABLE ONLY public."���������_������������" ALTER COLUMN "����������_�����" SET DEFAULT nextval('public."���������_�����_����������_����_seq"'::regclass);
 Z   ALTER TABLE public."���������_������������" ALTER COLUMN "����������_�����" DROP DEFAULT;
       public          postgres    false    209    211    211            �
           2604    238072 .   ���������_������������ ������_�����_����������    DEFAULT     �   ALTER TABLE ONLY public."���������_������������" ALTER COLUMN "������_�����_����������" SET DEFAULT nextval('public."���������_�����_������_�����_��_seq"'::regclass);
 a   ALTER TABLE public."���������_������������" ALTER COLUMN "������_�����_����������" DROP DEFAULT;
       public          postgres    false    210    211    211            �
           2604    238108    ��������� ����������_�����    DEFAULT     �   ALTER TABLE ONLY public."���������" ALTER COLUMN "����������_�����" SET DEFAULT nextval('public."���������_����������_�����_seq"'::regclass);
 M   ALTER TABLE public."���������" ALTER COLUMN "����������_�����" DROP DEFAULT;
       public          postgres    false    215    217    217            �
           2604    238109 !   ��������� ������_�����_����������    DEFAULT     �   ALTER TABLE ONLY public."���������" ALTER COLUMN "������_�����_����������" SET DEFAULT nextval('public."���������_������_�����_��������_seq"'::regclass);
 T   ALTER TABLE public."���������" ALTER COLUMN "������_�����_����������" DROP DEFAULT;
       public          postgres    false    217    216    217            I          0    238056 	   ��������� 
   TABLE DATA                 public          postgres    false    208   &X       G          0    238039    ���_������_����������� 
   TABLE DATA                 public          postgres    false    206   @X       D          0    237978    ��������_������_����������� 
   TABLE DATA                 public          postgres    false    203   ZX       O          0    238087 	   ��������� 
   TABLE DATA                 public          postgres    false    214   tX       L          0    238068    ���������_������������ 
   TABLE DATA                 public          postgres    false    211   �X       R          0    238105 	   ��������� 
   TABLE DATA                 public          postgres    false    217   �X       c           0    0    ���������_����������_�����_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."���������_����������_�����_seq"', 1, false);
          public          postgres    false    207            d           0    0 #   ����_������_���_������_�����_��_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."����_������_���_������_�����_��_seq"', 1, false);
          public          postgres    false    205            e           0    0 #   ����_������_���_����������_����_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."����_������_���_����������_����_seq"', 1, false);
          public          postgres    false    204            f           0    0 #   ��������_������_������_�����_��_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."��������_������_������_�����_��_seq"', 1, false);
          public          postgres    false    202            g           0    0 #   ���������_������_�����_��������_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."���������_������_�����_��������_seq"', 1, false);
          public          postgres    false    213            h           0    0    ���������_����������_�����_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."���������_����������_�����_seq"', 1, false);
          public          postgres    false    212            i           0    0 #   ���������_�����_������_�����_��_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."���������_�����_������_�����_��_seq"', 1, false);
          public          postgres    false    210            j           0    0 #   ���������_�����_����������_����_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."���������_�����_����������_����_seq"', 1, false);
          public          postgres    false    209            k           0    0 #   ���������_������_�����_��������_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."���������_������_�����_��������_seq"', 1, false);
          public          postgres    false    216            l           0    0    ���������_����������_�����_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."���������_����������_�����_seq"', 1, false);
          public          postgres    false    215            �
           2606    238063    ��������� cod_dolj_unique 
   CONSTRAINT     a   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT cod_dolj_unique UNIQUE ("���_���������");
 E   ALTER TABLE ONLY public."���������" DROP CONSTRAINT cod_dolj_unique;
       public            postgres    false    208            �
           2606    238045 (   ���_������_����������� num_dop_sotr_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public."���_������_�����������"
    ADD CONSTRAINT num_dop_sotr_pkey PRIMARY KEY ("����������_�����");
 T   ALTER TABLE ONLY public."���_������_�����������" DROP CONSTRAINT num_dop_sotr_pkey;
       public            postgres    false    206            �
           2606    237983 $   ��������_������_����������� num_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public."��������_������_�����������"
    ADD CONSTRAINT num_pkey PRIMARY KEY ("������_�����_����������");
 P   ALTER TABLE ONLY public."��������_������_�����������" DROP CONSTRAINT num_pkey;
       public            postgres    false    203            �
           2606    238061 !   ��������� vnutr_dolzh_pkey_unique 
   CONSTRAINT     q   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT vnutr_dolzh_pkey_unique PRIMARY KEY ("����������_�����");
 M   ALTER TABLE ONLY public."���������" DROP CONSTRAINT vnutr_dolzh_pkey_unique;
       public            postgres    false    208            �
           2606    238111    ��������� vnutr_num_vzsk_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT vnutr_num_vzsk_pkey PRIMARY KEY ("����������_�����");
 I   ALTER TABLE ONLY public."���������" DROP CONSTRAINT vnutr_num_vzsk_pkey;
       public            postgres    false    217            �
           2606    238077 %   ���������_������������ vnutr_pov_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public."���������_������������"
    ADD CONSTRAINT vnutr_pov_pkey PRIMARY KEY ("����������_�����");
 Q   ALTER TABLE ONLY public."���������_������������" DROP CONSTRAINT vnutr_pov_pkey;
       public            postgres    false    211            �
           2606    238093    ��������� ���������_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT "���������_pkey" PRIMARY KEY ("����������_�����");
 F   ALTER TABLE ONLY public."���������" DROP CONSTRAINT "���������_pkey";
       public            postgres    false    214            �
           2606    238095 (   ��������� ���������_����������_�����_key 
   CONSTRAINT     u   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT "���������_����������_�����_key" UNIQUE ("����������_�����");
 V   ALTER TABLE ONLY public."���������" DROP CONSTRAINT "���������_����������_�����_key";
       public            postgres    false    214            �
           2606    238046 #   ���_������_����������� lich_num_key    FK CONSTRAINT     �   ALTER TABLE ONLY public."���_������_�����������"
    ADD CONSTRAINT lich_num_key FOREIGN KEY ("������_�����_����������") REFERENCES public."��������_������_�����������"("������_�����_����������");
 O   ALTER TABLE ONLY public."���_������_�����������" DROP CONSTRAINT lich_num_key;
       public          postgres    false    206    2738    203            �
           2606    238096    ��������� lich_num_pochr_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT lich_num_pochr_fkey FOREIGN KEY ("������_�����_����������") REFERENCES public."��������_������_�����������"("������_�����_����������") NOT VALID;
 I   ALTER TABLE ONLY public."���������" DROP CONSTRAINT lich_num_pochr_fkey;
       public          postgres    false    203    214    2738            �
           2606    238078 (   ���������_������������ lich_num_pov_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."���������_������������"
    ADD CONSTRAINT lich_num_pov_fkey FOREIGN KEY ("������_�����_����������") REFERENCES public."��������_������_�����������"("������_�����_����������");
 T   ALTER TABLE ONLY public."���������_������������" DROP CONSTRAINT lich_num_pov_fkey;
       public          postgres    false    203    211    2738            �
           2606    238112    ��������� lich_num_vzisk_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."���������"
    ADD CONSTRAINT lich_num_vzisk_fkey FOREIGN KEY ("������_�����_����������") REFERENCES public."��������_������_�����������"("������_�����_����������");
 I   ALTER TABLE ONLY public."���������" DROP CONSTRAINT lich_num_vzisk_fkey;
       public          postgres    false    217    2738    203            I   
   x���          G   
   x���          D   
   x���          O   
   x���          L   
   x���          R   
   x���         