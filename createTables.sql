CREATE TABLE Location(
	location_id int, 
	city varchar(100),
	state varchar(100),
	country varchar (100),
	PRIMARY KEY (location_id)
);

CREATE TABLE User_Profile ( 
	user_id varchar(100),
	first_name varchar(100) NOT NULL,
	last_name varchar(100) NOT NULL,
	gender varchar(100),
	birth_month int,
	birth_day int,
	birth_year int,
	hometownL int,
	currentL int,
	PRIMARY KEY (user_id),
	FOREIGN KEY (hometownL) REFERENCES Location ON DELETE CASCADE,
	FOREIGN KEY (currentL) REFERENCES Location ON DELETE CASCADE
);

CREATE TABLE Album (
	album_ID varchar(100),
	album_name varchar(100),
	album_link varchar(2000),
	album_created_time timestamp,
	album_modified_time timestamp, 
	album_visibility varchar(100),
	cover_photo_ID varchar(100),
	owner_ID varchar(100),
	PRIMARY KEY (album_ID),
	FOREIGN KEY (owner_ID) REFERENCES User_Profile ON DELETE CASCADE
);

CREATE TABLE Photo (
	photo_id varchar(100),
	photo_caption varchar(2000),
	photo_link varchar(2000),
	photo_creation_time timestamp,
	photo_modified_time timestamp,
	album_ID varchar(100) NOT NULL,
	PRIMARY KEY (photo_id),
	FOREIGN KEY (album_ID) REFERENCES Album ON DELETE CASCADE
);

ALTER TABLE Album ADD CONSTRAINT A FOREIGN KEY (cover_photo_ID) REFERENCES Photo (photo_id) ON DELETE SET NULL

CREATE TABLE Tags (
	tag_photo_id varchar(100) NOT NULL,
	tag_subject_id varchar(100) NOT NULL,
	tag_created_time timestamp,
	tag_x_coord number,
	tag_y_coord number,
	PRIMARY KEY(tag_photo_id, tag_subject_id),
	FOREIGN KEY(tag_photo_id) REFERENCES Photo ON DELETE CASCADE,
	FOREIGN KEY(tag_subject_id) REFERENCES User_Profile ON DELETE CASCADE
);

CREATE TABLE Education (
	user_id varchar(100),
	ed_id number PRIMARY KEY,
	ed_institution varchar(100),
	ed_grad_year number,
	ed_degree varchar(100),
	ed_concentration varchar(100),
	FOREIGN KEY (user_id) REFERENCES User_Profile ON DELETE CASCADE
);

CREATE TABLE Message (
	message_id varchar(100) PRIMARY KEY,
	message_content varchar(2000),
	sent_time timestamp
);

CREATE TABLE Event (
	event_id varchar(100),
	event_creator_id varchar(100),
	event_name varchar(255),
	event_tagline varchar(100),
	event_description varchar(1000),
	event_start_time timestamp,
	event_end_time timestamp,
	event_location varchar(100),
	event_city varchar(120),
	event_state varchar(40),
	event_country varchar(40),
	event_host varchar(100),
	event_type varchar(100),
	event_subtype varchar(100),
	PRIMARY KEY(event_id),
	FOREIGN KEY(event_creator_id) REFERENCES User_Profile ON DELETE CASCADE
);

CREATE TABLE Friendship(
	user_id varchar(100),
	friend_id varchar(100),
	PRIMARY KEY (user_id, friend_id),
	FOREIGN KEY (user_id) REFERENCES User_Profile ON DELETE CASCADE,
	FOREIGN KEY (friend_id) REFERENCES User_Profile ON DELETE CASCADE
);

CREATE TABLE Participant (
	p_user varchar(100),
	p_attendance varchar(50) CHECK (p_attendance IN ('ATTENDING', 'DECLINED', 'NOT SURE', 'NOT REPLIED')),
	p_event varchar(100),
	PRIMARY KEY (p_user, p_event),
	FOREIGN KEY (p_user) REFERENCES User_Profile ON DELETE CASCADE,
	FOREIGN KEY (p_event) REFERENCES Event ON DELETE CASCADE
);

/*CREATE TABLE HometownL (
	user_id varchar(100),
	location_id int,
	PRIMARY KEY (user_id, location_id),
	FOREIGN KEY (location_id) REFERENCES Location ON DELETE CASCADE
);*/

/*CREATE TABLE CurrentL (
	user_id varchar(100),

	PRIMARY KEY (user_id, location_id),
	FOREIGN KEY (location_id) REFERENCES Location ON DELETE CASCADE
);*/

CREATE TABLE Chat (
	chat_id varchar(100) PRIMARY KEY,
	message_id varchar(100),
	sender_ID varchar(100),
	reciever_ID varchar(100),
	FOREIGN KEY (sender_ID) REFERENCES User_Profile ON DELETE CASCADE,
	FOREIGN KEY (reciever_ID) REFERENCES User_Profile,
	FOREIGN KEY (message_id) REFERENCES Message 
);
