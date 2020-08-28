create table transcription (
	tdate date NOT NULL, 
	ttime time NOT NULL, 
	tid varchar(50) PRIMARY KEY,
	result varchar(25),
	phone varchar(30) NOT NULL, 
	duration interval NOT NULL, 
	ttext varchar(255)
);

