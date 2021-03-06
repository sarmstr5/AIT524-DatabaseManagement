CREATE TABLE INSPECTION_REPORT 
	(
	REPORT_ID NUMBER(5),
	INSPECTOR_ID NUMBER(5),
	CLIENT_ID NUMBER(5),
	CONTRACT_ID NUMBER(5),
	INSPECTION_ID NUMBER(5),
	CONSTRAINT report_id_pk PRIMARY KEY (REPORT_ID)
	)
	
CREATE TABLE INSPECTION 
	(
	INSPECTION_ID NUMBER(5),
	INSPECTION_TEMPLATE_ID NUMBER(5),
	CONSTRAINT inspection_id_pk PRIMARY KEY (INSPECTION_ID)
	)

CREATE TABLE CONTRACT 
	(
	CONTRACT_ID NUMBER(5),
	INSPECTION_DATE DATE,
	CLIENT_ID NUMBER(5),
	INSPECTION_TYPE_ID NUMBER(5),
	PROPERTY_ADDRESS_ID NUMBER(5),
	WITNESSES VARCHAR(100),
	PROPERTY_TYPE VARCHAR(100),
	CONSTRAINT contract_id_pk PRIMARY KEY (CONTRACT_ID)
	)
	
CREATE TABLE CLIENT
	(
	CLIENT_ID NUMBER(5),
	CLIENT_ADDRESS_ID NUMBER(5),
	CLIENT_PHONE VARCHAR(10),
	CLIENT_EMAIL VARCHAR(100),
	CONSTRAINT client_id_pk PRIMARY KEY (CLIENT_ID)
	)
	
CREATE TABLE INSPECTOR
	(
	INSPECTOR_ID NUMBER(5),
	INSPECTOR_NAME VARCHAR(100),
	INSPECTION_COMPANY_ID NUMBER(5),
	CONSTRAINT inspector_id_pk PRIMARY KEY (INSPECTOR_ID)
	)
	
CREATE TABLE INSPECTION_TEMPLATE 
	(
	INSPECTION_TEMPLATE_ID NUMBER(5),
	SUBSYSTEM_ID NUMBER(5),
	CONSTRAINT inspection_template_id_pk PRIMARY KEY (INSPECTION_TEMPLATE_ID)
	)
	
CREATE TABLE INSPECTION_TYPE
	(
	INSPECTION_TYPE_ID NUMBER(5),
	INSPECTION_TYPE VARCHAR(50),
	CONSTRAINT inspection_type_id_pk PRIMARY KEY (INSPECTION_TYPE_ID)
	)
	
CREATE TABLE ADDRESS
	(
	ADDRESS_ID NUMBER(5),
	ADDRESS_STREET_ADDRESS_1 VARCHAR(100),
	ADDRESS_STREET_ADDRESS_2 VARCHAR(50),
	ADDRESS_CITY VARCHAR(100),
	ADDRESS_STATE_ID NUMBER(5),
	ADDRESS_ZIP NUMBER(5),
	CONSTRAINT address_id_pk PRIMARY KEY (ADDRESS_ID)
	)
	
CREATE TABLE INSPECTION_COMPANY
	(
	INSPECTION_COMPANY_ID NUMBER(5),
	COMPANY_ADDRESS_ID NUMBER(5),
	COMPANY_NAME VARCHAR(50),
	COMPANY_PHONE VARCHAR(10),
	COMPANY_LOGO RAW(1), /*NEED TO FIGURE OUT RIGHT DATA TYPE AND SIZE */
	CONSTRAINT inspection_company_id_pk PRIMARY KEY (INSPECTION_COMPANY_ID)
	)
	
CREATE TABLE SUBSYSTEM
	(
	SUBSYSTEM_ID NUMBER(5),
	SUBSYSTEM_INTRODUCTION VARCHAR(2000), /*arbituary size choice MAX IS 4K*/
	INSPECTION_ITEM_ID NUMBER(5),
	SUMMARY VARCHAR(2000),
	CONSTRAINT subsystem_id_pk PRIMARY KEY (SUBSYSTEM_ID)
	)
CREATE TABLE TEMPLATE_SECTION 
( 
TEMPLATE_SECTION_ID NUMBER(5), 
INTRODUCTION VARCHAR(2000), 
INSPECTION_ITEM_ID NUMBER(5), 
SUBSYSTEM_ID NUMBER(5), 
SUMMARY VARCHAR(2000), 
CONSTRAINT template_section_id_pk PRIMARY KEY (TEMPLATE_SECTION_ID) 
);	
CREATE TABLE ADDRESS_STATE
	(
	ADDRESS_STATE_ID NUMBER(5),
	ADDRESS_STATE_NAME VARCHAR(50),
	ADDRESS_STATE_ACRONYM CHAR(2),
	CONSTRAINT address_state_id_pk PRIMARY KEY (ADDRESS_STATE_ID)
	)
	
CREATE TABLE INSPECTION_ITEM
	(
	INSPECTION_ITEM_ID NUMBER(5),
	INSPECTION_ITEM_STATUS_ID NUMBER(5),
	MATERIAL_ID NUMBER(5),
	FLAG_STATUS NUMBER(1),
	INSPECTION_PHOTO RAW(1000), /*NEED TO FIGURE OUT RIGHT DATA TYPE AND SIZE */
	INSPECTION_ITEM_COMMENT VARCHAR(100),
	CONSTRAINT inspection_item_id_pk PRIMARY KEY (INSPECTION_ITEM_ID)
	)

CREATE TABLE SUBSYSTEM_MATERIAL_JOIN
	(
	JOIN_ID NUMBER(5),
	MATERIAL_NAME VARCHAR(50),
	SUBSYSTEM_ID NUMBER(5),
	CONSTRAINT join_id_pk PRIMARY KEY (JOIN_ID)
	)
	
CREATE TABLE INSPECTION_ITEM_STATUS
	(
	INSPECTION_ITEM_STATUS_ID NUMBER(5),
	ITEM_STATUS VARCHAR(25),
	CONSTRAINT inspection_item_status_id_pk PRIMARY KEY (INSPECTION_ITEM_STATUS_ID)
	)
	
CREATE TABLE MATERIAL 
	(
	MATERIAL_ID NUMBER(5),
	MATERIAL_NAME VARCHAR(50),
	SUBSYSTEM_ID NUMBER(5),
	CONSTRAINT material_id_pk PRIMARY KEY (MATERIAL_ID)
	)
	
ALTER TABLE INSPECTION_REPORT ADD CONSTRAINT inspector_id_fk FOREIGN KEY (INSPECTOR_ID) REFERENCES INSPECTOR (INSPECTOR_ID);
ALTER TABLE INSPECTION_REPORT ADD CONSTRAINT client_id_fk FOREIGN KEY (CLIENT_ID) REFERENCES CLIENT (CLIENT_ID);
ALTER TABLE INSPECTION_REPORT ADD CONSTRAINT contract_id_fk FOREIGN KEY(CONTRACT_ID ) REFERENCES CONTRACT (CONTRACT_ID);
ALTER TABLE INSPECTION_REPORT ADD CONSTRAINT inspection_id_fk FOREIGN KEY(INSPECTION_ID) REFERENCES INSPECTION(INSPECTION_ID);
ALTER TABLE INSPECTION 	ADD CONSTRAINT inspection_template_id_fk FOREIGN KEY(INSPECTION_ID) REFERENCES INSPECTION_TEMPLATE(INSPECTION_TEMPLATE_ID);


ALTER TABLE CONTRACT ADD CONSTRAINT client_id_fk FOREIGN KEY(CLIENT_ID) REFERENCES CLIENT (CLIENT_ID);
ALTER TABLE CONTRACT ADD CONSTRAINT inspection_type_id_fk 
	FOREIGN KEY(INSPECTION_TYPE_ID) REFERENCES INSPECTION_TYPE (INSPECTION_TYPE_ID);
ALTER TABLE CONTRACT ADD CONSTRAINT property_address_id_fk FOREIGN KEY(PROPERTY_ADDRESS_ID) REFERENCES PROPERTY_ADDRESS(PROPERTY_ADDRESS_ID);

	
ALTER TABLE CLIENT ADD CONSTRAINT client_address_id_fk FOREIGN KEY(CLIENT_ADDRESS_ID) REFERENCES ADDRESS (ADDRESS_ID);
	
ALTER TABLE INSPECTOR ADD CONSTRAINT inspection_company_id_fk FOREIGN KEY(INSPECTION_COMPANY_ID) REFERENCES INSPECTION_COMPANY (INSPECTION_COMPANY_ID);
	
	
ALTER TABLE INSPECTION_TEMPLATE ADD CONSTRAINT subsystem_id_fk FOREIGN KEY(SUBSYSTEM_ID) REFERENCES SUBSYSTEM (SUBSYSTEM_ID);

ALTER TABLE ADDRESS
	ADD CONSTRAINT address_state_id_fk FOREIGN KEY(ADDRESS_STATE_ID) REFERENCES ADDRESS_STATE (ADDRESS_STATE_ID);
	
	
ALTER TABLE INSPECTION_COMPANY
	ADD CONSTRAINT company_address_id_fk FOREIGN KEY(COMPANY_ADDRESS_ID)  REFERENCES ADDRESS (ADDRESS_ID);
	
ALTER TABLE SUBSYSTEM
	ADD CONSTRAINT inspection_item_id_fk FOREIGN KEY(INSPECTION_ITEM_ID) REFERENCES INSPECTION_ITEM (INSPECTION_ITEM_ID);
	
	
ALTER TABLE INSPECTION_ITEM
	ADD CONSTRAINT inspection_item_status_id_fk FOREIGN KEY(INSPECTION_ITEM_STATUS_ID) REFERENCES INSPECTION_ITEM_STATUS (INSPECTION_ITEM_STATUS_ID) ;

ALTER TABLE INSPECTION_ITEM
	ADD CONSTRAINT material_id_fk FOREIGN KEY(MATERIAL_ID) REFERENCES MATERIAL (MATERIAL_ID);

ALTER TABLE SUBSYSTEM_MATERIAL_JOIN
	ADD CONSTRAINT subsystem_join_id_fk FOREIGN KEY(SUBSYSTEM_ID) REFERENCES SUBSYSTEM (SUBSYSTEM_ID);
	
ALTER TABLE MATERIAL 
	ADD CONSTRAINT subsystem_material_id_fk FOREIGN KEY(SUBSYSTEM_ID)  REFERENCES SUBSYSTEM (SUBSYSTEM_ID);

