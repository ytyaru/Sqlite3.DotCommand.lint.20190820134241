SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd "$SCRIPT_DIR"

sqlite3 :memory: \
"PRAGMA foreign_keys = ON;" \
"create table classes(id integer primary key, name text);" \
"create index idx_classes_id on classes(id);" \
"create table users(id integer primary key, name text, class_id integer, foreign key(class_id) references classes(id));" \
"insert into classes(name) values('ひまわり組');" \
"insert into classes(name) values('チューリップ組');" \
"insert into users(name, class_id) values('Yamada', 1);" \
"insert into users(name, class_id) values('Suzuki', 2);" \
".lint fkey-indexes"

sqlite3 :memory: \
"PRAGMA foreign_keys = ON;" \
"create table classes(id integer primary key, name text);" \
"create index idx_classes_id on classes(id);" \
"create table users(id integer primary key, name text, class_id integer, foreign key(class_id) references classes(id));" \
"create index idx_users_class_id on users(class_id);" \
"insert into classes(name) values('ひまわり組');" \
"insert into classes(name) values('チューリップ組');" \
"insert into users(name, class_id) values('Yamada', 1);" \
"insert into users(name, class_id) values('Suzuki', 2);" \
".lint fkey-indexes"

