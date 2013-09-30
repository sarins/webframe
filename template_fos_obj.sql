-----------------------------------------------------
-- Export file for user FOS_DEV                    --
-- Created by Administrator on 2013/9/24, 16:22:25 --
-----------------------------------------------------

spool template_fos_obj.log

prompt
prompt Creating table EFW_SOURSE_ENTITY
prompt ================================
prompt
create table EFW_SOURSE_ENTITY
(
  ENTITY_ID    NUMBER not null,
  ENTITY_NAME  VARCHAR2(60) not null,
  ENTITY_CLASS VARCHAR2(60) not null,
  ENTITY_FIELD VARCHAR2(40) not null,
  QUERY_URL    VARCHAR2(200),
  QUERY_PARAM  VARCHAR2(200),
  ENTITY_ALIAS VARCHAR2(200),
  OUTPUT_KEY   VARCHAR2(40) not null,
  OUTPUT_TITLE VARCHAR2(60) not null,
  OUTPUT_CLASS VARCHAR2(40) not null,
  OUTPUT_VALUE VARCHAR2(40) not null,
  NOT_NULL     INTEGER default 1 not null
)
;
comment on table EFW_SOURSE_ENTITY
  is '实体权限定义表';
comment on column EFW_SOURSE_ENTITY.ENTITY_ID
  is '实体模块ID';
comment on column EFW_SOURSE_ENTITY.ENTITY_NAME
  is '实体名称';
comment on column EFW_SOURSE_ENTITY.ENTITY_CLASS
  is '实体类';
comment on column EFW_SOURSE_ENTITY.ENTITY_FIELD
  is '实体字段';
comment on column EFW_SOURSE_ENTITY.QUERY_URL
  is '查询地址，返回数据字典的json数据';
comment on column EFW_SOURSE_ENTITY.QUERY_PARAM
  is '查询条件，别名以_prefix开头';
comment on column EFW_SOURSE_ENTITY.ENTITY_ALIAS
  is '同类实体，每个同类实体使用分号;隔开';
comment on column EFW_SOURSE_ENTITY.OUTPUT_KEY
  is '数据名称';
comment on column EFW_SOURSE_ENTITY.OUTPUT_TITLE
  is '数据标题';
comment on column EFW_SOURSE_ENTITY.OUTPUT_CLASS
  is '数据表对象';
comment on column EFW_SOURSE_ENTITY.OUTPUT_VALUE
  is '数据值';
comment on column EFW_SOURSE_ENTITY.NOT_NULL
  is '是否允许空';
alter table EFW_SOURSE_ENTITY
  add constraint PK_SOURSE_ENTITY primary key (ENTITY_ID);

prompt
prompt Creating table EFW_BUSINESS_MODULE
prompt ==================================
prompt
create table EFW_BUSINESS_MODULE
(
  MODULE_ID NUMBER not null,
  NAME      VARCHAR2(128) not null,
  TITLE     VARCHAR2(100) not null,
  MENU_ID   VARCHAR2(500) not null,
  STATUS    VARCHAR2(6) not null
)
;
comment on table EFW_BUSINESS_MODULE
  is '业务模块定义表';
comment on column EFW_BUSINESS_MODULE.MODULE_ID
  is '业务模块ID';
comment on column EFW_BUSINESS_MODULE.NAME
  is '业务模块名称';
comment on column EFW_BUSINESS_MODULE.TITLE
  is '业务模块描述';
comment on column EFW_BUSINESS_MODULE.MENU_ID
  is '菜单模块id';
comment on column EFW_BUSINESS_MODULE.STATUS
  is '数据状态';
alter table EFW_BUSINESS_MODULE
  add constraint PK_BUSINESS_MODULE_ID primary key (MODULE_ID);
alter table EFW_BUSINESS_MODULE
  add constraint CKT_EFW_BUSINESS_MODULE
  check (STATUS IN ('A','D'));

prompt
prompt Creating table EFW_BUSINESS_MODULE_MAP
prompt ======================================
prompt
create table EFW_BUSINESS_MODULE_MAP
(
  ID        NUMBER not null,
  MODULE_ID NUMBER not null,
  SOURCE_ID NUMBER not null,
  NAME      VARCHAR2(30)
)
;
comment on table EFW_BUSINESS_MODULE_MAP
  is '业务模块权限定义表';
comment on column EFW_BUSINESS_MODULE_MAP.ID
  is '关联ID';
comment on column EFW_BUSINESS_MODULE_MAP.MODULE_ID
  is '业务模块ID';
comment on column EFW_BUSINESS_MODULE_MAP.SOURCE_ID
  is '权限实体ID';
comment on column EFW_BUSINESS_MODULE_MAP.NAME
  is '配置名称';
alter table EFW_BUSINESS_MODULE_MAP
  add constraint PK_BUSINESS_MODULE_MAP primary key (ID);
alter table EFW_BUSINESS_MODULE_MAP
  add constraint FK_EFW_BUSINESS_MAP foreign key (MODULE_ID)
  references EFW_BUSINESS_MODULE (MODULE_ID);
alter table EFW_BUSINESS_MODULE_MAP
  add constraint FK_EFW_ENTITY_SOURCE foreign key (SOURCE_ID)
  references EFW_SOURSE_ENTITY (ENTITY_ID);
create index IDX_EFW_BUSINESS_MAP on EFW_BUSINESS_MODULE_MAP (MODULE_ID);
create index IDX_EFW_ENTITY_SOURCE on EFW_BUSINESS_MODULE_MAP (SOURCE_ID);

prompt
prompt Creating table EFW_APPLY_SCOPE
prompt ==============================
prompt
create table EFW_APPLY_SCOPE
(
  APPLY_ID     NUMBER not null,
  TARGET_CLASS VARCHAR2(60) not null,
  TARGET_FIELD VARCHAR2(120) not null,
  IS_ENABLE    NUMBER not null,
  MAP_ID       INTEGER
)
;
comment on table EFW_APPLY_SCOPE
  is '应用范围表';
comment on column EFW_APPLY_SCOPE.APPLY_ID
  is '字段映射ID';
comment on column EFW_APPLY_SCOPE.TARGET_CLASS
  is '目标类';
comment on column EFW_APPLY_SCOPE.TARGET_FIELD
  is '目标字段';
comment on column EFW_APPLY_SCOPE.IS_ENABLE
  is '是否应用 {1应用,0不应用}';
alter table EFW_APPLY_SCOPE
  add constraint FK_MODULE_MAP_REL_APPLY_SCOPE foreign key (MAP_ID)
  references EFW_BUSINESS_MODULE_MAP (ID) on delete cascade;

prompt
prompt Creating table EFW_DATA_ROLE
prompt ============================
prompt
create table EFW_DATA_ROLE
(
  DR_ID       NUMBER not null,
  DR_NAME     VARCHAR2(128) not null,
  STATUS      VARCHAR2(6) not null,
  DESCRIPTION VARCHAR2(500)
)
;
comment on table EFW_DATA_ROLE
  is '数据角色表';
comment on column EFW_DATA_ROLE.DR_ID
  is '数据角色ID';
comment on column EFW_DATA_ROLE.DR_NAME
  is '数据角色名称';
comment on column EFW_DATA_ROLE.STATUS
  is '状态(A:可用 D:禁用)';
comment on column EFW_DATA_ROLE.DESCRIPTION
  is '描述';
alter table EFW_DATA_ROLE
  add constraint PK_DATA_ROLE primary key (DR_ID);
alter table EFW_DATA_ROLE
  add constraint UK_DATA_ROLE unique (DR_NAME);
alter table EFW_DATA_ROLE
  add constraint CKT_EFW_DATA_ROLE
  check (STATUS IN ('A','D'));

prompt
prompt Creating table EFW_DATA_ROLE_AUTHORITY
prompt ======================================
prompt
create table EFW_DATA_ROLE_AUTHORITY
(
  DA_ID       NUMBER not null,
  DR_ID       NUMBER not null,
  MODULE_ID   NUMBER,
  ENTITY_ID   NUMBER,
  DATA_ID     VARCHAR2(60) not null,
  FIELD_VALUE VARCHAR2(60) not null,
  FIELD_NAME  VARCHAR2(200)
)
;
comment on table EFW_DATA_ROLE_AUTHORITY
  is '数据角色权限';
comment on column EFW_DATA_ROLE_AUTHORITY.DA_ID
  is '数据权限ID';
comment on column EFW_DATA_ROLE_AUTHORITY.DR_ID
  is '数据角色';
comment on column EFW_DATA_ROLE_AUTHORITY.MODULE_ID
  is '权限划分主键';
comment on column EFW_DATA_ROLE_AUTHORITY.ENTITY_ID
  is '实体模块ID';
comment on column EFW_DATA_ROLE_AUTHORITY.DATA_ID
  is '实例ID，如果是字典是编码';
comment on column EFW_DATA_ROLE_AUTHORITY.FIELD_VALUE
  is '字段值';
comment on column EFW_DATA_ROLE_AUTHORITY.FIELD_NAME
  is '字段名称';
alter table EFW_DATA_ROLE_AUTHORITY
  add constraint PK_DATA_ROLE_AUTHORITY primary key (DA_ID);
alter table EFW_DATA_ROLE_AUTHORITY
  add constraint FK_DATA_ROLE foreign key (DR_ID)
  references EFW_DATA_ROLE (DR_ID) on delete cascade;
alter table EFW_DATA_ROLE_AUTHORITY
  add constraint FK_ENTITY_R_DATA_AUTHORITY foreign key (ENTITY_ID)
  references EFW_SOURSE_ENTITY (ENTITY_ID);
alter table EFW_DATA_ROLE_AUTHORITY
  add constraint FK_MODULE_R_DATA_AUTHORITY foreign key (MODULE_ID)
  references EFW_BUSINESS_MODULE (MODULE_ID);
create index IDX_AUTHORITY_ENTITY_SOURCE on EFW_DATA_ROLE_AUTHORITY (ENTITY_ID);
create index IDX_AUTHORITY_MODULE on EFW_DATA_ROLE_AUTHORITY (MODULE_ID);
create index IDX_DATA_ROLE on EFW_DATA_ROLE_AUTHORITY (DR_ID);

prompt
prompt Creating table EFW_TARGET_FIELD_MAP
prompt ===================================
prompt
create table EFW_TARGET_FIELD_MAP
(
  MAP_ID       NUMBER not null,
  MODULE_ID    NUMBER,
  MAP_NAME     VARCHAR2(60) not null,
  TARGET_CLASS VARCHAR2(60) not null,
  TARGET_FIELD VARCHAR2(120) not null,
  IS_ENABLE    NUMBER not null
)
;
comment on table EFW_TARGET_FIELD_MAP
  is '目标字段配置表';
comment on column EFW_TARGET_FIELD_MAP.MAP_ID
  is '字段映射ID';
comment on column EFW_TARGET_FIELD_MAP.MODULE_ID
  is '关联ID';
comment on column EFW_TARGET_FIELD_MAP.MAP_NAME
  is '映射名称';
comment on column EFW_TARGET_FIELD_MAP.TARGET_CLASS
  is '目标类';
comment on column EFW_TARGET_FIELD_MAP.TARGET_FIELD
  is '目标字段';
comment on column EFW_TARGET_FIELD_MAP.IS_ENABLE
  is '是否应用 {1应用,0不应用}';
alter table EFW_TARGET_FIELD_MAP
  add constraint PK_EFW_MAP_ID primary key (MAP_ID);
create index IDX_TARGET_FIELD_MOUDLE_ID on EFW_TARGET_FIELD_MAP (MODULE_ID);

prompt
prompt Creating table EFW_USER_DATA_ROLE
prompt =================================
prompt
create table EFW_USER_DATA_ROLE
(
  USER_DA_ID NUMBER not null,
  DR_ID      NUMBER not null,
  USER_ID    NUMBER not null
)
;
comment on table EFW_USER_DATA_ROLE
  is '用户数据权限表';
comment on column EFW_USER_DATA_ROLE.USER_DA_ID
  is '主键ID';
comment on column EFW_USER_DATA_ROLE.DR_ID
  is '数据角色ID';
comment on column EFW_USER_DATA_ROLE.USER_ID
  is '用户ID';
alter table EFW_USER_DATA_ROLE
  add constraint PK_USER_DA primary key (USER_DA_ID);
alter table EFW_USER_DATA_ROLE
  add constraint FK_USE_EFW_DATA_ROLE foreign key (DR_ID)
  references EFW_DATA_ROLE (DR_ID);
create index IDX_USER_DA_ACCTID on EFW_USER_DATA_ROLE (USER_ID);
create index IDX_USER_DA_ROLE_ID on EFW_USER_DATA_ROLE (DR_ID);

prompt
prompt Creating table FOS_ASSET_DEBT_MANAGEMENT
prompt ========================================
prompt
create table FOS_ASSET_DEBT_MANAGEMENT
(
  ASSET_DEBT_ID INTEGER not null,
  ASSET_AMOUNT  NUMBER not null,
  DEBT_TOATL    NUMBER not null,
  DEBT_RATIO    NUMBER not null,
  START_DATE    DATE,
  END_DATE      DATE,
  FOUND_DATE    DATE
)
;
comment on table FOS_ASSET_DEBT_MANAGEMENT
  is '资产负债率管理表';
comment on column FOS_ASSET_DEBT_MANAGEMENT.ASSET_DEBT_ID
  is '主键ID';
comment on column FOS_ASSET_DEBT_MANAGEMENT.ASSET_AMOUNT
  is '资产合计';
comment on column FOS_ASSET_DEBT_MANAGEMENT.DEBT_TOATL
  is '负债总计';
comment on column FOS_ASSET_DEBT_MANAGEMENT.DEBT_RATIO
  is '负债率';
comment on column FOS_ASSET_DEBT_MANAGEMENT.START_DATE
  is '起始日期';
comment on column FOS_ASSET_DEBT_MANAGEMENT.END_DATE
  is '截至日期';
comment on column FOS_ASSET_DEBT_MANAGEMENT.FOUND_DATE
  is '创建日期';
alter table FOS_ASSET_DEBT_MANAGEMENT
  add constraint PK_ASSET_DEBT_MANAGEMENT primary key (ASSET_DEBT_ID);

prompt
prompt Creating table FW_GROUP
prompt =======================
prompt
create table FW_GROUP
(
  GROUP_ID    NUMBER not null,
  GROUP_NAME  VARCHAR2(240) not null,
  STATUS      VARCHAR2(6) not null,
  DESCRIPTION VARCHAR2(400),
  GROUP_LEVEL NUMBER(20) not null,
  GROUP_STYLE VARCHAR2(80) not null,
  PARENT_ID   NUMBER,
  GROUP_TYPE  VARCHAR2(2)
)
;
comment on column FW_GROUP.GROUP_TYPE
  is '是否是报表汇总部门（1：是   2：否）';
alter table FW_GROUP
  add constraint PK_GROUP primary key (GROUP_ID);
alter table FW_GROUP
  add constraint UK_GROUP unique (GROUP_NAME);
alter table FW_GROUP
  add constraint FK_PARENT foreign key (PARENT_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_AUDITING_REPORTS_RECORD
prompt ==========================================
prompt
create table FOS_AUDITING_REPORTS_RECORD
(
  AUDIT_REP_REC_ID    INTEGER not null,
  REPORTS_NAME        VARCHAR2(200),
  ORG_USER_NAME       VARCHAR2(200),
  FOR_STATE           VARCHAR2(2),
  DEP_RES_USER        VARCHAR2(200),
  DEP_AUDITING_STATE  VARCHAR2(2),
  MG_LEADERSHIP       VARCHAR2(200),
  MG_LEADER_AUD_STATE VARCHAR2(2),
  GATHER_DATE         DATE,
  FOUND_DATE          DATE,
  GROUP_ID            INTEGER,
  ORG_ACCT_NAME       VARCHAR2(200),
  MG_LEADER_USER_NAME VARCHAR2(200),
  COPY_STATE          VARCHAR2(2)
)
;
comment on table FOS_AUDITING_REPORTS_RECORD
  is '报表审核记录表';
comment on column FOS_AUDITING_REPORTS_RECORD.AUDIT_REP_REC_ID
  is '主键ID';
comment on column FOS_AUDITING_REPORTS_RECORD.REPORTS_NAME
  is '报表名称';
comment on column FOS_AUDITING_REPORTS_RECORD.ORG_USER_NAME
  is '编制人';
comment on column FOS_AUDITING_REPORTS_RECORD.FOR_STATE
  is '编制状态(0:未完成,1:已完成)';
comment on column FOS_AUDITING_REPORTS_RECORD.DEP_RES_USER
  is '部门负责人';
comment on column FOS_AUDITING_REPORTS_RECORD.DEP_AUDITING_STATE
  is '部门审核状态';
comment on column FOS_AUDITING_REPORTS_RECORD.MG_LEADERSHIP
  is '分管领导（登录用户名）';
comment on column FOS_AUDITING_REPORTS_RECORD.MG_LEADER_AUD_STATE
  is '分管领导审核状态(0:未审核,1:已审核,2:驳回)';
comment on column FOS_AUDITING_REPORTS_RECORD.GATHER_DATE
  is '统计日期';
comment on column FOS_AUDITING_REPORTS_RECORD.FOUND_DATE
  is '创建日期';
comment on column FOS_AUDITING_REPORTS_RECORD.GROUP_ID
  is '所属部门ID';
comment on column FOS_AUDITING_REPORTS_RECORD.ORG_ACCT_NAME
  is '编制人（登录用户名）';
comment on column FOS_AUDITING_REPORTS_RECORD.MG_LEADER_USER_NAME
  is '分管领导';
comment on column FOS_AUDITING_REPORTS_RECORD.COPY_STATE
  is '是否被复制(0:未被复制, 1:已被复制)';
alter table FOS_AUDITING_REPORTS_RECORD
  add constraint PK_AUDITING_REPORTS_RECORD primary key (AUDIT_REP_REC_ID);
alter table FOS_AUDITING_REPORTS_RECORD
  add constraint FK_AUDIT_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_BASE_PROJECT_CATEGORIES
prompt ==========================================
prompt
create table FOS_BASE_PROJECT_CATEGORIES
(
  PRO_CATE_ID   INTEGER not null,
  PRO_CATE_CODE VARCHAR2(200),
  PRO_CATE_NAME VARCHAR2(200),
  PARENT_ID     INTEGER,
  GRADE         INTEGER,
  STATUS        VARCHAR2(2),
  STYLE         VARCHAR2(40),
  MODULE_NAME   VARCHAR2(50)
)
;
comment on table FOS_BASE_PROJECT_CATEGORIES
  is '项目类别表';
comment on column FOS_BASE_PROJECT_CATEGORIES.PRO_CATE_ID
  is '类别主键ID';
comment on column FOS_BASE_PROJECT_CATEGORIES.PRO_CATE_CODE
  is '类别编码';
comment on column FOS_BASE_PROJECT_CATEGORIES.PRO_CATE_NAME
  is '类别名称';
comment on column FOS_BASE_PROJECT_CATEGORIES.PARENT_ID
  is '上级ID';
comment on column FOS_BASE_PROJECT_CATEGORIES.GRADE
  is '级别';
comment on column FOS_BASE_PROJECT_CATEGORIES.STATUS
  is '状态';
comment on column FOS_BASE_PROJECT_CATEGORIES.STYLE
  is '样式';
comment on column FOS_BASE_PROJECT_CATEGORIES.MODULE_NAME
  is '模块名称(1:资金来源滚动计划 2:资金来源滚动计划 3:融资管理 4:集团内部借款 5:担保管理 6创投信息  7:委托贷款)';
alter table FOS_BASE_PROJECT_CATEGORIES
  add constraint PK_BASE_PROJECT_CATEGORIES primary key (PRO_CATE_ID);
alter table FOS_BASE_PROJECT_CATEGORIES
  add constraint UK_PROJECT_CATE unique (PRO_CATE_NAME, PARENT_ID, MODULE_NAME);

prompt
prompt Creating table FOS_ENTRUST_LOAN
prompt ===============================
prompt
create table FOS_ENTRUST_LOAN
(
  ENTRUST_LOAN_ID     INTEGER not null,
  LOAN_USER           VARCHAR2(200) not null,
  LOAN_BANK           VARCHAR2(200) not null,
  LOAN_MONEY          NUMBER not null,
  CONTRACT_RATES      NUMBER not null,
  START_RATE_DATE     DATE not null,
  END_RATE_DATE       DATE not null,
  TIME_LIMIT          NUMBER,
  INTEREST_INCOME     NUMBER,
  GROUP_ID            INTEGER not null,
  TRANSACT_USER       VARCHAR2(200) not null,
  REMARKS             VARCHAR2(1000),
  FOUND_DATE          DATE not null,
  PROVISION_DAYS      INTEGER,
  PAY_INTEREST_TIME   DATE,
  END_INTEREST_MODE   VARCHAR2(2) not null,
  REAL_RATES          NUMBER,
  ADVISER_COST        NUMBER,
  END_INTEREST_DATE   INTEGER not null,
  REPAY_PERIOD        VARCHAR2(10),
  LOAN_STATUS         VARCHAR2(2),
  FOR_STATE           VARCHAR2(2),
  DEP_RES_USER        VARCHAR2(200),
  DEP_AUDITING_STATE  VARCHAR2(2),
  MG_LEADERSHIP       VARCHAR2(200),
  MG_LEADER_AUD_STATE VARCHAR2(2),
  IS_MODIFY           VARCHAR2(2),
  TRANSACT_ACCT_NAME  VARCHAR2(200),
  MG_LEADER_USER_NAME VARCHAR2(200)
)
;
comment on table FOS_ENTRUST_LOAN
  is '委托贷款管理表';
comment on column FOS_ENTRUST_LOAN.ENTRUST_LOAN_ID
  is '主键ID';
comment on column FOS_ENTRUST_LOAN.LOAN_USER
  is '借款人';
comment on column FOS_ENTRUST_LOAN.LOAN_BANK
  is '委托贷款银行';
comment on column FOS_ENTRUST_LOAN.LOAN_MONEY
  is '贷款金额';
comment on column FOS_ENTRUST_LOAN.CONTRACT_RATES
  is '合同利率';
comment on column FOS_ENTRUST_LOAN.START_RATE_DATE
  is '起息日';
comment on column FOS_ENTRUST_LOAN.END_RATE_DATE
  is '到期日';
comment on column FOS_ENTRUST_LOAN.TIME_LIMIT
  is '期限';
comment on column FOS_ENTRUST_LOAN.INTEREST_INCOME
  is '利息收入';
comment on column FOS_ENTRUST_LOAN.GROUP_ID
  is '员工部门表ID';
comment on column FOS_ENTRUST_LOAN.TRANSACT_USER
  is '经办人';
comment on column FOS_ENTRUST_LOAN.REMARKS
  is '备注';
comment on column FOS_ENTRUST_LOAN.FOUND_DATE
  is '创建日期';
comment on column FOS_ENTRUST_LOAN.PROVISION_DAYS
  is '计提天数';
comment on column FOS_ENTRUST_LOAN.PAY_INTEREST_TIME
  is '付息时间';
comment on column FOS_ENTRUST_LOAN.END_INTEREST_MODE
  is '付息方式(1表示按月结，2表示季结)';
comment on column FOS_ENTRUST_LOAN.REAL_RATES
  is '实际利率';
comment on column FOS_ENTRUST_LOAN.ADVISER_COST
  is '财务顾问费';
comment on column FOS_ENTRUST_LOAN.END_INTEREST_DATE
  is '结息日';
comment on column FOS_ENTRUST_LOAN.REPAY_PERIOD
  is '还款周期';
comment on column FOS_ENTRUST_LOAN.LOAN_STATUS
  is '贷款状态(1：正常2：关注3：次级4：可疑5：损失)';
comment on column FOS_ENTRUST_LOAN.FOR_STATE
  is '编制状态(0:未完成,1:已完成)';
comment on column FOS_ENTRUST_LOAN.DEP_RES_USER
  is '部门负责人';
comment on column FOS_ENTRUST_LOAN.DEP_AUDITING_STATE
  is '部门审核状态';
comment on column FOS_ENTRUST_LOAN.MG_LEADERSHIP
  is '分管领导（登录用户名）';
comment on column FOS_ENTRUST_LOAN.MG_LEADER_AUD_STATE
  is '分管领导审核状态(0:未审核,1:已审核,2:驳回)';
comment on column FOS_ENTRUST_LOAN.IS_MODIFY
  is '是否可修改0代表否，1代表是（审核通过后数据不可修改）';
comment on column FOS_ENTRUST_LOAN.TRANSACT_ACCT_NAME
  is '编制人（登录用户名）';
comment on column FOS_ENTRUST_LOAN.MG_LEADER_USER_NAME
  is '分管领导';
alter table FOS_ENTRUST_LOAN
  add constraint PK_FOS_ENTRUST_LOAN primary key (ENTRUST_LOAN_ID);
alter table FOS_ENTRUST_LOAN
  add constraint FK_ENTRUST_LOAN_REF_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_ENTRUST_LOAN_REJECT_REASON
prompt =============================================
prompt
create table FOS_ENTRUST_LOAN_REJECT_REASON
(
  ENTRUST_LOAN_REASON_ID INTEGER not null,
  REJ_REASON             VARCHAR2(1000),
  REJ_USER_NAME          VARCHAR2(200),
  REJ_DATE               DATE,
  USE_TYPE               VARCHAR2(2),
  OWN_ID                 INTEGER,
  FOUND_DATE             DATE
)
;
comment on table FOS_ENTRUST_LOAN_REJECT_REASON
  is '委贷集团内部驳回原因记录表';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.ENTRUST_LOAN_REASON_ID
  is '主键ID';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.REJ_REASON
  is '驳回原因';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.REJ_USER_NAME
  is '驳回人';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.REJ_DATE
  is '驳回日期';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.USE_TYPE
  is '数据使用类型(1表示集团内部，2表示委托贷款)';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.OWN_ID
  is '所属表ID(集团内部主键ID，委托贷款主键ID)';
comment on column FOS_ENTRUST_LOAN_REJECT_REASON.FOUND_DATE
  is '创建日期';
alter table FOS_ENTRUST_LOAN_REJECT_REASON
  add constraint PK_ENTRUST_LOAN_REJECT_REASON primary key (ENTRUST_LOAN_REASON_ID);

prompt
prompt Creating table FOS_EXPORT_REPORTS_RECORD
prompt ========================================
prompt
create table FOS_EXPORT_REPORTS_RECORD
(
  EXPORT_REP_REC_ID   INTEGER not null,
  REPORTS_NAME        VARCHAR2(200),
  GROUP_NAME          VARCHAR2(200),
  ORG_USER_NAME       VARCHAR2(200),
  DEP_RES_USER        VARCHAR2(200),
  MG_LEADERSHIP       VARCHAR2(200),
  ALG_VSN_NUMBER      VARCHAR2(10),
  GATHER_DATE         DATE,
  FOUND_DATE          DATE,
  REPORTS_USE_TYPE    VARCHAR2(2),
  GROUP_ID            INTEGER,
  ORG_ACCT_NAME       VARCHAR2(200),
  MG_LEADER_USER_NAME VARCHAR2(200)
)
;
comment on table FOS_EXPORT_REPORTS_RECORD
  is '报表导出记录表';
comment on column FOS_EXPORT_REPORTS_RECORD.EXPORT_REP_REC_ID
  is '主键ID';
comment on column FOS_EXPORT_REPORTS_RECORD.REPORTS_NAME
  is '报表名称';
comment on column FOS_EXPORT_REPORTS_RECORD.GROUP_NAME
  is '编制单位';
comment on column FOS_EXPORT_REPORTS_RECORD.ORG_USER_NAME
  is '编制人';
comment on column FOS_EXPORT_REPORTS_RECORD.DEP_RES_USER
  is '部门负责人';
comment on column FOS_EXPORT_REPORTS_RECORD.MG_LEADERSHIP
  is '分管领导（登录用户名）';
comment on column FOS_EXPORT_REPORTS_RECORD.ALG_VSN_NUMBER
  is '算法文档版本号';
comment on column FOS_EXPORT_REPORTS_RECORD.GATHER_DATE
  is '统计日期';
comment on column FOS_EXPORT_REPORTS_RECORD.FOUND_DATE
  is '创建日期';
comment on column FOS_EXPORT_REPORTS_RECORD.REPORTS_USE_TYPE
  is '报表所属类型(1代表单部门，2代表5个部门总和)';
comment on column FOS_EXPORT_REPORTS_RECORD.GROUP_ID
  is '员工部门表ID（当报表所属类型是1时，需要根据不同的部门显示各自报表信息）';
comment on column FOS_EXPORT_REPORTS_RECORD.ORG_ACCT_NAME
  is '编制人（登录用户名）';
comment on column FOS_EXPORT_REPORTS_RECORD.MG_LEADER_USER_NAME
  is '分管领导';
alter table FOS_EXPORT_REPORTS_RECORD
  add constraint PK_EXPORT_REPORTS_RECORD primary key (EXPORT_REP_REC_ID);
alter table FOS_EXPORT_REPORTS_RECORD
  add constraint FK_EX_REPORTS_REF_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_FINANCING_DETAILS
prompt ====================================
prompt
create table FOS_FINANCING_DETAILS
(
  FINANCING_DETAILS_ID INTEGER not null,
  INTO_CATEGORY        VARCHAR2(10) not null,
  CONTRACT_NUMBER      VARCHAR2(200),
  INSTITUTION_CATEGORY VARCHAR2(10) not null,
  INSTITUTION_NAME     VARCHAR2(200) not null,
  FINANCING_CATEGORY   VARCHAR2(200),
  MONEY                NUMBER not null,
  PURPOSE              VARCHAR2(200),
  TIME_LIMIT           INTEGER,
  START_DATE           DATE not null,
  END_DATE             DATE not null,
  END_INTEREST_MODE    VARCHAR2(10) not null,
  END_INTEREST_DATE    INTEGER not null,
  IS_NEW               VARCHAR2(2) not null,
  OLD_ID               INTEGER not null,
  GROUP_ID             INTEGER not null,
  TRANSACT_USER        VARCHAR2(200) not null,
  REMARKS              VARCHAR2(1000),
  FOUND_DATE           DATE not null,
  IS_CHANGE            VARCHAR2(2) not null,
  INTEREST_RATES       VARCHAR2(10) not null,
  ADJUST_MODE          VARCHAR2(200),
  IS_ADVANCE_REPAY     VARCHAR2(2) not null,
  REPAY_DATE           DATE,
  REPAY_PERIOD         VARCHAR2(10),
  MORTGAGE_MODE        VARCHAR2(200),
  MORTGAGE_GOODS       VARCHAR2(200),
  REAL_END_DATE        DATE
)
;
comment on table FOS_FINANCING_DETAILS
  is '融资管理表';
comment on column FOS_FINANCING_DETAILS.FINANCING_DETAILS_ID
  is '主键ID';
comment on column FOS_FINANCING_DETAILS.INTO_CATEGORY
  is '信息类别(1代表融资，2代表授信)';
comment on column FOS_FINANCING_DETAILS.CONTRACT_NUMBER
  is '合同编号';
comment on column FOS_FINANCING_DETAILS.INSTITUTION_CATEGORY
  is '机构种类(1代表银行，2代表信托，3代表债券)';
comment on column FOS_FINANCING_DETAILS.INSTITUTION_NAME
  is '机构名称';
comment on column FOS_FINANCING_DETAILS.FINANCING_CATEGORY
  is '融资种类';
comment on column FOS_FINANCING_DETAILS.MONEY
  is '金额';
comment on column FOS_FINANCING_DETAILS.PURPOSE
  is '用途';
comment on column FOS_FINANCING_DETAILS.TIME_LIMIT
  is '融资期限(月)';
comment on column FOS_FINANCING_DETAILS.START_DATE
  is '起始日';
comment on column FOS_FINANCING_DETAILS.END_DATE
  is '截至日';
comment on column FOS_FINANCING_DETAILS.END_INTEREST_MODE
  is '结息方式(1表示按月结，2表示季结)';
comment on column FOS_FINANCING_DETAILS.END_INTEREST_DATE
  is '结息日';
comment on column FOS_FINANCING_DETAILS.IS_NEW
  is '是否最新(0代表否，1代表是)';
comment on column FOS_FINANCING_DETAILS.OLD_ID
  is '原始ID';
comment on column FOS_FINANCING_DETAILS.GROUP_ID
  is '员工部门表ID';
comment on column FOS_FINANCING_DETAILS.TRANSACT_USER
  is '经办人';
comment on column FOS_FINANCING_DETAILS.REMARKS
  is '备注';
comment on column FOS_FINANCING_DETAILS.FOUND_DATE
  is '创建日期';
comment on column FOS_FINANCING_DETAILS.IS_CHANGE
  is '是否变更利率(0代表否，1代表是)';
comment on column FOS_FINANCING_DETAILS.INTEREST_RATES
  is '利率';
comment on column FOS_FINANCING_DETAILS.ADJUST_MODE
  is '利率调整方式';
comment on column FOS_FINANCING_DETAILS.IS_ADVANCE_REPAY
  is '是否提前还款';
comment on column FOS_FINANCING_DETAILS.REPAY_DATE
  is '提前还款日期';
comment on column FOS_FINANCING_DETAILS.REPAY_PERIOD
  is '还款周期';
comment on column FOS_FINANCING_DETAILS.MORTGAGE_MODE
  is '担保/抵押方式';
comment on column FOS_FINANCING_DETAILS.MORTGAGE_GOODS
  is '抵押物';
comment on column FOS_FINANCING_DETAILS.REAL_END_DATE
  is '实际截至日期';
alter table FOS_FINANCING_DETAILS
  add constraint PK_FINANCING_DETAILS primary key (FINANCING_DETAILS_ID);
alter table FOS_FINANCING_DETAILS
  add constraint FK_FINANCING_DETAILS_REF_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_FINANCING_SECURITY_MONEY
prompt ===========================================
prompt
create table FOS_FINANCING_SECURITY_MONEY
(
  FINA_SECURITY_MONEY_ID INTEGER not null,
  USE_TYPE               VARCHAR2(2),
  BUDGET_MONEY           NUMBER,
  START_DATE             DATE,
  END_DATE               DATE,
  FOUND_DATE             DATE
)
;
comment on table FOS_FINANCING_SECURITY_MONEY
  is '融资担保金额计划表';
comment on column FOS_FINANCING_SECURITY_MONEY.FINA_SECURITY_MONEY_ID
  is '主键ID';
comment on column FOS_FINANCING_SECURITY_MONEY.USE_TYPE
  is '金额使用类型(1代表融资，2代表担保)';
comment on column FOS_FINANCING_SECURITY_MONEY.BUDGET_MONEY
  is '融资/担保年度预算金额';
comment on column FOS_FINANCING_SECURITY_MONEY.START_DATE
  is '年度起始时间';
comment on column FOS_FINANCING_SECURITY_MONEY.END_DATE
  is '年度截至时间';
comment on column FOS_FINANCING_SECURITY_MONEY.FOUND_DATE
  is '创建日期';
alter table FOS_FINANCING_SECURITY_MONEY
  add constraint PK_FINANCING_SECURITY_MONEY primary key (FINA_SECURITY_MONEY_ID);

prompt
prompt Creating table FOS_INITIAL_SETTLEMENT_MONEY
prompt ===========================================
prompt
create table FOS_INITIAL_SETTLEMENT_MONEY
(
  INITIAL_SET_MONEY_ID INTEGER not null,
  SETTLEMENT_MONEY     NUMBER,
  GATHER_DATE          DATE,
  FOUND_DATE           DATE,
  USE_TYPE             VARCHAR2(2)
)
;
comment on table FOS_INITIAL_SETTLEMENT_MONEY
  is '期初结转金额表';
comment on column FOS_INITIAL_SETTLEMENT_MONEY.INITIAL_SET_MONEY_ID
  is '主键ID';
comment on column FOS_INITIAL_SETTLEMENT_MONEY.SETTLEMENT_MONEY
  is '期初结转金额';
comment on column FOS_INITIAL_SETTLEMENT_MONEY.GATHER_DATE
  is '统计日期';
comment on column FOS_INITIAL_SETTLEMENT_MONEY.FOUND_DATE
  is '创建日期';
comment on column FOS_INITIAL_SETTLEMENT_MONEY.USE_TYPE
  is '金额使用类型(1:自有资金期初结转金额, 2:财政专户期初结转金额)';
alter table FOS_INITIAL_SETTLEMENT_MONEY
  add constraint PK_INITIAL_SETTLEMENT_MONEY primary key (INITIAL_SET_MONEY_ID);

prompt
prompt Creating table FOS_INTERIOR_LOAN
prompt ================================
prompt
create table FOS_INTERIOR_LOAN
(
  INTERIOR_LOAN_ID    INTEGER not null,
  LOAN_USER           VARCHAR2(200) not null,
  LOAN_MONEY          NUMBER not null,
  LOAN_BANK           VARCHAR2(200) not null,
  CONTRACT_RATES      NUMBER not null,
  REAL_RATES          NUMBER,
  ADVISER_COST        NUMBER,
  START_RATE_DATE     DATE not null,
  END_RATE_DATE       DATE not null,
  TIME_LIMIT          NUMBER,
  PROVISION_DAYS      INTEGER,
  INTEREST_INCOME     NUMBER,
  END_INTEREST_DATE   INTEGER not null,
  END_INTEREST_MODE   VARCHAR2(2) not null,
  LOAN_STATUS         VARCHAR2(2) not null,
  IS_DELAY            VARCHAR2(2) not null,
  DELAY_START_DATE    DATE,
  DELAY_END_DATE      DATE,
  GROUP_ID            INTEGER not null,
  TRANSACT_USER       VARCHAR2(200) not null,
  FOUND_DATE          DATE not null,
  REMARKS             VARCHAR2(1000),
  FOR_STATE           VARCHAR2(2),
  DEP_RES_USER        VARCHAR2(200),
  DEP_AUDITING_STATE  VARCHAR2(2),
  MG_LEADERSHIP       VARCHAR2(200),
  MG_LEADER_AUD_STATE VARCHAR2(2),
  IS_MODIFY           VARCHAR2(2),
  REPAY_PERIOD        VARCHAR2(10),
  TRANSACT_ACCT_NAME  VARCHAR2(200),
  MG_LEADER_USER_NAME VARCHAR2(200)
)
;
comment on table FOS_INTERIOR_LOAN
  is '集团内部借款';
comment on column FOS_INTERIOR_LOAN.INTERIOR_LOAN_ID
  is '主键ID';
comment on column FOS_INTERIOR_LOAN.LOAN_USER
  is '借款人';
comment on column FOS_INTERIOR_LOAN.LOAN_MONEY
  is '借款金额';
comment on column FOS_INTERIOR_LOAN.LOAN_BANK
  is '贷款银行';
comment on column FOS_INTERIOR_LOAN.CONTRACT_RATES
  is '合同利率';
comment on column FOS_INTERIOR_LOAN.REAL_RATES
  is '实际利率';
comment on column FOS_INTERIOR_LOAN.ADVISER_COST
  is '财务顾问费';
comment on column FOS_INTERIOR_LOAN.START_RATE_DATE
  is '起息日';
comment on column FOS_INTERIOR_LOAN.END_RATE_DATE
  is '到期日';
comment on column FOS_INTERIOR_LOAN.TIME_LIMIT
  is '期限';
comment on column FOS_INTERIOR_LOAN.PROVISION_DAYS
  is '计提天数';
comment on column FOS_INTERIOR_LOAN.INTEREST_INCOME
  is '利息收入';
comment on column FOS_INTERIOR_LOAN.END_INTEREST_DATE
  is '结息日';
comment on column FOS_INTERIOR_LOAN.END_INTEREST_MODE
  is '付息方式(1表示按月结，2表示季结)';
comment on column FOS_INTERIOR_LOAN.LOAN_STATUS
  is '借款状态(1表示正常，2表示逾期还款，3表示续贷)';
comment on column FOS_INTERIOR_LOAN.IS_DELAY
  is '是否延期(0表示否,1表示是)';
comment on column FOS_INTERIOR_LOAN.DELAY_START_DATE
  is '延期起始日期';
comment on column FOS_INTERIOR_LOAN.DELAY_END_DATE
  is '延期截至日期';
comment on column FOS_INTERIOR_LOAN.GROUP_ID
  is '员工部门表ID';
comment on column FOS_INTERIOR_LOAN.TRANSACT_USER
  is '经办人';
comment on column FOS_INTERIOR_LOAN.FOUND_DATE
  is '创建日期';
comment on column FOS_INTERIOR_LOAN.REMARKS
  is '备注';
comment on column FOS_INTERIOR_LOAN.FOR_STATE
  is '编制状态(0:未完成,1:已完成)';
comment on column FOS_INTERIOR_LOAN.DEP_RES_USER
  is '部门负责人';
comment on column FOS_INTERIOR_LOAN.DEP_AUDITING_STATE
  is '部门审核状态';
comment on column FOS_INTERIOR_LOAN.MG_LEADERSHIP
  is '分管领导（登录用户名）';
comment on column FOS_INTERIOR_LOAN.MG_LEADER_AUD_STATE
  is '分管领导审核状态(0:未审核,1:已审核,2:驳回)';
comment on column FOS_INTERIOR_LOAN.IS_MODIFY
  is '是否可修改0代表否，1代表是（审核通过后数据不可修改）';
comment on column FOS_INTERIOR_LOAN.REPAY_PERIOD
  is '还款周期（365）';
comment on column FOS_INTERIOR_LOAN.TRANSACT_ACCT_NAME
  is '经办人（登录用户名）';
comment on column FOS_INTERIOR_LOAN.MG_LEADER_USER_NAME
  is '分管领导';
alter table FOS_INTERIOR_LOAN
  add constraint PK_FOS_INTERIOR_LOAN primary key (INTERIOR_LOAN_ID);
alter table FOS_INTERIOR_LOAN
  add constraint FK_INTERIOR_LOAN_REF_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_REJECT_REASON_RECORD
prompt =======================================
prompt
create table FOS_REJECT_REASON_RECORD
(
  REJ_REA_RECORD_ID INTEGER not null,
  AUDIT_REP_REC_ID  INTEGER,
  REJ_REASON        VARCHAR2(1000),
  REJ_USER_NAME     VARCHAR2(200),
  REJ_DATE          DATE,
  FOUND_DATE        DATE
)
;
comment on table FOS_REJECT_REASON_RECORD
  is '驳回原因记录表';
comment on column FOS_REJECT_REASON_RECORD.REJ_REA_RECORD_ID
  is '主键ID';
comment on column FOS_REJECT_REASON_RECORD.AUDIT_REP_REC_ID
  is '报表审批记录表ID';
comment on column FOS_REJECT_REASON_RECORD.REJ_REASON
  is '驳回原因';
comment on column FOS_REJECT_REASON_RECORD.REJ_USER_NAME
  is '驳回人';
comment on column FOS_REJECT_REASON_RECORD.REJ_DATE
  is '驳回日期';
comment on column FOS_REJECT_REASON_RECORD.FOUND_DATE
  is '创建日期';
alter table FOS_REJECT_REASON_RECORD
  add constraint PK_REJECT_REASON_RECORD primary key (REJ_REA_RECORD_ID);
alter table FOS_REJECT_REASON_RECORD
  add constraint FK_RE_REF_AUDITING foreign key (AUDIT_REP_REC_ID)
  references FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID) on delete cascade;

prompt
prompt Creating table FOS_REPORTS_DETAILS
prompt ==================================
prompt
create table FOS_REPORTS_DETAILS
(
  REP_DETAILS_ID     INTEGER not null,
  ONE_REPORTS_NAME   VARCHAR2(200),
  TWO_REPORTS_NAME   VARCHAR2(200),
  THREE_REPORTS_NAME VARCHAR2(200),
  GATHER_DATE        DATE,
  FOUND_DATE         DATE,
  REPORTS_USE_TYPE   VARCHAR2(2),
  GROUP_ID           INTEGER
)
;
comment on table FOS_REPORTS_DETAILS
  is '导出报表明细表';
comment on column FOS_REPORTS_DETAILS.REP_DETAILS_ID
  is '主键ID';
comment on column FOS_REPORTS_DETAILS.ONE_REPORTS_NAME
  is '报表名称1（资金来源）';
comment on column FOS_REPORTS_DETAILS.TWO_REPORTS_NAME
  is '报表名称2（资金运用）';
comment on column FOS_REPORTS_DETAILS.THREE_REPORTS_NAME
  is '报表名称3（平衡分析）';
comment on column FOS_REPORTS_DETAILS.GATHER_DATE
  is '统计日期';
comment on column FOS_REPORTS_DETAILS.FOUND_DATE
  is '创建日期';
comment on column FOS_REPORTS_DETAILS.REPORTS_USE_TYPE
  is '报表所属类型（1代表单部门，2代表5个部门总和）';
comment on column FOS_REPORTS_DETAILS.GROUP_ID
  is '员工部门表ID（当报表所属类型是1时，需要根据不同的部门显示各自报表信息）';
alter table FOS_REPORTS_DETAILS
  add constraint PK_REPORTS_DETAILS primary key (REP_DETAILS_ID);
alter table FOS_REPORTS_DETAILS
  add constraint FK_REPORTS_REF_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_SECURITY_AUTHORIZATION
prompt =========================================
prompt
create table FOS_SECURITY_AUTHORIZATION
(
  SCY_ATZN_DTL_ID     INTEGER not null,
  PRO_CATEGORIES_CODE VARCHAR2(2) not null,
  EVENT_STATUS        VARCHAR2(2) not null,
  EVENT_NAME          VARCHAR2(200) not null,
  DRAW_TYPE           VARCHAR2(2),
  CONTRACT_MONEY      NUMBER not null,
  SECURITY_MONEY      NUMBER,
  EVENT_INITIAL_TIME  DATE not null,
  EVENT_END_TIME      DATE not null,
  APPROVE_CONDITION   VARCHAR2(1000),
  EVENT_SUMMARY       VARCHAR2(1000),
  REMARKS             VARCHAR2(1000),
  GROUP_ID            INTEGER not null,
  TRANSACT_USER       VARCHAR2(200) not null,
  FOUND_DATE          DATE not null,
  REMAINDER_MONEY     NUMBER
)
;
comment on table FOS_SECURITY_AUTHORIZATION
  is '担保授权执行表';
comment on column FOS_SECURITY_AUTHORIZATION.SCY_ATZN_DTL_ID
  is '主键ID';
comment on column FOS_SECURITY_AUTHORIZATION.PRO_CATEGORIES_CODE
  is '项目类别(1代表参股，2代表其他)';
comment on column FOS_SECURITY_AUTHORIZATION.EVENT_STATUS
  is '事项状态(1代表已到期偿还，2代表正常)';
comment on column FOS_SECURITY_AUTHORIZATION.EVENT_NAME
  is '事项名称';
comment on column FOS_SECURITY_AUTHORIZATION.DRAW_TYPE
  is '提取类别(1代表已提，2代表未提)';
comment on column FOS_SECURITY_AUTHORIZATION.CONTRACT_MONEY
  is '合同金额';
comment on column FOS_SECURITY_AUTHORIZATION.SECURITY_MONEY
  is '担保金额';
comment on column FOS_SECURITY_AUTHORIZATION.EVENT_INITIAL_TIME
  is '事件发生起始时间';
comment on column FOS_SECURITY_AUTHORIZATION.EVENT_END_TIME
  is '事件发生截至时间';
comment on column FOS_SECURITY_AUTHORIZATION.APPROVE_CONDITION
  is '审批情况';
comment on column FOS_SECURITY_AUTHORIZATION.EVENT_SUMMARY
  is '事项基本情况概述';
comment on column FOS_SECURITY_AUTHORIZATION.REMARKS
  is '备注';
comment on column FOS_SECURITY_AUTHORIZATION.GROUP_ID
  is '员工部门表ID ';
comment on column FOS_SECURITY_AUTHORIZATION.TRANSACT_USER
  is '经办人';
comment on column FOS_SECURITY_AUTHORIZATION.FOUND_DATE
  is '创建日期';
comment on column FOS_SECURITY_AUTHORIZATION.REMAINDER_MONEY
  is '担保余额';
alter table FOS_SECURITY_AUTHORIZATION
  add constraint PK_SECURITY_AUTHORIZATION_DETA primary key (SCY_ATZN_DTL_ID);
alter table FOS_SECURITY_AUTHORIZATION
  add constraint FK_SECURITY_REF_STAFF foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_SOURCE_USE_FUNDS
prompt ===================================
prompt
create table FOS_SOURCE_USE_FUNDS
(
  SOURCE_FUNDS_ID        INTEGER not null,
  FIRST_CATE_ID          INTEGER,
  PROJECT_NAME           VARCHAR2(200),
  TEN_DAYS_MONEY         NUMBER,
  TEN_DAYS_DATE          DATE,
  A_MONTH_MONEY          NUMBER,
  A_MONTH_DATE           DATE,
  TWO_MONTHS_MONEY       NUMBER,
  THREE_MONTHS_MONEY     NUMBER,
  SIX_MONTHS_MONEY       NUMBER,
  MOER_SIX_MONTHS_MONEY  NUMBER,
  GROUP_ID               INTEGER,
  DATA_SOURCES           VARCHAR2(2),
  IS_MODIFY              VARCHAR2(2),
  ORGANIZATION_USER_NAME VARCHAR2(200),
  GATHER_DATE            DATE,
  FOUND_DATE             DATE,
  SECOND_CATE_ID         INTEGER,
  REMARKS                VARCHAR2(1000)
)
;
comment on table FOS_SOURCE_USE_FUNDS
  is '资金来源运用滚动计划表';
comment on column FOS_SOURCE_USE_FUNDS.SOURCE_FUNDS_ID
  is '主键ID';
comment on column FOS_SOURCE_USE_FUNDS.FIRST_CATE_ID
  is '项目类别表ID 一级';
comment on column FOS_SOURCE_USE_FUNDS.PROJECT_NAME
  is '项目名称';
comment on column FOS_SOURCE_USE_FUNDS.TEN_DAYS_MONEY
  is '10日内金额';
comment on column FOS_SOURCE_USE_FUNDS.A_MONTH_MONEY
  is '1个月内金额';
comment on column FOS_SOURCE_USE_FUNDS.TWO_MONTHS_MONEY
  is '2个月内金额';
comment on column FOS_SOURCE_USE_FUNDS.THREE_MONTHS_MONEY
  is '3个月内金额';
comment on column FOS_SOURCE_USE_FUNDS.SIX_MONTHS_MONEY
  is '6个月内金额';
comment on column FOS_SOURCE_USE_FUNDS.MOER_SIX_MONTHS_MONEY
  is '6个月以上金额';
comment on column FOS_SOURCE_USE_FUNDS.GROUP_ID
  is '员工部门表ID';
comment on column FOS_SOURCE_USE_FUNDS.DATA_SOURCES
  is '数据来源（1代表资金来源、2代表资金运用、3代表创投资金）';
comment on column FOS_SOURCE_USE_FUNDS.IS_MODIFY
  is '是否可修改0代表否，1代表是（报表导出后数据不可修改）';
comment on column FOS_SOURCE_USE_FUNDS.ORGANIZATION_USER_NAME
  is '编制人';
comment on column FOS_SOURCE_USE_FUNDS.GATHER_DATE
  is '统计日期';
comment on column FOS_SOURCE_USE_FUNDS.FOUND_DATE
  is '创建时间';
comment on column FOS_SOURCE_USE_FUNDS.SECOND_CATE_ID
  is '项目类别表ID 二级';
comment on column FOS_SOURCE_USE_FUNDS.REMARKS
  is '备注';
alter table FOS_SOURCE_USE_FUNDS
  add constraint PK_SOURCE_USE_FUNDS primary key (SOURCE_FUNDS_ID);
alter table FOS_SOURCE_USE_FUNDS
  add constraint FK_SOURCE_REF_STAFF foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FOS_TEMP_SOURCE_USE_FUNDS
prompt ========================================
prompt
create table FOS_TEMP_SOURCE_USE_FUNDS
(
  SOURCE_FUNDS_ID        INTEGER not null,
  FIRST_CATE_ID          INTEGER,
  PROJECT_NAME           VARCHAR2(200),
  TEN_DAYS_MONEY         NUMBER,
  TEN_DAYS_DATE          DATE,
  A_MONTH_MONEY          NUMBER,
  A_MONTH_DATE           DATE,
  TWO_MONTHS_MONEY       NUMBER,
  THREE_MONTHS_MONEY     NUMBER,
  SIX_MONTHS_MONEY       NUMBER,
  MOER_SIX_MONTHS_MONEY  NUMBER,
  GROUP_ID               INTEGER,
  DATA_SOURCES           VARCHAR2(2),
  IS_MODIFY              VARCHAR2(2),
  ORGANIZATION_USER_NAME VARCHAR2(200),
  GATHER_DATE            DATE,
  FOUND_DATE             DATE,
  SECOND_CATE_ID         INTEGER,
  REMARKS                VARCHAR2(1000)
)
;
comment on table FOS_TEMP_SOURCE_USE_FUNDS
  is '资金来源运用滚动计划表';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.SOURCE_FUNDS_ID
  is '主键ID';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.FIRST_CATE_ID
  is '项目类别表ID 一级';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.PROJECT_NAME
  is '项目名称';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.TEN_DAYS_MONEY
  is '10日内金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.A_MONTH_MONEY
  is '1个月内金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.TWO_MONTHS_MONEY
  is '2个月内金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.THREE_MONTHS_MONEY
  is '3个月内金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.SIX_MONTHS_MONEY
  is '6个月内金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.MOER_SIX_MONTHS_MONEY
  is '6个月以上金额';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.GROUP_ID
  is '员工部门表ID';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.DATA_SOURCES
  is '数据来源（1代表资金来源、2代表资金运用、3代表创投资金）';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.IS_MODIFY
  is '是否可修改0代表否，1代表是（报表导出后数据不可修改）';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.ORGANIZATION_USER_NAME
  is '编制人';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.GATHER_DATE
  is '统计日期';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.FOUND_DATE
  is '创建时间';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.SECOND_CATE_ID
  is '项目类别表ID 二级';
comment on column FOS_TEMP_SOURCE_USE_FUNDS.REMARKS
  is '备注';
alter table FOS_TEMP_SOURCE_USE_FUNDS
  add constraint PK_TEMP_SOURCE_USE_FUNDS primary key (SOURCE_FUNDS_ID);
alter table FOS_TEMP_SOURCE_USE_FUNDS
  add constraint FK_TEMP_SOURCE_REF_STAFF foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);

prompt
prompt Creating table FW_ACCOUNT
prompt =========================
prompt
create table FW_ACCOUNT
(
  ACCT_ID     NUMBER not null,
  ACCT_NAME   VARCHAR2(40) not null,
  USER_NAME   VARCHAR2(120),
  FULL_NAME   VARCHAR2(120),
  ACCT_PWD    VARCHAR2(100) not null,
  RANDOM_KEY  VARCHAR2(40),
  STATUS      VARCHAR2(6) not null,
  DESCRIPTION VARCHAR2(400),
  GENDER      NUMBER,
  BIRTHDAY    DATE,
  EMAIL       VARCHAR2(160),
  PHOTO       VARCHAR2(100),
  PHONE       VARCHAR2(60),
  GROUP_ID    INTEGER not null,
  POSITION    VARCHAR2(2) default 11 not null
)
;
comment on table FW_ACCOUNT
  is '用户表';
comment on column FW_ACCOUNT.ACCT_ID
  is '主键';
comment on column FW_ACCOUNT.ACCT_NAME
  is '帐号';
comment on column FW_ACCOUNT.USER_NAME
  is '用户名';
comment on column FW_ACCOUNT.FULL_NAME
  is '用户名全称';
comment on column FW_ACCOUNT.ACCT_PWD
  is '密码';
comment on column FW_ACCOUNT.RANDOM_KEY
  is '随机密码';
comment on column FW_ACCOUNT.STATUS
  is '状态(A: 可用  D: 禁用)';
comment on column FW_ACCOUNT.DESCRIPTION
  is '描述';
comment on column FW_ACCOUNT.GENDER
  is '性别';
comment on column FW_ACCOUNT.BIRTHDAY
  is '生日';
comment on column FW_ACCOUNT.EMAIL
  is '电子邮件';
comment on column FW_ACCOUNT.PHOTO
  is '照片';
comment on column FW_ACCOUNT.PHONE
  is '手机';
comment on column FW_ACCOUNT.GROUP_ID
  is '用户组';
comment on column FW_ACCOUNT.POSITION
  is '职务';
alter table FW_ACCOUNT
  add constraint PK_ACCOUNT primary key (ACCT_ID);
alter table FW_ACCOUNT
  add constraint UK_ACCOUNT unique (ACCT_NAME);
alter table FW_ACCOUNT
  add constraint FK_ACCOUNT_GROUP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);
alter table FW_ACCOUNT
  add constraint CKT_FW_ACCOUNT
  check ((gender in (0,1,2)) and (status in ('A','D')));

prompt
prompt Creating table FW_DUTY
prompt ======================
prompt
create table FW_DUTY
(
  DUTY_ID     NUMBER not null,
  GROUP_ID    NUMBER not null,
  DUTY_NAME   VARCHAR2(240),
  STATUS      VARCHAR2(6) not null,
  DESCRIPTION VARCHAR2(400),
  DUTY_TYPE   VARCHAR2(8) not null
)
;
comment on table FW_DUTY
  is '角色表';
comment on column FW_DUTY.DUTY_ID
  is '角色ID';
comment on column FW_DUTY.GROUP_ID
  is '用户组';
comment on column FW_DUTY.DUTY_NAME
  is '角色名称';
comment on column FW_DUTY.STATUS
  is '状态(A: 可用  D: 禁用)';
comment on column FW_DUTY.DESCRIPTION
  is '描述';
comment on column FW_DUTY.DUTY_TYPE
  is '角色类型';
alter table FW_DUTY
  add constraint PK_DUTY primary key (DUTY_ID);
alter table FW_DUTY
  add constraint UK_DUTY unique (DUTY_NAME);
alter table FW_DUTY
  add constraint FK_DUTY_GRUOP foreign key (GROUP_ID)
  references FW_GROUP (GROUP_ID);
alter table FW_DUTY
  add constraint CKT_FW_DUTY
  check (status in ('A','D'));
create index IDX_DUTY_SYS_ID on FW_DUTY (GROUP_ID)
  reverse;

prompt
prompt Creating table FW_ACCOUNT_DUTY
prompt ==============================
prompt
create table FW_ACCOUNT_DUTY
(
  ACC_DUTY_ID NUMBER not null,
  DUTY_ID     NUMBER not null,
  ACCT_ID     NUMBER not null
)
;
comment on table FW_ACCOUNT_DUTY
  is '用户角色表';
comment on column FW_ACCOUNT_DUTY.DUTY_ID
  is '角色ID';
comment on column FW_ACCOUNT_DUTY.ACCT_ID
  is '用户ID';
alter table FW_ACCOUNT_DUTY
  add constraint PK_ACCOUNT_DUTY primary key (ACC_DUTY_ID);
alter table FW_ACCOUNT_DUTY
  add constraint FK_AD_ACCOUNT foreign key (ACCT_ID)
  references FW_ACCOUNT (ACCT_ID);
alter table FW_ACCOUNT_DUTY
  add constraint FK_AD_DUTY foreign key (DUTY_ID)
  references FW_DUTY (DUTY_ID);
create index IDX_ACCOUNT_DUTY_ACCOUNT on FW_ACCOUNT_DUTY (ACCT_ID)
  reverse;
create index IDX_ACCOUNT_DUTY_DUTY on FW_ACCOUNT_DUTY (DUTY_ID)
  reverse;

prompt
prompt Creating table FW_ACTION_LOG
prompt ============================
prompt
create table FW_ACTION_LOG
(
  ACT_LOG_ID  NUMBER not null,
  ACTION_TIME DATE not null,
  CLIENT_IP   VARCHAR2(40),
  CLIENT_PORT NUMBER,
  ACTION_ID   NUMBER not null,
  ACCT_ID     NUMBER not null
)
;
comment on table FW_ACTION_LOG
  is '操作日志表';
comment on column FW_ACTION_LOG.ACTION_TIME
  is '操作时间';
comment on column FW_ACTION_LOG.CLIENT_IP
  is '客户端IP';
comment on column FW_ACTION_LOG.CLIENT_PORT
  is '端口';
comment on column FW_ACTION_LOG.ACTION_ID
  is '操作ID';
comment on column FW_ACTION_LOG.ACCT_ID
  is '用户ID';
alter table FW_ACTION_LOG
  add constraint PK_ACTION_LOG primary key (ACT_LOG_ID);
create index IDX_LOG_ACCOUNT on FW_ACTION_LOG (ACCT_ID)
  reverse;

prompt
prompt Creating table FW_ACTION_CNT
prompt ============================
prompt
create table FW_ACTION_CNT
(
  ACT_CNT_ID      NUMBER not null,
  ACT_LOG_ID      NUMBER,
  BUSINESS_ID     NUMBER,
  BUSINESS_MODULE NUMBER,
  ACT_CNT         VARCHAR2(4000)
)
;
comment on table FW_ACTION_CNT
  is '操作日志明细表';
comment on column FW_ACTION_CNT.BUSINESS_ID
  is '业务ID';
comment on column FW_ACTION_CNT.BUSINESS_MODULE
  is '业务模块';
comment on column FW_ACTION_CNT.ACT_CNT
  is '日志内容';
alter table FW_ACTION_CNT
  add constraint PK_ACTION_CNT primary key (ACT_CNT_ID);
alter table FW_ACTION_CNT
  add constraint FK_CNT_LOG foreign key (ACT_LOG_ID)
  references FW_ACTION_LOG (ACT_LOG_ID);
create index IDX_ACTION_CNT_ACTIONID on FW_ACTION_CNT (ACT_LOG_ID)
  reverse;

prompt
prompt Creating table FW_CATEGORY
prompt ==========================
prompt
create table FW_CATEGORY
(
  CATEGORY_ID INTEGER not null,
  NAME        VARCHAR2(60) not null,
  CODE        VARCHAR2(30) not null,
  DISPLAY     VARCHAR2(10) not null,
  SYS_ID      INTEGER not null
)
;
comment on table FW_CATEGORY
  is '字典目录表';
comment on column FW_CATEGORY.CATEGORY_ID
  is '字典目录ID';
comment on column FW_CATEGORY.NAME
  is '字典目录名称';
comment on column FW_CATEGORY.CODE
  is '字典目录代码';
comment on column FW_CATEGORY.DISPLAY
  is '是否显示';
comment on column FW_CATEGORY.SYS_ID
  is '系统ID';
alter table FW_CATEGORY
  add constraint PK_FW_CATEGORY primary key (CATEGORY_ID);
alter table FW_CATEGORY
  add constraint UK_DIC_CATEGORY unique (CODE, SYS_ID);

prompt
prompt Creating table FW_DICTIONARY
prompt ============================
prompt
create table FW_DICTIONARY
(
  DICTIONARY_ID INTEGER not null,
  CATEGORY_ID   INTEGER not null,
  NAME          VARCHAR2(200) not null,
  CODE          VARCHAR2(30) not null,
  ORDER_NUM     VARCHAR2(30) not null,
  STATUS        VARCHAR2(6) not null
)
;
comment on table FW_DICTIONARY
  is '字典表';
comment on column FW_DICTIONARY.DICTIONARY_ID
  is '字典Id';
comment on column FW_DICTIONARY.CATEGORY_ID
  is '字典目录ID';
comment on column FW_DICTIONARY.NAME
  is '字典名称';
comment on column FW_DICTIONARY.CODE
  is '字典编码';
comment on column FW_DICTIONARY.ORDER_NUM
  is '字典排序';
comment on column FW_DICTIONARY.STATUS
  is '字典状态(A可用,D不可用)';
alter table FW_DICTIONARY
  add constraint PK_FW_DICTIONARY primary key (DICTIONARY_ID);
alter table FW_DICTIONARY
  add constraint UK_FW_DICTIONARY_CODE unique (CODE, CATEGORY_ID);
alter table FW_DICTIONARY
  add constraint UK_FW_DICTIONARY_NAME unique (CATEGORY_ID, NAME);
alter table FW_DICTIONARY
  add constraint FK_DICTIONARY_CATEGORY foreign key (CATEGORY_ID)
  references FW_CATEGORY (CATEGORY_ID);
alter table FW_DICTIONARY
  add constraint CKT_FW_DICTIONARY
  check (STATUS IN ('A','D'));
create index IDX_DICTIONARY_CATEGORY_ID on FW_DICTIONARY (CATEGORY_ID);

prompt
prompt Creating table FW_SOURCE
prompt ========================
prompt
create table FW_SOURCE
(
  SOURCE_ID    NUMBER not null,
  SOURCE_NAME  VARCHAR2(240) not null,
  SOURCE_CODE  VARCHAR2(200) not null,
  STATUS       VARCHAR2(6) not null,
  SOURCE_LEVEL NUMBER not null,
  SOURCE_STYLE VARCHAR2(40) not null,
  POSITION     NUMBER(20) not null,
  IS_MENU      NUMBER(20) not null,
  DESCRIPTION  VARCHAR2(400),
  ICON         VARCHAR2(60),
  PARENT_ID    NUMBER,
  SYS_ID       NUMBER
)
;
comment on table FW_SOURCE
  is '菜单表';
comment on column FW_SOURCE.SOURCE_NAME
  is '菜单名称';
comment on column FW_SOURCE.SOURCE_CODE
  is '菜单对应url';
comment on column FW_SOURCE.STATUS
  is '状态(A:可用 D:禁用)';
comment on column FW_SOURCE.SOURCE_LEVEL
  is '菜单级别';
comment on column FW_SOURCE.SOURCE_STYLE
  is '样式';
comment on column FW_SOURCE.IS_MENU
  is '是否显示';
comment on column FW_SOURCE.DESCRIPTION
  is '描述';
comment on column FW_SOURCE.ICON
  is '图标';
comment on column FW_SOURCE.PARENT_ID
  is '上级菜单ID';
alter table FW_SOURCE
  add constraint PK_SOURCE primary key (SOURCE_ID);
alter table FW_SOURCE
  add constraint UK_SOURCE unique (SOURCE_NAME, PARENT_ID);
alter table FW_SOURCE
  add constraint FK_SOURCE_PARENT foreign key (PARENT_ID)
  references FW_SOURCE (SOURCE_ID);
alter table FW_SOURCE
  add constraint CKT_FW_SOURCE
  check (status in ('A','D'));
create index IDX_SOURCE_PARENT on FW_SOURCE (PARENT_ID)
  reverse;
create index IDX_SOURCE_SYS_ID on FW_SOURCE (SYS_ID)
  reverse;

prompt
prompt Creating table FW_SRC_ACTION
prompt ============================
prompt
create table FW_SRC_ACTION
(
  ACTION_ID      NUMBER not null,
  SOURCE_ID      NUMBER not null,
  ACTION_NAME    VARCHAR2(240) not null,
  METHOD_NAME    VARCHAR2(60) not null,
  LOG_LEVEL      NUMBER,
  ACTION_METHODS VARCHAR2(480),
  ACTION_ORDER   FLOAT,
  ACTION_PATH    VARCHAR2(300)
)
;
comment on table FW_SRC_ACTION
  is '菜单操作表';
comment on column FW_SRC_ACTION.SOURCE_ID
  is '菜单ID';
comment on column FW_SRC_ACTION.ACTION_NAME
  is '操作名称';
comment on column FW_SRC_ACTION.METHOD_NAME
  is '方法名称';
comment on column FW_SRC_ACTION.LOG_LEVEL
  is '日志级别';
comment on column FW_SRC_ACTION.ACTION_METHODS
  is '可操作方法';
comment on column FW_SRC_ACTION.ACTION_ORDER
  is '顺序';
comment on column FW_SRC_ACTION.ACTION_PATH
  is '访问URL';
alter table FW_SRC_ACTION
  add constraint PK_SRCACTION primary key (ACTION_ID);
alter table FW_SRC_ACTION
  add constraint FK_ACTION_SOURCE foreign key (SOURCE_ID)
  references FW_SOURCE (SOURCE_ID);
create index IDX_SRC_ACTION_SOURCE_ID on FW_SRC_ACTION (SOURCE_ID)
  reverse;

prompt
prompt Creating table FW_DUTY_ACTION
prompt =============================
prompt
create table FW_DUTY_ACTION
(
  DUTY_ACTION_ID NUMBER not null,
  ACTION_ID      NUMBER not null,
  DUTY_ID        NUMBER not null
)
;
comment on table FW_DUTY_ACTION
  is '角色操作权限表';
comment on column FW_DUTY_ACTION.ACTION_ID
  is '操作ID';
comment on column FW_DUTY_ACTION.DUTY_ID
  is '角色ID';
alter table FW_DUTY_ACTION
  add constraint PK_DUTY_ACTION primary key (DUTY_ACTION_ID);
alter table FW_DUTY_ACTION
  add constraint FK_DA_DUTY foreign key (DUTY_ID)
  references FW_DUTY (DUTY_ID);
alter table FW_DUTY_ACTION
  add constraint FK_FW_DUTY_SRC foreign key (ACTION_ID)
  references FW_SRC_ACTION (ACTION_ID);
create index IDX_DUTY_ACTION_ACTION on FW_DUTY_ACTION (ACTION_ID)
  reverse;
create index IDX_DUTY_ACTION_DUTY on FW_DUTY_ACTION (DUTY_ID)
  reverse;

prompt
prompt Creating table FW_LOGIN
prompt =======================
prompt
create table FW_LOGIN
(
  ACCT_ID         NUMBER not null,
  LAST_LOGIN_TIME DATE,
  LAST_LOGIN_IP   VARCHAR2(40),
  ERROR_NUM       NUMBER,
  IS_LOCKED       NUMBER,
  SESSION_ID      VARCHAR2(120),
  LOCKED_TIME     DATE
)
;
comment on table FW_LOGIN
  is '登录信息表';
comment on column FW_LOGIN.ACCT_ID
  is '主键';
comment on column FW_LOGIN.LAST_LOGIN_TIME
  is '最后登录时间';
comment on column FW_LOGIN.LAST_LOGIN_IP
  is '最后登录IP';
comment on column FW_LOGIN.ERROR_NUM
  is '错误次数';
comment on column FW_LOGIN.IS_LOCKED
  is '是否锁定';
comment on column FW_LOGIN.SESSION_ID
  is '当前会话';
comment on column FW_LOGIN.LOCKED_TIME
  is '锁定时间';
alter table FW_LOGIN
  add constraint PK_LOGIN primary key (ACCT_ID);

prompt
prompt Creating table FW_SYSTEM
prompt ========================
prompt
create table FW_SYSTEM
(
  SYS_ID       NUMBER not null,
  SYS_NAME     VARCHAR2(240) not null,
  STATUS       VARCHAR2(6) not null,
  DESCRIPTION  VARCHAR2(400),
  SYS_IP       VARCHAR2(40),
  SYS_CODE     VARCHAR2(40),
  SYS_PORT     INTEGER,
  CONTEXT_PATH VARCHAR2(40)
)
;
comment on table FW_SYSTEM
  is '系统表';
comment on column FW_SYSTEM.SYS_NAME
  is '组织机构名称';
comment on column FW_SYSTEM.STATUS
  is '状态(A:可用; D: 禁用)';
comment on column FW_SYSTEM.DESCRIPTION
  is '描述';
comment on column FW_SYSTEM.SYS_IP
  is '系统IP';
comment on column FW_SYSTEM.SYS_CODE
  is '系统编码';
comment on column FW_SYSTEM.SYS_PORT
  is '系统端口号';
comment on column FW_SYSTEM.CONTEXT_PATH
  is '部署目录';
alter table FW_SYSTEM
  add constraint PK_SYSTEM primary key (SYS_ID);
alter table FW_SYSTEM
  add constraint CKT_FW_SYSTEM
  check (status in ('A','D'));

prompt
prompt Creating sequence S_FRAMEWORK
prompt =============================
prompt
create sequence S_FRAMEWORK
minvalue 1
maxvalue 999999999999999999999999999
start with 73683
increment by 1
cache 20;

prompt
prompt Creating view FUNDS_APPLY_GATHER_VIEW
prompt =====================================
prompt
create or replace view funds_apply_gather_view as
select Q.first_cate_id ||
       lpad(round(dbms_random.value(1, 999999999)), 9, 0) as apply_gather_id,
       Q."FIRST_CATE_ID",Q."PROJECT_NAME",Q."TEN_DAYS_MONEY",Q."A_MONTH_MONEY",Q."TWO_MONTHS_MONEY",Q."THREE_MONTHS_MONEY",Q."SIX_MONTHS_MONEY",Q."MOER_SIX_MONTHS_MONEY",Q."GATHER_DATE"
  from (select distinct A.first_cate_id,
                A.project_name,
                A.ten_days_money,
                A.a_month_money,
                A.two_months_money,
                A.three_months_money,
                A.six_months_money,
                A.moer_six_months_money,
                A.gather_date
  from (select t.first_cate_id,
               t.project_name,
               t.gather_date,
               nvl(sum(t.ten_days_money),0) ten_days_money,
               nvl(sum(t.a_month_money),0) a_month_money,
               nvl(sum(t.two_months_money),0) two_months_money,
               nvl(sum(t.three_months_money),0) three_months_money,
               nvl(sum(t.six_months_money),0) six_months_money,
               nvl(sum(t.moer_six_months_money),0) moer_six_months_money
          from fos_temp_source_use_funds t
         where t.data_sources = '2'
           and t.is_modify = '0'
         group by t.first_cate_id, t.project_name,t.gather_date
         order by t.first_cate_id, t.project_name,t.gather_date) A
  ) Q;

prompt
prompt Creating view FUNDS_ORIGIN_GATHER_VIEW
prompt ======================================
prompt
create or replace view funds_origin_gather_view as
select Q.first_cate_id || Q.second_cate_id ||
       lpad(round(dbms_random.value(1, 999999999)), 9, 0) as origin_gather_id,
       Q."FIRST_CATE_ID",Q."SECOND_CATE_ID",Q."PROJECT_NAME",Q."TEN_DAYS_MONEY",Q."A_MONTH_MONEY",Q."TWO_MONTHS_MONEY",Q."THREE_MONTHS_MONEY",Q."SIX_MONTHS_MONEY",Q."MOER_SIX_MONTHS_MONEY",Q."GATHER_DATE"
  from (select distinct A.first_cate_id,
                        A.second_cate_id,
                        A.project_name,
                        A.ten_days_money,
                        A.a_month_money,
                        A.two_months_money,
                        A.three_months_money,
                        A.six_months_money,
                        A.moer_six_months_money,
                        A.gather_date
          from (select t.first_cate_id,
                       t.second_cate_id,
                       t.project_name,
                       t.gather_date,
                       nvl(sum(t.ten_days_money),0) ten_days_money,
                       nvl(sum(t.a_month_money),0) a_month_money,
                       nvl(sum(t.two_months_money),0) two_months_money,
                       nvl(sum(t.three_months_money),0) three_months_money,
                       nvl(sum(t.six_months_money),0) six_months_money,
                       nvl(sum(t.moer_six_months_money),0) moer_six_months_money
                  from fos_temp_source_use_funds t
                 where t.data_sources = '1'
                   and t.is_modify = '0'
                 group by t.first_cate_id, t.second_cate_id, t.project_name,t.gather_date
                 order by t.first_cate_id, t.second_cate_id, t.project_name,t.gather_date) A
               ) Q;


spool off
