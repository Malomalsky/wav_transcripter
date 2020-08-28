CREATE TABLE "transcription"
(
 "tdate"    date NOT NULL,
 "ttime"    time NOT NULL,
 "tid"      varchar(50) NOT NULL,
 "result"   varchar(25) NOT NULL,
 "phone"    varchar(25) NOT NULL,
 "duration" interval NOT NULL,
 "ttext"    varchar(255) NULL,
 CONSTRAINT "PK_transcription" PRIMARY KEY ( "tid" )
);
