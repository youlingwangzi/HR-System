/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2016/7/8 11:02:09                            */
/*==============================================================*/


drop table if exists ADMIN;

drop table if exists DEPARTMENT;

drop table if exists JOB;

drop table if exists STAFF;

/*==============================================================*/
/* Table: ADMIN                                                 */
/*==============================================================*/
create table ADMIN
(
   ADMIN_ID             varchar(9) not null,
   ADMIN_NAME           varchar(50),
   PASSWORD             varchar(16),
   ADMIN_AUTHORITY      int,
   primary key (ADMIN_ID)
);

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT
(
   DEPART_ID            varchar(9) not null,
   DEPART_NAME          varchar(50),
   DEPART_ADRRESS       varchar(200),
   primary key (DEPART_ID)
);

/*==============================================================*/
/* Table: JOB                                                   */
/*==============================================================*/
create table JOB
(
   JOB_ID               varchar(9) not null,
   JOB_NAME             varchar(50),
   LOWEST_PAY           float(9,0),
   HIGHES_PAY           float(9,0),
   primary key (JOB_ID)
);

/*==============================================================*/
/* Table: STAFF                                                 */
/*==============================================================*/
create table STAFF
(
   STAFF_ID             varchar(9) not null,
   JOB_ID               varchar(9) not null,
   DEPART_ID            varchar(9) not null,
   STAFF_NAME           varchar(50),
   STAFF_EMAIL          varchar(50),
   STAFF_PHONE          varchar(16),
   ENTRY_TIME           date,
   STAFF_PAY            float(9,0),
   primary key (STAFF_ID)
);

alter table STAFF add constraint FK_STAFF_DEPARTMENT foreign key (DEPART_ID)
      references DEPARTMENT (DEPART_ID) on delete restrict on update restrict;

alter table STAFF add constraint FK_STAFF_JOB foreign key (JOB_ID)
      references JOB (JOB_ID) on delete restrict on update restrict;
