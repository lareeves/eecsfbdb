CREATE VIEW VIEW_USER_INFORMATION(
USER_ID, FIRST_NAME, LAST_NAME, YEAR_OF_BIRTH, MONTH_OF_BIRTH, DAY_OF_BIRTH,
GENDER, HOMETOWN_CITY, HOMETOWN_STATE, HOMETOWN_COUNTRY, CURRENT_CITY, 
CURRENT_STATE, CURRENT_COUNTRY, INSTITUTION_NAME, PROGRAM_YEAR, PROGRAM_CONCENTRATION,
PROGRAM_DEGREE
)
AS SELECT U_P.user_id, U_P.first_name, U_P.last_name, U_P.birth_year, U_P.birth_month, 
	U_P.birth_day, U_P.gender, Hl.city, Hl.state, Hl.country, Cl.city, Cl.state,
	Cl.country, Edu.ed_institution, Edu.ed_grad_year, Edu.ed_concentration, Edu.ed_degree
FROM User_Profile U_P;	

CREATE VIEW VIEW_ARE_FRIENDS (
USER1ID, USER2ID
)
AS SELECT user_id, friend_id 
FROM Friendship;

CREATE VIEW VIEW_PHOTO_INFORMATION (
ALBUM_ID, OWNER_ID, COVER_PHOTO_ID, ALBUM_NAME, ALBUM_CREATED_TIME, ALBUM_MODIFIED_TIME,
ALBUM_LINK, ALBUM_VISIBILITY, PHOTO_ID, PHOTO_CAPTION, PHOTO_CREATED_TIME, 
PHOTO_MODIFIED_TIME, PHOTO_LINK
)
AS SELECT p.album_ID, a.owner_ID, a.cover_photo_ID, a.album_name, a.album_created_time, 
a.album_modified_time, a.album_link, a.album_visibility, p.photo_id, p.photo_caption, 
p.photo_created_time, p.photo_modified_time, p.photo_link 
FROM Photo p, Album a
WHERE p.album_ID = a.album_ID;

CREATE VIEW VIEW_TAG_INFORMATION (
PHOTO_ID, TAG_SUBJECT_ID, TAG_CREATED_TIME, TAG_X_COORDINATE, 
TAG_Y_COORD
)
AS SELECT tag_photo_id, tag_subject_id, tag_created_time, tag_x_coord, 
tag_y_coord
FROM Tags; 

CREATE VIEW VIEW_EVENT_INORMATION (
EVENT_ID, EVENT_CREATOR_ID, EVENT_NAME, EVENT_TAGLINE, EVENT_DESCRIPTION,
EVENT_HOST, EVENT_TYPE, EVENT_SUBTYPE, EVENT_LOCATION, EVENT_CITY,
EVENT_STATE, EVENT_COUNTRY, EVENT_START_TIME, EVENT_END_TIME
)
AS SELECT event_id, event_creator_id, event_name, event_tagline, event_description,
event_host, event_type, event_subtype, event_location, event_city, event_state,
event_country, event_start_time, EVENT_END_TIME
FROM Event;
