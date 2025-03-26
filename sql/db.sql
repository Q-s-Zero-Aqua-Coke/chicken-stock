CREATE TABLE accounts
(
    account_id int auto_increment primary key ,
    nickname varchar(255) not null unique
)

INSERT INTO accounts (nickname)
    values ('월영인'),
    ('화영인'),
    ('수영인'),
    ('목영인'),
    ('금영인'),
    ('토영인'),
    ('일영인')