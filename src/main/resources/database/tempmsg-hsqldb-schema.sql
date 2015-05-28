--
--    Copyright 2010-2013 the original author or authors.
--
--    Licensed under the Apache License, Version 2.0 (the "License");
--    you may not use this file except in compliance with the License.
--    You may obtain a copy of the License at
--
--       http://www.apache.org/licenses/LICENSE-2.0
--
--    Unless required by applicable law or agreed to in writing, software
--    distributed under the License is distributed on an "AS IS" BASIS,
--    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
--    See the License for the specific language governing permissions and
--    limitations under the License.
--

create table msge (
    id int not null,
    name varchar(80) null,
    content varchar(3000) not null,
    description varchar(500) not null,
    channelId int not null,
    createTime BIGINT null,
    updateTime BIGINT null,
    constraint pk_msge primary key (id)
);

create table channel (
        id int not null,
        name varchar(80) null,
        description varchar(500) not null,
        createTime BIGINT null,
        updateTime BIGINT null,
    constraint pk_channel primary key (id)
);

CREATE TABLE sequence
(
    name               varchar(30)  not null,
    nextid             int          not null,
    constraint pk_sequence primary key (name)
);


