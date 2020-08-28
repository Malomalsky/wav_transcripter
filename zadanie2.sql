-- *************** SqlDBM: PostgreSQL ****************;
-- ***************************************************;


-- ************************************** "transcription"

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





insert into transcription values ('89851c32-e928-11ea-8992-d43d7e49fa06', '28-Aug-20', '15:26:19', 'АО', '88005553535', '8.700s', 'вас приветствует автоответчик оставьте сообщение после сигнала', 2, 1);



select a.tdate as RDate, a.result, count(a.tid), sum(a.duration), b.name as ProjectName, c.name as ServerName 
from transcription as a
inner join project as b on a.pid = b.id
inner join server as c on  a.sid = c.id 
where a.tdate between '2020-07-20' and '2020-08-30' group by 2,1,5,6 order by 1;