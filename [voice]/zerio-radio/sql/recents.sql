-- DO NOT MODIFY THESE FILES
-- THEY GET AUTOMATICALLY EXECUTED

create table if not exists zerio_radio_recents (
    id int(11) auto_increment not null,
    identifier varchar(255) not null,

    frequency int(11) not null,
    label varchar(64) not null,

    unique (id)
);
