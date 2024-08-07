PGDMP  
    1                |         	   cpen_dept    16.3    16.3 P    J           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            K           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            L           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            M           1262    40960 	   cpen_dept    DATABASE     �   CREATE DATABASE cpen_dept WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
    DROP DATABASE cpen_dept;
                postgres    false                        2615    40962    course_mngt    SCHEMA        CREATE SCHEMA course_mngt;
    DROP SCHEMA course_mngt;
                postgres    false                        2615    40963 
   staff_mngt    SCHEMA        CREATE SCHEMA staff_mngt;
    DROP SCHEMA staff_mngt;
                postgres    false                        2615    40961    student_mngt    SCHEMA        CREATE SCHEMA student_mngt;
    DROP SCHEMA student_mngt;
                postgres    false            �            1255    57412    calculate_outstanding_fees()    FUNCTION        CREATE FUNCTION public.calculate_outstanding_fees() RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result JSON;
BEGIN
    -- Calculate outstanding fees for each student and return as JSON array
    SELECT json_agg(json_build_object(
        'student_id', s.student_id,
        'student_name', s.student_name,
        'total_fees', f.total_fees,
        'amount_paid', COALESCE(SUM(fp.amount_paid), 0),
        'outstanding_fees', f.total_fees - COALESCE(SUM(fp.amount_paid), 0)
    ))
    INTO result
    FROM student_mngt.student s
    LEFT JOIN student_mngt.fees f ON s.student_id = f.student_id
    LEFT JOIN student_mngt.fees_payment fp ON s.student_id = fp.student_id
    GROUP BY s.student_id, s.student_name, f.total_fees;

    RETURN result;
END;
$$;
 3   DROP FUNCTION public.calculate_outstanding_fees();
       public          postgres    false            �            1255    40972    generate_student_id()    FUNCTION     �   CREATE FUNCTION public.generate_student_id() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    NEW.student_id := '11' || LPAD(nextval('student_id_seq')::TEXT, 6, '0');
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.generate_student_id();
       public          postgres    false            �            1255    57413    calculate_outstanding_fees()    FUNCTION     Q  CREATE FUNCTION student_mngt.calculate_outstanding_fees() RETURNS json
    LANGUAGE plpgsql
    AS $$
DECLARE
    result JSON;
BEGIN
    -- Calculate outstanding fees for each student and return as JSON array
    SELECT json_agg(json_build_object(
        'student_id', student.student_id ,
        'student_name', student.student_name ,
        'total_fees', fees.total_fees,
        'amount_paid', COALESCE(SUM(fees_payment.amount_paid), 0),
        'outstanding_fees', fees.total_fees - COALESCE(SUM(fees_payment.amount_paid), 0)
    ))
    INTO result
    FROM student_mngt.student
    LEFT JOIN student_mngt.fees  ON student.student_id = fees.student_id
    LEFT JOIN student_mngt.fees_payment  ON student.student_id = fees_payment.student_id
    GROUP BY student.student_id, student.student_name, fees.total_fees;

    RETURN result;
END;
$$;
 9   DROP FUNCTION student_mngt.calculate_outstanding_fees();
       student_mngt          postgres    false    6            �            1259    41040    course    TABLE     �   CREATE TABLE course_mngt.course (
    course_id integer NOT NULL,
    course_name character varying(100) NOT NULL,
    course_code character varying(10) NOT NULL
);
    DROP TABLE course_mngt.course;
       course_mngt         heap    postgres    false    7            �            1259    57352    course_assignment    TABLE     �   CREATE TABLE course_mngt.course_assignment (
    assignment_id integer NOT NULL,
    course_id integer,
    lecturer_id integer,
    assignment_date date NOT NULL
);
 *   DROP TABLE course_mngt.course_assignment;
       course_mngt         heap    postgres    false    7            �            1259    57351 #   course_assignment_assignment_id_seq    SEQUENCE     �   CREATE SEQUENCE course_mngt.course_assignment_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE course_mngt.course_assignment_assignment_id_seq;
       course_mngt          postgres    false    7    229            N           0    0 #   course_assignment_assignment_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE course_mngt.course_assignment_assignment_id_seq OWNED BY course_mngt.course_assignment.assignment_id;
          course_mngt          postgres    false    228            �            1259    41039    course_course_id_seq    SEQUENCE     �   CREATE SEQUENCE course_mngt.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE course_mngt.course_course_id_seq;
       course_mngt          postgres    false    7    223            O           0    0    course_course_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE course_mngt.course_course_id_seq OWNED BY course_mngt.course.course_id;
          course_mngt          postgres    false    222            �            1259    49179 
   enrollment    TABLE     �   CREATE TABLE course_mngt.enrollment (
    enrollment_id integer NOT NULL,
    student_id character varying(8),
    course_id integer,
    enrollment_date date NOT NULL
);
 #   DROP TABLE course_mngt.enrollment;
       course_mngt         heap    postgres    false    7            �            1259    49178    enrollment_enrollment_id_seq    SEQUENCE     �   CREATE SEQUENCE course_mngt.enrollment_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE course_mngt.enrollment_enrollment_id_seq;
       course_mngt          postgres    false    7    225            P           0    0    enrollment_enrollment_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE course_mngt.enrollment_enrollment_id_seq OWNED BY course_mngt.enrollment.enrollment_id;
          course_mngt          postgres    false    224            �            1259    40964    student_id_seq    SEQUENCE     |   CREATE SEQUENCE public.student_id_seq
    START WITH 237891
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.student_id_seq;
       public          postgres    false            �            1259    49196    lecturer    TABLE     �   CREATE TABLE staff_mngt.lecturer (
    lecturer_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15)
);
     DROP TABLE staff_mngt.lecturer;
    
   staff_mngt         heap    postgres    false    8            �            1259    49195    lecturer_lecturer_id_seq    SEQUENCE     �   CREATE SEQUENCE staff_mngt.lecturer_lecturer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE staff_mngt.lecturer_lecturer_id_seq;
    
   staff_mngt          postgres    false    227    8            Q           0    0    lecturer_lecturer_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE staff_mngt.lecturer_lecturer_id_seq OWNED BY staff_mngt.lecturer.lecturer_id;
       
   staff_mngt          postgres    false    226            �            1259    57378    ta_assignment    TABLE     �   CREATE TABLE staff_mngt.ta_assignment (
    ta_assignment_id integer NOT NULL,
    course_id integer,
    ta_id integer,
    assignment_date date NOT NULL
);
 %   DROP TABLE staff_mngt.ta_assignment;
    
   staff_mngt         heap    postgres    false    8            �            1259    57377 "   ta_assignment_ta_assignment_id_seq    SEQUENCE     �   CREATE SEQUENCE staff_mngt.ta_assignment_ta_assignment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 =   DROP SEQUENCE staff_mngt.ta_assignment_ta_assignment_id_seq;
    
   staff_mngt          postgres    false    8    233            R           0    0 "   ta_assignment_ta_assignment_id_seq    SEQUENCE OWNED BY     q   ALTER SEQUENCE staff_mngt.ta_assignment_ta_assignment_id_seq OWNED BY staff_mngt.ta_assignment.ta_assignment_id;
       
   staff_mngt          postgres    false    232            �            1259    57369    teaching_assistant    TABLE     �   CREATE TABLE staff_mngt.teaching_assistant (
    ta_id integer NOT NULL,
    fullname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15)
);
 *   DROP TABLE staff_mngt.teaching_assistant;
    
   staff_mngt         heap    postgres    false    8            �            1259    57368    teaching_assistant_ta_id_seq    SEQUENCE     �   CREATE SEQUENCE staff_mngt.teaching_assistant_ta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE staff_mngt.teaching_assistant_ta_id_seq;
    
   staff_mngt          postgres    false    231    8            S           0    0    teaching_assistant_ta_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE staff_mngt.teaching_assistant_ta_id_seq OWNED BY staff_mngt.teaching_assistant.ta_id;
       
   staff_mngt          postgres    false    230            �            1259    57402    fees    TABLE     o   CREATE TABLE student_mngt.fees (
    student_id character varying(8) NOT NULL,
    total_fees numeric(10,2)
);
    DROP TABLE student_mngt.fees;
       student_mngt         heap    postgres    false    6            �            1259    41022    fees_payment    TABLE     �   CREATE TABLE student_mngt.fees_payment (
    payment_id integer NOT NULL,
    student_id character varying(8),
    amount_paid numeric(10,2) NOT NULL,
    payment_date date NOT NULL
);
 &   DROP TABLE student_mngt.fees_payment;
       student_mngt         heap    postgres    false    6            �            1259    41021    fees_payment_payment_id_seq    SEQUENCE     �   CREATE SEQUENCE student_mngt.fees_payment_payment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE student_mngt.fees_payment_payment_id_seq;
       student_mngt          postgres    false    6    221            T           0    0    fees_payment_payment_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE student_mngt.fees_payment_payment_id_seq OWNED BY student_mngt.fees_payment.payment_id;
          student_mngt          postgres    false    220            �            1259    41006    student    TABLE     �   CREATE TABLE student_mngt.student (
    student_id character varying(8) NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    phone character varying(15)
);
 !   DROP TABLE student_mngt.student;
       student_mngt         heap    postgres    false    6                       2604    41043    course course_id    DEFAULT     ~   ALTER TABLE ONLY course_mngt.course ALTER COLUMN course_id SET DEFAULT nextval('course_mngt.course_course_id_seq'::regclass);
 D   ALTER TABLE course_mngt.course ALTER COLUMN course_id DROP DEFAULT;
       course_mngt          postgres    false    222    223    223            �           2604    57355    course_assignment assignment_id    DEFAULT     �   ALTER TABLE ONLY course_mngt.course_assignment ALTER COLUMN assignment_id SET DEFAULT nextval('course_mngt.course_assignment_assignment_id_seq'::regclass);
 S   ALTER TABLE course_mngt.course_assignment ALTER COLUMN assignment_id DROP DEFAULT;
       course_mngt          postgres    false    228    229    229            �           2604    49182    enrollment enrollment_id    DEFAULT     �   ALTER TABLE ONLY course_mngt.enrollment ALTER COLUMN enrollment_id SET DEFAULT nextval('course_mngt.enrollment_enrollment_id_seq'::regclass);
 L   ALTER TABLE course_mngt.enrollment ALTER COLUMN enrollment_id DROP DEFAULT;
       course_mngt          postgres    false    225    224    225            �           2604    49199    lecturer lecturer_id    DEFAULT     �   ALTER TABLE ONLY staff_mngt.lecturer ALTER COLUMN lecturer_id SET DEFAULT nextval('staff_mngt.lecturer_lecturer_id_seq'::regclass);
 G   ALTER TABLE staff_mngt.lecturer ALTER COLUMN lecturer_id DROP DEFAULT;
    
   staff_mngt          postgres    false    227    226    227            �           2604    57381    ta_assignment ta_assignment_id    DEFAULT     �   ALTER TABLE ONLY staff_mngt.ta_assignment ALTER COLUMN ta_assignment_id SET DEFAULT nextval('staff_mngt.ta_assignment_ta_assignment_id_seq'::regclass);
 Q   ALTER TABLE staff_mngt.ta_assignment ALTER COLUMN ta_assignment_id DROP DEFAULT;
    
   staff_mngt          postgres    false    233    232    233            �           2604    57372    teaching_assistant ta_id    DEFAULT     �   ALTER TABLE ONLY staff_mngt.teaching_assistant ALTER COLUMN ta_id SET DEFAULT nextval('staff_mngt.teaching_assistant_ta_id_seq'::regclass);
 K   ALTER TABLE staff_mngt.teaching_assistant ALTER COLUMN ta_id DROP DEFAULT;
    
   staff_mngt          postgres    false    230    231    231            ~           2604    41025    fees_payment payment_id    DEFAULT     �   ALTER TABLE ONLY student_mngt.fees_payment ALTER COLUMN payment_id SET DEFAULT nextval('student_mngt.fees_payment_payment_id_seq'::regclass);
 L   ALTER TABLE student_mngt.fees_payment ALTER COLUMN payment_id DROP DEFAULT;
       student_mngt          postgres    false    221    220    221            <          0    41040    course 
   TABLE DATA           J   COPY course_mngt.course (course_id, course_name, course_code) FROM stdin;
    course_mngt          postgres    false    223   �i       B          0    57352    course_assignment 
   TABLE DATA           h   COPY course_mngt.course_assignment (assignment_id, course_id, lecturer_id, assignment_date) FROM stdin;
    course_mngt          postgres    false    229   �j       >          0    49179 
   enrollment 
   TABLE DATA           `   COPY course_mngt.enrollment (enrollment_id, student_id, course_id, enrollment_date) FROM stdin;
    course_mngt          postgres    false    225   k       @          0    49196    lecturer 
   TABLE DATA           L   COPY staff_mngt.lecturer (lecturer_id, full_name, email, phone) FROM stdin;
 
   staff_mngt          postgres    false    227   �k       F          0    57378    ta_assignment 
   TABLE DATA           `   COPY staff_mngt.ta_assignment (ta_assignment_id, course_id, ta_id, assignment_date) FROM stdin;
 
   staff_mngt          postgres    false    233   �l       D          0    57369    teaching_assistant 
   TABLE DATA           O   COPY staff_mngt.teaching_assistant (ta_id, fullname, email, phone) FROM stdin;
 
   staff_mngt          postgres    false    231   m       G          0    57402    fees 
   TABLE DATA           <   COPY student_mngt.fees (student_id, total_fees) FROM stdin;
    student_mngt          postgres    false    234   �m       :          0    41022    fees_payment 
   TABLE DATA           _   COPY student_mngt.fees_payment (payment_id, student_id, amount_paid, payment_date) FROM stdin;
    student_mngt          postgres    false    221   �n       8          0    41006    student 
   TABLE DATA           X   COPY student_mngt.student (student_id, first_name, last_name, email, phone) FROM stdin;
    student_mngt          postgres    false    219   hp       U           0    0 #   course_assignment_assignment_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('course_mngt.course_assignment_assignment_id_seq', 1, false);
          course_mngt          postgres    false    228            V           0    0    course_course_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('course_mngt.course_course_id_seq', 1, false);
          course_mngt          postgres    false    222            W           0    0    enrollment_enrollment_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('course_mngt.enrollment_enrollment_id_seq', 40, true);
          course_mngt          postgres    false    224            X           0    0    student_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.student_id_seq', 238070, true);
          public          postgres    false    218            Y           0    0    lecturer_lecturer_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('staff_mngt.lecturer_lecturer_id_seq', 1, false);
       
   staff_mngt          postgres    false    226            Z           0    0 "   ta_assignment_ta_assignment_id_seq    SEQUENCE SET     U   SELECT pg_catalog.setval('staff_mngt.ta_assignment_ta_assignment_id_seq', 16, true);
       
   staff_mngt          postgres    false    232            [           0    0    teaching_assistant_ta_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('staff_mngt.teaching_assistant_ta_id_seq', 1, false);
       
   staff_mngt          postgres    false    230            \           0    0    fees_payment_payment_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('student_mngt.fees_payment_payment_id_seq', 120, true);
          student_mngt          postgres    false    220            �           2606    57357 (   course_assignment course_assignment_pkey 
   CONSTRAINT     v   ALTER TABLE ONLY course_mngt.course_assignment
    ADD CONSTRAINT course_assignment_pkey PRIMARY KEY (assignment_id);
 W   ALTER TABLE ONLY course_mngt.course_assignment DROP CONSTRAINT course_assignment_pkey;
       course_mngt            postgres    false    229            �           2606    41047    course course_course_code_key 
   CONSTRAINT     d   ALTER TABLE ONLY course_mngt.course
    ADD CONSTRAINT course_course_code_key UNIQUE (course_code);
 L   ALTER TABLE ONLY course_mngt.course DROP CONSTRAINT course_course_code_key;
       course_mngt            postgres    false    223            �           2606    41045    course course_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY course_mngt.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);
 A   ALTER TABLE ONLY course_mngt.course DROP CONSTRAINT course_pkey;
       course_mngt            postgres    false    223            �           2606    49184    enrollment enrollment_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY course_mngt.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);
 I   ALTER TABLE ONLY course_mngt.enrollment DROP CONSTRAINT enrollment_pkey;
       course_mngt            postgres    false    225            �           2606    49203    lecturer lecturer_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY staff_mngt.lecturer
    ADD CONSTRAINT lecturer_email_key UNIQUE (email);
 I   ALTER TABLE ONLY staff_mngt.lecturer DROP CONSTRAINT lecturer_email_key;
    
   staff_mngt            postgres    false    227            �           2606    49201    lecturer lecturer_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY staff_mngt.lecturer
    ADD CONSTRAINT lecturer_pkey PRIMARY KEY (lecturer_id);
 D   ALTER TABLE ONLY staff_mngt.lecturer DROP CONSTRAINT lecturer_pkey;
    
   staff_mngt            postgres    false    227            �           2606    57383     ta_assignment ta_assignment_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY staff_mngt.ta_assignment
    ADD CONSTRAINT ta_assignment_pkey PRIMARY KEY (ta_assignment_id);
 N   ALTER TABLE ONLY staff_mngt.ta_assignment DROP CONSTRAINT ta_assignment_pkey;
    
   staff_mngt            postgres    false    233            �           2606    57376 /   teaching_assistant teaching_assistant_email_key 
   CONSTRAINT     o   ALTER TABLE ONLY staff_mngt.teaching_assistant
    ADD CONSTRAINT teaching_assistant_email_key UNIQUE (email);
 ]   ALTER TABLE ONLY staff_mngt.teaching_assistant DROP CONSTRAINT teaching_assistant_email_key;
    
   staff_mngt            postgres    false    231            �           2606    57374 *   teaching_assistant teaching_assistant_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY staff_mngt.teaching_assistant
    ADD CONSTRAINT teaching_assistant_pkey PRIMARY KEY (ta_id);
 X   ALTER TABLE ONLY staff_mngt.teaching_assistant DROP CONSTRAINT teaching_assistant_pkey;
    
   staff_mngt            postgres    false    231            �           2606    41027    fees_payment fees_payment_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY student_mngt.fees_payment
    ADD CONSTRAINT fees_payment_pkey PRIMARY KEY (payment_id);
 N   ALTER TABLE ONLY student_mngt.fees_payment DROP CONSTRAINT fees_payment_pkey;
       student_mngt            postgres    false    221            �           2606    57406    fees fees_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY student_mngt.fees
    ADD CONSTRAINT fees_pkey PRIMARY KEY (student_id);
 >   ALTER TABLE ONLY student_mngt.fees DROP CONSTRAINT fees_pkey;
       student_mngt            postgres    false    234            �           2606    41012    student student_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY student_mngt.student
    ADD CONSTRAINT student_email_key UNIQUE (email);
 I   ALTER TABLE ONLY student_mngt.student DROP CONSTRAINT student_email_key;
       student_mngt            postgres    false    219            �           2606    41010    student student_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY student_mngt.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (student_id);
 D   ALTER TABLE ONLY student_mngt.student DROP CONSTRAINT student_pkey;
       student_mngt            postgres    false    219            �           2620    41013    student set_student_id    TRIGGER     �   CREATE TRIGGER set_student_id BEFORE INSERT ON student_mngt.student FOR EACH ROW EXECUTE FUNCTION public.generate_student_id();
 5   DROP TRIGGER set_student_id ON student_mngt.student;
       student_mngt          postgres    false    219    235            �           2606    57358 2   course_assignment course_assignment_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY course_mngt.course_assignment
    ADD CONSTRAINT course_assignment_course_id_fkey FOREIGN KEY (course_id) REFERENCES course_mngt.course(course_id);
 a   ALTER TABLE ONLY course_mngt.course_assignment DROP CONSTRAINT course_assignment_course_id_fkey;
       course_mngt          postgres    false    4750    229    223            �           2606    57363 4   course_assignment course_assignment_lecturer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY course_mngt.course_assignment
    ADD CONSTRAINT course_assignment_lecturer_id_fkey FOREIGN KEY (lecturer_id) REFERENCES staff_mngt.lecturer(lecturer_id);
 c   ALTER TABLE ONLY course_mngt.course_assignment DROP CONSTRAINT course_assignment_lecturer_id_fkey;
       course_mngt          postgres    false    4756    227    229            �           2606    49190 $   enrollment enrollment_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY course_mngt.enrollment
    ADD CONSTRAINT enrollment_course_id_fkey FOREIGN KEY (course_id) REFERENCES course_mngt.course(course_id);
 S   ALTER TABLE ONLY course_mngt.enrollment DROP CONSTRAINT enrollment_course_id_fkey;
       course_mngt          postgres    false    4750    223    225            �           2606    49185 %   enrollment enrollment_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY course_mngt.enrollment
    ADD CONSTRAINT enrollment_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_mngt.student(student_id);
 T   ALTER TABLE ONLY course_mngt.enrollment DROP CONSTRAINT enrollment_student_id_fkey;
       course_mngt          postgres    false    225    4744    219            �           2606    57384 *   ta_assignment ta_assignment_course_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY staff_mngt.ta_assignment
    ADD CONSTRAINT ta_assignment_course_id_fkey FOREIGN KEY (course_id) REFERENCES course_mngt.course(course_id);
 X   ALTER TABLE ONLY staff_mngt.ta_assignment DROP CONSTRAINT ta_assignment_course_id_fkey;
    
   staff_mngt          postgres    false    223    4750    233            �           2606    57389 &   ta_assignment ta_assignment_ta_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY staff_mngt.ta_assignment
    ADD CONSTRAINT ta_assignment_ta_id_fkey FOREIGN KEY (ta_id) REFERENCES staff_mngt.teaching_assistant(ta_id);
 T   ALTER TABLE ONLY staff_mngt.ta_assignment DROP CONSTRAINT ta_assignment_ta_id_fkey;
    
   staff_mngt          postgres    false    233    4762    231            �           2606    41028 )   fees_payment fees_payment_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY student_mngt.fees_payment
    ADD CONSTRAINT fees_payment_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_mngt.student(student_id);
 Y   ALTER TABLE ONLY student_mngt.fees_payment DROP CONSTRAINT fees_payment_student_id_fkey;
       student_mngt          postgres    false    4744    219    221            �           2606    57407    fees fees_student_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY student_mngt.fees
    ADD CONSTRAINT fees_student_id_fkey FOREIGN KEY (student_id) REFERENCES student_mngt.student(student_id);
 I   ALTER TABLE ONLY student_mngt.fees DROP CONSTRAINT fees_student_id_fkey;
       student_mngt          postgres    false    219    234    4744            <   �   x�=�MK�0�ϙ_1�@ұֶֽȂ,B^���;�I5� �{�G=?�GC�̰Ʒ���}n�G�dIfx�NX9�֌^=:-AK�}:c]�,z���pK�3O��g$�"�O;h��[g��qJK9KZv� w�X��(_j~�x<��wX!t���:<�$���i�i�_�2Ϝ9��+N��Or������ |�;K�      B   `   x�e�A�0Cѵ�KG�@�ޥ�?G�.�쐞>2A�@*��g\�\N$O��B>�W�H��<��B��ځ���.&�Z5w�*���]�?3� ��"�      >   �   x�]ѻCAD�x�[0������0�Gk6@B:҅���<[N�|����2�!�FZ?`���:8d�m����&�d�u�>��-ۗm�=�=���sC���s��d�jD�K�u�@�~zzG�K�6ꒁ�M��d�j�.h���7B]2P�]]2P1>o _��a�      @   �   x�m�=o� @g�W�,̇��"U"%S�.��5��T*���LNoy�==ݵ-R�Kr��L���痘�<7Ә���e�t'5^��b1F\�9l������=c�#�sv7��B����a��w;�M1�@V�~��-lɒ;~�<(J�X�AU��HMJ�6�d�<�T�{���Q
v�&���s�=+��P���L�7wC�׼�!�(�� � m0i�      F   a   x�m���PB�x�T��f��?Gݜ��7��C�i��jL̍�F��uVW�!!ͅ�1d��F=�8��L��x���x���L��o���� �WD|�$      D   �   x�]�=N�0��>�O���O�t!
$:J��ge�H�
q{�����73oΤ�u� #*�@SAx�dp:�����|g��z�c����O�^�'ڼ��+��9�Y��o|�%"sh��m{�Hڽ��g�\�M\��퀍h�^��Kl���Z�{����6������ň�o=p�Yc�|�v�����umX�����-�|?I) ��a       G   �   x�]λ�0 ����/a�����;��tN��y����{���B	-�p��bN�i8��4���pN�i:M��4���t�N�i:-�崜��rZN�i9-�崝��v�N�i;m������q:N��8��t���q:N���s������7      :   �  x�e�˭�@Dѵ��<�Ov.�?S�ps��S�f�'��e�燃RQ��U��P��kQ:�?�jSj<��|(5����,�z�~V��Q��U��'כ���U�!N+��!A+խ!I+��!E+��!M+�/�C+ͭ�L+���B+���J+=[C�V�[C�V&[C�V�[C�Vf[C�V�[C�V_�V�[ØVV�F}X�ae}kLUjXٹ5�X9�S��\n�z7x`�zkԻ�+�[��X���n����֨w�V�[c6x`�5f�V�[c6x`�gk����9f���
��Bap�n���0�¶��P`�d�(��/�3d�e�(���2[Z�f�1
C-�f�5�@-y��E���Yf���u�� E�6'��"E����i�&P�����Q���?��r�����W�������o��~;����j���:5�~��73>9      8   l  x����N�H���wY�&��ΰ�Y�f���T�r�$ng�m"��oI7ڡ[�͑��N��,ˋ�,��F�*Xm'��l��ȥ.��%��r��,/����Ev�r��ZDW-�G|�D\�V͈����B�F$A�*�fC�~�����mD\�
VFY::���?�H,=X�#v�ߓ�z�C�Vyl+~O�u;i��I@��p߷�u��	ͮ��I`s�-�r��i'⏛�U�qJ��3��ޟ�����kY��S\�5��!X�ё�����;%ϥ�#���Qs!E~������v;���;8�Hʼ���Zm�	��z�V$���\y_zײ)��n��	����KoF�8[x��5��3<���G@$Δ�[��Ѿj+���C�8Tyg��]Gd�ߍ0�b�C�wV��?68��U�Ԡz�85��*�x�V���u(��WE����@���X�8���*r.>�b�#v7*���c����vQ�5��7]͞E"	�w�`�h.��F�	Z�$߰�z���2�,	k�e{C)���c�j;�V"����s��`�Y2np����	24n_�i�N�׈��x!���ǁ-{k=�� r�H�+gܺ����ҋ$�����S��yR���[�_�J"d>[*砚h�k���!�'M`�!e�qc����I`>ʒ���y#�畱;�$0o����{՜�4ԂB��U�}�2S�q6�H��*%?���#ܿ���3�e�y_��sT}'�qV����O��{1�+O��$ o�jv.�w����2��U��3Z��v�hT(��j��s��Cdİđ< �r��$?$|<|�3\[����q��~#g��T�Mv���t�.�j�8V�>�6M�w��q����:��E��< ����Q�<�"q,�b��
>7I�/��g�آ�����Ύ�wn�� ����ζ�B��N$΄�R���3���!����e�X��Wϻ������漠����'�%�v$��r�+��l�i4|�h�DA���5��!�|�,g{N)��H��G=�ҟ��n4p�n>�͉	N��+�^�=o2tK
U�'����Fԉ�\���xhz�98z�D�ʋ./..��T��     