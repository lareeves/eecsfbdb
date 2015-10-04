CREATE SEQUENCE location_id_seq
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER location_id_trigger
BEFORE INSERT ON Location
FOR EACH ROW
BEGIN 
SELECT location_id_seq.nextval INTO :new.location_id FROM dual;
END;
.
RUN;

CREATE SEQUENCE ed_id_seq
START WITH 1
INCREMENT BY 1;

CREATE TRIGGER ed_id_trigger
BEFORE INSERT ON Education
FOR EACH ROW
BEGIN 
SELECT ed_id_seq.nextval INTO :new.ed_id FROM dual;
END;
.
RUN;

INSERT INTO User_Profile (user_id, first_name, last_name, gender, birth_month,
						  birth_day, birth_year)
SELECT DISTINCT USER_ID, FIRST_NAME, LAST_NAME, GENDER, MONTH_OF_BIRTH, 
				DAY_OF_BIRTH, YEAR_OF_BIRTH 
FROM keykholt.PUBLIC_USER_INFORMATION;

INSERT INTO Location (city, state, country)
SELECT DISTINCT HOMETOWN_CITY, HOMETOWN_STATE, HOMETOWN_COUNTRY
FROM keykholt.PUBLIC_USER_INFORMATION
UNION 
SELECT DISTINCT CURRENT_CITY, CURRENT_STATE, CURRENT_COUNTRY 
FROM keykholt.PUBLIC_USER_INFORMATION 
UNION EVENT_CITY, EVENT_STATE, EVENT_COUNTRY
FROM keykholt.PUBLIC_USER_INFORMATION;

INSERT INTO Album (album_ID, album_name, album_link, album_created_time, 
				   album_modified_time, album_visibility, cover_photo_ID, owner_ID)
SELECT DISTINCT ALBUM_ID, ALBUM_NAME, ALBUM_LINK, ALBUM_CREATED_TIME, 
				ALBUM_MODIFIED_TIME, ALBUM_VISIBILITY, COVER_PHOTO_ID, OWNER_ID
FROM keykholt.PUBLIC_PHOTO_INFORMATION;

INSERT INTO Photo (photo_id, photo_caption, photo_creation_time, photo_modified_time,
				   photo_link, album_ID)
SELECT DISTINCT PHOTO_ID, PHOTO_CAPTION, PHOTO_CREATED_TIME, PHOTO_MODIFIED_TIME,
				PHOTO_LINK, ALBUM_ID
FROM keykholt.PUBLIC_PHOTO_INFORMATION;


INSERT INTO Tags (tag_photo_id, tag_subject_id, tag_created_time, tag_x_coord,
				  tag_y_coord)
SELECT DISTINCT PHOTO_ID, TAG_SUBJECT_ID, TAG_CREATED_TIME, TAG_X_COORDINATE, 
				TAG_Y_COORD
FROM keykholt.PUBLIC_TAG_INFORMATION; 

INSERT INTO Education (ed_institution, ed_grad_year, ed_degree_, ed_concentration)
SELECT DISTINCT INSTITUTION_NAME, PROGRAM_YEAR, PROGRAM_DEGREE, PROGRAM_CONCENTRATION
FROM keykholt.PUBLIC_USER_INFORMATION;

INSERT INTO Event (event_id, event_creator_id, event_name, event_tagline, event_description,
				   event_start_time, event_end_time, event_location, event_city, event_state,
				   event_country, event_host, event_subtype)
SELECT DISTINCT EVENT_ID, EVENT_CREATOR_ID, EVENT_NAME, EVENT_TAGLINE, EVENT_DESCRIPTION,
				EVENT_START_TIME, EVENT_END_TIME, EVENT_LOCATION, EVENT_CITY, EVENT_CITY,
				EVENT_STATE, EVENT_COUNTRY, EVENT_HOST, EVENT_SUBTYPE
FROM keykholt.PUBLIC_EVENT_INFORMATION;

INSERT INTO Friendship (user_id, friend_id)
SELECT DISTINCT USER1_ID, USER2_ID 
FROM keykholt.PUBLIC_ARE_FRIENDS;

INSERT INTO HometownL (user_id, location_id)
SELECT DISTINCT p_u_i.USER_ID, l.location_id FROM keykholt.PUBLIC_USER_INFORMATION p_u_i, Location l
WHERE p_u_i.HOMETOWN_CITY = l.city AND p_u_i.HOMETOWN_STATE = l.state AND p_u_i.HOMETOWN_COUNTRY = l.country;

INSERT INTO CurrentL (user_id, location_id)
SELECT DISTINCT p_u_i.USER_ID, l.location_id FROM keykholt.PUBLIC_USER_INFORMATION p_u_i, Location l
WHERE p_u_i.CURRENT_CITY = l.city AND p_u_i.CURRENT_STATE = l.state AND p_u_i.CURRENT_COUNTRY = l.country;
