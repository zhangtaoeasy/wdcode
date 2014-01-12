/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/1/12 19:56:09                           */
/*==============================================================*/


/*==============================================================*/
/* Table: admin                                                 */
/*==============================================================*/
create table admin
(
   id                   int not null auto_increment,
   name                 varchar(50) not null comment '用户名',
   password             char(40) comment '用户密码',
   state                tinyint default 1 comment 'Email',
   time                 int default 0,
   role_id              int comment '用户状态 0 无效 1 有效 2 已删除',
   login_ip             char(15),
   login_time           int,
   primary key (id)
);

alter table admin comment '管理员表';

/*==============================================================*/
/* Index: Index_Name                                            */
/*==============================================================*/
create unique index Index_Name on admin
(
   name
);

/*==============================================================*/
/* Table: menu                                                  */
/*==============================================================*/
create table menu
(
   id                   int not null auto_increment comment '主键',
   name                 varchar(50) comment '菜单名',
   menu_id              int default 0,
   url                  varchar(100),
   type                 int,
   primary key (id)
);

alter table menu comment '菜单表';

/*==============================================================*/
/* Table: operate                                               */
/*==============================================================*/
create table operate
(
   link                 varchar(50) not null comment '操作连接',
   name                 varchar(50) comment '操作名称 用于显示',
   type                 int,
   primary key (link)
);

alter table operate comment '操作信息表';

/*==============================================================*/
/* Index: Index_ID                                              */
/*==============================================================*/
create index Index_ID on operate
(
   link
);

/*==============================================================*/
/* Table: role                                                  */
/*==============================================================*/
create table role
(
   id                   int not null auto_increment comment '主键',
   name                 varchar(50) comment '角色名',
   primary key (id)
);

alter table role comment '角色信息表';

/*==============================================================*/
/* Table: role_menu                                             */
/*==============================================================*/
create table role_menu
(
   id                   int not null auto_increment,
   role_id              int,
   menu_id              int,
   primary key (id)
);

alter table role_menu comment '角色与菜单关系表';

/*==============================================================*/
/* Index: Index_Menu                                            */
/*==============================================================*/
create index Index_Menu on role_menu
(
   menu_id
);

/*==============================================================*/
/* Table: role_operate                                          */
/*==============================================================*/
create table role_operate
(
   id                   int not null auto_increment comment '主键',
   operate              varchar(50) default '0',
   role_id              int default 0 comment '角色ID',
   primary key (id)
);

alter table role_operate comment '角色与操作关系表';

