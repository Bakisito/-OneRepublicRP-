-- DO NOT MODIFY THESE FILES
-- THEY GET AUTOMATICALLY EXECUTED

create table if not exists zerio_radio_favorites (
    id int(11) auto_increment not null,
    identifier varchar(255) not null,

    frequency int(6) not null,
    label varchar(64) not null,

    unique (id)
);
