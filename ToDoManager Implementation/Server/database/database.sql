BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER NOT NULL,
	"email"	TEXT NOT NULL,
	"name"	TEXT,
	"hash"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "assignments" (
	"task"	INTEGER NOT NULL,
	"user"	INTEGER NOT NULL,
	"active"	INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY("user") REFERENCES "users"("id"),
	FOREIGN KEY("task") REFERENCES "tasks"("id") ON DELETE CASCADE,
	PRIMARY KEY("task","user")
);
CREATE TABLE IF NOT EXISTS "completion_records" (
	"task_id"	INTEGER NOT NULL,
	"user_id"	INTEGER NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "users"("id"),
	FOREIGN KEY("task_id") REFERENCES "tasks"("id")  ON DELETE CASCADE,
	PRIMARY KEY("task_id","user_id")
);
CREATE TABLE IF NOT EXISTS "tasks" (
	"id"	INTEGER,
	"description"	TEXT NOT NULL,
	"important"	INTEGER NOT NULL DEFAULT 0,
	"private"	INTEGER NOT NULL DEFAULT 1,
	"project"	TEXT,
	"deadline"	TEXT,
	"completed"	INTEGER DEFAULT 0,
	"owner"	INTEGER NOT NULL,
	"completers"	INTEGER NOT NULL DEFAULT 1,
	FOREIGN KEY("owner") REFERENCES "users"("id"),
	PRIMARY KEY("id")
);
INSERT INTO "users" ("id","email","name","hash") VALUES (1,'user.dsp@polito.it','User','$2a$10$.hw.euW0lGhWtNfigv5U9uEcwc1cfgH3DK7.zReNHPvi5xpJRfPc2'),
 (2,'frank.stein@polito.it','Frank','$2a$10$YBUtQ7qWvOo9xBuJfLWAkeTHmQHZe0uB0NM/7zAITHCccGVAfOkEm'),
 (3,'karen.makise@polito.it','Karen','$2a$10$d9pllxqTsXoAXJwE14VzzeJPJc6Z1igrR2/jfa1IQeAb5pNPfYViS'),
 (4,'rene.regeay@polito.it','Rene','$2a$10$WJcNTzEY1rIePhRVKdfkYeSkVJ20PLMEktgdjVPJq9qUeP1ZdSrPi'),
 (5,'beatrice.golden@polito.it','Beatrice','$2a$10$wQtLnqD224VS3US.LCrWXOWfASq6PZJHEpViYV6GEKUXWxMZNmSTW'),
 (6,'arthur.pendragon@polito.it','Arthur','$2a$10$uFVLA5yq4LZTB.gglOqsReDsm.KgeRrhcSy4T45Dlh.yWyR.uYA7a');
INSERT INTO "assignments" ("task","user","active") VALUES (4,1,1),
 (4,2,0),
 (5,2,1),
 (7,3,0),
 (8,5,0),
 (9,1,0),
 (10,1,0),
 (11,6,0),
 (7,5,1),
 (1,6,0),
 (2,1,0),
 (4,5,0),
 (2,5,0),
 (13,1,0),
 (13,2,0);
INSERT INTO "completion_records" ("task_id","user_id") VALUES (2,5),
 (4,1),
 (6,2),
 (9,1),
 (10,1),
 (4,2),
 (4,5);
INSERT INTO "tasks" ("id","description","important","private","project","deadline","completed","owner","completers") VALUES (1,'Complete RESTful APIs Design',1,1,'WA2_Project','2021-11-20T00:00:00.000Z',0,1,1),
 (2,'Study JSON Schemas',0,1,'DSP_Project','2021-10-20T00:00:00.000Z',1,1,1),
 (3,'Prepare slides for thesis meeting',0,0,'Personal','2021-10-30T00:00:00.000Z',0,1,1),
 (4,'Email professor to register exam result',1,1,'WA1_Project','2021-11-30T00:00:00Z',1,1,3),
 (5,'Watch first videolesson',0,0,'WA2_Project','2021-11-14T00:00:00Z',0,2,1),
 (6,'Pay import fees for the parcel',1,1,'Personal','2021-09-14T00:00:00Z',1,2,1),
 (7,'Walk the dog outside',0,0,'Personal','2021-10-26T10:30:00Z',0,2,1),
 (8,'Listen to the seagulls crying',1,1,'Personal','2022-12-31T00:00:00Z',0,5,1),
 (9,'Study for the exam',0,1,'WA2_Project','2021-01-26T00:00:00Z',1,3,1),
 (10,'Change desktop wallpaper',0,1,'Personal','2021-08-08T00:00:00Z',1,3,1),
 (11,'Buy the latest novel',0,1,'Personal','2021-12-10T20:00:00Z',0,4,1),
 (12,'Install Mosquitto',1,1,'WA2_Project','2021-11-30T00:00:00Z',0,4,1),
 (13,'Prepare report for the meeting',1,0,'WA2_Project','2022-12-31T00:00:00Z',0,3,2);
COMMIT;
