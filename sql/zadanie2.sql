
-- Запрос. Для работы с другими именами таблиц - поменять transcription -
-- (таблицы, где хранятся результаты распознавания). А также задать даты. 

select a.tdate as RDate, a.result, count(a.tid), sum(a.duration), b.name as ProjectName, c.name as ServerName 
from transcription as a
inner join project as b on a.pid = b.id
inner join server as c on  a.sid = c.id 
where a.tdate between 'xxxx-xx-xx' and 'yyyy-yy-yy' group by 2,1,5,6 order by 1;






-- Схема БД, на которой проводились тесты. 
CREATE TABLE "transcription"
(
 "tid"      varchar(50) NOT NULL,
 "tdate"    date NOT NULL,
 "ttime"    time NOT NULL,
 "result"   varchar(25) NOT NULL,
 "phone"    varchar(25) NOT NULL,
 "duration" interval NOT NULL,
 "ttext"    varchar(255) NULL,
 "sid"       int NOT NULL,
 "pid"       int NOT NULL,
 CONSTRAINT "PK_transcription" PRIMARY KEY ( "tid" ),
 CONSTRAINT "FK_23" FOREIGN KEY ( "pid" ) REFERENCES "project" ( "id" ),
 CONSTRAINT "FK_26" FOREIGN KEY ( "sid" ) REFERENCES "server" ( "id" )
);

CREATE INDEX "fkIdx_23" ON "transcription"
(
 "id"
);

CREATE INDEX "fkIdx_26" ON "transcription"
(
 "id"
);



CREATE TABLE "project"
(
 "id"          int NOT NULL,
 "name"        varchar(50) NOT NULL,
 "description" varchar(50) NOT NULL,
 CONSTRAINT "PK_project" PRIMARY KEY ( "id" )
);


CREATE TABLE "server"
(
 "id"          int NOT NULL,
 "name"        varchar(50) NOT NULL,
 "ip_address"  varchar(50) NOT NULL,
 "description" varchar(50) NOT NULL,
 CONSTRAINT "PK_server" PRIMARY KEY ( "id" )
);

