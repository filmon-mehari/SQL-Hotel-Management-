CREATE TABLE customer
(
 customer_ID     int NOT NULL IDENTITY (1, 1),
 First_Name      varchar(50) NULL,
 Last_Name       varchar(50) NULL,
 Date_Of_Birth date NULL,
 Email           varchar(50) NULL,
 Phone_Number    varchar(50) NULL,
 Address         varchar(50) NULL,
 CONSTRAINT PK_4 PRIMARY KEY ( customer_ID )
);

CREATE TABLE room
(
 room_ID      int NOT NULL IDENTITY (1, 1),
 Type         varchar(50)NULL,
 Price        varchar(50)  NULL,
 Availability varchar(50) NULL,
 Number       int NULL,
 CONSTRAINT PK_113 PRIMARY KEY ( room_ID )
);

CREATE TABLE hotel
(
 hotel_ID     int NOT NULL IDENTITY(1, 1),
 Name         varchar(50) NULL,
 room_ID      int NULL,
 Email        varchar(50) NULL,
 Phone_Number varchar(50) NULL,
 Address      varchar(50) NULL,
 CONSTRAINT PK_5 PRIMARY KEY ( hotel_ID ),
 CONSTRAINT FK_140 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID )
);

CREATE TABLE manager
(
 manager_ID    int NOT NULL IDENTITY (1, 1),
 hotel_ID      int NULL,
 First_Name    varchar(50) NULL,
 Last_Name     varchar(50) NULL,
 Phone_Number  varchar(50) NULL,
 Email         varchar(50) NULL,
 Salary        varchar(50) NULL,
 Date_Of_Birth date NULL,
 Address       varchar(50) NULL,
 CONSTRAINT PK_6 PRIMARY KEY ( manager_ID),
 CONSTRAINT FK_149 FOREIGN KEY ( hotel_ID ) REFERENCES hotel ( hotel_ID )
);

CREATE TABLE payment
(
 payment_ID  int NOT NULL IDENTITY(1,1),
 Date        date NULL,
 room_ID     int NULL,
 customer_ID int NULL,
 Amount      varchar(50) NULL,
 Method      varchar(50) NULL,
 Description varchar(50) NULL, 
 CONSTRAINT PK_7 PRIMARY KEY ( payment_ID ),
 CONSTRAINT FK_131 FOREIGN KEY ( customer_ID ) REFERENCES customer ( customer_ID ),
 CONSTRAINT FK_137 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID )
);


CREATE TABLE bill
(
 bill_ID     int NOT NULL IDENTITY(1, 1),
 room_ID     int NULL,
 First_Name  varchar(50) NULL,
 payment_ID  int NULL,
 customer_ID int NULL,
 Last_Name   varchar(50) NULL,
 Amount      varchar(50) NULL,
 Date        date NULL,
 Type        varchar(50) NULL,
 CONSTRAINT PK_8 PRIMARY KEY ( bill_ID ),
 CONSTRAINT FK_128 FOREIGN KEY ( customer_ID ) REFERENCES customer ( customer_ID ),
 CONSTRAINT FK_134 FOREIGN KEY ( payment_ID ) REFERENCES payment ( payment_ID ),
 CONSTRAINT FK_158 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID )
);

CREATE TABLE reservation
(
 reservation_ID int NOT NULL IDENTITY(1, 1),
 room_ID        int  NULL,
 customer_ID    int  NULL,
 manager_ID     int  NULL,
 hotel_ID       int  NULL,
 Start_Date     date NULL,
 End_Date       date NULL,
 CONSTRAINT PK_108 PRIMARY KEY ( reservation_ID),
 CONSTRAINT FK_161 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID ),
 CONSTRAINT FK_164 FOREIGN KEY ( customer_ID ) REFERENCES customer ( customer_ID ),
 CONSTRAINT FK_167 FOREIGN KEY ( manager_ID) REFERENCES manager ( manager_ID)
);


CREATE TABLE service
(
 service_ID  int NOT NULL IDENTITY(1, 1),
 room_ID     int  NULL,
 customer_ID int  NULL,
 Name        varchar(50) NULL,
 Type        varchar(50) NULL,
 Description varchar(50) NULL,
 CONSTRAINT PK_120 PRIMARY KEY ( service_ID),
 CONSTRAINT FK_152 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID ),
 CONSTRAINT FK_155 FOREIGN KEY ( customer_ID ) REFERENCES customer ( customer_ID )
);


CREATE TABLE RoomService
(
 room_ID     int NULL,
 service_ID  int NULL,
 room_ID_1   int NULL,
 customer_ID int NULL,
 CONSTRAINT FK_206 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID ),
 CONSTRAINT FK_210 FOREIGN KEY ( service_ID) REFERENCES service ( service_ID)
);

CREATE TABLE CustReserv
(
 reservation_ID int  NULL,
 room_ID        int  NULL,
 customer_ID    int  NULL,
 manager_ID     int  NULL,
 hotel_ID       int  NULL,
 customer_ID_1  int  NULL,
 CONSTRAINT FK_182 FOREIGN KEY ( reservation_ID) REFERENCES reservation ( reservation_ID),
 CONSTRAINT FK_190 FOREIGN KEY ( customer_ID_1 ) REFERENCES customer ( customer_ID )
);


CREATE TABLE CustService
(
 customer_ID   int NULL,
 service_ID    int NULL,
 room_ID       int NULL,
 customer_ID_1 int NULL,
 CONSTRAINT FK_172 FOREIGN KEY ( customer_ID ) REFERENCES customer ( customer_ID ),
 CONSTRAINT FK_176 FOREIGN KEY ( service_ID) REFERENCES service ( service_ID)
);

CREATE TABLE RoomReservation
(
 room_ID        int  NULL,
 reservation_ID int NULL,
 room_ID_1      int NULL,
 customer_ID    int NULL,
 manager_ID     int NULL,
 hotel_ID       int NULL,
 CONSTRAINT FK_194 FOREIGN KEY ( room_ID ) REFERENCES room ( room_ID ),
 CONSTRAINT FK_198 FOREIGN KEY ( reservation_ID) REFERENCES reservation ( reservation_ID)
);









