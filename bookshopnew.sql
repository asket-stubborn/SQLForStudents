PGDMP                           x            Bookshop    12.2    12.2     ~           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    41379    Bookshop    DATABASE     �   CREATE DATABASE "Bookshop" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';
    DROP DATABASE "Bookshop";
                postgres    false            g          0    41380    Доставка 
   TABLE DATA           �   COPY public."Доставка" ("код_доставки", "код_заказа", "адрес_доставки", "код_курьера", "доставлен") FROM stdin;
    public          postgres    false    202   �       k          0    41390    Заказчики 
   TABLE DATA           u   COPY public."Заказчики" ("Код_заказчика", "Имя", "Адрес", "Телефон") FROM stdin;
    public          postgres    false    206          m          0    41395    Заказы 
   TABLE DATA           �   COPY public."Заказы" ("внутренний_индекс", "код_книги", "код_заказчика", "Оплачен", "Дата", "оформил", "код_заказа") FROM stdin;
    public          postgres    false    208          r          0    41407 
   Книги 
   TABLE DATA           �   COPY public."Книги" ("Код_книги", "Автор", "Название", "Издательство", "Цена", "Остаток") FROM stdin;
    public          postgres    false    213   �       t          0    41412    Поставки 
   TABLE DATA           �   COPY public."Поставки" ("Номер", "Код_книги", "Код_поставщика", "Количество", "Дата") FROM stdin;
    public          postgres    false    215   �       v          0    41417    Поставщики 
   TABLE DATA           �   COPY public."Поставщики" ("код_поставщика", "Название", "Город", "Адрес", "Телефон") FROM stdin;
    public          postgres    false    217   �       x          0    41423    Сотрудники 
   TABLE DATA           {   COPY public."Сотрудники" ("код_сотрудника", "ФИО", "должность", "стаж") FROM stdin;
    public          postgres    false    219   {       y          0    41427    Сотрудники5 
   TABLE DATA           |   COPY public."Сотрудники5" ("код_сотрудника", "ФИО", "должность", "стаж") FROM stdin;
    public          postgres    false    220          �           0    0 ,   Доставка_код_доставки_seq    SEQUENCE SET     ]   SELECT pg_catalog.setval('public."Доставка_код_доставки_seq"', 1, false);
          public          postgres    false    203            �           0    0 (   Доставка_код_заказа_seq    SEQUENCE SET     Y   SELECT pg_catalog.setval('public."Доставка_код_заказа_seq"', 1, false);
          public          postgres    false    204            �           0    0 *   Доставка_код_курьера_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."Доставка_код_курьера_seq"', 1, false);
          public          postgres    false    205            �           0    0 0   Заказчики_Код_заказчика_seq    SEQUENCE SET     a   SELECT pg_catalog.setval('public."Заказчики_Код_заказчика_seq"', 1, false);
          public          postgres    false    207            �           0    0 $   Заказы_код_заказа_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public."Заказы_код_заказа_seq"', 3, true);
          public          postgres    false    209            �           0    0 *   Заказы_код_заказчика_seq    SEQUENCE SET     [   SELECT pg_catalog.setval('public."Заказы_код_заказчика_seq"', 1, false);
          public          postgres    false    210            �           0    0 "   Заказы_код_книги_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('public."Заказы_код_книги_seq"', 1, false);
          public          postgres    false    211            �           0    0    Заказы_оформил_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public."Заказы_оформил_seq"', 1, true);
          public          postgres    false    212            �           0    0     Книги_Код_книги_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('public."Книги_Код_книги_seq"', 1, false);
          public          postgres    false    214            �           0    0    Поставки_Номер_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public."Поставки_Номер_seq"', 1, false);
          public          postgres    false    216            �           0    0 4   Поставщики_код_поставщика_seq    SEQUENCE SET     e   SELECT pg_catalog.setval('public."Поставщики_код_поставщика_seq"', 1, false);
          public          postgres    false    218            �           0    0 5   Сотрудники5_код_сотрудника_seq    SEQUENCE SET     f   SELECT pg_catalog.setval('public."Сотрудники5_код_сотрудника_seq"', 1, false);
          public          postgres    false    221            �           0    0 4   Сотрудники_код_сотрудника_seq    SEQUENCE SET     d   SELECT pg_catalog.setval('public."Сотрудники_код_сотрудника_seq"', 6, true);
          public          postgres    false    222            g   &   x�3�4估I�.l��v\�3����� �T�      k   �   x�]�AN�0E��S�E��[p���R7,
����n`k�FM�^�ύ�m(��4���=��\����yB��b�?�X�h�`��2w!���&z�Q7�I��,[��аhp������6�>�I#�$ɜ�)��ߟ �e����>��x�zH�x���V3����o]��y��S���M���~{n>RK�އǋ�:���V�|0�BC���{D?,�1W�5��      m   p   x�u���0��.A�IB�af��za�t�>ڴHH�>���M�շ�Wפ%i�*�������Rő�o�\o�H	��G�_�iA˘����>�YA���K<�#�b� �H�3�      r     x�m�MN�0���S� (r�f�E8L�X�ԔB �+$'����,8��xc)HHll���{o&�-��`F#x���X"ĭEoS�UϞ}/�С���sW��k)�J��@̌I� �`��g^{������ԃ�爞�V�Y��3k�Ic
�XT*��J�\�Y����ԲTh�e��<qTO�9�XV�l��ÉW͏���2�L�^c�֗�Srm�n`���Mn
U4���G>�T,�.�Q�SW��)>�~N4�Ȓ���dƘ�_      t   %   x�3�4B# 22�50�50�2�4�b�=... ���      v   �   x�E���0�ki
 9+�,�&@K�Qq@�?Gcfx�����t��$���/���Ry-�{<�F�[����Y�Vׄ="���Q�1��bep���Ä01�����;�)��iR@,�J��[��ֈ����U���X�      x   w   x�3�0�¦.�U�1.��;.��p^�u��b�Ş[/6ppq^Xrq�-�]lP@0zQ�8/L r�\�4l��ƋM@��@�@���t���`�eB5��L��)W� �w;      y      x������ � �     