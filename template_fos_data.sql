prompt PL/SQL Developer import file
prompt Created on 2013年9月24日 by Administrator
set feedback off
set define off
prompt Disabling foreign key constraints for EFW_BUSINESS_MODULE_MAP...
alter table EFW_BUSINESS_MODULE_MAP disable constraint FK_EFW_BUSINESS_MAP;
alter table EFW_BUSINESS_MODULE_MAP disable constraint FK_EFW_ENTITY_SOURCE;
prompt Disabling foreign key constraints for EFW_APPLY_SCOPE...
alter table EFW_APPLY_SCOPE disable constraint FK_MODULE_MAP_REL_APPLY_SCOPE;
prompt Disabling foreign key constraints for EFW_DATA_ROLE_AUTHORITY...
alter table EFW_DATA_ROLE_AUTHORITY disable constraint FK_DATA_ROLE;
alter table EFW_DATA_ROLE_AUTHORITY disable constraint FK_ENTITY_R_DATA_AUTHORITY;
alter table EFW_DATA_ROLE_AUTHORITY disable constraint FK_MODULE_R_DATA_AUTHORITY;
prompt Disabling foreign key constraints for EFW_USER_DATA_ROLE...
alter table EFW_USER_DATA_ROLE disable constraint FK_USE_EFW_DATA_ROLE;
prompt Disabling foreign key constraints for FW_GROUP...
alter table FW_GROUP disable constraint FK_PARENT;
prompt Disabling foreign key constraints for FOS_AUDITING_REPORTS_RECORD...
alter table FOS_AUDITING_REPORTS_RECORD disable constraint FK_AUDIT_GROUP;
prompt Disabling foreign key constraints for FOS_ENTRUST_LOAN...
alter table FOS_ENTRUST_LOAN disable constraint FK_ENTRUST_LOAN_REF_GROUP;
prompt Disabling foreign key constraints for FOS_EXPORT_REPORTS_RECORD...
alter table FOS_EXPORT_REPORTS_RECORD disable constraint FK_EX_REPORTS_REF_GROUP;
prompt Disabling foreign key constraints for FOS_FINANCING_DETAILS...
alter table FOS_FINANCING_DETAILS disable constraint FK_FINANCING_DETAILS_REF_GROUP;
prompt Disabling foreign key constraints for FOS_INTERIOR_LOAN...
alter table FOS_INTERIOR_LOAN disable constraint FK_INTERIOR_LOAN_REF_GROUP;
prompt Disabling foreign key constraints for FOS_REJECT_REASON_RECORD...
alter table FOS_REJECT_REASON_RECORD disable constraint FK_RE_REF_AUDITING;
prompt Disabling foreign key constraints for FOS_REPORTS_DETAILS...
alter table FOS_REPORTS_DETAILS disable constraint FK_REPORTS_REF_GROUP;
prompt Disabling foreign key constraints for FOS_SECURITY_AUTHORIZATION...
alter table FOS_SECURITY_AUTHORIZATION disable constraint FK_SECURITY_REF_STAFF;
prompt Disabling foreign key constraints for FOS_SOURCE_USE_FUNDS...
alter table FOS_SOURCE_USE_FUNDS disable constraint FK_SOURCE_REF_STAFF;
prompt Disabling foreign key constraints for FOS_TEMP_SOURCE_USE_FUNDS...
alter table FOS_TEMP_SOURCE_USE_FUNDS disable constraint FK_TEMP_SOURCE_REF_STAFF;
prompt Disabling foreign key constraints for FW_ACCOUNT...
alter table FW_ACCOUNT disable constraint FK_ACCOUNT_GROUP;
prompt Disabling foreign key constraints for FW_DUTY...
alter table FW_DUTY disable constraint FK_DUTY_GRUOP;
prompt Disabling foreign key constraints for FW_ACCOUNT_DUTY...
alter table FW_ACCOUNT_DUTY disable constraint FK_AD_ACCOUNT;
alter table FW_ACCOUNT_DUTY disable constraint FK_AD_DUTY;
prompt Disabling foreign key constraints for FW_ACTION_CNT...
alter table FW_ACTION_CNT disable constraint FK_CNT_LOG;
prompt Disabling foreign key constraints for FW_DICTIONARY...
alter table FW_DICTIONARY disable constraint FK_DICTIONARY_CATEGORY;
prompt Disabling foreign key constraints for FW_SOURCE...
alter table FW_SOURCE disable constraint FK_SOURCE_PARENT;
prompt Disabling foreign key constraints for FW_SRC_ACTION...
alter table FW_SRC_ACTION disable constraint FK_ACTION_SOURCE;
prompt Disabling foreign key constraints for FW_DUTY_ACTION...
alter table FW_DUTY_ACTION disable constraint FK_DA_DUTY;
alter table FW_DUTY_ACTION disable constraint FK_FW_DUTY_SRC;
prompt Deleting FW_SYSTEM...
delete from FW_SYSTEM;
commit;
prompt Deleting FW_LOGIN...
delete from FW_LOGIN;
commit;
prompt Deleting FW_DUTY_ACTION...
delete from FW_DUTY_ACTION;
commit;
prompt Deleting FW_SRC_ACTION...
delete from FW_SRC_ACTION;
commit;
prompt Deleting FW_SOURCE...
delete from FW_SOURCE;
commit;
prompt Deleting FW_DICTIONARY...
delete from FW_DICTIONARY;
commit;
prompt Deleting FW_CATEGORY...
delete from FW_CATEGORY;
commit;
prompt Deleting FW_ACTION_CNT...
delete from FW_ACTION_CNT;
commit;
prompt Deleting FW_ACTION_LOG...
delete from FW_ACTION_LOG;
commit;
prompt Deleting FW_ACCOUNT_DUTY...
delete from FW_ACCOUNT_DUTY;
commit;
prompt Deleting FW_DUTY...
delete from FW_DUTY;
commit;
prompt Deleting FW_ACCOUNT...
delete from FW_ACCOUNT;
commit;
prompt Deleting FOS_TEMP_SOURCE_USE_FUNDS...
delete from FOS_TEMP_SOURCE_USE_FUNDS;
commit;
prompt Deleting FOS_SOURCE_USE_FUNDS...
delete from FOS_SOURCE_USE_FUNDS;
commit;
prompt Deleting FOS_SECURITY_AUTHORIZATION...
delete from FOS_SECURITY_AUTHORIZATION;
commit;
prompt Deleting FOS_REPORTS_DETAILS...
delete from FOS_REPORTS_DETAILS;
commit;
prompt Deleting FOS_REJECT_REASON_RECORD...
delete from FOS_REJECT_REASON_RECORD;
commit;
prompt Deleting FOS_INTERIOR_LOAN...
delete from FOS_INTERIOR_LOAN;
commit;
prompt Deleting FOS_INITIAL_SETTLEMENT_MONEY...
delete from FOS_INITIAL_SETTLEMENT_MONEY;
commit;
prompt Deleting FOS_FINANCING_SECURITY_MONEY...
delete from FOS_FINANCING_SECURITY_MONEY;
commit;
prompt Deleting FOS_FINANCING_DETAILS...
delete from FOS_FINANCING_DETAILS;
commit;
prompt Deleting FOS_EXPORT_REPORTS_RECORD...
delete from FOS_EXPORT_REPORTS_RECORD;
commit;
prompt Deleting FOS_ENTRUST_LOAN_REJECT_REASON...
delete from FOS_ENTRUST_LOAN_REJECT_REASON;
commit;
prompt Deleting FOS_ENTRUST_LOAN...
delete from FOS_ENTRUST_LOAN;
commit;
prompt Deleting FOS_BASE_PROJECT_CATEGORIES...
delete from FOS_BASE_PROJECT_CATEGORIES;
commit;
prompt Deleting FOS_AUDITING_REPORTS_RECORD...
delete from FOS_AUDITING_REPORTS_RECORD;
commit;
prompt Deleting FW_GROUP...
delete from FW_GROUP;
commit;
prompt Deleting FOS_ASSET_DEBT_MANAGEMENT...
delete from FOS_ASSET_DEBT_MANAGEMENT;
commit;
prompt Deleting EFW_USER_DATA_ROLE...
delete from EFW_USER_DATA_ROLE;
commit;
prompt Deleting EFW_TARGET_FIELD_MAP...
delete from EFW_TARGET_FIELD_MAP;
commit;
prompt Deleting EFW_DATA_ROLE_AUTHORITY...
delete from EFW_DATA_ROLE_AUTHORITY;
commit;
prompt Deleting EFW_DATA_ROLE...
delete from EFW_DATA_ROLE;
commit;
prompt Deleting EFW_APPLY_SCOPE...
delete from EFW_APPLY_SCOPE;
commit;
prompt Deleting EFW_BUSINESS_MODULE_MAP...
delete from EFW_BUSINESS_MODULE_MAP;
commit;
prompt Deleting EFW_BUSINESS_MODULE...
delete from EFW_BUSINESS_MODULE;
commit;
prompt Deleting EFW_SOURSE_ENTITY...
delete from EFW_SOURSE_ENTITY;
commit;
prompt Loading EFW_SOURSE_ENTITY...
insert into EFW_SOURSE_ENTITY (ENTITY_ID, ENTITY_NAME, ENTITY_CLASS, ENTITY_FIELD, QUERY_URL, QUERY_PARAM, ENTITY_ALIAS, OUTPUT_KEY, OUTPUT_TITLE, OUTPUT_CLASS, OUTPUT_VALUE, NOT_NULL)
values (29284, '用户数据', 'FwAccount', 'status', null, '_prefix.fwCategory.code=''status''', null, 'name', '用户状态', 'FwDictionary', 'code', 1);
insert into EFW_SOURSE_ENTITY (ENTITY_ID, ENTITY_NAME, ENTITY_CLASS, ENTITY_FIELD, QUERY_URL, QUERY_PARAM, ENTITY_ALIAS, OUTPUT_KEY, OUTPUT_TITLE, OUTPUT_CLASS, OUTPUT_VALUE, NOT_NULL)
values (41204, '用户部门', 'FwGroup', 'id', null, null, null, 'name', '部门名称', 'FwGroup', 'id', 1);
commit;
prompt 2 records loaded
prompt Loading EFW_BUSINESS_MODULE...
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (29289, '用户管理', '系统管理', '241', 'A');
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (30895, '资金来源滚动', '资金来源滚动计划', '27688', 'A');
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (30901, '融资管理', '融资管理权限', '27507', 'A');
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (30907, '担保管理', '担保管理权限', '42041', 'A');
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (30913, '委托贷款', '委托贷款', '43247', 'A');
insert into EFW_BUSINESS_MODULE (MODULE_ID, NAME, TITLE, MENU_ID, STATUS)
values (30981, '资金运用滚动计划', '资金运用滚动计划', '41271', 'A');
commit;
prompt 6 records loaded
prompt Loading EFW_BUSINESS_MODULE_MAP...
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (29294, 29289, 29284, '用户状态');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (41211, 29289, 41204, '用户部门');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (30898, 30895, 41204, '资金来源滚动计划权限');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (30904, 30901, 41204, '融资管理权限');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (30910, 30907, 41204, '担保管理权限');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (30916, 30913, 41204, '委托贷款权限');
insert into EFW_BUSINESS_MODULE_MAP (ID, MODULE_ID, SOURCE_ID, NAME)
values (30984, 30981, 41204, '资金运用滚动计划权限');
commit;
prompt 7 records loaded
prompt Loading EFW_APPLY_SCOPE...
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (41208, 'FwAccount', 'fwGroup', 1, 41211);
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (30900, 'SourceUseFunds', 'fwGroup', 1, 30898);
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (30906, 'FinancingDetail', 'fwGroup', 1, 30904);
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (30912, 'SecurityAuthorization', 'fwGroup', 1, 30910);
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (30918, 'EntrustLoan', 'fwGroup', 1, 30916);
insert into EFW_APPLY_SCOPE (APPLY_ID, TARGET_CLASS, TARGET_FIELD, IS_ENABLE, MAP_ID)
values (30986, 'SourceUseFunds', 'fwGroup', 1, 30984);
commit;
prompt 6 records loaded
prompt Loading EFW_DATA_ROLE...
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (51485, '恒信资本', 'D', null);
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (50088, '资金财务部', 'A', null);
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (50089, '西投置业', 'A', null);
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (50090, '资本运营部', 'A', null);
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (50091, '金融发展部', 'A', null);
insert into EFW_DATA_ROLE (DR_ID, DR_NAME, STATUS, DESCRIPTION)
values (50092, '产业发展部', 'A', null);
commit;
prompt 6 records loaded
prompt Loading EFW_DATA_ROLE_AUTHORITY...
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (73664, 51485, 30895, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (73665, 51485, 30895, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (73666, 51485, 30895, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50093, 50092, 30895, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50094, 50092, 30901, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50095, 50092, 30913, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50096, 50091, 30895, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50097, 50091, 30981, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50098, 50091, 30913, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50099, 50090, 30901, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50100, 50090, 30907, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50101, 50089, 30895, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50102, 50089, 30981, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50104, 50088, 30895, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50105, 50088, 30895, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50106, 50088, 30895, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50107, 50088, 30895, 41204, '49880', '49880', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50108, 50088, 30895, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50109, 50088, 30895, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50110, 50088, 30895, 41204, '2', '2', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50114, 50088, 30901, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50112, 50088, 30901, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50113, 50088, 30901, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50115, 50088, 30901, 41204, '49880', '49880', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50116, 50088, 30901, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50117, 50088, 30901, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50118, 50088, 30901, 41204, '2', '2', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50119, 50088, 30907, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50120, 50088, 30907, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50121, 50088, 30907, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50122, 50088, 30907, 41204, '49880', '49880', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50123, 50088, 30907, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50124, 50088, 30907, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50125, 50088, 30907, 41204, '2', '2', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50126, 50088, 30913, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50127, 50088, 30913, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50128, 50088, 30913, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50129, 50088, 30913, 41204, '49880', '49880', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50130, 50088, 30913, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50131, 50088, 30913, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50132, 50088, 30913, 41204, '2', '2', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50133, 50088, 30981, 41204, '49891', '49891', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50134, 50088, 30981, 41204, '49886', '49886', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50135, 50088, 30981, 41204, '49882', '49882', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50136, 50088, 30981, 41204, '49880', '49880', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50137, 50088, 30981, 41204, '49849', '49849', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50138, 50088, 30981, 41204, '49847', '49847', null);
insert into EFW_DATA_ROLE_AUTHORITY (DA_ID, DR_ID, MODULE_ID, ENTITY_ID, DATA_ID, FIELD_VALUE, FIELD_NAME)
values (50139, 50088, 30981, 41204, '2', '2', null);
commit;
prompt 48 records loaded
prompt Loading EFW_TARGET_FIELD_MAP...
prompt Table is empty
prompt Loading EFW_USER_DATA_ROLE...
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (51253, 50090, 51252);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (51267, 50088, 51266);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (51574, 50088, 49889);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (51013, 50090, 51008);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (52076, 50091, 52075);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53596, 50091, 51990);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50143, 50089, 49893);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50150, 50089, 49895);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50155, 50090, 49897);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50159, 50091, 49899);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50163, 50091, 49901);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (50176, 50092, 49903);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53597, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53595, 50091, 51990);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53598, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53599, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53600, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53601, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (53602, 51485, 53400);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (51451, 50088, 51257);
insert into EFW_USER_DATA_ROLE (USER_DA_ID, DR_ID, USER_ID)
values (52309, 50092, 49905);
commit;
prompt 21 records loaded
prompt Loading FOS_ASSET_DEBT_MANAGEMENT...
insert into FOS_ASSET_DEBT_MANAGEMENT (ASSET_DEBT_ID, ASSET_AMOUNT, DEBT_TOATL, DEBT_RATIO, START_DATE, END_DATE, FOUND_DATE)
values (51841, 924176.54, 304370.33, 33, to_date('01-06-2013', 'dd-mm-yyyy'), to_date('30-06-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:36:42', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 1 records loaded
prompt Loading FW_GROUP...
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (53398, '内审风控部', 'A', null, 2, '010700000000', 2, '2');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49847, '产业发展部', 'A', null, 2, '010100000000', 2, '1');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49849, '金融发展部', 'A', null, 2, '010200000000', 2, '1');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49880, '资金财务部', 'A', null, 2, '010300000000', 2, '1');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49882, '西安西投置业有限公司', 'A', null, 2, '010400000000', 2, '1');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49886, '资本运营部', 'A', null, 2, '010500000000', 2, '2');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (49891, '西安恒信资本', 'A', null, 2, '010600000000', 2, '2');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (1, '系统根节点', 'A', '系统根节点', 0, '000000000000', null, '2');
insert into FW_GROUP (GROUP_ID, GROUP_NAME, STATUS, DESCRIPTION, GROUP_LEVEL, GROUP_STYLE, PARENT_ID, GROUP_TYPE)
values (2, '西安投资控股有限公司', 'A', '公司部门，重要请勿删除', 1, '010000000000', 1, '2');
commit;
prompt 9 records loaded
prompt Loading FOS_AUDITING_REPORTS_RECORD...
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73568, '资金运用滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '1', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('28-08-2013 14:22:20', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73472, '资金来源滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '1', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('28-08-2013 11:12:38', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53323, '资金来源滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:34:14', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53338, '资金运用滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:46:29', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51122, '资金来源滚动计划表', '时丽君', '0', null, null, 'zhaofeng', '0', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:31:09', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51494, '资金来源滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:46:56', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51508, '资金运用滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:58:19', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (52417, '资金运用滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:10:13', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (52904, '资金来源滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:32:59', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (52908, '资金运用滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53240, '资金来源滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:01:15', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53257, '资金运用滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:12:31', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51183, '资金运用滚动计划表', '时丽君', '0', null, null, 'zhaofeng', '0', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (52401, '资金来源滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:34:28', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53199, '资金来源滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '0', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:05:25', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53209, '资金运用滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '0', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53440, '资金运用滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:45:54', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53625, '资金来源滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:22:41', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53639, '资金运用滚动计划表', '刘西奎', '1', null, null, 'shangrui1', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:30:49', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51714, '资金运用滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:23:36', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51642, '资金来源滚动计划表', '刘西奎', '1', null, null, 'shangrui', '1', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:24:08', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51707, '资金运用滚动计划表', '刘西奎', '1', null, null, 'shangrui', '1', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:22:47', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51721, '资金来源滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '1', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:24:20', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51908, '资金运用滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '0', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:37:18', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (51554, '资金来源滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 11:27:10', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53408, '资金来源滚动计划表', '时丽君', '1', null, null, 'zhaofeng', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:05:47', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53504, '资金来源滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:22:18', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53520, '资金运用滚动计划表', '张涛', '1', null, null, 'duanqinyi', '1', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:38:26', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53557, '资金来源滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '0', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:35:27', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (53564, '资金运用滚动计划表', '贾晓怡', '1', null, null, 'shangrui', '0', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:41:44', 'dd-mm-yyyy hh24:mi:ss'), 49886, 'jiaxiaoyi', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73057, '资金来源滚动计划表', '时丽君', '0', null, null, 'zhaofeng', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73100, '资金运用滚动计划表', '时丽君', '0', null, null, 'zhaofeng', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), 49847, 'shilijun', '赵丰', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73110, '资金来源滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73127, '资金运用滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73138, '资金来源滚动计划表', '刘西奎', '0', null, null, 'shangrui1', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73148, '资金运用滚动计划表', '刘西奎', '0', null, null, 'shangrui1', '0', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 49849, 'liuxikui', '商睿', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73164, '资金来源滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73179, '资金来源滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73191, '资金运用滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', '1');
insert into FOS_AUDITING_REPORTS_RECORD (AUDIT_REP_REC_ID, REPORTS_NAME, ORG_USER_NAME, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, GATHER_DATE, FOUND_DATE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME, COPY_STATE)
values (73203, '资金运用滚动计划表', '张涛', '0', null, null, 'duanqinyi', '0', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), 49882, 'zhangtao', '段秦义', null);
commit;
prompt 40 records loaded
prompt Loading FOS_BASE_PROJECT_CATEGORIES...
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30334, '0101', '自有资金', 30330, 2, null, '010200000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30336, '0102', '债权融资', null, 1, null, '020000000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30337, '0103', '直接融资', 30336, 2, null, '020100000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30340, '0104', '间接融资', 30336, 2, null, '020200000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30351, '0105', '投资收回', null, 1, null, '030000000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30330, '0106', '股权融资', null, 1, null, '010000000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30332, '0107', '财政资金', 30330, 2, null, '010100000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30358, '0108', '投资收益', 30351, 2, null, '030100000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30460, '0109', '资金理财', 30351, 2, null, '030400000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30376, '0110', '来源自投项目 （含委贷）', 30351, 2, null, '030200000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (30446, '0111', '来源财政扶持项目', 30351, 2, null, '030300000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44337, '05', '资金收入', null, 1, null, '050000000000', '6');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44339, '06', '资金支出', null, 1, null, '060000000000', '6');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44897, '0202', '运用财政扶持项目', null, 1, null, '080000000000', '2');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44899, '0203', '代持项目', null, 1, null, '090000000000', '2');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44901, '0204', '运用自投项目 （含委贷）', null, 1, null, '100000000000', '2');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (44903, '0205', '归还借款本息', null, 1, null, '110000000000', '2');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (53609, '0112', '担保费', 30351, 2, null, '030500000000', '1');
insert into FOS_BASE_PROJECT_CATEGORIES (PRO_CATE_ID, PRO_CATE_CODE, PRO_CATE_NAME, PARENT_ID, GRADE, STATUS, STYLE, MODULE_NAME)
values (72894, '0200', '西投置业类目', null, 1, null, '130000000000', '2');
commit;
prompt 19 records loaded
prompt Loading FOS_ENTRUST_LOAN...
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (73610, '小黄', '建行', 1000, 2, to_date('04-09-2013', 'dd-mm-yyyy'), to_date('30-09-2013', 'dd-mm-yyyy'), 1, null, 49847, '时丽君', null, to_date('04-09-2013 16:10:32', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 1, null, 20, '365', '2', '1', null, null, 'zhaofeng', '0', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51134, '鸿达水景', '中信银行西安分行明德门支行', 20000, 14, to_date('25-12-2012', 'dd-mm-yyyy'), to_date('24-12-2014', 'dd-mm-yyyy'), 24, null, 49847, '时丽君', null, to_date('09-07-2013 12:45:16', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 14, null, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51173, '双维实业', '交通银行陕西省分行光华路支行', 2000, 19, to_date('23-08-2012', 'dd-mm-yyyy'), to_date('22-08-2013', 'dd-mm-yyyy'), 12, null, 49847, '时丽君', null, to_date('09-07-2013 13:03:38', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 19, 0, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52154, '西安高新区国信小额贷款有限公司', '无', 5000, 14, to_date('19-03-2013', 'dd-mm-yyyy'), to_date('18-03-2014', 'dd-mm-yyyy'), 12, null, 49849, '苟涛', '股东借款', to_date('10-07-2013 15:50:30', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 14, null, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52132, '西安协和置业股份有限公司', '中信银行西安分行', 24000, 20, to_date('19-04-2013', 'dd-mm-yyyy'), to_date('29-04-2013', 'dd-mm-yyyy'), 0, 133.33, 49849, '苟涛', '本息已如期收回。该项目已结束。', to_date('10-07-2013 15:32:55', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 20, 33.33, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52150, '西安高新区国信小额贷款有限公司', '无', 5000, 14, to_date('06-02-2013', 'dd-mm-yyyy'), to_date('05-02-2014', 'dd-mm-yyyy'), 12, null, 49849, '苟涛', '股东借款', to_date('10-07-2013 15:48:45', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 14, null, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52158, '陕西开城实业有限公司', '交通银行陕西省分行', 10000, 18, to_date('20-05-2013', 'dd-mm-yyyy'), to_date('19-05-2014', 'dd-mm-yyyy'), 12, null, 49849, '苟涛', null, to_date('10-07-2013 15:51:40', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 18, null, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52162, '陕西思普瑞通信技术咨询有限公司', '交通银行陕西省分行', 4000, 20, to_date('25-06-2013', 'dd-mm-yyyy'), to_date('24-12-2013', 'dd-mm-yyyy'), 6, null, 49849, '苟涛', '股权质押及公证手续正在后补。', to_date('10-07-2013 15:53:02', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 20, null, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52173, '宝信国际融资租赁有限公司', '无', 20000, 9.5, to_date('31-12-2012', 'dd-mm-yyyy'), to_date('30-12-2014', 'dd-mm-yyyy'), 24, null, 49849, '苟涛', '股东借款。', to_date('10-07-2013 16:08:35', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 9.5, null, 20, '365', '1', '0', null, null, 'shangrui1', '0', '1', 'goutao', '商睿');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51590, '明泰工程建设公司', '交通银行陕西省分行光华路支行', 10000, 18, to_date('20-06-2012', 'dd-mm-yyyy'), to_date('19-06-2013', 'dd-mm-yyyy'), 12, null, 49847, '时丽君', null, to_date('28-06-2013 13:47:32', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 18, 0, 20, '360', '2', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51610, '瑞麟置业', '恒丰银行西安分行', 10000, 19, to_date('28-04-2012', 'dd-mm-yyyy'), to_date('27-04-2014', 'dd-mm-yyyy'), 24, null, 49847, '时丽君', null, to_date('28-06-2013 14:01:34', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 19, 0, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51614, '沣东车城', '浙商银行西安分行', 30000, 12, to_date('11-04-2013', 'dd-mm-yyyy'), to_date('10-10-2014', 'dd-mm-yyyy'), 22, null, 49847, '时丽君', '财务咨询费共计838万元，分四次支付，目前已付230万元，后续支付日期分别为：' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '2013.9.20  230万' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '2014.3.20  230万' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(9) || '' || chr(13) || '' || chr(10) || '2014.9.20  148万', to_date('28-06-2013 14:05:10', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 13.5, 838, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51627, '世园', '西安银行城南支行', 30000, 14, to_date('14-12-2012', 'dd-mm-yyyy'), to_date('13-10-2014', 'dd-mm-yyyy'), 22, null, 49847, '时丽君', null, to_date('28-06-2013 14:16:56', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 14, 0, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51631, '中大机械', '交通银行陕西省分行光华路支行', 2000, 15, to_date('12-03-2013', 'dd-mm-yyyy'), to_date('11-12-2013', 'dd-mm-yyyy'), 9, null, 49847, '时丽君', null, to_date('28-06-2013 14:19:18', 'dd-mm-yyyy hh24:mi:ss'), null, null, '1', 15, 0, 20, '360', '1', '1', null, null, 'zhaofeng', '1', '0', 'shilijun', '赵丰');
insert into FOS_ENTRUST_LOAN (ENTRUST_LOAN_ID, LOAN_USER, LOAN_BANK, LOAN_MONEY, CONTRACT_RATES, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, INTEREST_INCOME, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, PROVISION_DAYS, PAY_INTEREST_TIME, END_INTEREST_MODE, REAL_RATES, ADVISER_COST, END_INTEREST_DATE, REPAY_PERIOD, LOAN_STATUS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (53616, '明泰工程建设公司', '交通银行陕西省分行光华路支行', 8000, 14, to_date('30-07-2013', 'dd-mm-yyyy'), to_date('29-07-2014', 'dd-mm-yyyy'), 12, null, 49847, '时丽君', null, to_date('30-07-2013 16:09:04', 'dd-mm-yyyy hh24:mi:ss'), null, null, '2', 14, null, 20, '360', '1', '1', null, null, 'zhaofeng', '0', '0', 'shilijun', '赵丰');
commit;
prompt 15 records loaded
prompt Loading FOS_ENTRUST_LOAN_REJECT_REASON...
insert into FOS_ENTRUST_LOAN_REJECT_REASON (ENTRUST_LOAN_REASON_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, USE_TYPE, OWN_ID, FOUND_DATE)
values (73617, 'FFF', '赵丰', to_date('04-09-2013 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), '2', 53616, to_date('04-09-2013 16:24:24', 'dd-mm-yyyy hh24:mi:ss'));
insert into FOS_ENTRUST_LOAN_REJECT_REASON (ENTRUST_LOAN_REASON_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, USE_TYPE, OWN_ID, FOUND_DATE)
values (73620, 'GGG', '赵丰', to_date('04-09-2013 16:25:01', 'dd-mm-yyyy hh24:mi:ss'), '2', 73610, to_date('04-09-2013 16:25:01', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 2 records loaded
prompt Loading FOS_EXPORT_REPORTS_RECORD...
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53363, '资金来源滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 15:00:57', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53369, '资金运用滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 15:02:16', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (51095, '资金运用滚动计划表', '西安西投置业有限公司', '张涛', null, 'duanqinyi', null, to_date('30-06-2013', 'dd-mm-yyyy'), to_date('09-07-2013 10:29:34', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882, 'zhangtao', '段秦义');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53114, '资金来源滚动计划表', '资本运营部', '贾晓怡', null, 'shangrui', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('17-07-2013 14:06:07', 'dd-mm-yyyy hh24:mi:ss'), '1', 49886, 'jiaxiaoyi', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53120, '资金运用滚动计划表', '资本运营部', '贾晓怡', null, 'shangrui', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('17-07-2013 14:06:43', 'dd-mm-yyyy hh24:mi:ss'), '1', 49886, 'jiaxiaoyi', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53285, '资金来源滚动计划汇总表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 13:37:11', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53288, '资金运用滚动计划汇总表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 13:37:18', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53289, '资金计划与平衡分析报表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 13:37:18', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52379, '资金运用滚动计划表', '产业发展部', '时丽君', null, 'zhaofeng', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 16:50:35', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847, 'shilijun', '赵丰');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52384, '资金来源滚动计划表', '产业发展部', '时丽君', null, 'zhaofeng', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 16:51:05', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847, 'shilijun', '赵丰');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52690, '资金运用滚动计划表', '西安西投置业有限公司', '张涛', null, 'duanqinyi', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 15:40:59', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882, 'zhangtao', '段秦义');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52783, '资金来源滚动计划表', '西安西投置业有限公司', '张涛', null, 'duanqinyi', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 13:51:04', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882, 'zhangtao', '段秦义');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52869, '资金来源滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (52874, '资金运用滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 15:56:48', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53715, '资金来源滚动计划表', '西安西投置业有限公司', '张涛', null, 'duanqinyi', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('05-08-2013 14:33:04', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882, 'zhangtao', '段秦义');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (53720, '资金运用滚动计划表', '西安西投置业有限公司', '张涛', null, 'duanqinyi', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('05-08-2013 14:33:24', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882, 'zhangtao', '段秦义');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (72913, '资金来源滚动计划表', '产业发展部', '时丽君', null, 'zhaofeng', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:53:51', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847, 'shilijun', '赵丰');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (72918, '资金运用滚动计划表', '产业发展部', '时丽君', null, 'zhaofeng', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:54:06', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847, 'shilijun', '赵丰');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (72921, '资金来源滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:54:21', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (72925, '资金运用滚动计划表', '金融发展部', '刘西奎', null, 'shangrui1', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:54:29', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849, 'liuxikui', '商睿');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (72990, '资金来源滚动计划汇总表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:00:17', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (73020, '资金运用滚动计划汇总表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:00:59', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
insert into FOS_EXPORT_REPORTS_RECORD (EXPORT_REP_REC_ID, REPORTS_NAME, GROUP_NAME, ORG_USER_NAME, DEP_RES_USER, MG_LEADERSHIP, ALG_VSN_NUMBER, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID, ORG_ACCT_NAME, MG_LEADER_USER_NAME)
values (73021, '资金计划与平衡分析报表', '资金财务部', '张赵凡', null, 'chenxiaoying', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:00:59', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880, 'zhangzhaofan', '陈晓英');
commit;
prompt 23 records loaded
prompt Loading FOS_FINANCING_DETAILS...
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51488, '1', 'CIIT(2012)457XTDK', '2', '兴业国际信托有限公司', '单一信托资金计划', 15000, '补充流动资金', 12, to_date('27-09-2012', 'dd-mm-yyyy'), to_date('26-09-2013', 'dd-mm-yyyy'), '2', 20, '1', 51488, 49886, 'lvkun', null, to_date('10-07-2013 09:46:00', 'dd-mm-yyyy hh24:mi:ss'), '0', '6', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51496, '1', '交银国信?聚福330号单一资金信托合同', '2', '交银国际信托有限公司', '单一信托资金计划', 50000, '补充流动资金', 24, to_date('13-12-2012', 'dd-mm-yyyy'), to_date('12-12-2014', 'dd-mm-yyyy'), '2', 20, '1', 51496, 49886, 'lvkun', null, to_date('10-07-2013 09:48:47', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.7', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51530, '1', '交银国信?聚福330号单一资金信托合同*', '2', '交银国际信托有限公司', '单一信托资金计划', 50000, '补充流动资金', 24, to_date('31-03-2013', 'dd-mm-yyyy'), to_date('30-03-2015', 'dd-mm-yyyy'), '2', 20, '1', 51530, 49886, 'lvkun', null, to_date('10-07-2013 10:04:28', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.7', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51540, '1', '（2013）信银（西）字3-005号', '1', '中信银行西安明德门支行', '委托债权融资', 20000, '补充流动资金', 12, to_date('31-03-2013', 'dd-mm-yyyy'), to_date('30-03-2014', 'dd-mm-yyyy'), '2', 20, '1', 51540, 49886, 'lvkun', null, to_date('10-07-2013 10:05:49', 'dd-mm-yyyy hh24:mi:ss'), '0', '6', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51581, '1', '2012年西安投资控股有限公司公司债券承销协议', '3', '2013西投企业债券', '债券', 70000, '西安综合保税区（一期）物流园区项目建设', 120, to_date('19-03-2013', 'dd-mm-yyyy'), to_date('18-03-2023', 'dd-mm-yyyy'), '3', 20, '1', 51581, 49886, 'lvkun', null, to_date('10-07-2013 10:14:43', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.18', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51207, '1', 'XA261011110050', '1', '华夏银行西安分行', '短期流动资金贷款', 2900, '公司子公司西安鑫正实业有限公司装修资金', 6, to_date('30-11-2011', 'dd-mm-yyyy'), to_date('30-05-2012', 'dd-mm-yyyy'), '1', 20, '1', 51207, 49886, 'lvkun', null, to_date('09-07-2013 16:44:26', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '新的基准利率调整日适用新利率', '2', null, '360', '存单质押（3000万）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51213, '1', 'XA261011110053', '1', '华夏银行西安分行', '短期资金流动贷款', 4930, '公司子公司西安鑫正实业有限公司装修资金', 3, to_date('08-12-2011', 'dd-mm-yyyy'), to_date('08-03-2012', 'dd-mm-yyyy'), '1', 20, '1', 51213, 49886, 'lvkun', null, to_date('09-07-2013 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '新的基准利率调整日适用新利率', '2', null, '360', '存单质押（5000万）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51216, '1', '72012011281173', '1', '上海浦东发展银行股份有限公司西安分行', '短期流动资金贷款', 4750, '公司子公司西安鑫正实业有限公司装修资金', 6, to_date('12-12-2011', 'dd-mm-yyyy'), to_date('11-06-2012', 'dd-mm-yyyy'), '1', 20, '1', 51216, 49886, 'lvkun', null, to_date('09-07-2013 16:48:51', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '不调整', '2', null, '360', '存单质押（5000万）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51219, '1', '资金使用协议 BX（资）字2011003号', '1', '西安宝信融资租赁有限公司', null, 7000, '补充流动资金', 12, to_date('08-10-2011', 'dd-mm-yyyy'), to_date('23-10-2012', 'dd-mm-yyyy'), '1', 20, '0', 51219, 49886, 'lvkun', '融资利率为同期基准利率上浮20%', to_date('09-07-2013 16:50:48', 'dd-mm-yyyy hh24:mi:ss'), '1', '7.872', '新的基准利率调整日适用新利率', '2', null, '360', '向宝信提供1亿银行授信担保', null, to_date('07-06-2012', 'dd-mm-yyyy'));
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51224, '1', '资金使用协议 BX（资）字2011003号', '1', '西安宝信融资租赁有限公司', null, 7000, '补充流动资金', 12, to_date('08-06-2012', 'dd-mm-yyyy'), to_date('23-10-2012', 'dd-mm-yyyy'), '1', 20, '0', 51219, 49886, 'lvkun', '融资利率为同期基准利率上浮20%', to_date('09-07-2013 16:52:51', 'dd-mm-yyyy hh24:mi:ss'), '1', '7.572', '新的基准利率调整日适用新利率', '2', null, '360', '向宝信提供1亿银行授信担保', null, to_date('05-07-2012', 'dd-mm-yyyy'));
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51228, '1', '资金使用协议 BX（资）字2011003号', '1', '西安宝信融资租赁有限公司', null, 7000, '补充流动资金', 12, to_date('06-07-2012', 'dd-mm-yyyy'), to_date('23-10-2012', 'dd-mm-yyyy'), '1', 20, '1', 51219, 49886, 'lvkun', '融资利率为同期基准利率上浮20%', to_date('09-07-2013 16:54:04', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.2', '新的基准利率调整日适用新利率', '2', null, '360', '向宝信提供1亿银行授信担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51234, '1', '2012年恒银西借字第16-002号', '1', '恒丰银行西安分行', '短期流动资金贷款', 5000, '公司子公司西投远汇委托代建工程款', 6, to_date('30-03-2012', 'dd-mm-yyyy'), to_date('29-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51234, 49886, 'lvkun', null, to_date('09-07-2013 16:56:27', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '不调整', '2', null, '360', '存单质押   （1亿）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51237, '1', '2012年恒银西借字第16-003号', '1', '恒丰银行西安分行', '短期流动资金贷款', 5000, '公司子公司西投远汇委托代建工程款', 6, to_date('30-03-2012', 'dd-mm-yyyy'), to_date('29-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51237, 49886, 'lvkun', null, to_date('09-07-2013 16:58:16', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '不调整', '2', null, '360', '存单质押   （1亿）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51241, '1', 'YB-201203DK', '2', '陕西省国际信托信托股份有限公司', '单一信托资金计划', 6000, '资金周转', 36, to_date('12-04-2012', 'dd-mm-yyyy'), to_date('10-04-2015', 'dd-mm-yyyy'), '2', 20, '1', 51241, 49886, 'lvkun', null, to_date('09-07-2013 17:08:55', 'dd-mm-yyyy hh24:mi:ss'), '0', '12', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (53181, '1', '2013年重银陕分授贷字第A0009号', '1', '重庆银行股份有限公司西安分行', '短期流动资金贷款', 5000, '公司子公司鑫盛有限公司苗木采购', 10, to_date('28-06-2013', 'dd-mm-yyyy'), to_date('27-04-2014', 'dd-mm-yyyy'), '1', 20, '1', 53181, 49886, 'lvkun', null, to_date('18-07-2013 09:41:43', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.6', '新的基准利率调整日适用新利率', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51358, '1', 'C22TL1100036N', '1', '东亚银行（中国）有限公司西安分行', '短期流动资金贷款', 2250, '公司子公司西安鑫正实业有限公司装修资金', 12, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('26-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51358, 49886, 'lvkun', '融资利率为同期基准利率上浮10%', to_date('27-06-2013 16:26:55', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.216', '每六个月按新的基准利率调节', '2', null, '360', '理财产品质押', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51362, '1', 'C22TL1100037N', '1', '东亚银行（中国）有限公司西安分行', '短期流动贷款', 2250, '公司子公司西安鑫正实业有限公司装修资金', 12, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('26-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51362, 49886, 'lvkun', '融资利率为同期基准利率上浮10%', to_date('27-06-2013 16:30:50', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.216', '每六个月按新的基准利率调节', '2', null, '360', '理财产品质押', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51369, '1', 'C22TL1100038N', '1', '东亚银行（中国）有限公司西安分行', '短期流动资金贷款', 2250, '公司子公司西安鑫正实业有限公司装修资金', 12, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('26-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51369, 49886, 'lvkun', '融资利率为同期基准利率上浮10%', to_date('27-06-2013 16:42:05', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.216', '每六个月按新的基准利率调节', '2', null, '360', '理财产品质押', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51381, '1', 'C22TL1100039N', '1', '东亚银行（中国）有限公司西安分行', '短期流动资金贷款', 2250, '公司子公司西安鑫正实业有限公司装修资金', 12, to_date('27-09-2011', 'dd-mm-yyyy'), to_date('26-09-2012', 'dd-mm-yyyy'), '1', 20, '1', 51381, 49886, 'lvkun', '融资利率为同期基准利率上浮10%', to_date('27-06-2013 16:48:33', 'dd-mm-yyyy hh24:mi:ss'), '0', '7.216', '每六个月按新的基准利率调节', '2', null, '360', '理财产品质押', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51392, '1', 'T110729940-01', '2', '平安信托有限责任公司', '单一信托资金计划', 4500, '补充流动资金', 12, to_date('18-10-2011', 'dd-mm-yyyy'), to_date('17-10-2012', 'dd-mm-yyyy'), '2', 20, '1', 51392, 49886, 'lvkun', '此笔融资共有3份协议，其他两份协议号分别是T110729940-02 和T110729940-03', to_date('27-06-2013 16:58:57', 'dd-mm-yyyy hh24:mi:ss'), '0', '9', '不调整', '2', null, '360', '交通银行1748.23万流通股质押', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51399, '1', '2011年恒银西借字第11-16号', '1', '恒丰银行西安分行', '短期流动资金贷款', 5000, '公司子公司西安鑫正实业有限公司装修资金', 6, to_date('22-11-2011', 'dd-mm-yyyy'), to_date('22-05-2012', 'dd-mm-yyyy'), '1', 20, '1', 51399, 49886, 'lvkun', null, to_date('27-06-2013 17:06:33', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '不调整', '2', null, '360', '存单质押    （1亿）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51406, '1', '2011年恒银西借字第11-17号', '1', '恒丰银行西安分行', '短期流动资金贷款', 5000, '公司子公司西安鑫正实业有限公司装修资金', 6, to_date('22-11-2011', 'dd-mm-yyyy'), to_date('22-05-2012', 'dd-mm-yyyy'), '1', 20, '1', 51406, 49886, 'lvkun', null, to_date('27-06-2013 17:08:05', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '不调整', '2', null, '360', '存单质押（1亿）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51427, '1', '2011年重银陕分贷字第A002号', '1', '重庆银行股份有限公司西安分行', '短期流动资金贷款', 3720, '公司子公司西安鑫正实业有限公司装修资金', 6, to_date('29-09-2011', 'dd-mm-yyyy'), to_date('28-05-2012', 'dd-mm-yyyy'), '2', 20, '1', 51427, 49886, 'lvkun', null, to_date('27-06-2013 17:09:45', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '新的基准利率调整日适用新利率', '1', null, '360', '存单质押    （4000万）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51433, '1', '建陕南贷（2011）087号', '1', '建设银行西安南大街支行', '短期流动资金贷款', 2900, '公司子公司西安鑫正实业有限公司装修资金', 3, to_date('30-11-2011', 'dd-mm-yyyy'), to_date('29-02-2012', 'dd-mm-yyyy'), '2', 20, '1', 51433, 49886, 'lvkun', null, to_date('27-06-2013 17:11:52', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.1', '新的基准利率调整日适用新利率', '2', null, '360', '存单质押（3000万）', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51134, '1', '2011年重银陕分授字第11010004号', '1', '重庆银行股份有限公司西安分行', '短期流动资金贷款', 3000, '补充流动资金', 12, to_date('08-06-2012', 'dd-mm-yyyy'), to_date('19-06-2012', 'dd-mm-yyyy'), '1', 20, '1', 51126, 49886, 'lvkun', null, to_date('27-06-2013 09:54:23', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.8779', '同期基准利率（6.31%）上调9%，新的基准利率调整日适用新利率', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51152, '1', '72012011280724', '1', '上海浦东发展银行股份有限公司西安分行', '短期流动贷款', 8000, '公司子公司西安鑫正实业有限公司装修资金', 12, to_date('24-08-2011', 'dd-mm-yyyy'), to_date('23-08-2012', 'dd-mm-yyyy'), '2', 20, '1', 51152, 49886, 'lvkun', '融资利率为同期基准利率', to_date('27-06-2013 11:16:16', 'dd-mm-yyyy hh24:mi:ss'), '0', '6.56', '不调整', '2', null, '360', '信用担保', null, null);
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51126, '1', '2011年重银陕分授字第11010004号', '1', '重庆银行股份有限公司西安分行', '短期流动资金贷款', 3000, '补充流动资金', 12, to_date('20-06-2011', 'dd-mm-yyyy'), to_date('19-06-2012', 'dd-mm-yyyy'), '1', 20, '0', 51126, 49886, 'lvkun', null, to_date('27-06-2013 09:52:24', 'dd-mm-yyyy hh24:mi:ss'), '1', '6.8779', '同期基准利率（6.31%）上调9%', '2', null, '360', '信用担保', null, to_date('07-07-2011', 'dd-mm-yyyy'));
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51130, '1', '2011年重银陕分授字第11010004号', '1', '重庆银行股份有限公司西安分行', '短期流动资金贷款', 3000, '补充流动资金', 12, to_date('07-07-2011', 'dd-mm-yyyy'), to_date('19-06-2012', 'dd-mm-yyyy'), '1', 20, '0', 51126, 49886, 'lvkun', null, to_date('27-06-2013 09:53:41', 'dd-mm-yyyy hh24:mi:ss'), '1', '7.1504', '同期基准利率（6.56%）上调9%', '2', null, '360', '信用担保', null, to_date('08-06-2012', 'dd-mm-yyyy'));
insert into FOS_FINANCING_DETAILS (FINANCING_DETAILS_ID, INTO_CATEGORY, CONTRACT_NUMBER, INSTITUTION_CATEGORY, INSTITUTION_NAME, FINANCING_CATEGORY, MONEY, PURPOSE, TIME_LIMIT, START_DATE, END_DATE, END_INTEREST_MODE, END_INTEREST_DATE, IS_NEW, OLD_ID, GROUP_ID, TRANSACT_USER, REMARKS, FOUND_DATE, IS_CHANGE, INTEREST_RATES, ADJUST_MODE, IS_ADVANCE_REPAY, REPAY_DATE, REPAY_PERIOD, MORTGAGE_MODE, MORTGAGE_GOODS, REAL_END_DATE)
values (51858, '1', '（20900000）浙商银借字（2013）第00207号', '1', '浙商银行股份有限公司西安分行', '流动资金贷款', 10000, '用于下属企业西安鑫盛景观园林绿化工程有限公司苗木采购', 12, to_date('26-06-2013', 'dd-mm-yyyy'), to_date('25-06-2014', 'dd-mm-yyyy'), '2', 20, '1', 51858, 49886, 'lvkun', null, to_date('28-06-2013 16:18:22', 'dd-mm-yyyy hh24:mi:ss'), '0', '6', '不调整', '2', null, '360', '陕西明泰工程建设有限责任公司', null, null);
commit;
prompt 29 records loaded
prompt Loading FOS_FINANCING_SECURITY_MONEY...
insert into FOS_FINANCING_SECURITY_MONEY (FINA_SECURITY_MONEY_ID, USE_TYPE, BUDGET_MONEY, START_DATE, END_DATE, FOUND_DATE)
values (50001, '1', 200000, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('31-12-2013', 'dd-mm-yyyy'), to_date('07-06-2013', 'dd-mm-yyyy'));
insert into FOS_FINANCING_SECURITY_MONEY (FINA_SECURITY_MONEY_ID, USE_TYPE, BUDGET_MONEY, START_DATE, END_DATE, FOUND_DATE)
values (50002, '0', 1000, to_date('01-01-2013', 'dd-mm-yyyy'), to_date('31-12-2013', 'dd-mm-yyyy'), to_date('07-06-2013', 'dd-mm-yyyy'));
commit;
prompt 2 records loaded
prompt Loading FOS_INITIAL_SETTLEMENT_MONEY...
prompt Table is empty
prompt Loading FOS_INTERIOR_LOAN...
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (73384, 'ssdsd', 10, 'dsf', 1, 2, null, to_date('19-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013', 'dd-mm-yyyy'), null, null, null, 20, '1', '1', '0', null, null, 49882, '张涛', to_date('21-08-2013 16:00:20', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, null, 'duanqinyi', '0', '1', '365', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (73392, 'sdfsdf', 10, 'sdfs', 2, 3, null, to_date('21-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013', 'dd-mm-yyyy'), null, null, null, 20, '1', '1', '0', null, null, 49882, '张涛', to_date('21-08-2013 16:04:40', 'dd-mm-yyyy hh24:mi:ss'), null, '0', null, null, 'duanqinyi', '0', '1', '365', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51577, '西安西投置业有限公司', 1000, '无', 8, 8, null, to_date('10-04-2012', 'dd-mm-yyyy'), to_date('09-04-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 10:13:29', 'dd-mm-yyyy hh24:mi:ss'), '远景股本金借出', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51838, '西安西投置业有限公司', 750, '无', 8, 8, null, to_date('10-04-2012', 'dd-mm-yyyy'), to_date('09-04-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 10:33:57', 'dd-mm-yyyy hh24:mi:ss'), '鑫盛股本金借出', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51844, '西安西投置业有限公司', 1050, '无', 8, 8, null, to_date('10-04-2012', 'dd-mm-yyyy'), to_date('16-05-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 10:41:17', 'dd-mm-yyyy hh24:mi:ss'), '鑫盛股本金借出', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51860, '西安西投置业有限公司', 3200, '无', 8, 8, null, to_date('14-09-2012', 'dd-mm-yyyy'), to_date('13-09-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 10:51:02', 'dd-mm-yyyy hh24:mi:ss'), '鑫盛股本金借出', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51863, '西安西投置业有限公司', 2700, '无', 8, 8, null, to_date('11-12-2012', 'dd-mm-yyyy'), to_date('10-12-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 10:52:29', 'dd-mm-yyyy hh24:mi:ss'), '沣京股本金借出', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51937, '西安西投置业有限公司', 1000, '无', 0, 0, null, to_date('02-05-2013', 'dd-mm-yyyy'), to_date('01-05-2018', 'dd-mm-yyyy'), null, null, null, 20, '3', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:19:21', 'dd-mm-yyyy hh24:mi:ss'), '户渼项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51948, '西安西投置业有限公司', 9000, '无', 0, 0, null, to_date('30-05-2013', 'dd-mm-yyyy'), to_date('29-05-2018', 'dd-mm-yyyy'), null, null, null, 20, '3', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:21:50', 'dd-mm-yyyy hh24:mi:ss'), '户渼项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51951, '西安西投置业有限公司', 100, '无', 8, 8, null, to_date('13-04-2010', 'dd-mm-yyyy'), to_date('12-04-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '1', to_date('13-04-2013', 'dd-mm-yyyy'), to_date('12-04-2016', 'dd-mm-yyyy'), 49882, '张涛', to_date('10-07-2013 11:23:22', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款，到期后续签三年', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51961, '西安西投置业有限公司', 100, '无', 8, 8, null, to_date('13-04-2013', 'dd-mm-yyyy'), to_date('12-04-2016', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:38:44', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51964, '西安西投置业有限公司', 800, '无', 8, 8, null, to_date('07-06-2010', 'dd-mm-yyyy'), to_date('06-06-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '1', to_date('07-06-2013', 'dd-mm-yyyy'), to_date('06-06-2016', 'dd-mm-yyyy'), 49882, '张涛', to_date('10-07-2013 11:40:53', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款，到期后续签三年', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51967, '西安西投置业有限公司', 800, '无', 8, 8, null, to_date('07-06-2013', 'dd-mm-yyyy'), to_date('06-06-2016', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:41:50', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51970, '西安西投置业有限公司', 500, '无', 8, 8, null, to_date('24-12-2010', 'dd-mm-yyyy'), to_date('23-12-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:43:01', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51973, '西安西投置业有限公司', 4300, '无', 10.09, 10.09, null, to_date('21-06-2012', 'dd-mm-yyyy'), to_date('20-06-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:45:25', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51977, '西安西投置业有限公司', 450, '无', 8, 8, null, to_date('10-05-2013', 'dd-mm-yyyy'), to_date('09-05-2016', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:47:01', 'dd-mm-yyyy hh24:mi:ss'), '远景项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51986, '西安西投置业有限公司', 5000, '无', 14, 14, null, to_date('28-10-2011', 'dd-mm-yyyy'), to_date('27-10-2012', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '1', to_date('28-10-2012', 'dd-mm-yyyy'), to_date('27-10-2014', 'dd-mm-yyyy'), 49882, '张涛', to_date('10-07-2013 11:48:27', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款，到期后续签二年', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (51998, '西安西投置业有限公司', 5000, '无', 14, 14, null, to_date('28-10-2012', 'dd-mm-yyyy'), to_date('27-10-2014', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:52:23', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52001, '西安西投置业有限公司', 2500, '无', 14, 14, null, to_date('17-05-2012', 'dd-mm-yyyy'), to_date('16-05-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 11:54:00', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52012, '西安西投置业有限公司', 5100, '无', 14, 14, null, to_date('06-08-2012', 'dd-mm-yyyy'), to_date('05-08-2015', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 13:40:58', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52015, '西安西投置业有限公司', 10000, '无', 14, 14, null, to_date('28-09-2012', 'dd-mm-yyyy'), to_date('27-09-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 13:41:57', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52019, '西安西投置业有限公司', 18000, '无', 14, 14, null, to_date('26-03-2013', 'dd-mm-yyyy'), to_date('25-03-2016', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52022, '西安西投置业有限公司', 12000, '无', 14, 14, null, to_date('08-06-2013', 'dd-mm-yyyy'), to_date('07-06-2016', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '0', null, null, 49882, '张涛', to_date('10-07-2013 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), '远秦项目借款', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
insert into FOS_INTERIOR_LOAN (INTERIOR_LOAN_ID, LOAN_USER, LOAN_MONEY, LOAN_BANK, CONTRACT_RATES, REAL_RATES, ADVISER_COST, START_RATE_DATE, END_RATE_DATE, TIME_LIMIT, PROVISION_DAYS, INTEREST_INCOME, END_INTEREST_DATE, END_INTEREST_MODE, LOAN_STATUS, IS_DELAY, DELAY_START_DATE, DELAY_END_DATE, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMARKS, FOR_STATE, DEP_RES_USER, DEP_AUDITING_STATE, MG_LEADERSHIP, MG_LEADER_AUD_STATE, IS_MODIFY, REPAY_PERIOD, TRANSACT_ACCT_NAME, MG_LEADER_USER_NAME)
values (52025, '西安西投置业有限公司', 3000, '无', 12, 16, null, to_date('19-01-2012', 'dd-mm-yyyy'), to_date('31-01-2013', 'dd-mm-yyyy'), null, null, null, 20, '2', '1', '1', to_date('19-01-2013', 'dd-mm-yyyy'), to_date('31-01-2013', 'dd-mm-yyyy'), 49882, '张涛', to_date('10-07-2013 13:49:13', 'dd-mm-yyyy hh24:mi:ss'), '恒奥委贷', '1', null, null, 'duanqinyi', '1', '0', '360', 'zhangtao', '段秦义');
commit;
prompt 24 records loaded
prompt Loading FOS_REJECT_REASON_RECORD...
insert into FOS_REJECT_REASON_RECORD (REJ_REA_RECORD_ID, AUDIT_REP_REC_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, FOUND_DATE)
values (52361, 51122, null, 'zhaofeng', to_date('10-07-2013 16:27:22', 'dd-mm-yyyy hh24:mi:ss'), to_date('10-07-2013 16:27:22', 'dd-mm-yyyy hh24:mi:ss'));
insert into FOS_REJECT_REASON_RECORD (REJ_REA_RECORD_ID, AUDIT_REP_REC_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, FOUND_DATE)
values (51833, 51554, null, 'duanqinyi', to_date('28-06-2013 16:10:32', 'dd-mm-yyyy hh24:mi:ss'), to_date('28-06-2013 16:10:32', 'dd-mm-yyyy hh24:mi:ss'));
insert into FOS_REJECT_REASON_RECORD (REJ_REA_RECORD_ID, AUDIT_REP_REC_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, FOUND_DATE)
values (72896, 53408, null, '赵丰', to_date('31-07-2013 14:46:13', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-07-2013 14:46:13', 'dd-mm-yyyy hh24:mi:ss'));
insert into FOS_REJECT_REASON_RECORD (REJ_REA_RECORD_ID, AUDIT_REP_REC_ID, REJ_REASON, REJ_USER_NAME, REJ_DATE, FOUND_DATE)
values (72897, 53440, null, '赵丰', to_date('31-07-2013 14:46:20', 'dd-mm-yyyy hh24:mi:ss'), to_date('31-07-2013 14:46:20', 'dd-mm-yyyy hh24:mi:ss'));
commit;
prompt 4 records loaded
prompt Loading FOS_REPORTS_DETAILS...
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (73474, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('31-08-2013', 'dd-mm-yyyy'), to_date('28-08-2013 11:15:22', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (53364, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 15:00:57', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (51096, null, '资金运用滚动计划表', null, to_date('30-06-2013', 'dd-mm-yyyy'), to_date('09-07-2013 10:29:34', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (53115, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('17-07-2013 14:06:07', 'dd-mm-yyyy hh24:mi:ss'), '1', 49886);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (53286, '资金来源滚动计划汇总表', '资金运用滚动计划汇总表', '资金计划与平衡分析报表', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 13:37:11', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (52791, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 13:52:06', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (52784, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 13:51:04', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (52870, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('10-07-2013', 'dd-mm-yyyy'), to_date('12-07-2013 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (53716, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('05-08-2013 14:33:04', 'dd-mm-yyyy hh24:mi:ss'), '1', 49882);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (72914, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:53:51', 'dd-mm-yyyy hh24:mi:ss'), '1', 49847);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (72922, '资金来源滚动计划表', '资金运用滚动计划表', null, to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:54:21', 'dd-mm-yyyy hh24:mi:ss'), '1', 49849);
insert into FOS_REPORTS_DETAILS (REP_DETAILS_ID, ONE_REPORTS_NAME, TWO_REPORTS_NAME, THREE_REPORTS_NAME, GATHER_DATE, FOUND_DATE, REPORTS_USE_TYPE, GROUP_ID)
values (73256, '资金来源滚动计划汇总表', '资金运用滚动计划汇总表', '资金计划与平衡分析报表', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:40', 'dd-mm-yyyy hh24:mi:ss'), '2', 49880);
commit;
prompt 12 records loaded
prompt Loading FOS_SECURITY_AUTHORIZATION...
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (73371, '1', '2', '小黄', null, 100.63, 100.1, to_date('21-08-2013', 'dd-mm-yyyy'), to_date('31-08-2013', 'dd-mm-yyyy'), null, null, null, 2, 'fosadmin', to_date('21-08-2013 14:03:36', 'dd-mm-yyyy hh24:mi:ss'), 500.22);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (73308, '1', '2', '小黄', null, 100, 20, to_date('20-08-2013', 'dd-mm-yyyy'), to_date('23-08-2014', 'dd-mm-yyyy'), null, null, null, 2, 'fosadmin', to_date('20-08-2013 18:05:27', 'dd-mm-yyyy hh24:mi:ss'), 500);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (53943, '2', '2', '爱菊集团', '1', 20000, 75, to_date('26-06-2013', 'dd-mm-yyyy'), to_date('25-06-2015', 'dd-mm-yyyy'), '交通银行', '流动资金贷款', '分次提款，一次还款。担保费共600万。', 49886, 'lvkun', to_date('05-08-2013 16:16:07', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52992, '1', '2', '莲湖基投', '1', 147000, null, to_date('06-05-2013', 'dd-mm-yyyy'), to_date('06-12-2022', 'dd-mm-yyyy'), '国开行', '项目贷款', '分次提款，分次还款', 49886, 'lvkun', to_date('16-07-2013 11:44:00', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52935, '2', '2', '鑫正实业', '1', 8000, null, to_date('31-08-2010', 'dd-mm-yyyy'), to_date('24-08-2018', 'dd-mm-yyyy'), '西安银行', '项目贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:19:01', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52938, '2', '2', '鑫正实业', '1', 4000, null, to_date('12-03-2012', 'dd-mm-yyyy'), to_date('11-03-2015', 'dd-mm-yyyy'), '西安银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:19:58', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52941, '2', '2', '国信小贷', '1', 5000, null, to_date('18-07-2012', 'dd-mm-yyyy'), to_date('18-07-2015', 'dd-mm-yyyy'), '交通银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:20:56', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52944, '2', '2', '国信小贷', '2', 5000, null, to_date('18-07-2012', 'dd-mm-yyyy'), to_date('18-07-2015', 'dd-mm-yyyy'), '交通银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:22:01', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52947, '2', '1', '国信小贷', '1', 3500, null, to_date('13-08-2012', 'dd-mm-yyyy'), to_date('13-08-2013', 'dd-mm-yyyy'), '中信银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:22:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52950, '2', '1', '国信小贷', '1', 4000, null, to_date('15-08-2012', 'dd-mm-yyyy'), to_date('15-08-2013', 'dd-mm-yyyy'), '中信银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:23:44', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52953, '2', '2', '国信小贷', '2', 7000, null, to_date('22-04-2013', 'dd-mm-yyyy'), to_date('22-04-2014', 'dd-mm-yyyy'), '西安银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:24:28', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52956, '2', '2', '国信小贷', '2', 1000, null, to_date('27-04-2013', 'dd-mm-yyyy'), to_date('26-04-2015', 'dd-mm-yyyy'), '重庆金融资产交易所', '金融资产收益权转让', null, 49886, 'lvkun', to_date('16-07-2013 11:25:35', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52959, '2', '2', '宝信公司', '2', 750, null, to_date('29-11-2011', 'dd-mm-yyyy'), to_date('28-11-2013', 'dd-mm-yyyy'), '中信银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:26:40', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52962, '2', '2', '宝信公司', '1', 3600, null, to_date('17-08-2012', 'dd-mm-yyyy'), to_date('16-08-2013', 'dd-mm-yyyy'), '中信银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:27:20', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52965, '2', '2', '宝信公司', '1', 3000, null, to_date('29-09-2012', 'dd-mm-yyyy'), to_date('28-09-2013', 'dd-mm-yyyy'), '重庆银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:28:09', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52968, '2', '2', '宝信公司', '1', 5000, null, to_date('31-10-2012', 'dd-mm-yyyy'), to_date('30-10-2015', 'dd-mm-yyyy'), '恒丰银行', '固定资产贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:29:05', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52971, '2', '2', '宝信公司', '1', 5000, null, to_date('01-11-2012', 'dd-mm-yyyy'), to_date('31-10-2015', 'dd-mm-yyyy'), '恒丰银行', '固定资产贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52974, '2', '2', '宝信公司', '2', 2000, null, to_date('29-11-2012', 'dd-mm-yyyy'), to_date('28-11-2013', 'dd-mm-yyyy'), '交通银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:30:46', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52977, '2', '2', '宝信公司', '2', 2000, null, to_date('23-11-2012', 'dd-mm-yyyy'), to_date('22-11-2013', 'dd-mm-yyyy'), '交通银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:31:27', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52980, '2', '2', '宝信公司', '1', 4500, null, to_date('29-12-2011', 'dd-mm-yyyy'), to_date('28-12-2013', 'dd-mm-yyyy'), '华夏银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:32:35', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52983, '2', '2', '宝信公司', '1', 2400, null, to_date('29-02-2012', 'dd-mm-yyyy'), to_date('28-02-2015', 'dd-mm-yyyy'), '光大银行', '保理', null, 49886, 'lvkun', to_date('16-07-2013 11:33:30', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52986, '2', '2', '宝信公司', '1', 5000, null, to_date('25-05-2012', 'dd-mm-yyyy'), to_date('24-05-2015', 'dd-mm-yyyy'), '西安银行', '流动资金贷款', null, 49886, 'lvkun', to_date('16-07-2013 11:34:35', 'dd-mm-yyyy hh24:mi:ss'), null);
insert into FOS_SECURITY_AUTHORIZATION (SCY_ATZN_DTL_ID, PRO_CATEGORIES_CODE, EVENT_STATUS, EVENT_NAME, DRAW_TYPE, CONTRACT_MONEY, SECURITY_MONEY, EVENT_INITIAL_TIME, EVENT_END_TIME, APPROVE_CONDITION, EVENT_SUMMARY, REMARKS, GROUP_ID, TRANSACT_USER, FOUND_DATE, REMAINDER_MONEY)
values (52989, '2', '2', '宝信公司', '1', 3217.2, null, to_date('01-03-2012', 'dd-mm-yyyy'), to_date('01-03-2015', 'dd-mm-yyyy'), '长安信托', '集合资金信托计划', null, 49886, 'lvkun', to_date('16-07-2013 11:35:37', 'dd-mm-yyyy hh24:mi:ss'), null);
commit;
prompt 23 records loaded
prompt Loading FOS_SOURCE_USE_FUNDS...
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53249, 30351, '借款利息收入（计划借款）', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 403, 1546, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:09:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53250, 30351, '收回信托利息', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:10:14', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53256, 44899, '户县渼陂湖及潭峪河综合治理项目', 14784, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:12:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53261, 44899, '西部投资企业总部项目', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:12:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53265, 44901, '支付项目公司借款', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 17000, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:14:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53269, 44903, '归还西控公司到期借款', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:16:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53273, 44903, '借款利息收入（实际已发生借款)', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 2031, 1682, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:17:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53277, 44903, '借款利息收入（计划借款）', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 403, 1546, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:18:07', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53281, 44903, '支付信托利息', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:18:26', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51136, 30351, '鸿达水景', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 715.56, 707.78, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:47:04', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51137, 30336, '长安财富资产管理公司', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 30000, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:48:34', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51138, 30351, '双维委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 31.67, to_date('20-08-2013', 'dd-mm-yyyy'), 34.83, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:51:23', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51139, 30351, '沣东车城委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 1150, 910, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:52:16', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51140, 30351, '世园委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 1073.33, 1061.67, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:53:24', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51141, 30351, '中大机械委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 25, to_date('20-08-2013', 'dd-mm-yyyy'), 25.83, 25.83, 68.33, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 12:54:16', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51182, 44897, '文化专项', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 300, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51186, 44897, '综合服务业', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:15:33', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51189, 44897, '高新技术专项', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:16:21', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51192, 44901, '同力重工', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 7800, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:17:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51195, 44901, '东方园林定向增发', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 15000, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:18:26', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51198, 44901, '明泰委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 8000, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 13:18:58', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52400, 30330, '西安银行增资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:34:28', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52402, 30351, '国信小贷分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:37:04', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52403, 30351, '宝信租赁分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 1289.36, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:38:22', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52404, 30351, '海联典当分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:39:10', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52405, 30351, '陕国投分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 70, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:40:49', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52406, 30351, '国信小贷的股东借款利息', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:41:45', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52407, 30351, '开城实业公司委贷', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 10:43:03', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53198, 30336, '银行融资', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 0, 10000, 14500, 49886, '1', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:05:25', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53208, 44903, '陕西省国际信托股份有限公司', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 1834.25, 0, 1794.38, 1834.25, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53212, 44903, '浙商银行西安分行', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 156.71, 0, 164, 167.64, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:09:43', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53215, 44903, '兴业国际信托有限公司', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 207, 0, 202.5, 15220.5, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:10:33', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53218, 44903, '交银国际股份有限公司', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 1856.418948, 0, 1900.6112, 1942.7831, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:11:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53221, 44903, '中信银行明德门支行', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 306.67, 0, 300, 306.67, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53224, 44903, '重庆银行西安分行', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 28.42, to_date('21-07-2013', 'dd-mm-yyyy'), 28.42, 27.5, 82.5, 84.33, 49886, '2', '1', 'jiaxiaoyi', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 10:13:15', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53433, 30351, '中大机械委贷', 25, to_date('01-08-2013', 'dd-mm-yyyy'), 25.83, to_date('31-08-2013', 'dd-mm-yyyy'), 25.83, 68.33, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:36:58', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53434, 30336, '资产管理计划 （长安财富资产管理有限公司）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 30000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:39:43', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53439, 44897, '文化专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 300, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:45:54', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53443, 44897, '综合服务业', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:46:41', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53446, 44897, '高新技术专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:47:30', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53449, 44901, '东方园林定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 15000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53452, 44901, '蓝色光标定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:51:01', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53455, 44901, '明泰委贷', 8000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:51:39', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53458, 44901, '溪啸工贸委贷项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9800, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 14:52:29', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53466, 44339, '国海创新机构合作', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:00:33', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53469, 44339, '东方赛富机构合作', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 1000, 0, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:01:28', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53472, 44339, '中国风投机构合作', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:03:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53475, 44339, '力合清源机构合作', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 800, 0, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:04:19', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53478, 44339, '海汇投资机构合作', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:05:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53481, 44339, '2013年预计投资额', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 10000, 0, 49891, '3', '1', '时丽君', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 15:06:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53539, 44903, '借款利息支出（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:58:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53542, 44903, '借款利息支出（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 15:02:25', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53545, 44903, '支付信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 15:03:49', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53624, 30330, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:22:41', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53626, 30351, '国信小贷公司分红', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:23:33', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53627, 30351, '海联典当行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:24:37', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53628, 30351, '国信小贷公司股东借款利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:25:21', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53629, 30351, '开城实业公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:26:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53630, 30351, '宝信租赁公司贷款本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 364.17, 0, 5373.4, 10989.58, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:27:26', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53631, 30351, '陕西斯普瑞本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:28:23', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53632, 30351, '交行分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 839.15, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:29:02', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53633, 30351, '长安信托分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:29:39', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53638, 44897, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:30:49', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53642, 44897, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:31:30', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53645, 44901, '迈科期货投资', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:32:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53648, 44901, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:32:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53651, 44901, '国信小贷增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:33:05', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53654, 44901, '陕西股权交易所', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1100, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:33:30', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53657, 44901, '光大证券定向增发', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 10000, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 09:34:03', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53671, 30351, '鸿达水景委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:27:18', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53672, 30351, '沣东车城委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:29:11', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53673, 30351, '世园委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:32:10', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53674, 30351, '明泰委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 164.89, 0, 283.11, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:33:33', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53675, 30351, '中大机械委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 25.83, to_date('10-09-2013', 'dd-mm-yyyy'), 25.83, 25, 43.33, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 15:34:37', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51652, 30351, '宝信租赁分红', 1289.36, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:30:17', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51641, 30330, '西安银行增资款', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:24:08', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53416, 30351, '开米股权退出收益', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:15:49', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53417, 30351, '瑞麟委贷', 158.33, to_date('01-08-2013', 'dd-mm-yyyy'), 163.61, to_date('31-08-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:17:54', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53418, 30351, '明泰委贷罚息', 240, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:32:50', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53419, 30351, '双维委贷', 31.67, to_date('01-08-2013', 'dd-mm-yyyy'), 34.83, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:33:55', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53420, 30351, '鸿达水景委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:37:28', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53421, 30351, '沣东车城委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:38:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53422, 30351, '世园委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:40:01', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53503, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:22:18', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53505, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:23:23', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53508, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:28:24', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53509, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:29:40', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53510, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:31:44', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53511, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:33:37', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53512, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:34:57', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53519, 44899, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 7784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:38:26', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53524, 44899, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:39:41', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53527, 44901, '支付项目公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 17000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:41:07', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53530, 44903, '归还西控公司到期借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('29-07-2013 14:42:07', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53556, 30336, '银行融资', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 20000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 14500, 49886, '1', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:35:27', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53560, 30351, '莲湖基投担保费收入', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 315, 0, 0, 0, 49886, '1', '1', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:38:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53563, 44903, '陕西省国际信托股份有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1834.25, 0, 1794.38, 1834.25, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:41:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53567, 44903, '浙商银行西安分行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 156.71, 0, 164, 167.64, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:42:54', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53583, 44903, '兴业国际信托有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 207, 0, 202.5, 15220.5, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:46:49', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53586, 44903, '交银国际股份有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1856.418948, 0, 1900.6112, 1942.7831, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:48:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 100 records committed...
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53589, 44903, '中信银行明德门支行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 306.67, 0, 300, 306.67, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:49:10', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53592, 44903, '重庆银行西安分行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 28.42, to_date('01-08-2013', 'dd-mm-yyyy'), 28.42, 27.5, 82.5, 84.33, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('30-07-2013 09:50:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53661, 30330, '财政扶持股权资金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 13:59:56', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53662, 30351, '数字学院股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:01:31', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73025, 30351, '中大机械委贷', 25, to_date('01-08-2013', 'dd-mm-yyyy'), 25.83, to_date('31-08-2013', 'dd-mm-yyyy'), 25.83, 68.33, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73026, 30336, '资产管理计划 （长安财富资产管理有限公司）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 30000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73027, 30351, '鸿达水景委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73028, 30351, '沣东车城委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73029, 30351, '世园委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73030, 30351, '明泰委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 164.89, 0, 283.11, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73031, 30351, '中大机械委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 25.83, to_date('10-09-2013', 'dd-mm-yyyy'), 25.83, 25, 43.33, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73032, 30351, '开米股权退出收益', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73033, 30351, '瑞麟委贷', 158.33, to_date('01-08-2013', 'dd-mm-yyyy'), 163.61, to_date('31-08-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73034, 30351, '明泰委贷罚息', 240, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73035, 30351, '双维委贷', 31.67, to_date('01-08-2013', 'dd-mm-yyyy'), 34.83, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73036, 30351, '鸿达水景委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73037, 30351, '沣东车城委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73038, 30351, '世园委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73039, 30330, '财政扶持股权资金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73040, 30351, '数字学院股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73041, 30351, '开米股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73042, 30330, '财政扶持股权资金', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73043, 30351, '数字学院股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73044, 30351, '开米股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73045, 30351, '明泰委贷', 10000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73046, 30351, '双维委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73047, 30351, '中大机械委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73048, 30351, '财政扶持股权收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73049, 30351, '朱雀太平股息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73050, 30351, '双维委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73051, 30351, '中大机械委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73052, 30351, '财政扶持股权收回', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73053, 30351, '朱雀太平股息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73054, 30351, '开米股权退收益', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73055, 30351, '瑞麟委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 163.61, to_date('10-09-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73056, 30351, '双维委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 39.06, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:03:25', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73059, 30351, '中大机械委贷', 25, to_date('01-08-2013', 'dd-mm-yyyy'), 25.83, to_date('31-08-2013', 'dd-mm-yyyy'), 25.83, 68.33, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73060, 30336, '资产管理计划 （长安财富资产管理有限公司）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 30000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73061, 30351, '鸿达水景委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73062, 30351, '沣东车城委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73063, 30351, '世园委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73064, 30351, '明泰委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 164.89, 0, 283.11, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73065, 30351, '中大机械委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 25.83, to_date('10-09-2013', 'dd-mm-yyyy'), 25.83, 25, 43.33, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73066, 30351, '开米股权退出收益', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73067, 30351, '瑞麟委贷', 158.33, to_date('01-08-2013', 'dd-mm-yyyy'), 163.61, to_date('31-08-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73068, 30351, '明泰委贷罚息', 240, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73069, 30351, '双维委贷', 31.67, to_date('01-08-2013', 'dd-mm-yyyy'), 34.83, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73070, 30351, '鸿达水景委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73071, 30351, '沣东车城委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73072, 30351, '世园委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73073, 30330, '财政扶持股权资金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73074, 30351, '数字学院股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73075, 30351, '开米股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73076, 30330, '财政扶持股权资金', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73077, 30351, '数字学院股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73078, 30351, '开米股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73079, 30351, '明泰委贷', 10000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73080, 30351, '双维委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73081, 30351, '中大机械委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73082, 30351, '财政扶持股权收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73083, 30351, '朱雀太平股息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73084, 30351, '双维委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73085, 30351, '中大机械委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73086, 30351, '财政扶持股权收回', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73087, 30351, '朱雀太平股息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73088, 30351, '开米股权退收益', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73089, 30351, '瑞麟委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 163.61, to_date('10-09-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73090, 30351, '双维委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 39.06, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:34', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73093, 44897, '文化专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 300, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73094, 44897, '综合服务业', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73095, 44897, '高新技术专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73096, 44901, '东方园林定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 15000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73097, 44901, '蓝色光标定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73098, 44901, '明泰委贷', 8000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73099, 44901, '溪啸工贸委贷项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9800, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '1', 'shilijun', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73103, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73104, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73105, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73106, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73107, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73108, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73109, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:06:05', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73111, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73112, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73113, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73114, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73115, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73116, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73117, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:04', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73120, 44903, '借款利息支出（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73121, 44903, '借款利息支出（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73122, 44903, '支付信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73123, 44899, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 7784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73124, 44899, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73125, 44901, '支付项目公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 17000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73126, 44903, '归还西控公司到期借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '2', '1', 'zhangtao', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73129, 30330, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73130, 30351, '国信小贷公司分红', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73131, 30351, '海联典当行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73132, 30351, '国信小贷公司股东借款利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
commit;
prompt 200 records committed...
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73133, 30351, '开城实业公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73134, 30351, '宝信租赁公司贷款本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 364.17, 0, 5373.4, 10989.58, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73135, 30351, '陕西斯普瑞本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73136, 30351, '交行分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 839.15, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73137, 30351, '长安信托分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:14:19', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73141, 44897, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73142, 44897, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73143, 44901, '迈科期货投资', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73144, 44901, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73145, 44901, '国信小贷增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73146, 44901, '陕西股权交易所', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1100, null, 0, 0, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73147, 44901, '光大证券定向增发', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 10000, 0, 0, 49849, '2', '1', 'liuxikui', to_date('10-08-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73150, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73151, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73152, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73153, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73154, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73155, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73156, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51644, 30351, '国信小贷分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:25:49', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51653, 30351, '海联典当分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:31:15', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51654, 30351, '陕国投分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 70, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:31:51', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51655, 30351, '国信小贷股东借款利息', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:36:16', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51657, 30351, '陕西开城实业公司委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:41:12', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51677, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 200, to_date('19-07-2013', 'dd-mm-yyyy'), 0, 2030, 1658, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:57:28', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51678, 30351, '借款利息收入（计划借款）', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 270, 926, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 14:59:01', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51688, 30351, '宝信租赁贷款本息回收', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 364.17, 5373.4, 10989.58, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:10:40', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51689, 30351, '收回信托利息', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 2200, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:12:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51690, 30351, '陕西斯普瑞通信技术公司贷款本息回收', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:12:13', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51693, 30351, '西安银行分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 4349.99, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:13:10', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51694, 30351, '西投保分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 573, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:13:50', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51695, 30351, '交通银行分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 350, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:14:26', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51696, 30351, '长安信托分红', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51706, 44897, '西安银行增资', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:22:47', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51710, 44897, '长安信托增资', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 5013.33, 0, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:23:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51713, 44899, '户县渼陂湖及潭峪河综合治理项目', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 21120, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:23:36', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51718, 44901, '迈科期货的投资', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:24:17', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51792, 30351, '瑞麟委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 158.33, to_date('10-08-2013', 'dd-mm-yyyy'), 163.61, 163.61, 480.28, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:56:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51736, 44901, '国信小贷增资', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:25:40', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51729, 44901, '长安信托增资', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 5013.33, 0, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:24:56', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51733, 44899, '西部投资企业总部项目', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:25:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51739, 44901, '光大证券定向增发', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 10000, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:26:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51796, 30351, '双维委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 31.67, to_date('10-08-2013', 'dd-mm-yyyy'), 35.89, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:57:46', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51744, 44901, '支付项目公司借款', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 17000, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 10000, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:26:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51748, 44901, '国际金融中心', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 1000, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:27:05', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51751, 44903, '归还西控公司到期借款本金', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:28:29', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51801, 30351, '鸿达水景委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 715.56, 707.78, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:58:44', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51756, 44903, '借款利息收入（实际已发生借款）', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 200, to_date('19-07-2013', 'dd-mm-yyyy'), 0, 2030, 1658, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:29:42', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51760, 44903, '借款利息收入（计划借款）', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 270, 926, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:30:16', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51803, 30351, '沣东车城委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 920, 910, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:59:31', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51765, 44903, '支付信托利息', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 1400, 0, 49882, '2', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:30:54', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51805, 30351, '世园委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 1073.33, 1061.67, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:00:32', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51810, 30351, '中大机械委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 25, to_date('10-08-2013', 'dd-mm-yyyy'), 25.83, 25.83, 68.33, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:01:29', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51812, 30351, '开米股权退出', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 6709.56, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:04:12', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51777, 30351, '朱雀太平股息', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:39:09', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51780, 30351, '开米退出股权收益', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:42:44', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51785, 30351, '汉丰药业', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 540, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:50:24', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51786, 30351, '高峰水泥', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 400, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:51:13', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51907, 44897, '文化专项', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 300, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:37:18', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51789, 30351, '明泰委贷', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 460, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 15:55:15', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51811, 30351, '数字学院股权退出', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 300, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:03:24', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51813, 30351, '明泰委贷本金', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:06:46', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51816, 30351, '双维委贷本金', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:07:20', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51825, 30351, '中大机械委贷本金', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:08:13', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51926, 44901, '郅辉房地产委贷项目', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 30000, to_date('10-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:43:56', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51553, 30330, '户县渼陂湖及潭峪河综合治理项目', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 10000, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 11:27:10', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51555, 30330, '西部投资企业总部', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 11:28:24', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51556, 30336, '向西控控股公司借款', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 28120, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 10000, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 11:29:56', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51557, 30351, '远秦公司借款本金收回', 0, to_date('01-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '1', '0', 'zhangtao', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 11:31:42', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51866, 44339, '东方赛富机构合作', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 1000, 0, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:27:04', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51869, 44339, '中国风投机构合作', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:27:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51872, 44339, '力合清源机构合作', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 800, 0, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:28:48', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51885, 44339, '海汇投资机构合作', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:29:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51839, 30330, '财政扶持股权资金', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 2000, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:12:57', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51863, 44339, '国海创新机构合作', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:26:06', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51895, 44339, '计划投资额', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 11000, 0, 49891, '3', '1', '时丽君', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:30:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51911, 44897, '综合服务业', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:37:52', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51914, 44897, '高新技术专项', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:38:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51917, 44901, '同力重工股权投入', 0, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 7800, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:39:23', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51920, 44901, '中国国旅定向增发', 26500, to_date('10-07-2013', 'dd-mm-yyyy'), 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('30-06-2013', 'dd-mm-yyyy'), to_date('28-06-2013 16:40:21', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53663, 30351, '开米股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:16:34', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51127, 30351, '中大机械委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:47:59', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51128, 30351, '财政扶持股权', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 540, 400, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:49:37', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51129, 30351, '朱雀太平', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:50:38', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51130, 30351, '开米股权收益', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:51:17', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51131, 30351, '瑞麟委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 158.33, to_date('20-08-2013', 'dd-mm-yyyy'), 163.61, 163.61, 480.28, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:53:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53407, 30330, '财政扶持股权资金', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:05:47', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53409, 30351, '数字学院股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:06:38', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53410, 30351, '开米股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:07:52', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53411, 30351, '明泰委贷', 10000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:08:47', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53412, 30351, '双维委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:09:52', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53413, 30351, '中大机械委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:11:38', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53414, 30351, '财政扶持股权收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:14:00', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53415, 30351, '朱雀太平股息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('26-07-2013 10:14:57', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53322, 30330, '西安银行增资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:34:14', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53324, 30351, '国信小贷公司分红', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:35:31', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53325, 30351, '宝信租赁公司分红', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 1289.36, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:36:27', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53326, 30351, '海联典当行分红', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:38:21', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53327, 30351, '国信小贷公司股东借款利息', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:39:21', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53328, 30351, '开城实业公司', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:40:35', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
commit;
prompt 300 records committed...
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53329, 30351, '宝信租赁公司贷款本金及利息', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 364.17, 0, 5373.4, 10989.58, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:42:03', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53330, 30351, '陕西斯普瑞贷款本金及利息', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:43:31', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53331, 30351, '交行分红款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 839.15, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:44:15', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53332, 30351, '长安信托分红款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:44:59', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53337, 44897, '西安银行增资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:46:29', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53341, 44897, '长安信托增资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:47:09', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53344, 44901, '迈科期货投资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:47:54', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53347, 44901, '长安信托增资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:48:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53350, 44901, '国信小贷公司增资款', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:49:32', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53353, 44901, '光大证券定向增发', 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, null, 0, 10000, 0, 0, 49849, '2', '0', 'liuxikui', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 14:50:11', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53664, 30351, '双维委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:44:00', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53665, 30351, '中大机械委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:44:54', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53666, 30351, '财政扶持股权收回', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:45:59', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53667, 30351, '朱雀太平股息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:47:01', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53668, 30351, '开米股权退收益', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:47:54', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53669, 30351, '瑞麟委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 163.61, to_date('10-09-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:55:20', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53670, 30351, '双维委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 39.06, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('31-07-2013 14:59:16', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51121, 30330, '财政扶持股权资金', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:31:09', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51123, 30351, '数字学院', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 300, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:32:07', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51124, 30351, '开米股权', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 6709.56, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:33:01', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51125, 30351, '明泰委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 10000, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:33:54', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51126, 30351, '双维委贷', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('09-07-2013 11:34:52', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51493, 30330, '户县渼陂湖及潭峪河综合治理项目', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 10000, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:46:56', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51499, 30330, '西部投资企业总部', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:49:40', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51500, 30336, '向西控公司借款', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 28120, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 1380, 47520, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:51:23', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51501, 30351, '远秦公司借款本金收回', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:52:43', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51502, 30351, '借款利息收入（实际已发生借款）', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 2031, 1682, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:54:44', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51503, 30351, '借款利息收入（计划借款）', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 373, 1485, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:55:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51504, 30351, '收回信托利息', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:56:00', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51507, 44899, '户县渼陂湖及潭峪河综合治理项目', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 21120, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 1380, 1800, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:58:19', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51512, 44899, '西部投资企业总部项目', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 09:58:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51516, 44901, '支付项目公司借款', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 17000, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 45720, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:00:16', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51526, 44903, '归还西控公司到期借款', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:03:40', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51533, 44903, '借款利息收入（实际已发生借款)', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 2031, 1682, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:05:19', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51543, 44903, '借款利息收入（计划借款）', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 373, 1485, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:06:19', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51547, 44903, '支付信托利息', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '0', 'zhangtao', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:06:42', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51827, 30351, '明泰委贷罚息', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 195, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '1', 'shilijun', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 10:30:05', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51884, 44339, '国海创新机构合作', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 2000, 0, 0, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:04:37', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51888, 44339, '东方赛富机构合作', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 1000, 0, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:05:50', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51891, 44339, '中国风投机构合作', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:07:29', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51894, 44339, '力合清源机构合作', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 800, 0, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:08:08', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51897, 44339, '海汇投资机构合作', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:08:44', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52408, 30351, '宝信租赁的贷款本息', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 364.17, 5373.4, 10989.58, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:05:02', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (51915, 44339, '2013年预计投资额', 0, to_date('20-07-2013', 'dd-mm-yyyy'), 0, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 0, 10000, 0, 49891, '3', '1', '时丽君', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('10-07-2013 11:15:15', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52409, 30351, '陕西斯普瑞贷款本息', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:06:15', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52410, 30351, '西安银行分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 4349.99, null, 0, 0, 0, 0, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:06:59', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52411, 30351, '交行分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 839.15, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:08:05', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52412, 30351, '长安信托分红', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:08:41', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52416, 44897, '西安银行增资款', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:10:13', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52420, 44897, '长安信托增资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:10:52', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52423, 44901, '迈科期货投资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:11:33', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52426, 44901, '长安信托增资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:12:02', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52429, 44901, '国信小贷增资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:12:34', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52432, 44901, '光大证券定向增发', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 10000, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('11-07-2013 11:13:12', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52903, 30336, '银行融资', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 0, 10000, 14500, 49886, '1', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:32:59', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52907, 44903, '陕西省国际信托有限公司', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 1834.25, 1794.38, 1834.25, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52911, 44903, '浙商银行西安分行', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 156.71, 164, 167.64, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:40:30', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52915, 44903, '兴业国际信托有限公司', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 207, 202.5, 15220.5, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:45:56', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52918, 44903, '交银国际股份有限公司', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 1857.42, 1899.61, 1941.78, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:48:58', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52921, 44903, '中信银行明德门支行', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 306.67, 300, 306.67, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:49:55', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52924, 44903, '重庆银行西安分行', 0, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 77, 82.5, 84.33, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:50:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (52927, 44903, '大成律师事务所', 48, to_date('11-07-2013', 'dd-mm-yyyy'), 0, to_date('21-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49886, '2', '0', 'jiaxiaoyi', to_date('10-07-2013', 'dd-mm-yyyy'), to_date('15-07-2013 16:54:02', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53239, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:01:15', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53245, 30330, '西部投资企业总部', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:03:37', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53246, 30336, '向西控公司借款', 7784, to_date('30-07-2013', 'dd-mm-yyyy'), 17000, to_date('20-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:06:15', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53247, 30351, '远秦公司借款本金收回', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 10000, 0, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:07:26', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (53248, 30351, '借款利息收入（实际已发生借款）', 0, to_date('30-07-2013', 'dd-mm-yyyy'), 0, to_date('31-07-2013', 'dd-mm-yyyy'), 0, 2031, 1682, 0, 49882, '1', '0', 'zhangtao', to_date('20-07-2013', 'dd-mm-yyyy'), to_date('19-07-2013 11:08:40', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73471, 30330, 'ds', 10, to_date('02-09-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('28-08-2013 11:12:38', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73157, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73158, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73159, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73160, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73161, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73162, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73163, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('15-08-2013 15:22:45', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73165, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73166, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73167, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73168, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73169, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73170, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73171, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73172, 30330, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73173, 30330, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73174, 30336, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30337, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73175, 30351, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73176, 30351, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73177, 30351, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73178, 30351, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '1', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('29-08-2013 15:25:08', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73184, 44903, '借款利息支出（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73185, 44903, '借款利息支出（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73186, 44903, '支付信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73187, 44899, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 7784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73188, 44899, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73189, 44901, '支付项目公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 17000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73190, 44903, '归还西控公司到期借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '2', '1', 'zhangtao', to_date('20-08-2013', 'dd-mm-yyyy'), to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73196, 44903, '借款利息支出（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73197, 44903, '借款利息支出（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73198, 44903, '支付信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73199, 44899, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 7784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 400 records committed...
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73200, 44899, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73201, 44901, '支付项目公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 17000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73202, 44903, '归还西控公司到期借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '2', '1', 'zhangtao', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73567, 44897, 'sdfdgfdfg', 100, to_date('03-09-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-08-2013', 'dd-mm-yyyy'), to_date('28-08-2013 14:22:20', 'dd-mm-yyyy hh24:mi:ss'), null, null);
commit;
prompt 404 records loaded
prompt Loading FOS_TEMP_SOURCE_USE_FUNDS...
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73283, 30358, '借款利息收入（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73284, 30358, '借款利息收入（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73285, 30358, '收回信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 1600, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73222, 30351, '中大机械委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 25.83, to_date('10-09-2013', 'dd-mm-yyyy'), 25.83, 25, 43.33, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73223, 30351, '开米股权退出收益', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73224, 30351, '瑞麟委贷', 158.33, to_date('01-08-2013', 'dd-mm-yyyy'), 163.61, to_date('31-08-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73225, 30351, '明泰委贷罚息', 240, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73226, 30351, '双维委贷', 31.67, to_date('01-08-2013', 'dd-mm-yyyy'), 34.83, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73227, 30351, '鸿达水景委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73228, 30351, '沣东车城委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73229, 30351, '世园委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73230, 30336, '银行融资', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 20000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 14500, 49886, '1', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73231, 30330, '财政扶持股权资金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73232, 30351, '数字学院股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73233, 30351, '开米股权退出', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73234, 30330, '财政扶持股权资金', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 1200, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73235, 30351, '数字学院股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 300, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73236, 30351, '开米股权', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 6709.56, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73237, 30351, '明泰委贷', 10000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73238, 30351, '双维委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73239, 30351, '中大机械委贷', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73240, 30351, '财政扶持股权收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73241, 30351, '朱雀太平股息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73242, 30351, '双维委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 2000, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73243, 30351, '中大机械委贷本金', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 2000, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73244, 30351, '财政扶持股权收回', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 540, 0, 400, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73245, 30351, '朱雀太平股息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 500, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73246, 30351, '开米股权退收益', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 670.96, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73247, 30351, '瑞麟委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 163.61, to_date('10-09-2013', 'dd-mm-yyyy'), 163.61, 158.33, 321.94, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73248, 30351, '双维委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 39.06, to_date('10-09-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73249, 72894, '借款利息支出（实际已发生借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2031, 0, 1682, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44903, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73250, 72894, '借款利息支出（计划借款）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 403, 0, 1546, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44903, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73251, 72894, '支付信托利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 800, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44903, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73252, 72894, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 7784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 6336, 3000, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44899, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73253, 72894, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44899, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73254, 72894, '支付项目公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 17000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 3500, 42400, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44901, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73255, 72894, '归还西控公司到期借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '1', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 44903, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73259, 44897, '文化专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 300, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73260, 44897, '综合服务业', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 600, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73261, 44897, '高新技术专项', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 2000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73262, 44901, '东方园林定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 15000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73263, 44901, '蓝色光标定增项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73264, 44901, '明泰委贷', 8000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73265, 44901, '溪啸工贸委贷项目', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9800, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '2', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73266, 44897, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73267, 44897, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73268, 44901, '迈科期货投资', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 25006.77, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73269, 44901, '长安信托增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 5013.33, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73270, 44901, '国信小贷增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 9900, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73271, 44901, '陕西股权交易所', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1100, null, 0, 0, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73272, 44901, '光大证券定向增发', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 10000, 0, 0, 49849, '2', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73273, 44903, '陕西省国际信托股份有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1834.25, 0, 1794.38, 1834.25, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73274, 44903, '浙商银行西安分行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 156.71, 0, 164, 167.64, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73275, 44903, '兴业国际信托有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 207, 0, 202.5, 15220.5, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73276, 44903, '交银国际股份有限公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 1856.418948, 0, 1900.6112, 1942.7831, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73277, 44903, '中信银行明德门支行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 306.67, 0, 300, 306.67, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73278, 44903, '重庆银行西安分行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 28.42, to_date('01-08-2013', 'dd-mm-yyyy'), 28.42, 27.5, 82.5, 84.33, 49886, '2', '0', 'jiaxiaoyi', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73279, 30332, '户县渼陂湖及潭峪河综合治理项目', 7000, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73280, 30332, '西部投资企业总部', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, 0, 15000, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73281, 30337, '向西投公司借款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 24784, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 9836, 45400, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73282, 30376, '远秦公司借款本金收回', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, to_date('01-08-2013', 'dd-mm-yyyy'), 10000, 0, 0, 0, 49882, '2', '0', 'zhangtao', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), null, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73207, 30351, '中大机械委贷', 25, to_date('01-08-2013', 'dd-mm-yyyy'), 25.83, to_date('31-08-2013', 'dd-mm-yyyy'), 25.83, 68.33, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73208, 30336, '资产管理计划 （长安财富资产管理有限公司）', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 30000, to_date('31-08-2013', 'dd-mm-yyyy'), 0, 0, 0, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30340, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73209, 30330, '西安银行增资款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 17500, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30332, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73210, 30351, '国信小贷公司分红', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 2200, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73211, 30351, '海联典当行', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 95, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73212, 30351, '国信小贷公司股东借款利息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 350, 350, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73213, 30351, '开城实业公司', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 150, null, 150, 150, 150, 600, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73214, 30351, '宝信租赁公司贷款本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 364.17, 0, 5373.4, 10989.58, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73215, 30351, '陕西斯普瑞本息', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 66.66, null, 66.66, 66.66, 66.66, 4133.36, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73216, 30351, '交行分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 839.15, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73217, 30351, '长安信托分红款', 0, to_date('01-08-2013', 'dd-mm-yyyy'), 0, null, 0, 0, 0, 1559, 49849, '1', '0', 'liuxikui', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30446, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73218, 30351, '鸿达水景委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 715.56, 0, 707.78, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30376, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73219, 30351, '沣东车城委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1150, 0, 910, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73220, 30351, '世园委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 1073.33, 0, 1061.67, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
insert into FOS_TEMP_SOURCE_USE_FUNDS (SOURCE_FUNDS_ID, FIRST_CATE_ID, PROJECT_NAME, TEN_DAYS_MONEY, TEN_DAYS_DATE, A_MONTH_MONEY, A_MONTH_DATE, TWO_MONTHS_MONEY, THREE_MONTHS_MONEY, SIX_MONTHS_MONEY, MOER_SIX_MONTHS_MONEY, GROUP_ID, DATA_SOURCES, IS_MODIFY, ORGANIZATION_USER_NAME, GATHER_DATE, FOUND_DATE, SECOND_CATE_ID, REMARKS)
values (73221, 30351, '明泰委贷利息', 0, to_date('10-08-2013', 'dd-mm-yyyy'), 0, to_date('10-09-2013', 'dd-mm-yyyy'), 164.89, 0, 283.11, 0, 49847, '1', '0', 'shilijun', to_date('31-07-2013', 'dd-mm-yyyy'), to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), 30358, null);
commit;
prompt 76 records loaded
prompt Loading FW_ACCOUNT...
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51044, 'zhoufei', '周飞', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51046, 'xueweijiang', '薛卫江', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51048, 'guoxiaopeng', '郭晓鹏', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51050, 'liujianli', '刘建利', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51052, 'zengtianxiang', '曾天祥', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51054, 'gongbaosheng', '巩宝生', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51056, 'xiaoxiping', '肖西平', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51252, 'jiaxiaoyi', '贾晓怡', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49886, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51257, 'chenxiaoying', '陈晓英', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49880, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51266, 'zhufeifei', '朱菲菲', null, 'Hp22icu0NNU=', null, 'A', '主要导入公司资产负债表', null, null, null, null, null, 49880, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (53400, 'fenghui', '冯慧', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 53398, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51008, 'shangrui', '商睿', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49886, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (52075, 'goutao', '苟涛', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49849, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49895, 'duanqinyi', '段秦义', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49882, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49897, 'lvkun', '吕堃', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49886, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49899, 'liuxikui', '刘西奎', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49849, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49901, 'shangrui1', '商睿', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49849, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49889, 'zhangzhaofan', '张赵凡', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49880, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49893, 'zhangtao', '张涛', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49882, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49903, 'shilijun', '时丽君', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49847, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49905, 'zhaofeng', '赵丰', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49847, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (49907, 'lingdao', '领导', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (50209, 'shilijun1', '时丽君', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49891, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (1, 'superadmin', '超级管理员', null, 'Hp22icu0NNU=', null, 'A', '系统超级管理员', null, null, null, null, null, 1, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (3, 'fosadmin', '资金运营平台管理员', null, 'Hp22icu0NNU=', null, 'A', '资金运营平台管理员', null, null, null, null, null, 2, '11');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (50561, 'zhaofeng1', '赵丰', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49891, '12');
insert into FW_ACCOUNT (ACCT_ID, ACCT_NAME, USER_NAME, FULL_NAME, ACCT_PWD, RANDOM_KEY, STATUS, DESCRIPTION, GENDER, BIRTHDAY, EMAIL, PHOTO, PHONE, GROUP_ID, POSITION)
values (51990, 'zhangchi', '张弛', null, 'Hp22icu0NNU=', null, 'A', null, null, null, null, null, null, 49886, '11');
commit;
prompt 27 records loaded
prompt Loading FW_DUTY...
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (51269, 2, '资产负债导入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (53428, 2, '集团内部借款查询', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (50998, 2, '融资录入审核', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (52060, 2, '委托贷款查询', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49860, 2, '资金来源滚动计划录入员', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49862, 2, '资金运用滚动计划录入员', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49864, 2, '资金来源滚动计划审核', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49866, 2, '资金运用滚动计划审核', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49909, 2, '融资录入员', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49911, 2, '融资查询', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49913, 2, '集团内部借款录入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49915, 2, '集团内部借款审核', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49918, 2, '担保录入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49920, 2, '担保查询', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49922, 2, '创投资金收入录入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49924, 2, '创投资金支出录入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49926, 2, '创投查询导出', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49928, 2, '委托贷款录入', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49930, 2, '委托贷款审核', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49933, 2, '财务及报表汇总生成', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (49935, 2, '公司领导', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (1, 1, '系统超级管理员', 'A', '超级管理员角色', '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (3, 2, '平台管理员', 'A', '资金运营平台管理员', '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (51984, 2, '查看预警首页', 'A', null, '1');
insert into FW_DUTY (DUTY_ID, GROUP_ID, DUTY_NAME, STATUS, DESCRIPTION, DUTY_TYPE)
values (51300, 2, '预警查看', 'A', null, '1');
commit;
prompt 25 records loaded
prompt Loading FW_ACCOUNT_DUTY...
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51810, 49862, 49889);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51811, 49860, 49889);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51060, 49935, 51048);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51061, 49935, 51050);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51062, 49935, 51052);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51063, 49935, 51054);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51058, 49935, 51044);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51059, 49935, 51046);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51064, 49935, 51056);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51278, 49862, 49893);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51279, 49913, 49893);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51280, 49860, 49893);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51246, 49866, 49895);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51247, 49915, 49895);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51248, 49864, 49895);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51812, 49922, 49889);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51813, 49926, 49889);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51272, 51269, 51266);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51814, 49933, 49889);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51807, 49924, 50209);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51808, 49922, 50209);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51809, 49926, 50209);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53401, 49920, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53402, 51984, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53403, 49926, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53404, 49911, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53405, 51300, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53406, 52060, 53400);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51014, 50998, 51008);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51015, 49864, 51008);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51016, 49911, 51008);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51017, 49866, 51008);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51004, 49930, 49901);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51005, 49864, 49901);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51006, 49866, 49901);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52066, 49920, 51990);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52067, 49911, 51990);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52068, 51984, 51990);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52106, 49928, 52075);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52069, 52060, 51990);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53793, 3, 3);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53898, 49920, 51252);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53899, 49911, 51252);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53900, 52060, 51252);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53901, 49860, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53902, 49918, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53903, 49920, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53904, 49911, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53905, 49909, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53906, 49862, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (53907, 51984, 49897);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (21365, 1, 1);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (50182, 49935, 49907);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (50212, 49928, 49903);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (50213, 49862, 49903);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (50214, 49860, 49903);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (50562, 49926, 50561);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51449, 49864, 51257);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (51450, 49866, 51257);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52165, 49860, 49899);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52166, 49862, 49899);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52180, 49930, 49905);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52181, 49866, 49905);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52182, 52060, 49905);
insert into FW_ACCOUNT_DUTY (ACC_DUTY_ID, DUTY_ID, ACCT_ID)
values (52183, 49864, 49905);
commit;
prompt 65 records loaded
prompt Loading FW_ACTION_LOG...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50997, to_date('03-07-2013 11:24:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2705, 562, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51003, to_date('03-07-2013 11:27:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2806, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51007, to_date('03-07-2013 11:28:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2806, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51029, to_date('03-07-2013 13:45:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51030, to_date('03-07-2013 13:45:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51031, to_date('03-07-2013 13:45:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51032, to_date('03-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51033, to_date('03-07-2013 13:45:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51034, to_date('03-07-2013 13:45:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51035, to_date('03-07-2013 13:45:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51036, to_date('03-07-2013 13:45:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51037, to_date('03-07-2013 13:45:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51038, to_date('03-07-2013 13:45:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51039, to_date('03-07-2013 13:45:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51040, to_date('03-07-2013 13:46:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1224, 53126, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50976, to_date('28-06-2013 17:58:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.5.44', 53079, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50979, to_date('28-06-2013 18:05:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 4325, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51083, to_date('09-07-2013 10:12:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2039, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51084, to_date('09-07-2013 10:12:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2043, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51085, to_date('09-07-2013 10:12:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2040, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51086, to_date('09-07-2013 10:13:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2042, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51087, to_date('09-07-2013 10:13:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2044, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51088, to_date('09-07-2013 10:13:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2051, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51089, to_date('09-07-2013 10:13:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2051, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51090, to_date('09-07-2013 10:24:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2725, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51091, to_date('09-07-2013 10:24:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2725, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51092, to_date('09-07-2013 10:24:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2725, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51093, to_date('09-07-2013 10:24:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2725, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51094, to_date('09-07-2013 10:29:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2960, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51097, to_date('09-07-2013 10:30:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2978, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51480, to_date('10-07-2013 09:40:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1572, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51481, to_date('10-07-2013 09:40:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1572, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51482, to_date('10-07-2013 09:40:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2531, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51483, to_date('10-07-2013 09:40:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2531, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51484, to_date('10-07-2013 09:43:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3329, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51486, to_date('10-07-2013 09:45:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2546, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51487, to_date('10-07-2013 09:45:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3552, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51489, to_date('10-07-2013 09:46:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3552, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51490, to_date('10-07-2013 09:46:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2546, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51491, to_date('10-07-2013 09:46:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2546, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51492, to_date('10-07-2013 09:46:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2546, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51495, to_date('10-07-2013 09:48:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3565, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51497, to_date('10-07-2013 09:48:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3565, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51498, to_date('10-07-2013 09:49:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2556, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51505, to_date('10-07-2013 09:56:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2450, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51506, to_date('10-07-2013 09:58:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2475, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51509, to_date('10-07-2013 09:58:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2475, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51510, to_date('10-07-2013 09:58:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2475, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51511, to_date('10-07-2013 09:58:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2478, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51513, to_date('10-07-2013 09:58:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2478, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51514, to_date('10-07-2013 09:59:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2478, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51515, to_date('10-07-2013 10:00:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2483, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51517, to_date('10-07-2013 10:00:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2483, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51518, to_date('10-07-2013 10:00:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2483, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51524, to_date('10-07-2013 10:03:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3659, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51525, to_date('10-07-2013 10:03:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2505, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51527, to_date('10-07-2013 10:03:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2505, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51528, to_date('10-07-2013 10:04:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2509, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51529, to_date('10-07-2013 10:04:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3664, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51531, to_date('10-07-2013 10:04:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3664, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51532, to_date('10-07-2013 10:05:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51534, to_date('10-07-2013 10:05:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51535, to_date('10-07-2013 10:05:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51536, to_date('10-07-2013 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51537, to_date('10-07-2013 10:05:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51538, to_date('10-07-2013 10:05:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2512, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51539, to_date('10-07-2013 10:05:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3682, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51541, to_date('10-07-2013 10:05:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3682, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51542, to_date('10-07-2013 10:06:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51544, to_date('10-07-2013 10:06:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51545, to_date('10-07-2013 10:06:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51546, to_date('10-07-2013 10:06:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51548, to_date('10-07-2013 10:06:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51549, to_date('10-07-2013 10:06:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51550, to_date('10-07-2013 10:07:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2516, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51551, to_date('10-07-2013 10:09:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1782, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51552, to_date('10-07-2013 10:09:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1782, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51558, to_date('10-07-2013 10:10:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2631, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51559, to_date('10-07-2013 10:10:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51560, to_date('10-07-2013 10:10:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51561, to_date('10-07-2013 10:10:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51562, to_date('10-07-2013 10:10:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51563, to_date('10-07-2013 10:10:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51564, to_date('10-07-2013 10:11:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51565, to_date('10-07-2013 10:11:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51566, to_date('10-07-2013 10:11:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51567, to_date('10-07-2013 10:11:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51568, to_date('10-07-2013 10:11:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51569, to_date('10-07-2013 10:11:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51570, to_date('10-07-2013 10:11:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51571, to_date('10-07-2013 10:11:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51572, to_date('10-07-2013 10:11:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2632, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51573, to_date('10-07-2013 10:11:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1789, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51575, to_date('10-07-2013 10:13:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1791, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51576, to_date('10-07-2013 10:13:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2578, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51578, to_date('10-07-2013 10:13:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2578, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51579, to_date('10-07-2013 10:13:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1793, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51580, to_date('10-07-2013 10:14:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3735, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51582, to_date('10-07-2013 10:14:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3735, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51605, to_date('10-07-2013 10:16:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2597, 41828, 49893);
commit;
prompt 100 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51613, to_date('10-07-2013 10:17:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1798, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51630, to_date('10-07-2013 10:18:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2666, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51631, to_date('10-07-2013 10:19:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2666, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51632, to_date('10-07-2013 10:19:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2666, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51633, to_date('10-07-2013 10:19:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2666, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51692, to_date('10-07-2013 10:21:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2612, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51693, to_date('10-07-2013 10:21:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2612, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51806, to_date('10-07-2013 10:23:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1971, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51815, to_date('10-07-2013 10:24:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1973, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51816, to_date('10-07-2013 10:24:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51817, to_date('10-07-2013 10:24:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51818, to_date('10-07-2013 10:24:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51819, to_date('10-07-2013 10:24:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51820, to_date('10-07-2013 10:24:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51821, to_date('10-07-2013 10:24:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2679, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51822, to_date('10-07-2013 10:26:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2619, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51823, to_date('10-07-2013 10:26:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2619, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51824, to_date('10-07-2013 10:29:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2628, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51825, to_date('10-07-2013 10:29:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2630, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51826, to_date('10-07-2013 10:29:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2630, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51828, to_date('10-07-2013 10:30:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2632, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51829, to_date('10-07-2013 10:30:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2632, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51830, to_date('10-07-2013 10:30:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2632, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51832, to_date('10-07-2013 10:30:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2632, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51833, to_date('10-07-2013 10:32:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.171', 2582, 50995, 51266);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51834, to_date('10-07-2013 10:32:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2649, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51835, to_date('10-07-2013 10:33:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2649, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51836, to_date('10-07-2013 10:33:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2649, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51837, to_date('10-07-2013 10:33:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2656, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51839, to_date('10-07-2013 10:33:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2656, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51840, to_date('10-07-2013 10:35:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2019, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51842, to_date('10-07-2013 10:41:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3905, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51843, to_date('10-07-2013 10:41:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2700, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51845, to_date('10-07-2013 10:41:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2700, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51846, to_date('10-07-2013 10:41:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3908, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51847, to_date('10-07-2013 10:42:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2742, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51848, to_date('10-07-2013 10:42:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2742, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51849, to_date('10-07-2013 10:42:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2742, 53126, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51850, to_date('10-07-2013 10:43:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2041, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51851, to_date('10-07-2013 10:44:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2737, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51852, to_date('10-07-2013 10:44:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2737, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51853, to_date('10-07-2013 10:44:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2737, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51854, to_date('10-07-2013 10:45:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2744, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51855, to_date('10-07-2013 10:45:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2744, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51856, to_date('10-07-2013 10:45:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2744, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51857, to_date('10-07-2013 10:49:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2774, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51858, to_date('10-07-2013 10:49:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2774, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51859, to_date('10-07-2013 10:51:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2783, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51861, to_date('10-07-2013 10:51:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2783, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51862, to_date('10-07-2013 10:52:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2785, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51864, to_date('10-07-2013 10:52:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2785, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51865, to_date('10-07-2013 10:52:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2785, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51866, to_date('10-07-2013 10:52:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2785, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51867, to_date('10-07-2013 10:52:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2785, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51881, to_date('10-07-2013 11:02:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2063, 42739, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51882, to_date('10-07-2013 11:03:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2127, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51883, to_date('10-07-2013 11:04:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2145, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51885, to_date('10-07-2013 11:04:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2145, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50977, to_date('28-06-2013 18:00:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 4273, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50978, to_date('28-06-2013 18:04:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 4312, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51901, to_date('10-07-2013 11:12:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2834, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51902, to_date('10-07-2013 11:12:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2834, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51903, to_date('10-07-2013 11:12:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2206, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51905, to_date('10-07-2013 11:12:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2206, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51906, to_date('10-07-2013 11:12:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2836, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51907, to_date('10-07-2013 11:12:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2836, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51908, to_date('10-07-2013 11:13:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2838, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51909, to_date('10-07-2013 11:13:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2838, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51910, to_date('10-07-2013 11:13:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2212, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51911, to_date('10-07-2013 11:14:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2212, 53124, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51912, to_date('10-07-2013 11:14:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2212, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51913, to_date('10-07-2013 11:14:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2842, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51914, to_date('10-07-2013 11:15:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2216, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51916, to_date('10-07-2013 11:15:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2216, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51917, to_date('10-07-2013 11:15:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2844, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51918, to_date('10-07-2013 11:15:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2844, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51919, to_date('10-07-2013 11:15:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2844, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51920, to_date('10-07-2013 11:16:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2846, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51921, to_date('10-07-2013 11:16:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2846, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51922, to_date('10-07-2013 11:16:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2846, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51923, to_date('10-07-2013 11:16:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2848, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51924, to_date('10-07-2013 11:16:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2848, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51925, to_date('10-07-2013 11:17:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2221, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51926, to_date('10-07-2013 11:17:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2221, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51927, to_date('10-07-2013 11:17:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2221, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51928, to_date('10-07-2013 11:17:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2221, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51929, to_date('10-07-2013 11:17:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51930, to_date('10-07-2013 11:17:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51931, to_date('10-07-2013 11:17:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51932, to_date('10-07-2013 11:17:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51933, to_date('10-07-2013 11:18:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51934, to_date('10-07-2013 11:18:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51935, to_date('10-07-2013 11:18:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2859, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51936, to_date('10-07-2013 11:19:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2871, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51938, to_date('10-07-2013 11:19:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2871, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51939, to_date('10-07-2013 11:19:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2871, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51940, to_date('10-07-2013 11:19:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2871, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51941, to_date('10-07-2013 11:19:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2871, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51942, to_date('10-07-2013 11:20:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2874, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51943, to_date('10-07-2013 11:20:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2874, 41828, 49893);
commit;
prompt 200 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51944, to_date('10-07-2013 11:20:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2874, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51945, to_date('10-07-2013 11:20:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2874, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51946, to_date('10-07-2013 11:20:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2874, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51947, to_date('10-07-2013 11:21:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2881, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51949, to_date('10-07-2013 11:21:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2881, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51950, to_date('10-07-2013 11:23:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2885, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51952, to_date('10-07-2013 11:23:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2885, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51953, to_date('10-07-2013 11:31:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2897, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51954, to_date('10-07-2013 11:31:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2897, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51955, to_date('10-07-2013 11:31:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2897, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51956, to_date('10-07-2013 11:32:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2912, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51957, to_date('10-07-2013 11:33:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2912, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51958, to_date('10-07-2013 11:33:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2912, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51959, to_date('10-07-2013 11:38:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2931, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51960, to_date('10-07-2013 11:38:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2931, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51962, to_date('10-07-2013 11:38:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2931, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51963, to_date('10-07-2013 11:40:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2934, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51965, to_date('10-07-2013 11:40:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2934, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51966, to_date('10-07-2013 11:41:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2936, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51968, to_date('10-07-2013 11:41:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2936, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51969, to_date('10-07-2013 11:43:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2940, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51971, to_date('10-07-2013 11:43:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2940, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51972, to_date('10-07-2013 11:45:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2943, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51974, to_date('10-07-2013 11:45:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2943, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51975, to_date('10-07-2013 11:46:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4368, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51976, to_date('10-07-2013 11:47:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2951, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51978, to_date('10-07-2013 11:47:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2951, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51979, to_date('10-07-2013 11:47:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4376, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51980, to_date('10-07-2013 11:47:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4376, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51982, to_date('10-07-2013 11:47:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4376, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51983, to_date('10-07-2013 11:48:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3108, 562, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51985, to_date('10-07-2013 11:48:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2968, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51987, to_date('10-07-2013 11:48:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2968, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51988, to_date('10-07-2013 11:48:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3109, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51989, to_date('10-07-2013 11:48:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3109, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51991, to_date('10-07-2013 11:49:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3109, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51992, to_date('10-07-2013 11:50:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3120, 549, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51995, to_date('10-07-2013 11:51:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2978, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51996, to_date('10-07-2013 11:51:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2978, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51997, to_date('10-07-2013 11:52:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2981, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51999, to_date('10-07-2013 11:52:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2981, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52000, to_date('10-07-2013 11:54:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2988, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52002, to_date('10-07-2013 11:54:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2988, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52003, to_date('10-07-2013 11:58:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4393, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52005, to_date('10-07-2013 11:58:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4393, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52006, to_date('10-07-2013 11:59:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4399, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52007, to_date('10-07-2013 12:00:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4399, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52009, to_date('10-07-2013 12:00:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4399, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52010, to_date('10-07-2013 13:38:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1231, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52011, to_date('10-07-2013 13:40:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1251, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52013, to_date('10-07-2013 13:40:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1251, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52014, to_date('10-07-2013 13:41:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1253, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52016, to_date('10-07-2013 13:41:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1253, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52017, to_date('10-07-2013 13:43:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1262, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52018, to_date('10-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1262, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52020, to_date('10-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1262, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52021, to_date('10-07-2013 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1267, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52023, to_date('10-07-2013 13:47:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1267, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52024, to_date('10-07-2013 13:49:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1275, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52026, to_date('10-07-2013 13:49:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1275, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52027, to_date('10-07-2013 13:49:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1275, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52028, to_date('10-07-2013 13:49:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1275, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52029, to_date('10-07-2013 13:49:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1275, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52030, to_date('10-07-2013 13:50:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1278, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52031, to_date('10-07-2013 13:51:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1279, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52032, to_date('10-07-2013 13:51:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1279, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52033, to_date('10-07-2013 13:51:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1279, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52034, to_date('10-07-2013 13:52:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1280, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52035, to_date('10-07-2013 13:55:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1285, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52036, to_date('10-07-2013 13:56:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1288, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52037, to_date('10-07-2013 13:56:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1288, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52038, to_date('10-07-2013 14:04:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1339, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52039, to_date('10-07-2013 14:12:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2290, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52041, to_date('10-07-2013 14:12:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2290, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52042, to_date('10-07-2013 14:13:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2297, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52044, to_date('10-07-2013 14:13:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2297, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52045, to_date('10-07-2013 14:14:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2304, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52047, to_date('10-07-2013 14:14:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2304, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52048, to_date('10-07-2013 14:16:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2308, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52049, to_date('10-07-2013 14:16:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2308, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52051, to_date('10-07-2013 14:16:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2308, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52052, to_date('10-07-2013 14:16:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2308, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52053, to_date('10-07-2013 14:17:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2310, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52054, to_date('10-07-2013 14:17:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2310, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52055, to_date('10-07-2013 14:17:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2310, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52059, to_date('10-07-2013 14:52:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1654, 562, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52061, to_date('10-07-2013 14:52:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1654, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52070, to_date('10-07-2013 14:57:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 1632, 41520, 51990);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52071, to_date('10-07-2013 14:58:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 1632, 41520, 51990);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52072, to_date('10-07-2013 14:58:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 1632, 41520, 51990);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52073, to_date('10-07-2013 14:58:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 1632, 41520, 51990);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52074, to_date('10-07-2013 15:01:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1770, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52094, to_date('10-07-2013 15:05:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1935, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52095, to_date('10-07-2013 15:05:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1935, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52107, to_date('10-07-2013 15:06:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1935, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52108, to_date('10-07-2013 15:06:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1935, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52109, to_date('10-07-2013 15:06:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1935, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52110, to_date('10-07-2013 15:21:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1836, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52111, to_date('10-07-2013 15:24:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1905, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52112, to_date('10-07-2013 15:28:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1874, 43482, 52075);
commit;
prompt 300 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52114, to_date('10-07-2013 15:28:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1874, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52115, to_date('10-07-2013 15:32:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1900, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52116, to_date('10-07-2013 15:32:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1901, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52118, to_date('10-07-2013 15:33:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1902, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52120, to_date('10-07-2013 15:33:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1902, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52121, to_date('10-07-2013 15:33:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1902, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52122, to_date('10-07-2013 15:34:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1903, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52124, to_date('10-07-2013 15:34:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1903, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52126, to_date('10-07-2013 15:34:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1903, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52128, to_date('10-07-2013 15:35:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1904, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52129, to_date('10-07-2013 15:35:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1904, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52131, to_date('10-07-2013 15:36:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1905, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52133, to_date('10-07-2013 15:36:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1905, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52134, to_date('10-07-2013 15:37:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1911, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52135, to_date('10-07-2013 15:37:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1911, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52136, to_date('10-07-2013 15:37:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1911, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52137, to_date('10-07-2013 15:38:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1913, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52139, to_date('10-07-2013 15:39:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1913, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52140, to_date('10-07-2013 15:39:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1913, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52141, to_date('10-07-2013 15:40:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1918, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52142, to_date('10-07-2013 15:46:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2076, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52143, to_date('10-07-2013 15:47:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2077, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52144, to_date('10-07-2013 15:48:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2849, 43482, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52145, to_date('10-07-2013 15:48:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2865, 43486, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52146, to_date('10-07-2013 15:48:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2866, 43482, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52147, to_date('10-07-2013 15:48:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2847, 43486, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52148, to_date('10-07-2013 15:48:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2850, 43482, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52149, to_date('10-07-2013 15:48:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2080, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52151, to_date('10-07-2013 15:48:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2080, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52152, to_date('10-07-2013 15:49:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2081, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52153, to_date('10-07-2013 15:50:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2084, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52155, to_date('10-07-2013 15:50:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2084, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52156, to_date('10-07-2013 15:50:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2084, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52157, to_date('10-07-2013 15:51:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2085, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52159, to_date('10-07-2013 15:51:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2085, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52160, to_date('10-07-2013 15:52:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2085, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52161, to_date('10-07-2013 15:53:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2088, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52163, to_date('10-07-2013 15:53:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2088, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52164, to_date('10-07-2013 16:03:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50313, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52167, to_date('10-07-2013 16:05:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50340, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52168, to_date('10-07-2013 16:06:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2096, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52169, to_date('10-07-2013 16:06:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2175, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52170, to_date('10-07-2013 16:06:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2175, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52171, to_date('10-07-2013 16:06:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2175, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52172, to_date('10-07-2013 16:08:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2160, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52174, to_date('10-07-2013 16:08:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2160, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52305, to_date('10-07-2013 16:13:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4989, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52306, to_date('10-07-2013 16:13:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4989, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52307, to_date('10-07-2013 16:13:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4989, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52308, to_date('10-07-2013 16:13:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4989, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52310, to_date('10-07-2013 16:15:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1129, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52340, to_date('10-07-2013 16:17:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52341, to_date('10-07-2013 16:18:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2853, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52342, to_date('10-07-2013 16:18:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52343, to_date('10-07-2013 16:18:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52344, to_date('10-07-2013 16:18:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52349, to_date('10-07-2013 16:18:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52350, to_date('10-07-2013 16:18:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2853, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52351, to_date('10-07-2013 16:18:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2853, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52352, to_date('10-07-2013 16:18:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2853, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52353, to_date('10-07-2013 16:18:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52354, to_date('10-07-2013 16:18:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52355, to_date('10-07-2013 16:18:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2854, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52356, to_date('10-07-2013 16:18:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1129, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52357, to_date('10-07-2013 16:18:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1129, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52358, to_date('10-07-2013 16:19:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2878, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52359, to_date('10-07-2013 16:19:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 2878, 43482, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52360, to_date('10-07-2013 16:20:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1129, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52362, to_date('10-07-2013 16:28:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1178, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52363, to_date('10-07-2013 16:34:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50516, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52364, to_date('10-07-2013 16:36:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 42742, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52365, to_date('10-07-2013 16:36:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52366, to_date('10-07-2013 16:36:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52367, to_date('10-07-2013 16:36:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52368, to_date('10-07-2013 16:37:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52369, to_date('10-07-2013 16:37:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52370, to_date('10-07-2013 16:37:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52371, to_date('10-07-2013 16:37:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.1.126', 50534, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52372, to_date('10-07-2013 16:43:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 51870, 45615, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52373, to_date('10-07-2013 16:49:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 51941, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52374, to_date('10-07-2013 16:49:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 51941, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52375, to_date('10-07-2013 16:49:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 51941, 41257, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52376, to_date('10-07-2013 16:50:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2405, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52377, to_date('10-07-2013 16:50:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2404, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52378, to_date('10-07-2013 16:50:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2409, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52381, to_date('10-07-2013 16:50:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2404, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52382, to_date('10-07-2013 16:51:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2403, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52383, to_date('10-07-2013 16:51:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2411, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52396, to_date('11-07-2013 10:03:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3779, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52397, to_date('11-07-2013 10:03:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3772, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52398, to_date('11-07-2013 10:04:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3793, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52399, to_date('11-07-2013 10:32:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1907, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52413, to_date('11-07-2013 11:09:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2133, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52414, to_date('11-07-2013 11:09:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2133, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52415, to_date('11-07-2013 11:10:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2141, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52418, to_date('11-07-2013 11:10:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2141, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52419, to_date('11-07-2013 11:10:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2148, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52421, to_date('11-07-2013 11:10:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2148, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52422, to_date('11-07-2013 11:11:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2154, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52424, to_date('11-07-2013 11:11:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2154, 41352, 49899);
commit;
prompt 400 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52425, to_date('11-07-2013 11:12:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2156, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52427, to_date('11-07-2013 11:12:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2156, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52428, to_date('11-07-2013 11:12:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2158, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52430, to_date('11-07-2013 11:12:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2158, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52431, to_date('11-07-2013 11:13:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2159, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52433, to_date('11-07-2013 11:13:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2159, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52434, to_date('11-07-2013 11:45:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2057, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52435, to_date('11-07-2013 11:46:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2057, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52436, to_date('11-07-2013 11:47:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2280, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52437, to_date('11-07-2013 11:48:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2290, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52438, to_date('11-07-2013 11:50:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2296, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52439, to_date('11-07-2013 11:50:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2297, 28192, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52440, to_date('11-07-2013 12:52:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2494, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52441, to_date('11-07-2013 12:54:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2501, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52442, to_date('11-07-2013 12:55:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2501, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52443, to_date('11-07-2013 12:55:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2501, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52444, to_date('11-07-2013 12:55:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2501, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52445, to_date('11-07-2013 12:56:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2506, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52446, to_date('11-07-2013 12:56:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2506, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52447, to_date('11-07-2013 12:56:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2508, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52448, to_date('11-07-2013 12:57:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2511, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52449, to_date('11-07-2013 12:57:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2511, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52450, to_date('11-07-2013 12:58:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2513, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52451, to_date('11-07-2013 12:58:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2515, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52452, to_date('11-07-2013 13:00:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2517, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52453, to_date('11-07-2013 13:00:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2519, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52454, to_date('11-07-2013 13:01:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2520, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52455, to_date('11-07-2013 13:01:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2522, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52456, to_date('11-07-2013 13:02:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2523, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52457, to_date('11-07-2013 13:42:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3295, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52458, to_date('11-07-2013 13:43:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1259, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52459, to_date('11-07-2013 13:44:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1273, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52460, to_date('11-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1284, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52461, to_date('11-07-2013 13:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1284, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52462, to_date('11-07-2013 13:46:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1284, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52463, to_date('11-07-2013 13:46:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1290, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52464, to_date('11-07-2013 13:46:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1290, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52465, to_date('11-07-2013 13:48:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52466, to_date('11-07-2013 13:48:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52467, to_date('11-07-2013 13:48:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52468, to_date('11-07-2013 13:48:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52469, to_date('11-07-2013 13:48:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52470, to_date('11-07-2013 13:48:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52471, to_date('11-07-2013 13:49:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52472, to_date('11-07-2013 13:49:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52473, to_date('11-07-2013 13:49:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52474, to_date('11-07-2013 13:49:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52475, to_date('11-07-2013 13:49:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52476, to_date('11-07-2013 13:49:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52477, to_date('11-07-2013 13:49:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52478, to_date('11-07-2013 13:49:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52479, to_date('11-07-2013 13:49:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52480, to_date('11-07-2013 13:49:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52481, to_date('11-07-2013 13:49:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52482, to_date('11-07-2013 13:49:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52483, to_date('11-07-2013 13:49:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52484, to_date('11-07-2013 13:49:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52485, to_date('11-07-2013 13:49:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52486, to_date('11-07-2013 13:50:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52487, to_date('11-07-2013 13:50:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52488, to_date('11-07-2013 13:50:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52489, to_date('11-07-2013 13:50:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52490, to_date('11-07-2013 13:50:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52491, to_date('11-07-2013 13:50:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52492, to_date('11-07-2013 13:50:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52493, to_date('11-07-2013 13:50:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52494, to_date('11-07-2013 13:50:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52495, to_date('11-07-2013 13:50:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52496, to_date('11-07-2013 13:50:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52497, to_date('11-07-2013 13:50:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51299, to_date('09-07-2013 17:59:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4970, 562, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52138, to_date('10-07-2013 15:39:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.82', 1913, 43486, 52075);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52498, to_date('11-07-2013 13:50:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52499, to_date('11-07-2013 13:50:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52500, to_date('11-07-2013 13:50:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52501, to_date('11-07-2013 13:50:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53100, to_date('16-07-2013 19:51:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51018, to_date('03-07-2013 11:37:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3654, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51019, to_date('03-07-2013 11:37:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3654, 45621, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51065, to_date('03-07-2013 14:06:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2655, 41257, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51066, to_date('03-07-2013 14:06:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2655, 41257, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51067, to_date('03-07-2013 14:06:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2655, 41257, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51098, to_date('09-07-2013 10:41:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2032, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51099, to_date('09-07-2013 10:41:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2051, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51100, to_date('09-07-2013 10:42:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2052, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51101, to_date('09-07-2013 10:43:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3137, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51102, to_date('09-07-2013 10:43:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3137, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51103, to_date('09-07-2013 10:43:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2055, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51104, to_date('09-07-2013 10:43:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2055, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51105, to_date('09-07-2013 10:49:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51106, to_date('09-07-2013 10:50:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51107, to_date('09-07-2013 10:50:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3244, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51108, to_date('09-07-2013 10:50:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3245, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51109, to_date('09-07-2013 10:50:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3244, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51110, to_date('09-07-2013 10:51:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51111, to_date('09-07-2013 10:51:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51112, to_date('09-07-2013 10:51:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3244, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50974, to_date('28-06-2013 17:55:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.5.44', 53066, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (50975, to_date('28-06-2013 17:56:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.5.44', 53074, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51113, to_date('09-07-2013 10:51:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
commit;
prompt 500 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51114, to_date('09-07-2013 10:51:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51115, to_date('09-07-2013 10:51:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51116, to_date('09-07-2013 10:51:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51117, to_date('09-07-2013 10:51:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3244, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51118, to_date('09-07-2013 10:51:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51119, to_date('09-07-2013 10:51:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3251, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51120, to_date('09-07-2013 10:51:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3240, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51132, to_date('09-07-2013 12:42:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2310, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51133, to_date('09-07-2013 12:45:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2313, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51135, to_date('09-07-2013 12:45:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2313, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51142, to_date('09-07-2013 12:55:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51143, to_date('09-07-2013 12:55:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51144, to_date('09-07-2013 12:56:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51145, to_date('09-07-2013 12:56:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51146, to_date('09-07-2013 12:56:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51147, to_date('09-07-2013 12:56:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51148, to_date('09-07-2013 12:56:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51149, to_date('09-07-2013 12:56:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51150, to_date('09-07-2013 12:56:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51151, to_date('09-07-2013 12:56:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51152, to_date('09-07-2013 12:56:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51153, to_date('09-07-2013 12:56:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51154, to_date('09-07-2013 12:56:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51155, to_date('09-07-2013 12:56:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51156, to_date('09-07-2013 12:57:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51157, to_date('09-07-2013 12:57:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51158, to_date('09-07-2013 12:57:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51159, to_date('09-07-2013 12:57:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51160, to_date('09-07-2013 12:57:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51161, to_date('09-07-2013 12:57:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51162, to_date('09-07-2013 12:57:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51163, to_date('09-07-2013 12:57:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51164, to_date('09-07-2013 12:57:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51165, to_date('09-07-2013 12:57:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51166, to_date('09-07-2013 12:57:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51167, to_date('09-07-2013 12:57:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51168, to_date('09-07-2013 12:57:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51169, to_date('09-07-2013 12:57:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51170, to_date('09-07-2013 12:57:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2367, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51171, to_date('09-07-2013 13:01:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2394, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51172, to_date('09-07-2013 13:03:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2398, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51174, to_date('09-07-2013 13:03:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2398, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51175, to_date('09-07-2013 13:13:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51176, to_date('09-07-2013 13:13:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51177, to_date('09-07-2013 13:13:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51178, to_date('09-07-2013 13:13:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51179, to_date('09-07-2013 13:13:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51180, to_date('09-07-2013 13:14:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2515, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51181, to_date('09-07-2013 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2525, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51184, to_date('09-07-2013 13:15:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2525, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51185, to_date('09-07-2013 13:15:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2527, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51187, to_date('09-07-2013 13:15:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2527, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51188, to_date('09-07-2013 13:16:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2529, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51190, to_date('09-07-2013 13:16:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2529, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51191, to_date('09-07-2013 13:17:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2531, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51193, to_date('09-07-2013 13:17:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2531, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51194, to_date('09-07-2013 13:18:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2533, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51196, to_date('09-07-2013 13:18:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2533, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51197, to_date('09-07-2013 13:18:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2535, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51199, to_date('09-07-2013 13:18:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2535, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51200, to_date('09-07-2013 13:19:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2539, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51201, to_date('09-07-2013 13:19:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2539, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51202, to_date('09-07-2013 13:20:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2542, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51205, to_date('09-07-2013 16:36:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1469, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51206, to_date('09-07-2013 16:44:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1606, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51208, to_date('09-07-2013 16:44:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1606, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51209, to_date('09-07-2013 16:46:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4401, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51210, to_date('09-07-2013 16:46:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4401, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51211, to_date('09-07-2013 16:46:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4401, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51212, to_date('09-07-2013 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1620, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51214, to_date('09-07-2013 16:46:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1620, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51215, to_date('09-07-2013 16:48:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1635, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51217, to_date('09-07-2013 16:48:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1635, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51218, to_date('09-07-2013 16:50:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1642, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51220, to_date('09-07-2013 16:50:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1642, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51221, to_date('09-07-2013 16:51:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1643, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51222, to_date('09-07-2013 16:52:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1645, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51223, to_date('09-07-2013 16:52:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1647, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51225, to_date('09-07-2013 16:52:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1647, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51226, to_date('09-07-2013 16:52:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1647, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51227, to_date('09-07-2013 16:54:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1649, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51229, to_date('09-07-2013 16:54:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1649, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51230, to_date('09-07-2013 16:55:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1653, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51231, to_date('09-07-2013 16:55:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4552, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51232, to_date('09-07-2013 16:55:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4552, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51233, to_date('09-07-2013 16:56:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1669, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51235, to_date('09-07-2013 16:56:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1669, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51236, to_date('09-07-2013 16:58:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1678, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51238, to_date('09-07-2013 16:58:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1678, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51239, to_date('09-07-2013 17:00:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 4964, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51240, to_date('09-07-2013 17:08:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1707, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51242, to_date('09-07-2013 17:08:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1707, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51281, to_date('09-07-2013 17:23:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4535, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51282, to_date('09-07-2013 17:25:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4665, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51283, to_date('09-07-2013 17:33:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4740, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51395, to_date('09-07-2013 18:02:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4990, 41352, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51396, to_date('09-07-2013 18:02:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4990, 44773, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51448, to_date('09-07-2013 18:06:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1056, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51452, to_date('10-07-2013 08:57:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1179, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51453, to_date('10-07-2013 08:57:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1179, 43482, 49903);
commit;
prompt 600 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51454, to_date('10-07-2013 08:58:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51455, to_date('10-07-2013 08:58:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51456, to_date('10-07-2013 08:58:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51457, to_date('10-07-2013 08:58:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51458, to_date('10-07-2013 08:58:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51459, to_date('10-07-2013 08:58:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51460, to_date('10-07-2013 08:58:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51461, to_date('10-07-2013 08:58:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51462, to_date('10-07-2013 08:58:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1265, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51463, to_date('10-07-2013 09:00:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1355, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51464, to_date('10-07-2013 09:00:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1355, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51465, to_date('10-07-2013 09:00:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1355, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51466, to_date('10-07-2013 09:01:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1362, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51467, to_date('10-07-2013 09:01:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1362, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51468, to_date('10-07-2013 09:01:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1362, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51469, to_date('10-07-2013 09:02:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1368, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51470, to_date('10-07-2013 09:02:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1368, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51471, to_date('10-07-2013 09:03:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1377, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51472, to_date('10-07-2013 09:03:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1377, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51473, to_date('10-07-2013 09:08:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2274, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51474, to_date('10-07-2013 09:22:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1527, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51475, to_date('10-07-2013 09:22:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1527, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51476, to_date('10-07-2013 09:25:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1557, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51477, to_date('10-07-2013 09:34:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2333, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51886, to_date('10-07-2013 11:04:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2145, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51887, to_date('10-07-2013 11:05:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2148, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51889, to_date('10-07-2013 11:05:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2148, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51890, to_date('10-07-2013 11:07:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2159, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51892, to_date('10-07-2013 11:07:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2159, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51893, to_date('10-07-2013 11:08:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2165, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51895, to_date('10-07-2013 11:08:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2165, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51896, to_date('10-07-2013 11:08:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2168, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51898, to_date('10-07-2013 11:08:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2168, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51899, to_date('10-07-2013 11:09:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2170, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51900, to_date('10-07-2013 11:11:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2833, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51047, to_date('03-07-2013 13:51:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1627, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51049, to_date('03-07-2013 13:51:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1627, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51051, to_date('03-07-2013 13:52:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1721, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51053, to_date('03-07-2013 13:53:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1721, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51055, to_date('03-07-2013 13:53:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1721, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51057, to_date('03-07-2013 13:54:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1721, 562, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51203, to_date('09-07-2013 16:27:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.246', 56541, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51204, to_date('09-07-2013 16:27:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.246', 56541, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51251, to_date('09-07-2013 17:12:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4415, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51256, to_date('09-07-2013 17:14:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4437, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51265, to_date('09-07-2013 17:17:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4475, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51268, to_date('09-07-2013 17:18:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4475, 562, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51043, to_date('03-07-2013 13:50:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1574, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51045, to_date('03-07-2013 13:51:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1603, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51292, to_date('09-07-2013 17:47:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4850, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51293, to_date('09-07-2013 17:47:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4852, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51294, to_date('09-07-2013 17:47:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4851, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51295, to_date('09-07-2013 17:47:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4853, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51296, to_date('09-07-2013 17:47:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4851, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51297, to_date('09-07-2013 17:47:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4853, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (51298, to_date('09-07-2013 17:48:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4869, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52502, to_date('11-07-2013 13:51:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52503, to_date('11-07-2013 13:51:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52504, to_date('11-07-2013 13:51:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52505, to_date('11-07-2013 13:51:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52506, to_date('11-07-2013 13:51:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52507, to_date('11-07-2013 13:51:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52508, to_date('11-07-2013 13:51:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52509, to_date('11-07-2013 13:51:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52510, to_date('11-07-2013 13:51:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52511, to_date('11-07-2013 13:51:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52512, to_date('11-07-2013 13:51:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52513, to_date('11-07-2013 13:51:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52514, to_date('11-07-2013 13:51:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52515, to_date('11-07-2013 13:51:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52516, to_date('11-07-2013 13:52:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52517, to_date('11-07-2013 13:52:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52518, to_date('11-07-2013 13:52:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52519, to_date('11-07-2013 13:52:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52520, to_date('11-07-2013 13:52:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52521, to_date('11-07-2013 13:52:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52522, to_date('11-07-2013 13:52:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52523, to_date('11-07-2013 13:52:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52524, to_date('11-07-2013 13:52:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1295, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52525, to_date('11-07-2013 13:52:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52526, to_date('11-07-2013 13:52:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52527, to_date('11-07-2013 13:52:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52528, to_date('11-07-2013 13:52:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52529, to_date('11-07-2013 13:52:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52530, to_date('11-07-2013 13:52:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52531, to_date('11-07-2013 13:52:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52532, to_date('11-07-2013 13:52:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52533, to_date('11-07-2013 13:52:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52534, to_date('11-07-2013 13:52:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52535, to_date('11-07-2013 13:52:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52536, to_date('11-07-2013 13:52:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52537, to_date('11-07-2013 13:52:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52538, to_date('11-07-2013 13:53:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52539, to_date('11-07-2013 13:53:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52540, to_date('11-07-2013 13:53:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52541, to_date('11-07-2013 13:53:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52542, to_date('11-07-2013 13:53:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52543, to_date('11-07-2013 13:53:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52544, to_date('11-07-2013 13:53:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52545, to_date('11-07-2013 13:53:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
commit;
prompt 700 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52546, to_date('11-07-2013 13:53:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52547, to_date('11-07-2013 13:54:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52548, to_date('11-07-2013 13:54:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52549, to_date('11-07-2013 13:54:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52550, to_date('11-07-2013 13:54:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52551, to_date('11-07-2013 13:54:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52552, to_date('11-07-2013 13:54:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52553, to_date('11-07-2013 13:54:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52554, to_date('11-07-2013 13:54:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52555, to_date('11-07-2013 13:54:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52556, to_date('11-07-2013 13:54:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52557, to_date('11-07-2013 13:54:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52558, to_date('11-07-2013 13:54:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52559, to_date('11-07-2013 13:54:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52560, to_date('11-07-2013 13:54:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52561, to_date('11-07-2013 13:54:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52562, to_date('11-07-2013 13:54:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52563, to_date('11-07-2013 13:55:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52564, to_date('11-07-2013 13:55:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52565, to_date('11-07-2013 13:55:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52566, to_date('11-07-2013 13:55:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52567, to_date('11-07-2013 13:55:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52568, to_date('11-07-2013 13:55:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52569, to_date('11-07-2013 13:55:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52570, to_date('11-07-2013 13:55:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52571, to_date('11-07-2013 13:55:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52572, to_date('11-07-2013 13:55:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52573, to_date('11-07-2013 13:55:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52574, to_date('11-07-2013 13:56:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52575, to_date('11-07-2013 13:56:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52576, to_date('11-07-2013 13:56:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52577, to_date('11-07-2013 13:56:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52578, to_date('11-07-2013 13:56:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52579, to_date('11-07-2013 13:56:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52580, to_date('11-07-2013 13:56:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52581, to_date('11-07-2013 13:56:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52582, to_date('11-07-2013 13:56:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52583, to_date('11-07-2013 13:56:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1319, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52584, to_date('11-07-2013 13:56:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52585, to_date('11-07-2013 13:56:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52586, to_date('11-07-2013 13:56:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52587, to_date('11-07-2013 13:56:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52588, to_date('11-07-2013 13:56:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52589, to_date('11-07-2013 13:56:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52590, to_date('11-07-2013 13:56:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52591, to_date('11-07-2013 13:56:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52592, to_date('11-07-2013 13:56:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52593, to_date('11-07-2013 13:56:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52594, to_date('11-07-2013 13:56:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52595, to_date('11-07-2013 13:56:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52596, to_date('11-07-2013 13:57:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52597, to_date('11-07-2013 13:57:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52598, to_date('11-07-2013 13:57:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52599, to_date('11-07-2013 13:57:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52600, to_date('11-07-2013 13:57:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52601, to_date('11-07-2013 13:57:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52602, to_date('11-07-2013 13:57:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52603, to_date('11-07-2013 13:57:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52604, to_date('11-07-2013 13:57:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52605, to_date('11-07-2013 13:57:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52606, to_date('11-07-2013 13:57:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52607, to_date('11-07-2013 13:57:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52608, to_date('11-07-2013 13:57:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52609, to_date('11-07-2013 13:57:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52610, to_date('11-07-2013 13:57:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52611, to_date('11-07-2013 13:57:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52612, to_date('11-07-2013 13:57:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52613, to_date('11-07-2013 13:57:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52614, to_date('11-07-2013 13:57:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52615, to_date('11-07-2013 13:57:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52616, to_date('11-07-2013 13:57:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52617, to_date('11-07-2013 13:57:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52618, to_date('11-07-2013 13:57:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52619, to_date('11-07-2013 13:57:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52620, to_date('11-07-2013 13:57:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52621, to_date('11-07-2013 13:57:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52622, to_date('11-07-2013 13:57:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52623, to_date('11-07-2013 13:57:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52624, to_date('11-07-2013 13:58:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52625, to_date('11-07-2013 13:58:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52626, to_date('11-07-2013 13:58:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52627, to_date('11-07-2013 13:58:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52628, to_date('11-07-2013 13:58:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52629, to_date('11-07-2013 13:58:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52630, to_date('11-07-2013 13:58:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52631, to_date('11-07-2013 13:58:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52632, to_date('11-07-2013 13:58:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52633, to_date('11-07-2013 13:58:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52634, to_date('11-07-2013 13:58:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52635, to_date('11-07-2013 13:58:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52636, to_date('11-07-2013 13:58:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52637, to_date('11-07-2013 13:58:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52638, to_date('11-07-2013 13:58:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52782, to_date('12-07-2013 13:51:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3684, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52785, to_date('12-07-2013 13:51:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3685, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52786, to_date('12-07-2013 13:51:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3685, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52787, to_date('12-07-2013 13:51:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3684, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52788, to_date('12-07-2013 13:51:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3676, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52789, to_date('12-07-2013 13:52:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3685, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52790, to_date('12-07-2013 13:52:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3687, 45621, 49903);
commit;
prompt 800 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52792, to_date('12-07-2013 13:52:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3686, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52793, to_date('12-07-2013 13:52:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3685, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52794, to_date('12-07-2013 13:52:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3688, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52795, to_date('12-07-2013 13:52:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3690, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52796, to_date('12-07-2013 13:52:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3688, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52797, to_date('12-07-2013 13:52:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3688, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52798, to_date('12-07-2013 13:52:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3689, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52799, to_date('12-07-2013 13:53:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3688, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52800, to_date('12-07-2013 13:53:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3685, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52801, to_date('12-07-2013 13:53:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3689, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52802, to_date('12-07-2013 13:53:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3691, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52803, to_date('12-07-2013 13:53:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3689, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52991, to_date('16-07-2013 11:43:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4101, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52993, to_date('16-07-2013 11:44:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4101, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53333, to_date('19-07-2013 14:45:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1996, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53334, to_date('19-07-2013 14:45:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1996, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53335, to_date('19-07-2013 14:45:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1996, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53336, to_date('19-07-2013 14:46:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2001, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53339, to_date('19-07-2013 14:46:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2001, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53340, to_date('19-07-2013 14:47:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2002, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53342, to_date('19-07-2013 14:47:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2002, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53343, to_date('19-07-2013 14:47:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2004, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53345, to_date('19-07-2013 14:47:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2004, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53346, to_date('19-07-2013 14:48:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2005, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53348, to_date('19-07-2013 14:48:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2005, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53349, to_date('19-07-2013 14:49:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2006, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53351, to_date('19-07-2013 14:49:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2006, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53352, to_date('19-07-2013 14:50:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53354, to_date('19-07-2013 14:50:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53355, to_date('19-07-2013 14:50:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53356, to_date('19-07-2013 14:50:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53357, to_date('19-07-2013 14:51:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53358, to_date('19-07-2013 14:51:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2007, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53359, to_date('19-07-2013 14:52:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1312, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53360, to_date('19-07-2013 14:53:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1333, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53361, to_date('19-07-2013 15:00:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2043, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53362, to_date('19-07-2013 15:00:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2043, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53365, to_date('19-07-2013 15:01:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2046, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53366, to_date('19-07-2013 15:02:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 42742, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53367, to_date('19-07-2013 15:02:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53368, to_date('19-07-2013 15:02:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53370, to_date('19-07-2013 15:02:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53371, to_date('19-07-2013 15:02:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53372, to_date('19-07-2013 15:02:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53373, to_date('19-07-2013 15:03:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2048, 45621, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53397, to_date('25-07-2013 16:21:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.24', 1055, 27245, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53399, to_date('25-07-2013 16:22:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.24', 1060, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53423, to_date('26-07-2013 10:44:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2166, 27245, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53425, to_date('26-07-2013 10:50:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2331, 549, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53426, to_date('26-07-2013 10:50:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2331, 549, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53427, to_date('26-07-2013 10:53:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2429, 562, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53429, to_date('26-07-2013 10:53:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2429, 549, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53432, to_date('26-07-2013 10:54:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2429, 549, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53916, to_date('05-08-2013 16:00:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53917, to_date('05-08-2013 16:00:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53918, to_date('05-08-2013 16:01:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 55244, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53919, to_date('05-08-2013 16:01:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 55244, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53920, to_date('05-08-2013 16:01:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 55244, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53921, to_date('05-08-2013 16:01:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 55244, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53922, to_date('05-08-2013 16:03:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53923, to_date('05-08-2013 16:03:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53924, to_date('05-08-2013 16:03:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53925, to_date('05-08-2013 16:03:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53926, to_date('05-08-2013 16:03:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53927, to_date('05-08-2013 16:03:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53928, to_date('05-08-2013 16:03:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53929, to_date('05-08-2013 16:03:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53930, to_date('05-08-2013 16:03:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53931, to_date('05-08-2013 16:03:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53932, to_date('05-08-2013 16:03:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60239, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53933, to_date('05-08-2013 16:04:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53934, to_date('05-08-2013 16:04:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53935, to_date('05-08-2013 16:04:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53936, to_date('05-08-2013 16:04:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53937, to_date('05-08-2013 16:04:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53938, to_date('05-08-2013 16:04:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53939, to_date('05-08-2013 16:04:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53940, to_date('05-08-2013 16:04:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60240, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53941, to_date('05-08-2013 16:08:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4955, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52766, to_date('12-07-2013 10:25:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2223, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52804, to_date('12-07-2013 14:22:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1382, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52805, to_date('12-07-2013 14:22:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52806, to_date('12-07-2013 14:22:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52807, to_date('12-07-2013 14:22:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52808, to_date('12-07-2013 14:22:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52809, to_date('12-07-2013 14:22:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52810, to_date('12-07-2013 14:22:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52811, to_date('12-07-2013 14:22:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52812, to_date('12-07-2013 14:22:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52813, to_date('12-07-2013 14:22:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52814, to_date('12-07-2013 14:22:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52815, to_date('12-07-2013 14:22:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52816, to_date('12-07-2013 14:22:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52817, to_date('12-07-2013 14:22:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42060, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52818, to_date('12-07-2013 14:22:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1496, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52819, to_date('12-07-2013 14:27:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3798, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52820, to_date('12-07-2013 15:14:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3992, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52821, to_date('12-07-2013 15:14:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3992, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52822, to_date('12-07-2013 15:30:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4179, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52823, to_date('12-07-2013 15:30:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4178, 45615, 49901);
commit;
prompt 900 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52824, to_date('12-07-2013 15:38:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4191, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52825, to_date('12-07-2013 15:38:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4191, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52826, to_date('12-07-2013 15:38:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4191, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52827, to_date('12-07-2013 15:38:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4191, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52828, to_date('12-07-2013 15:38:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4191, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52829, to_date('12-07-2013 15:42:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4251, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52830, to_date('12-07-2013 15:42:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4254, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52831, to_date('12-07-2013 15:42:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4252, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52832, to_date('12-07-2013 15:42:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4251, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52833, to_date('12-07-2013 15:42:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4254, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52834, to_date('12-07-2013 15:42:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4253, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52835, to_date('12-07-2013 15:42:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4254, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52836, to_date('12-07-2013 15:43:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4251, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52837, to_date('12-07-2013 15:43:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4254, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52838, to_date('12-07-2013 15:43:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4260, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52839, to_date('12-07-2013 15:43:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4253, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52840, to_date('12-07-2013 15:43:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4252, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52841, to_date('12-07-2013 15:43:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4251, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52842, to_date('12-07-2013 15:43:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4252, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52843, to_date('12-07-2013 15:43:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4250, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52844, to_date('12-07-2013 15:43:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4251, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52845, to_date('12-07-2013 15:43:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 4268, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52846, to_date('12-07-2013 15:47:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52847, to_date('12-07-2013 15:47:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52848, to_date('12-07-2013 15:47:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2640, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52849, to_date('12-07-2013 15:47:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52850, to_date('12-07-2013 15:47:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2640, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52851, to_date('12-07-2013 15:47:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52852, to_date('12-07-2013 15:47:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2640, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52853, to_date('12-07-2013 15:48:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52854, to_date('12-07-2013 15:48:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52855, to_date('12-07-2013 15:48:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2640, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52856, to_date('12-07-2013 15:48:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2639, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52857, to_date('12-07-2013 15:49:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2745, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52858, to_date('12-07-2013 15:49:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2745, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52859, to_date('12-07-2013 15:50:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2772, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52860, to_date('12-07-2013 15:50:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2789, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52861, to_date('12-07-2013 15:50:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2789, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52862, to_date('12-07-2013 15:50:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2789, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52863, to_date('12-07-2013 15:52:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2825, 42742, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52864, to_date('12-07-2013 15:53:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2842, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52865, to_date('12-07-2013 15:53:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2842, 45615, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52866, to_date('12-07-2013 15:54:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2842, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52867, to_date('12-07-2013 15:54:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2842, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52868, to_date('12-07-2013 15:54:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2842, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52871, to_date('12-07-2013 15:56:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52872, to_date('12-07-2013 15:56:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52873, to_date('12-07-2013 15:56:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52875, to_date('12-07-2013 15:56:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52876, to_date('12-07-2013 15:57:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52877, to_date('12-07-2013 15:57:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2875, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52878, to_date('12-07-2013 15:57:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2888, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52879, to_date('12-07-2013 15:57:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2892, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52880, to_date('12-07-2013 15:57:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2896, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52881, to_date('12-07-2013 15:59:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2985, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52882, to_date('12-07-2013 15:59:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2982, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52883, to_date('12-07-2013 15:59:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 2996, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52933, to_date('16-07-2013 11:16:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3952, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52934, to_date('16-07-2013 11:19:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3959, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52936, to_date('16-07-2013 11:19:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3959, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52937, to_date('16-07-2013 11:19:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3971, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52939, to_date('16-07-2013 11:19:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3971, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52940, to_date('16-07-2013 11:20:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3986, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52942, to_date('16-07-2013 11:20:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3986, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52943, to_date('16-07-2013 11:22:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3989, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52945, to_date('16-07-2013 11:22:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3989, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52946, to_date('16-07-2013 11:22:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3992, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52948, to_date('16-07-2013 11:22:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3992, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52949, to_date('16-07-2013 11:23:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3994, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52951, to_date('16-07-2013 11:23:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3994, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52952, to_date('16-07-2013 11:24:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4014, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52954, to_date('16-07-2013 11:24:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4014, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52955, to_date('16-07-2013 11:25:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4017, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52957, to_date('16-07-2013 11:25:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4017, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52958, to_date('16-07-2013 11:26:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4026, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52960, to_date('16-07-2013 11:26:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4026, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52961, to_date('16-07-2013 11:27:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4027, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52963, to_date('16-07-2013 11:27:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4027, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52964, to_date('16-07-2013 11:28:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4034, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52966, to_date('16-07-2013 11:28:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4034, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52967, to_date('16-07-2013 11:29:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4046, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52969, to_date('16-07-2013 11:29:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4046, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52970, to_date('16-07-2013 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4049, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52972, to_date('16-07-2013 11:30:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4049, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52973, to_date('16-07-2013 11:30:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4054, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52975, to_date('16-07-2013 11:30:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4054, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52976, to_date('16-07-2013 11:31:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4055, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52978, to_date('16-07-2013 11:31:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4055, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52979, to_date('16-07-2013 11:32:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4062, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52981, to_date('16-07-2013 11:32:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4062, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52982, to_date('16-07-2013 11:33:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4064, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52984, to_date('16-07-2013 11:33:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4064, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52985, to_date('16-07-2013 11:34:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4065, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52987, to_date('16-07-2013 11:34:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4065, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52988, to_date('16-07-2013 11:35:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4070, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52990, to_date('16-07-2013 11:35:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4070, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53096, to_date('16-07-2013 19:41:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2753, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53097, to_date('16-07-2013 19:41:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2753, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53098, to_date('16-07-2013 19:42:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2753, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53099, to_date('16-07-2013 19:42:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2746, 45615, 51252);
commit;
prompt 1000 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53549, to_date('29-07-2013 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3142, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53550, to_date('29-07-2013 15:35:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3254, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53551, to_date('29-07-2013 15:36:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3255, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53553, to_date('30-07-2013 09:34:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1880, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53554, to_date('30-07-2013 09:34:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1880, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53555, to_date('30-07-2013 09:34:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1880, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53558, to_date('30-07-2013 09:35:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1882, 30370, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53559, to_date('30-07-2013 09:36:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1882, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53561, to_date('30-07-2013 09:40:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1904, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53562, to_date('30-07-2013 09:41:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1925, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53565, to_date('30-07-2013 09:41:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1925, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53566, to_date('30-07-2013 09:42:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1928, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53568, to_date('30-07-2013 09:42:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1928, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53569, to_date('30-07-2013 09:42:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1928, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53570, to_date('30-07-2013 09:43:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1928, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53571, to_date('30-07-2013 09:43:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1932, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53572, to_date('30-07-2013 09:43:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1932, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53573, to_date('30-07-2013 09:43:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1932, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53574, to_date('30-07-2013 09:43:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1932, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53575, to_date('30-07-2013 09:44:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1932, 41362, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53576, to_date('30-07-2013 09:44:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53577, to_date('30-07-2013 09:44:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53578, to_date('30-07-2013 09:44:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53579, to_date('30-07-2013 09:44:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 41362, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53580, to_date('30-07-2013 09:44:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 41362, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53581, to_date('30-07-2013 09:45:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1937, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53582, to_date('30-07-2013 09:46:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1965, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53584, to_date('30-07-2013 09:46:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1965, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53585, to_date('30-07-2013 09:48:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1972, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53587, to_date('30-07-2013 09:48:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1972, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53588, to_date('30-07-2013 09:49:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1982, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53590, to_date('30-07-2013 09:49:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1982, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53591, to_date('30-07-2013 09:50:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1992, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53593, to_date('30-07-2013 09:50:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1992, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53594, to_date('30-07-2013 09:50:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1992, 42739, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53614, to_date('30-07-2013 16:06:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1373, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53615, to_date('30-07-2013 16:09:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1400, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53617, to_date('30-07-2013 16:09:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1400, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53695, to_date('31-07-2013 16:41:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 53500, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52994, to_date('16-07-2013 15:48:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2990, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52995, to_date('16-07-2013 15:49:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2997, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52996, to_date('16-07-2013 15:49:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2997, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52997, to_date('16-07-2013 15:50:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52998, to_date('16-07-2013 15:50:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52999, to_date('16-07-2013 15:50:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53000, to_date('16-07-2013 15:50:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53001, to_date('16-07-2013 15:51:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53002, to_date('16-07-2013 15:51:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53003, to_date('16-07-2013 15:51:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53004, to_date('16-07-2013 15:51:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2998, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53005, to_date('16-07-2013 15:52:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3011, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53006, to_date('16-07-2013 15:52:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3021, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53007, to_date('16-07-2013 15:52:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3019, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53008, to_date('16-07-2013 15:52:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3018, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53009, to_date('16-07-2013 15:52:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3020, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53010, to_date('16-07-2013 15:53:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3018, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53011, to_date('16-07-2013 15:53:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3017, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53012, to_date('16-07-2013 15:53:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3017, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53013, to_date('16-07-2013 15:53:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3018, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53014, to_date('16-07-2013 15:54:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53015, to_date('16-07-2013 15:54:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53016, to_date('16-07-2013 15:54:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53017, to_date('16-07-2013 15:54:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53018, to_date('16-07-2013 15:54:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53019, to_date('16-07-2013 15:55:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53020, to_date('16-07-2013 15:55:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3040, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53021, to_date('16-07-2013 16:01:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53022, to_date('16-07-2013 16:01:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53023, to_date('16-07-2013 16:01:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53024, to_date('16-07-2013 16:01:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53025, to_date('16-07-2013 16:01:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53026, to_date('16-07-2013 16:01:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53027, to_date('16-07-2013 16:01:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3082, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53028, to_date('16-07-2013 16:02:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3083, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53029, to_date('16-07-2013 16:03:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3085, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53030, to_date('16-07-2013 16:03:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3085, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53031, to_date('16-07-2013 16:04:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3096, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53032, to_date('16-07-2013 16:04:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3091, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53033, to_date('16-07-2013 16:04:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3093, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53034, to_date('16-07-2013 16:04:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3091, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53035, to_date('16-07-2013 16:04:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3094, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53036, to_date('16-07-2013 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3095, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53037, to_date('16-07-2013 16:05:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3094, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53038, to_date('16-07-2013 16:05:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3095, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53039, to_date('16-07-2013 16:05:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3091, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53040, to_date('16-07-2013 16:05:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3095, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53041, to_date('16-07-2013 16:05:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3106, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53042, to_date('16-07-2013 16:06:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3104, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53043, to_date('16-07-2013 16:06:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3107, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53044, to_date('16-07-2013 16:06:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3103, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53045, to_date('16-07-2013 16:06:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3106, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53046, to_date('16-07-2013 16:06:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3103, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53047, to_date('16-07-2013 16:06:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3103, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53048, to_date('16-07-2013 16:06:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3112, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53049, to_date('16-07-2013 16:08:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3129, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53050, to_date('16-07-2013 16:08:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3128, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53051, to_date('16-07-2013 16:08:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3126, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53052, to_date('16-07-2013 16:08:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3127, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53053, to_date('16-07-2013 16:09:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53054, to_date('16-07-2013 16:09:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 41828, 49893);
commit;
prompt 1100 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53055, to_date('16-07-2013 16:09:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53056, to_date('16-07-2013 16:09:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53057, to_date('16-07-2013 16:09:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53058, to_date('16-07-2013 16:10:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3135, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53059, to_date('16-07-2013 16:10:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3136, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53060, to_date('16-07-2013 16:11:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3142, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53061, to_date('16-07-2013 16:11:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53062, to_date('16-07-2013 16:11:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53063, to_date('16-07-2013 16:12:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53064, to_date('16-07-2013 16:12:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53065, to_date('16-07-2013 16:12:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53066, to_date('16-07-2013 16:12:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53067, to_date('16-07-2013 16:12:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3148, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53068, to_date('16-07-2013 16:15:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3150, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53069, to_date('16-07-2013 16:16:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3150, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53070, to_date('16-07-2013 16:16:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3150, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53071, to_date('16-07-2013 16:20:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3156, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53072, to_date('16-07-2013 16:22:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3158, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53073, to_date('16-07-2013 16:22:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3158, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53074, to_date('16-07-2013 16:22:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3158, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53075, to_date('16-07-2013 16:23:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3158, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53076, to_date('16-07-2013 16:24:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3159, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53077, to_date('16-07-2013 16:25:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53078, to_date('16-07-2013 16:25:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53079, to_date('16-07-2013 16:25:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53080, to_date('16-07-2013 16:25:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53081, to_date('16-07-2013 16:25:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53082, to_date('16-07-2013 16:26:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53083, to_date('16-07-2013 16:26:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53084, to_date('16-07-2013 16:26:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53085, to_date('16-07-2013 16:26:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53086, to_date('16-07-2013 16:26:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53087, to_date('16-07-2013 16:26:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3161, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53088, to_date('16-07-2013 16:26:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3164, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53089, to_date('16-07-2013 16:26:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3166, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53090, to_date('16-07-2013 16:30:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3221, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53091, to_date('16-07-2013 16:31:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3225, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53092, to_date('16-07-2013 16:31:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3227, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53093, to_date('16-07-2013 16:33:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3259, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53094, to_date('16-07-2013 16:33:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3259, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53095, to_date('16-07-2013 16:33:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3259, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53122, to_date('17-07-2013 16:16:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53123, to_date('17-07-2013 16:16:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53124, to_date('17-07-2013 16:16:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53125, to_date('17-07-2013 16:16:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53126, to_date('17-07-2013 16:16:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53127, to_date('17-07-2013 16:16:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53128, to_date('17-07-2013 16:16:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53129, to_date('17-07-2013 16:16:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53130, to_date('17-07-2013 16:16:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 41352, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53131, to_date('17-07-2013 16:16:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53132, to_date('17-07-2013 16:16:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53133, to_date('17-07-2013 16:16:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53134, to_date('17-07-2013 16:16:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53135, to_date('17-07-2013 16:16:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53136, to_date('17-07-2013 16:16:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53137, to_date('17-07-2013 16:16:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53138, to_date('17-07-2013 16:16:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53139, to_date('17-07-2013 16:16:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53140, to_date('17-07-2013 16:17:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53141, to_date('17-07-2013 16:17:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53142, to_date('17-07-2013 16:17:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53143, to_date('17-07-2013 16:17:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53144, to_date('17-07-2013 16:17:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53145, to_date('17-07-2013 16:17:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53146, to_date('17-07-2013 16:17:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53147, to_date('17-07-2013 16:17:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53148, to_date('17-07-2013 16:17:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53149, to_date('17-07-2013 16:17:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53150, to_date('17-07-2013 16:17:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 42739, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53151, to_date('17-07-2013 16:17:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53152, to_date('17-07-2013 16:17:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53153, to_date('17-07-2013 16:17:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3441, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53154, to_date('17-07-2013 16:17:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3440, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53155, to_date('17-07-2013 16:17:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3438, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53156, to_date('17-07-2013 16:17:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3439, 30370, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53157, to_date('17-07-2013 16:18:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3462, 45615, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53158, to_date('17-07-2013 16:19:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53159, to_date('17-07-2013 16:19:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53160, to_date('17-07-2013 16:19:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53161, to_date('17-07-2013 16:19:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53162, to_date('17-07-2013 16:20:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53163, to_date('17-07-2013 16:20:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53164, to_date('17-07-2013 16:20:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53165, to_date('17-07-2013 16:20:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53166, to_date('17-07-2013 16:20:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53167, to_date('17-07-2013 16:20:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53168, to_date('17-07-2013 16:20:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53169, to_date('17-07-2013 16:20:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53170, to_date('17-07-2013 16:20:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53171, to_date('17-07-2013 16:21:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53172, to_date('17-07-2013 16:21:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53173, to_date('17-07-2013 16:21:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53174, to_date('17-07-2013 16:21:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53175, to_date('17-07-2013 16:21:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53176, to_date('17-07-2013 16:21:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3473, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52767, to_date('12-07-2013 11:12:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2754, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52768, to_date('12-07-2013 11:12:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2755, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52769, to_date('12-07-2013 11:12:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2754, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52770, to_date('12-07-2013 11:12:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2755, 45621, 49899);
commit;
prompt 1200 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53107, to_date('17-07-2013 14:04:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2725, 30370, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53108, to_date('17-07-2013 14:04:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2725, 42739, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53109, to_date('17-07-2013 14:04:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2756, 42742, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53110, to_date('17-07-2013 14:05:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2756, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53111, to_date('17-07-2013 14:05:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2756, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53112, to_date('17-07-2013 14:05:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2756, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53113, to_date('17-07-2013 14:06:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2779, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53116, to_date('17-07-2013 14:06:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2781, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53117, to_date('17-07-2013 14:06:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2789, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53118, to_date('17-07-2013 14:06:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2789, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53119, to_date('17-07-2013 14:06:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2789, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53121, to_date('17-07-2013 14:06:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2795, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53177, to_date('17-07-2013 16:21:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3504, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53178, to_date('18-07-2013 09:36:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3007, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53179, to_date('18-07-2013 09:36:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3007, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53180, to_date('18-07-2013 09:41:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3075, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53182, to_date('18-07-2013 09:41:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3075, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53183, to_date('18-07-2013 10:22:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2658, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53184, to_date('18-07-2013 10:22:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2659, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53185, to_date('18-07-2013 10:22:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2660, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53186, to_date('18-07-2013 10:22:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2666, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53187, to_date('18-07-2013 10:23:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2678, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53188, to_date('18-07-2013 10:23:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2678, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53189, to_date('18-07-2013 10:24:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2685, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53190, to_date('18-07-2013 10:24:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2683, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53191, to_date('18-07-2013 10:24:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2689, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53192, to_date('19-07-2013 10:04:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53193, to_date('19-07-2013 10:04:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53194, to_date('19-07-2013 10:04:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53195, to_date('19-07-2013 10:04:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53196, to_date('19-07-2013 10:04:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53197, to_date('19-07-2013 10:04:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1762, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53200, to_date('19-07-2013 10:05:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1764, 30370, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53201, to_date('19-07-2013 10:06:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1764, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53202, to_date('19-07-2013 10:06:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1764, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53203, to_date('19-07-2013 10:06:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1764, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53204, to_date('19-07-2013 10:07:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1789, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53205, to_date('19-07-2013 10:07:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1789, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53206, to_date('19-07-2013 10:07:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1791, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53207, to_date('19-07-2013 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1797, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53210, to_date('19-07-2013 10:08:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1797, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53211, to_date('19-07-2013 10:09:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1805, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53213, to_date('19-07-2013 10:09:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1805, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53214, to_date('19-07-2013 10:10:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1807, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53216, to_date('19-07-2013 10:10:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1807, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53217, to_date('19-07-2013 10:11:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1811, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53219, to_date('19-07-2013 10:11:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1811, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53220, to_date('19-07-2013 10:12:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1817, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53222, to_date('19-07-2013 10:12:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1817, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53223, to_date('19-07-2013 10:13:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1823, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53225, to_date('19-07-2013 10:13:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1823, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53226, to_date('19-07-2013 10:13:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 1823, 42739, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53227, to_date('19-07-2013 10:14:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 2904, 45615, 51008);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53228, to_date('19-07-2013 10:23:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3333, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53233, to_date('19-07-2013 10:57:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3496, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53234, to_date('19-07-2013 10:57:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3495, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53235, to_date('19-07-2013 10:57:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3495, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53236, to_date('19-07-2013 10:57:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3495, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53237, to_date('19-07-2013 10:57:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3495, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53238, to_date('19-07-2013 10:57:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3495, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53241, to_date('19-07-2013 11:01:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3531, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53242, to_date('19-07-2013 11:01:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3531, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53243, to_date('19-07-2013 11:01:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3531, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53244, to_date('19-07-2013 11:01:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3531, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53251, to_date('19-07-2013 11:11:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3564, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53252, to_date('19-07-2013 11:11:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3564, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53253, to_date('19-07-2013 11:11:09', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3564, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53254, to_date('19-07-2013 11:11:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3564, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53255, to_date('19-07-2013 11:12:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3575, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53258, to_date('19-07-2013 11:12:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3575, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53259, to_date('19-07-2013 11:12:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3575, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53260, to_date('19-07-2013 11:12:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3578, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53262, to_date('19-07-2013 11:12:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3578, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53263, to_date('19-07-2013 11:13:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3578, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53264, to_date('19-07-2013 11:14:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3581, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53266, to_date('19-07-2013 11:14:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3581, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53267, to_date('19-07-2013 11:14:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3583, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53268, to_date('19-07-2013 11:16:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3585, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53270, to_date('19-07-2013 11:16:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3585, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53271, to_date('19-07-2013 11:16:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3590, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53272, to_date('19-07-2013 11:17:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3602, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53274, to_date('19-07-2013 11:17:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3602, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53275, to_date('19-07-2013 11:17:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3602, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53276, to_date('19-07-2013 11:18:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3604, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53278, to_date('19-07-2013 11:18:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3604, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53279, to_date('19-07-2013 11:18:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3604, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53280, to_date('19-07-2013 11:18:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3604, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53282, to_date('19-07-2013 11:18:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 3604, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53283, to_date('19-07-2013 13:36:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 52712, 44773, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53284, to_date('19-07-2013 13:37:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 52709, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53287, to_date('19-07-2013 13:37:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 52709, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53290, to_date('19-07-2013 13:46:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4728, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53291, to_date('19-07-2013 13:46:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4742, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53292, to_date('19-07-2013 13:48:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53293, to_date('19-07-2013 13:48:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53294, to_date('19-07-2013 13:48:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53295, to_date('19-07-2013 13:48:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53296, to_date('19-07-2013 13:49:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53297, to_date('19-07-2013 13:49:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53298, to_date('19-07-2013 13:49:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4749, 45615, 49893);
commit;
prompt 1300 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53299, to_date('19-07-2013 13:49:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4746, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53300, to_date('19-07-2013 13:51:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4753, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53301, to_date('19-07-2013 13:53:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53302, to_date('19-07-2013 13:53:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53303, to_date('19-07-2013 13:53:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53304, to_date('19-07-2013 13:53:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53305, to_date('19-07-2013 13:53:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53306, to_date('19-07-2013 13:53:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53307, to_date('19-07-2013 13:53:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53308, to_date('19-07-2013 13:53:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53309, to_date('19-07-2013 13:53:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53310, to_date('19-07-2013 13:54:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53311, to_date('19-07-2013 13:54:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4758, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53312, to_date('19-07-2013 13:55:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4759, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53313, to_date('19-07-2013 13:56:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4759, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53314, to_date('19-07-2013 13:56:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4760, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53315, to_date('19-07-2013 13:56:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4760, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53316, to_date('19-07-2013 13:58:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4763, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53317, to_date('19-07-2013 14:00:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4768, 45615, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53318, to_date('19-07-2013 14:01:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4769, 45615, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53319, to_date('19-07-2013 14:01:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4769, 45615, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53320, to_date('19-07-2013 14:02:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4770, 45615, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53321, to_date('19-07-2013 14:02:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 4770, 45621, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53374, to_date('19-07-2013 15:44:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1715, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53383, to_date('25-07-2013 11:24:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3526, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53384, to_date('25-07-2013 11:24:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3517, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53385, to_date('25-07-2013 11:24:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3520, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53386, to_date('25-07-2013 11:24:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3520, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53387, to_date('25-07-2013 11:24:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3520, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53388, to_date('25-07-2013 11:25:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3534, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53389, to_date('25-07-2013 11:25:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3534, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53390, to_date('25-07-2013 11:25:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3536, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53391, to_date('25-07-2013 11:25:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3536, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53392, to_date('25-07-2013 11:26:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3538, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53393, to_date('25-07-2013 11:27:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3544, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53394, to_date('25-07-2013 11:31:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3550, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53395, to_date('25-07-2013 11:31:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3550, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53396, to_date('25-07-2013 11:37:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3561, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53424, to_date('26-07-2013 10:50:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2331, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53435, to_date('26-07-2013 14:39:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2025, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53436, to_date('26-07-2013 14:40:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2029, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53437, to_date('26-07-2013 14:40:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2029, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53438, to_date('26-07-2013 14:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2050, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53441, to_date('26-07-2013 14:45:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2050, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53442, to_date('26-07-2013 14:46:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2055, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53444, to_date('26-07-2013 14:46:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2055, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53445, to_date('26-07-2013 14:47:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2057, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53447, to_date('26-07-2013 14:47:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2057, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53448, to_date('26-07-2013 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2060, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53450, to_date('26-07-2013 14:50:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2060, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53451, to_date('26-07-2013 14:51:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2062, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53453, to_date('26-07-2013 14:51:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2062, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53454, to_date('26-07-2013 14:51:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2064, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53456, to_date('26-07-2013 14:51:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2064, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72895, to_date('08-08-2013 14:44:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1036, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72898, to_date('31-07-2013 14:46:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 42742, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72899, to_date('31-07-2013 14:46:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72900, to_date('31-07-2013 14:46:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72901, to_date('31-07-2013 14:46:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72902, to_date('31-07-2013 14:47:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72903, to_date('31-07-2013 14:47:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72904, to_date('31-07-2013 14:47:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72905, to_date('31-07-2013 14:47:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 42739, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72906, to_date('31-07-2013 14:47:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72907, to_date('31-07-2013 14:47:43', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1053, 45085, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72908, to_date('31-07-2013 14:52:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 42742, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72909, to_date('31-07-2013 14:52:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72910, to_date('31-07-2013 14:53:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 42742, 49901);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72911, to_date('31-07-2013 14:53:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72912, to_date('31-07-2013 14:53:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72915, to_date('31-07-2013 14:53:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72916, to_date('31-07-2013 14:54:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72917, to_date('31-07-2013 14:54:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72919, to_date('31-07-2013 14:54:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72920, to_date('31-07-2013 14:54:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72923, to_date('31-07-2013 14:54:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72924, to_date('31-07-2013 14:54:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72926, to_date('31-07-2013 14:54:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72927, to_date('31-07-2013 14:54:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72928, to_date('31-07-2013 14:55:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72929, to_date('31-07-2013 14:55:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72930, to_date('31-07-2013 14:55:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1121, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72931, to_date('31-07-2013 14:55:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72932, to_date('31-07-2013 14:55:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72933, to_date('31-07-2013 14:55:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72934, to_date('31-07-2013 14:55:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72935, to_date('31-07-2013 14:55:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72936, to_date('31-07-2013 14:55:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1170, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72937, to_date('31-07-2013 14:59:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1190, 45615, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72938, to_date('31-07-2013 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1190, 41352, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72939, to_date('31-07-2013 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1190, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72940, to_date('31-07-2013 15:00:16', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1190, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (72992, to_date('31-07-2013 15:00:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1190, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73022, to_date('31-07-2013 15:02:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1213, 50841, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73023, to_date('31-07-2013 15:02:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1213, 50189, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73024, to_date('31-07-2013 15:02:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1213, 50187, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73091, to_date('08-08-2013 15:05:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1248, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73092, to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1248, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73101, to_date('08-08-2013 15:05:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1248, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73102, to_date('08-08-2013 15:05:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1248, 41352, 49903);
commit;
prompt 1400 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73118, to_date('08-08-2013 15:12:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73119, to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73128, to_date('08-08-2013 15:12:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73139, to_date('08-08-2013 15:14:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73140, to_date('08-08-2013 15:14:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73149, to_date('08-08-2013 15:15:00', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1303, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73180, to_date('29-08-2013 15:25:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73181, to_date('29-08-2013 15:25:34', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73182, to_date('20-08-2013 15:25:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73183, to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73192, to_date('20-08-2013 15:25:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73193, to_date('20-08-2013 15:25:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1476, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73194, to_date('23-08-2013 15:25:56', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1510, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73195, to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1510, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73204, to_date('23-08-2013 15:25:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1510, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73205, to_date('08-08-2013 15:39:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1707, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73206, to_date('08-08-2013 15:39:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1707, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73257, to_date('08-08-2013 15:39:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1707, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73258, to_date('08-08-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1707, 48777, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73286, to_date('08-08-2013 15:42:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1763, 41352, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73303, to_date('20-08-2013 17:36:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2895, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73314, to_date('20-08-2013 18:55:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3493, 53122, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73328, to_date('21-08-2013 11:10:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3043, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73329, to_date('21-08-2013 11:12:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3080, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73330, to_date('21-08-2013 11:14:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3086, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73331, to_date('21-08-2013 11:15:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3096, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73332, to_date('21-08-2013 11:18:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3115, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73333, to_date('21-08-2013 12:12:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3451, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73334, to_date('21-08-2013 12:13:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3460, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73335, to_date('21-08-2013 12:13:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3460, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73336, to_date('21-08-2013 12:14:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3460, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73337, to_date('21-08-2013 12:15:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3484, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73338, to_date('21-08-2013 12:15:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3484, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73339, to_date('21-08-2013 12:16:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3491, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73340, to_date('21-08-2013 12:23:02', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3523, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73304, to_date('20-08-2013 18:04:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3070, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73305, to_date('20-08-2013 18:05:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3075, 42054, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73307, to_date('20-08-2013 18:07:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3097, 42054, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73309, to_date('20-08-2013 18:07:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3097, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73310, to_date('20-08-2013 18:15:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3153, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73311, to_date('20-08-2013 18:15:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3153, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73312, to_date('20-08-2013 18:16:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3153, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73313, to_date('20-08-2013 18:18:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3177, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73315, to_date('21-08-2013 09:13:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73316, to_date('21-08-2013 09:13:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73317, to_date('21-08-2013 09:13:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73318, to_date('21-08-2013 09:14:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73319, to_date('21-08-2013 09:14:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73320, to_date('21-08-2013 09:14:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73321, to_date('21-08-2013 09:14:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73322, to_date('21-08-2013 09:14:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73323, to_date('21-08-2013 09:14:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1486, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73324, to_date('21-08-2013 09:15:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1668, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73325, to_date('21-08-2013 09:15:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1724, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73326, to_date('21-08-2013 10:56:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2947, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73327, to_date('21-08-2013 10:56:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2947, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73345, to_date('21-08-2013 13:06:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3915, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73346, to_date('21-08-2013 13:06:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3915, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73347, to_date('21-08-2013 13:06:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3915, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73348, to_date('21-08-2013 13:07:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3921, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73349, to_date('21-08-2013 13:09:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3944, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73350, to_date('21-08-2013 13:10:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3944, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73351, to_date('21-08-2013 13:10:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3944, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73358, to_date('21-08-2013 13:45:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4312, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73359, to_date('21-08-2013 13:45:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4312, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73360, to_date('21-08-2013 13:49:56', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4357, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73361, to_date('21-08-2013 13:50:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4357, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73362, to_date('21-08-2013 13:51:02', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4372, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73363, to_date('21-08-2013 13:52:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4384, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73364, to_date('21-08-2013 13:53:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4390, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73365, to_date('21-08-2013 13:55:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4419, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73366, to_date('21-08-2013 13:59:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4445, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73367, to_date('21-08-2013 14:01:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4453, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73368, to_date('21-08-2013 14:03:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4460, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73369, to_date('21-08-2013 14:03:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4465, 42054, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73370, to_date('21-08-2013 14:03:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4465, 42054, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73372, to_date('21-08-2013 14:03:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4465, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73373, to_date('21-08-2013 14:10:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4527, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73374, to_date('21-08-2013 14:11:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4527, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73376, to_date('21-08-2013 14:23:16', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4635, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73377, to_date('21-08-2013 15:07:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1228, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73378, to_date('21-08-2013 15:16:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1302, 53122, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73379, to_date('21-08-2013 15:16:56', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1302, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73381, to_date('21-08-2013 15:59:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1966, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73382, to_date('21-08-2013 15:59:46', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1966, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73383, to_date('21-08-2013 15:59:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1966, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73385, to_date('21-08-2013 16:00:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1966, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73386, to_date('21-08-2013 16:02:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1986, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73387, to_date('21-08-2013 16:03:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73388, to_date('21-08-2013 16:04:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73389, to_date('21-08-2013 16:04:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73390, to_date('21-08-2013 16:04:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73391, to_date('21-08-2013 16:04:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73393, to_date('21-08-2013 16:04:40', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 41000, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73394, to_date('21-08-2013 16:04:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2003, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73395, to_date('23-08-2013 14:44:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3369, 41255, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73396, to_date('23-08-2013 14:44:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3369, 41255, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73397, to_date('23-08-2013 16:10:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4844, 41520, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73398, to_date('23-08-2013 16:22:34', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1156, 27520, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73399, to_date('23-08-2013 16:22:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1156, 27520, 3);
commit;
prompt 1500 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73400, to_date('23-08-2013 16:22:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1156, 27520, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73401, to_date('23-08-2013 16:58:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2235, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73402, to_date('23-08-2013 16:58:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2235, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73409, to_date('27-08-2013 09:56:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3693, 41352, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73463, to_date('27-08-2013 10:32:20', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50931, 562, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73464, to_date('27-08-2013 10:32:23', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50931, 562, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73465, to_date('27-08-2013 10:33:50', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50938, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73466, to_date('27-08-2013 10:33:53', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50938, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73467, to_date('28-08-2013 11:11:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3133, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73468, to_date('28-08-2013 11:11:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3133, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73469, to_date('28-08-2013 11:12:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3133, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73470, to_date('28-08-2013 11:12:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3133, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73473, to_date('28-08-2013 11:15:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3180, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73475, to_date('28-08-2013 11:28:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3382, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73476, to_date('28-08-2013 11:28:57', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3382, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73477, to_date('28-08-2013 11:28:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3382, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73478, to_date('28-08-2013 13:35:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2174, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73479, to_date('28-08-2013 13:35:07', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2174, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73480, to_date('28-08-2013 13:35:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2180, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73481, to_date('28-08-2013 13:43:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2262, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73482, to_date('28-08-2013 13:43:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2262, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73483, to_date('28-08-2013 13:43:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2262, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73484, to_date('28-08-2013 13:44:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2265, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73485, to_date('28-08-2013 13:44:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2265, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73486, to_date('28-08-2013 13:45:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2265, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73487, to_date('28-08-2013 13:45:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2271, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73488, to_date('28-08-2013 13:46:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2273, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73489, to_date('28-08-2013 13:46:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2273, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73490, to_date('28-08-2013 13:47:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2285, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73491, to_date('28-08-2013 13:47:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2288, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73492, to_date('28-08-2013 13:48:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2290, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73493, to_date('28-08-2013 13:48:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2290, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73494, to_date('28-08-2013 13:49:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2292, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73495, to_date('28-08-2013 13:49:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2292, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73496, to_date('28-08-2013 13:49:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2292, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73497, to_date('28-08-2013 13:50:19', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2299, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73498, to_date('28-08-2013 13:51:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2303, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73499, to_date('28-08-2013 13:51:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2305, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73500, to_date('28-08-2013 13:53:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2318, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73501, to_date('28-08-2013 13:54:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2327, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73502, to_date('28-08-2013 13:54:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2327, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73503, to_date('28-08-2013 13:55:06', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2329, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73504, to_date('28-08-2013 13:55:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2332, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73505, to_date('28-08-2013 13:56:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2342, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73506, to_date('28-08-2013 13:58:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2345, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73507, to_date('28-08-2013 13:58:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2345, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73508, to_date('28-08-2013 13:58:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2351, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73509, to_date('28-08-2013 13:59:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2357, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73510, to_date('28-08-2013 13:59:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2357, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73511, to_date('28-08-2013 13:59:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2357, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73512, to_date('28-08-2013 14:00:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2361, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73513, to_date('28-08-2013 14:00:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2361, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73514, to_date('28-08-2013 14:01:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2364, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73515, to_date('28-08-2013 14:01:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2364, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73516, to_date('28-08-2013 14:01:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2364, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73517, to_date('28-08-2013 14:02:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2364, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73518, to_date('28-08-2013 14:02:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2369, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73519, to_date('28-08-2013 14:03:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2369, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73520, to_date('28-08-2013 14:03:22', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2369, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73521, to_date('28-08-2013 14:03:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73522, to_date('28-08-2013 14:04:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73523, to_date('28-08-2013 14:04:34', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73524, to_date('28-08-2013 14:05:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73525, to_date('28-08-2013 14:05:41', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73526, to_date('28-08-2013 14:05:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73527, to_date('28-08-2013 14:06:08', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2372, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73528, to_date('28-08-2013 14:06:42', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2384, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73529, to_date('28-08-2013 14:06:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2384, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73530, to_date('28-08-2013 14:06:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2384, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73531, to_date('28-08-2013 14:07:11', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2384, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73532, to_date('28-08-2013 14:07:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2393, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73533, to_date('28-08-2013 14:08:02', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2394, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73534, to_date('28-08-2013 14:08:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2394, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73535, to_date('28-08-2013 14:08:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2394, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73536, to_date('28-08-2013 14:09:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2394, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73537, to_date('28-08-2013 14:09:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2403, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73538, to_date('28-08-2013 14:10:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2403, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73539, to_date('28-08-2013 14:10:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2403, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73540, to_date('28-08-2013 14:11:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73541, to_date('28-08-2013 14:11:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73542, to_date('28-08-2013 14:11:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73543, to_date('28-08-2013 14:11:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73544, to_date('28-08-2013 14:12:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73545, to_date('28-08-2013 14:12:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2486, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73546, to_date('28-08-2013 14:13:05', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2504, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73547, to_date('28-08-2013 14:13:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2509, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73548, to_date('28-08-2013 14:15:56', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2521, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73549, to_date('28-08-2013 14:17:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2525, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73550, to_date('28-08-2013 14:17:44', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2525, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73551, to_date('28-08-2013 14:18:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2525, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73552, to_date('28-08-2013 14:18:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2529, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73553, to_date('28-08-2013 14:18:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2529, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73554, to_date('28-08-2013 14:19:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2531, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73555, to_date('28-08-2013 14:19:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2531, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73556, to_date('28-08-2013 14:19:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2531, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73557, to_date('28-08-2013 14:20:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2531, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73558, to_date('28-08-2013 14:20:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2548, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73559, to_date('28-08-2013 14:21:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2548, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73560, to_date('28-08-2013 14:21:15', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2548, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73561, to_date('28-08-2013 14:21:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2548, 43482, 3);
commit;
prompt 1600 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73562, to_date('28-08-2013 14:21:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 41352, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73563, to_date('28-08-2013 14:22:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73564, to_date('28-08-2013 14:22:10', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73565, to_date('28-08-2013 14:22:12', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73566, to_date('28-08-2013 14:22:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73569, to_date('28-08-2013 14:22:20', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73570, to_date('28-08-2013 14:22:23', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 45621, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73571, to_date('28-08-2013 14:22:30', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 42739, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73572, to_date('28-08-2013 14:22:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 45621, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73573, to_date('28-08-2013 14:23:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2557, 42742, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73581, to_date('28-08-2013 15:44:53', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3192, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73582, to_date('28-08-2013 15:44:56', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3192, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73583, to_date('28-08-2013 15:57:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3284, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73607, to_date('04-09-2013 16:09:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1568, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73341, to_date('21-08-2013 12:29:35', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3577, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73342, to_date('21-08-2013 12:34:48', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3621, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73343, to_date('21-08-2013 12:36:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3702, 42717, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73344, to_date('21-08-2013 12:36:28', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3702, 53122, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73352, to_date('21-08-2013 13:20:47', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4045, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73353, to_date('21-08-2013 13:28:29', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4123, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73354, to_date('21-08-2013 13:28:49', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4123, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73355, to_date('21-08-2013 13:29:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4123, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73356, to_date('21-08-2013 13:31:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4177, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73357, to_date('21-08-2013 13:31:18', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4177, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73375, to_date('21-08-2013 14:16:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4604, 45085, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73380, to_date('21-08-2013 15:25:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1415, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73403, to_date('27-08-2013 09:47:13', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73404, to_date('27-08-2013 09:47:16', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73405, to_date('27-08-2013 09:48:54', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73406, to_date('27-08-2013 09:48:57', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73407, to_date('27-08-2013 09:49:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73408, to_date('27-08-2013 09:49:08', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50100, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73574, to_date('28-08-2013 14:43:17', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 41352, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73575, to_date('28-08-2013 14:43:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 41000, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73576, to_date('28-08-2013 14:43:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 42548, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73577, to_date('28-08-2013 14:43:38', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73578, to_date('28-08-2013 14:43:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 42717, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73579, to_date('28-08-2013 14:43:52', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 53122, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73580, to_date('28-08-2013 14:43:58', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1779, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73584, to_date('28-08-2013 16:36:21', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 3653, 586, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73603, to_date('04-09-2013 10:59:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2551, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73604, to_date('04-09-2013 10:59:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2551, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73605, to_date('04-09-2013 11:00:04', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2551, 43482, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73606, to_date('04-09-2013 11:00:51', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2551, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73608, to_date('04-09-2013 16:09:50', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1568, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73609, to_date('04-09-2013 16:10:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1588, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73611, to_date('04-09-2013 16:10:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1588, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73612, to_date('04-09-2013 16:10:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1588, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73613, to_date('04-09-2013 16:12:55', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1606, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73614, to_date('04-09-2013 16:16:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1665, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73615, to_date('04-09-2013 16:24:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73616, to_date('04-09-2013 16:24:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73618, to_date('04-09-2013 16:24:39', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73619, to_date('04-09-2013 16:25:01', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 44389, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73621, to_date('04-09-2013 16:25:27', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73622, to_date('04-09-2013 16:25:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73623, to_date('04-09-2013 16:25:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73624, to_date('04-09-2013 16:25:36', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73625, to_date('04-09-2013 16:26:03', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 1720, 44369, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73626, to_date('05-09-2013 10:17:31', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2692, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73627, to_date('05-09-2013 10:18:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 2692, 45621, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73643, to_date('18-09-2013 13:09:32', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4430, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73644, to_date('18-09-2013 13:09:37', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4430, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73645, to_date('18-09-2013 13:09:59', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4430, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73646, to_date('18-09-2013 13:10:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4430, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73647, to_date('18-09-2013 13:10:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4430, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73648, to_date('18-09-2013 13:12:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73649, to_date('18-09-2013 13:12:13', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73650, to_date('18-09-2013 13:12:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73651, to_date('18-09-2013 13:12:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73652, to_date('18-09-2013 13:12:14', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73653, to_date('18-09-2013 13:12:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73654, to_date('18-09-2013 13:12:24', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73655, to_date('18-09-2013 13:12:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73656, to_date('18-09-2013 13:12:25', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4488, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73657, to_date('18-09-2013 13:17:45', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4514, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73658, to_date('18-09-2013 13:17:54', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4514, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73659, to_date('18-09-2013 13:18:02', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4514, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73660, to_date('18-09-2013 13:18:09', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4514, 28192, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73661, to_date('18-09-2013 13:21:33', 'dd-mm-yyyy hh24:mi:ss'), '127.0.0.1', 4540, 30370, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73663, to_date('24-09-2013 10:10:03', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 50038, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73667, to_date('24-09-2013 15:48:09', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53154, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73668, to_date('24-09-2013 15:48:11', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53154, 569, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73669, to_date('24-09-2013 15:55:05', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53231, 42060, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73670, to_date('24-09-2013 15:55:33', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53231, 41255, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73671, to_date('24-09-2013 15:59:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53281, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73672, to_date('24-09-2013 15:59:59', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53281, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73673, to_date('24-09-2013 16:00:56', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53295, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (73674, to_date('24-09-2013 16:01:01', 'dd-mm-yyyy hh24:mi:ss'), '0:0:0:0:0:0:0:1', 53295, 569, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53101, to_date('16-07-2013 19:51:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53102, to_date('16-07-2013 19:51:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53103, to_date('16-07-2013 19:51:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53104, to_date('16-07-2013 19:51:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53105, to_date('16-07-2013 19:51:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53106, to_date('16-07-2013 19:51:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2788, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53457, to_date('26-07-2013 14:52:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2068, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53459, to_date('26-07-2013 14:52:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2068, 41352, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53460, to_date('26-07-2013 14:52:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2068, 42739, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53461, to_date('26-07-2013 14:53:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2072, 42739, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53462, to_date('26-07-2013 14:53:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2072, 43482, 49903);
commit;
prompt 1700 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53463, to_date('26-07-2013 14:59:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2090, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53464, to_date('26-07-2013 14:59:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2090, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53465, to_date('26-07-2013 15:00:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2096, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53467, to_date('26-07-2013 15:00:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2096, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53468, to_date('26-07-2013 15:01:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2098, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53470, to_date('26-07-2013 15:01:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2098, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53471, to_date('26-07-2013 15:03:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2103, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53473, to_date('26-07-2013 15:03:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2103, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53474, to_date('26-07-2013 15:04:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2105, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53476, to_date('26-07-2013 15:04:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2105, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53477, to_date('26-07-2013 15:05:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2107, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53479, to_date('26-07-2013 15:05:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2107, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53480, to_date('26-07-2013 15:06:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2109, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53482, to_date('26-07-2013 15:06:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2109, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53483, to_date('26-07-2013 15:06:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2109, 44773, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53484, to_date('26-07-2013 15:06:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 2109, 53126, 50209);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53506, to_date('29-07-2013 14:24:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2844, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53507, to_date('29-07-2013 14:24:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2844, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53513, to_date('29-07-2013 14:35:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2857, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53514, to_date('29-07-2013 14:35:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2857, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53515, to_date('29-07-2013 14:36:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2858, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53516, to_date('29-07-2013 14:36:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2858, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53517, to_date('29-07-2013 14:36:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2858, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53518, to_date('29-07-2013 14:38:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2862, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53521, to_date('29-07-2013 14:38:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2862, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53522, to_date('29-07-2013 14:39:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2862, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53523, to_date('29-07-2013 14:39:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2863, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53525, to_date('29-07-2013 14:39:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2863, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53526, to_date('29-07-2013 14:41:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2866, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53528, to_date('29-07-2013 14:41:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2866, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53529, to_date('29-07-2013 14:42:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2869, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53531, to_date('29-07-2013 14:42:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2869, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53532, to_date('29-07-2013 14:42:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2870, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53533, to_date('29-07-2013 14:42:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2870, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53534, to_date('29-07-2013 14:43:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2870, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53535, to_date('29-07-2013 14:43:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2874, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53536, to_date('29-07-2013 14:43:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2874, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53537, to_date('29-07-2013 14:44:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2875, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53538, to_date('29-07-2013 14:58:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2903, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53540, to_date('29-07-2013 14:58:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2903, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53541, to_date('29-07-2013 15:02:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2927, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53543, to_date('29-07-2013 15:02:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2927, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53544, to_date('29-07-2013 15:03:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2934, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53546, to_date('29-07-2013 15:03:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 2934, 41352, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53547, to_date('29-07-2013 15:15:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3001, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53548, to_date('29-07-2013 15:15:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3003, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53552, to_date('29-07-2013 16:21:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 2232, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53603, to_date('30-07-2013 10:11:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2670, 28573, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53604, to_date('30-07-2013 10:13:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2246, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53605, to_date('30-07-2013 10:15:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 3770, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53606, to_date('30-07-2013 10:16:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2756, 28573, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53607, to_date('30-07-2013 10:16:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.70', 3770, 45623, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53608, to_date('30-07-2013 10:16:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2756, 28573, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53610, to_date('30-07-2013 10:17:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2758, 28573, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53611, to_date('30-07-2013 10:18:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2758, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53612, to_date('30-07-2013 10:18:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2758, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53613, to_date('30-07-2013 10:18:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2758, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53618, to_date('30-07-2013 18:21:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1548, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53619, to_date('30-07-2013 18:26:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1581, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53621, to_date('30-07-2013 18:26:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1581, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53622, to_date('30-07-2013 18:29:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1586, 43486, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53623, to_date('30-07-2013 18:29:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 1586, 43482, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53634, to_date('31-07-2013 09:29:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1377, 45615, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53635, to_date('31-07-2013 09:30:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1377, 30370, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53636, to_date('31-07-2013 09:30:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1377, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53637, to_date('31-07-2013 09:30:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1382, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53640, to_date('31-07-2013 09:30:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1382, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53641, to_date('31-07-2013 09:31:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1385, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53643, to_date('31-07-2013 09:31:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1385, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53644, to_date('31-07-2013 09:32:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1388, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53646, to_date('31-07-2013 09:32:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1388, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53647, to_date('31-07-2013 09:32:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1389, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53649, to_date('31-07-2013 09:32:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1389, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53650, to_date('31-07-2013 09:33:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1392, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53652, to_date('31-07-2013 09:33:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1392, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53653, to_date('31-07-2013 09:33:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1394, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53655, to_date('31-07-2013 09:33:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1394, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53656, to_date('31-07-2013 09:34:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1395, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53658, to_date('31-07-2013 09:34:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1395, 41352, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53659, to_date('31-07-2013 09:34:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1395, 45621, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53660, to_date('31-07-2013 09:34:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.41', 1395, 42739, 49899);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53676, to_date('31-07-2013 15:35:05', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4175, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53677, to_date('31-07-2013 15:35:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4175, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53678, to_date('31-07-2013 15:35:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4175, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53679, to_date('31-07-2013 15:35:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4175, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53680, to_date('31-07-2013 15:35:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4175, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53681, to_date('31-07-2013 15:36:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4181, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53682, to_date('31-07-2013 15:36:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4181, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53683, to_date('31-07-2013 15:37:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4181, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53684, to_date('31-07-2013 15:37:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4181, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53685, to_date('31-07-2013 15:37:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4181, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53686, to_date('31-07-2013 15:39:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4247, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53687, to_date('31-07-2013 15:42:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4277, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53688, to_date('31-07-2013 15:43:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49905);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53689, to_date('31-07-2013 15:43:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53690, to_date('31-07-2013 15:44:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53691, to_date('31-07-2013 15:44:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53692, to_date('31-07-2013 15:44:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53693, to_date('31-07-2013 15:44:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53694, to_date('31-07-2013 15:44:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.189', 4279, 45615, 49903);
commit;
prompt 1800 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53703, to_date('05-08-2013 14:01:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 53456, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53704, to_date('05-08-2013 14:01:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 53456, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53705, to_date('05-08-2013 14:02:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.37', 53495, 45621, 49889);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53706, to_date('05-08-2013 14:29:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2931, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53707, to_date('05-08-2013 14:30:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2931, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53708, to_date('05-08-2013 14:30:10', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2938, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53709, to_date('05-08-2013 14:30:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2930, 45615, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53710, to_date('05-08-2013 14:30:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2929, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53711, to_date('05-08-2013 14:32:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2962, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53712, to_date('05-08-2013 14:32:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2962, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53713, to_date('05-08-2013 14:33:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2962, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53714, to_date('05-08-2013 14:33:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2968, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53717, to_date('05-08-2013 14:33:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2983, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53718, to_date('05-08-2013 14:33:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2979, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53719, to_date('05-08-2013 14:33:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 2968, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53721, to_date('05-08-2013 14:47:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 59708, 50189, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53745, to_date('05-08-2013 15:12:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 4819, 45623, 51044);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53746, to_date('05-08-2013 15:20:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60017, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53747, to_date('05-08-2013 15:20:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60017, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53748, to_date('05-08-2013 15:20:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60017, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53749, to_date('05-08-2013 15:23:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53750, to_date('05-08-2013 15:23:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53751, to_date('05-08-2013 15:23:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53752, to_date('05-08-2013 15:23:34', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53753, to_date('05-08-2013 15:23:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53754, to_date('05-08-2013 15:23:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60026, 45621, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53755, to_date('05-08-2013 15:24:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60028, 41352, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53756, to_date('05-08-2013 15:27:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60040, 42054, 1);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53757, to_date('05-08-2013 15:34:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53758, to_date('05-08-2013 15:34:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53759, to_date('05-08-2013 15:34:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53760, to_date('05-08-2013 15:34:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53761, to_date('05-08-2013 15:34:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45621, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53762, to_date('05-08-2013 15:34:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45621, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53763, to_date('05-08-2013 15:34:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60077, 45621, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53764, to_date('05-08-2013 15:47:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60181, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53765, to_date('05-08-2013 15:47:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60181, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53766, to_date('05-08-2013 15:47:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60181, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53767, to_date('05-08-2013 15:47:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60181, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53768, to_date('05-08-2013 15:47:48', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60181, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53908, to_date('05-08-2013 15:59:40', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60216, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53909, to_date('05-08-2013 16:00:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53910, to_date('05-08-2013 16:00:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53911, to_date('05-08-2013 16:00:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53912, to_date('05-08-2013 16:00:15', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53913, to_date('05-08-2013 16:00:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53914, to_date('05-08-2013 16:00:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53915, to_date('05-08-2013 16:00:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 60219, 45615, 3);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53942, to_date('05-08-2013 16:16:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1372, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53944, to_date('05-08-2013 16:16:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1372, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (53945, to_date('05-08-2013 16:16:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 1372, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52905, to_date('15-07-2013 16:33:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2502, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52906, to_date('15-07-2013 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2577, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52909, to_date('15-07-2013 16:39:31', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2577, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52910, to_date('15-07-2013 16:40:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2584, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52912, to_date('15-07-2013 16:40:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2584, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52913, to_date('15-07-2013 16:44:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1711, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52914, to_date('15-07-2013 16:45:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2662, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52916, to_date('15-07-2013 16:45:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2662, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52917, to_date('15-07-2013 16:48:57', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2696, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52919, to_date('15-07-2013 16:48:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2696, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52920, to_date('15-07-2013 16:49:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2703, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52922, to_date('15-07-2013 16:49:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2703, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52923, to_date('15-07-2013 16:50:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2709, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52925, to_date('15-07-2013 16:50:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2709, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52926, to_date('15-07-2013 16:54:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2720, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52928, to_date('15-07-2013 16:54:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2720, 41352, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52929, to_date('15-07-2013 16:54:41', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2728, 42739, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52930, to_date('15-07-2013 16:54:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.44', 2728, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52931, to_date('15-07-2013 17:01:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2282, 45615, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52932, to_date('15-07-2013 17:01:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2282, 45621, 51252);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52639, to_date('11-07-2013 13:58:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.194', 1334, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52640, to_date('11-07-2013 15:20:33', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3361, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52641, to_date('11-07-2013 15:20:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3359, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52642, to_date('11-07-2013 15:20:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3362, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52643, to_date('11-07-2013 15:21:16', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3365, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52644, to_date('11-07-2013 15:22:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3371, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52645, to_date('11-07-2013 15:22:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3377, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52646, to_date('11-07-2013 15:22:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3377, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52647, to_date('11-07-2013 15:23:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52648, to_date('11-07-2013 15:23:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52649, to_date('11-07-2013 15:23:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 30370, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52650, to_date('11-07-2013 15:24:17', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42739, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52651, to_date('11-07-2013 15:24:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52652, to_date('11-07-2013 15:24:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52653, to_date('11-07-2013 15:24:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52654, to_date('11-07-2013 15:24:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52655, to_date('11-07-2013 15:25:00', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3378, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52656, to_date('11-07-2013 15:25:55', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52657, to_date('11-07-2013 15:26:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3389, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52658, to_date('11-07-2013 15:26:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3391, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52659, to_date('11-07-2013 15:26:26', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52660, to_date('11-07-2013 15:26:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3386, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52661, to_date('11-07-2013 15:26:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3391, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52662, to_date('11-07-2013 15:26:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52663, to_date('11-07-2013 15:27:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3386, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52664, to_date('11-07-2013 15:27:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3391, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52665, to_date('11-07-2013 15:27:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52666, to_date('11-07-2013 15:27:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52667, to_date('11-07-2013 15:28:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
commit;
prompt 1900 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52668, to_date('11-07-2013 15:28:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52669, to_date('11-07-2013 15:28:22', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52670, to_date('11-07-2013 15:28:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52671, to_date('11-07-2013 15:28:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52672, to_date('11-07-2013 15:28:45', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52673, to_date('11-07-2013 15:28:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52674, to_date('11-07-2013 15:28:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52675, to_date('11-07-2013 15:29:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3388, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52676, to_date('11-07-2013 15:29:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52677, to_date('11-07-2013 15:29:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52678, to_date('11-07-2013 15:30:24', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52679, to_date('11-07-2013 15:30:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52680, to_date('11-07-2013 15:31:04', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52681, to_date('11-07-2013 15:31:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3393, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52682, to_date('11-07-2013 15:31:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3394, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52683, to_date('11-07-2013 15:33:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3397, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52684, to_date('11-07-2013 15:39:51', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1846, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52685, to_date('11-07-2013 15:40:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1846, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52686, to_date('11-07-2013 15:40:07', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1846, 42742, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52687, to_date('11-07-2013 15:40:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1846, 45621, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52688, to_date('11-07-2013 15:40:39', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1876, 45621, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52689, to_date('11-07-2013 15:40:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1876, 45621, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52692, to_date('11-07-2013 15:41:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1893, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52693, to_date('11-07-2013 15:41:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1893, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52694, to_date('11-07-2013 15:42:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1893, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52695, to_date('11-07-2013 15:42:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1893, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52696, to_date('11-07-2013 15:42:36', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52697, to_date('11-07-2013 15:42:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52698, to_date('11-07-2013 15:42:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52699, to_date('11-07-2013 15:43:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52700, to_date('11-07-2013 15:43:11', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52701, to_date('11-07-2013 15:43:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52702, to_date('11-07-2013 15:43:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52703, to_date('11-07-2013 15:43:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52704, to_date('11-07-2013 15:43:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52705, to_date('11-07-2013 15:43:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52706, to_date('11-07-2013 15:43:43', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52707, to_date('11-07-2013 15:43:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52708, to_date('11-07-2013 15:43:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52709, to_date('11-07-2013 15:43:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52710, to_date('11-07-2013 15:43:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52711, to_date('11-07-2013 15:44:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3415, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52712, to_date('11-07-2013 15:44:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52713, to_date('11-07-2013 15:44:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52714, to_date('11-07-2013 15:44:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52715, to_date('11-07-2013 15:44:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52716, to_date('11-07-2013 15:44:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52717, to_date('11-07-2013 15:44:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52718, to_date('11-07-2013 15:44:23', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52719, to_date('11-07-2013 15:44:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52720, to_date('11-07-2013 15:44:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52721, to_date('11-07-2013 15:44:29', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52722, to_date('11-07-2013 15:44:30', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52723, to_date('11-07-2013 15:44:32', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52724, to_date('11-07-2013 15:44:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52725, to_date('11-07-2013 15:44:35', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52726, to_date('11-07-2013 15:44:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52727, to_date('11-07-2013 15:44:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52728, to_date('11-07-2013 15:44:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52729, to_date('11-07-2013 15:44:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52730, to_date('11-07-2013 15:44:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52731, to_date('11-07-2013 15:44:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52732, to_date('11-07-2013 15:44:53', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52733, to_date('11-07-2013 15:44:58', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 42548, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52734, to_date('11-07-2013 15:44:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52735, to_date('11-07-2013 15:44:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52736, to_date('11-07-2013 15:45:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52737, to_date('11-07-2013 15:45:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52738, to_date('11-07-2013 15:45:08', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52739, to_date('11-07-2013 15:45:13', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52740, to_date('11-07-2013 15:45:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52741, to_date('11-07-2013 15:45:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52742, to_date('11-07-2013 15:45:18', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3418, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52743, to_date('11-07-2013 15:45:20', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52744, to_date('11-07-2013 15:45:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52745, to_date('11-07-2013 15:45:25', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3418, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52746, to_date('11-07-2013 15:45:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52747, to_date('11-07-2013 15:45:27', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52748, to_date('11-07-2013 15:45:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 3417, 41828, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52749, to_date('11-07-2013 15:45:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52750, to_date('11-07-2013 15:45:50', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 45623, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52751, to_date('11-07-2013 15:45:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.48', 1903, 42552, 49895);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52752, to_date('12-07-2013 09:28:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 2698, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52753, to_date('12-07-2013 09:29:37', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3368, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52754, to_date('12-07-2013 09:29:38', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3368, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52755, to_date('12-07-2013 09:38:19', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3537, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52756, to_date('12-07-2013 09:41:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1601, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52757, to_date('12-07-2013 09:41:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1603, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52758, to_date('12-07-2013 09:41:21', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1601, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52759, to_date('12-07-2013 09:41:46', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1604, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52760, to_date('12-07-2013 09:41:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1604, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52761, to_date('12-07-2013 09:41:52', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1604, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52762, to_date('12-07-2013 09:42:02', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.167', 1604, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52763, to_date('12-07-2013 09:57:03', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.66', 3702, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52764, to_date('12-07-2013 10:01:12', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 1944, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52765, to_date('12-07-2013 10:04:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 2093, 27524, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52771, to_date('12-07-2013 12:55:06', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3367, 42054, 49897);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52772, to_date('12-07-2013 12:55:56', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3362, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52773, to_date('12-07-2013 12:56:01', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3368, 45621, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52774, to_date('12-07-2013 12:58:14', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3447, 42548, 49893);
commit;
prompt 2000 records committed...
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52775, to_date('12-07-2013 12:58:28', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3447, 45623, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52776, to_date('12-07-2013 12:58:42', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3447, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52777, to_date('12-07-2013 12:58:49', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3447, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52778, to_date('12-07-2013 13:50:44', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3676, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52779, to_date('12-07-2013 13:50:47', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3676, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52780, to_date('12-07-2013 13:50:54', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3677, 45615, 49893);
insert into FW_ACTION_LOG (ACT_LOG_ID, ACTION_TIME, CLIENT_IP, CLIENT_PORT, ACTION_ID, ACCT_ID)
values (52781, to_date('12-07-2013 13:50:59', 'dd-mm-yyyy hh24:mi:ss'), '192.168.0.100', 3676, 45615, 49893);
commit;
prompt 2007 records loaded
prompt Loading FW_ACTION_CNT...
prompt Table is empty
prompt Loading FW_CATEGORY...
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (20185, '数据状态', 'status', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (40046, '是否必填', 'notNull', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (40050, '用户身份', 'position', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (40109, '数据库唯一键', 'uniqueKey', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (40143, '数据库外键', 'foreignKey', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (45440, '贷款状态', 'loanStatus', 'A', 2);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (50149, '部门类型', 'groupType', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (45053, '系统功能模块', 'fosFunctionMoudle', 'A', 1);
insert into FW_CATEGORY (CATEGORY_ID, NAME, CODE, DISPLAY, SYS_ID)
values (52174, '资金运营管理系统唯一约束', 'uniqueKey', 'A', 2);
commit;
prompt 9 records loaded
prompt Loading FW_DICTIONARY...
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (20196, 20185, '生效', 'A', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (20197, 20185, '失效', 'D', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40047, 40046, '是', '1', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40048, 40046, '否', '0', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40051, 40050, '普通用户', '11', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40052, 40050, '分管领导', '12', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40204, 40109, '已经存在该字典名称', 'UK_FW_DICTIONARY_NAME', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40183, 40109, '字典目录已经存在于所选择的系统', 'UK_DIC_CATEGORY', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40203, 40109, '已经存在该字典编码', 'UK_FW_DICTIONARY', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40123, 40109, '用户账号已经存在', 'UK_ACCOUNT', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40124, 40109, '角色名称已经存在', 'UK_DUTY', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40125, 40109, '部门名称已经存在', 'UK_GROUP', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40126, 40109, '同一父节点下的资源名称已经存在', 'UK_SOURCE', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40127, 40109, '数据角色名称已经存在', 'UK_DATA_ROLE', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (40144, 40143, '该数据已经被字典明细数据引用。', 'FK_DICTIONARY_CATEGORY', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45447, 45440, '次级', '3', '3', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45451, 45440, '可疑', '4', '4', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45441, 45440, '正常', '1', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45442, 45440, '关注', '2', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45452, 45440, '损失', '5', '5', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (50150, 50149, '报表汇总部门', '1', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45054, 45053, '资金来源滚动计划', '1', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45055, 45053, '资金运用滚动计划', '2', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45057, 45053, '融资管理', '3', '3', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45058, 45053, '集团内部借款', '4', '4', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45059, 45053, '担保管理', '5', '5', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45060, 45053, '创投信息', '6', '6', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (45061, 45053, '委托贷款', '7', '7', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (50163, 50149, '非报表汇总部门', '2', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (52382, 40143, '该数据已被其他用户引用，请先删除与其关联数据。', 'FK_ACCOUNT_GROUP', '3', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (52175, 52174, '相同父节点，相同模块下项目分类名称不能重复', 'UK_PROJECT_CATE', '1', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (52377, 40143, '该数据已被权限数据引用，请先删除与其关联数据。', 'FK_USE_EFW_DATA_ROLE', '2', 'A');
insert into FW_DICTIONARY (DICTIONARY_ID, CATEGORY_ID, NAME, CODE, ORDER_NUM, STATUS)
values (32017, 40143, '该数据已被其他数据表引用，请先删除与其关联数据。', 'FK_AUDIT_GROUP', '4', 'A');
commit;
prompt 33 records loaded
prompt Loading FW_SOURCE...
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (28565, '基础数据', '#', 'A', 1, '040000000000', 0, 1, '菜单描述长度测试正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正正', null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (241, '系统管理', '#', 'A', 1, '020000000000', 0, 1, null, null, null, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (481, '用户管理', 'user.do?actionMethod=query', 'A', 2, '020200000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (501, '角色管理', 'role.do?actionMethod=query', 'A', 2, '020300000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (503, '菜单管理 ', 'source.do?actionMethod=query', 'A', 2, '020500000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (1342, '菜单调整', 'source.do?actionMethod=frame', 'A', 2, '020600000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (9182, '操作日志', 'logger.do?actionMethod=query', 'A', 2, '020900000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (9187, '菜单操作', 'operation.do?actionMethod=query', 'A', 3, '020501000000', 0, 0, null, null, 503, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20199, '数据权限', 'efwDataRole.do?actionMethod=query', 'A', 2, '020400000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20041, '字典管理', 'dicCategory.do?actionMethod=query', 'A', 2, '020700000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20126, '数据权限配置', '#', 'A', 1, '030000000000', 0, 1, null, null, null, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20238, '应用范围设置', 'applyScope.do?actionMethod=query', 'A', 3, '030301000000', 0, 0, null, null, 20682, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27242, '部门管理', 'groupController.do?actionMethod=query', 'A', 2, '020100000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (28568, '项目类目数据配置', 'baseProjectCategories.do?actionMethod=query', 'A', 2, '040100000000', 0, 1, null, null, 28565, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27688, '资金来源滚动计划', '#', 'A', 1, '050000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27507, '融资管理', '#', 'A', 1, '070000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27509, '数据录入', 'financing.do?actionMethod=editQuery', 'A', 2, '070100000000', 0, 1, null, null, 27507, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27512, '数据查询', 'financing.do?actionMethod=query', 'A', 2, '070200000000', 0, 1, null, null, 27507, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (28127, '数据查询', 'fundsOrigin.do?actionMethod=query', 'A', 2, '050200000000', 0, 1, null, null, 27688, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27182, '系统配置', 'system.do?actionMethod=query', 'A', 2, '020800000000', 0, 1, null, null, 241, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (27752, '数据录入', 'fundsOrigin.do?actionMethod=editQuery', 'A', 2, '050100000000', 0, 1, null, null, 27688, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (28274, '报表提交', 'fundsOriginAudit.do?actionMethod=query&opType=editSubmit', 'A', 2, '050300000000', 0, 1, null, null, 27688, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20131, '数据实体', 'sourseEntity.do?actionMethod=query', 'A', 2, '030100000000', 0, 1, null, null, 20126, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20136, '业务模块', 'efwBusinessModule.do?actionMethod=query', 'A', 2, '030200000000', 0, 1, null, null, 20126, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20682, '业务模块配置', 'efwBusinessModuleMap.do?actionMethod=query', 'A', 2, '030300000000', 0, 1, null, null, 20126, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (20073, '字典明细', 'dictionary.do?actionMethod=query', 'A', 3, '020701000000', 0, 0, null, null, 20041, 1);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (40781, '集团内部借款', '#', 'A', 1, '080000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (41271, '资金运用滚动计划', '#', 'A', 1, '060000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (41275, '数据录入', 'fundsApply.do?actionMethod=editQuery', 'A', 2, '060100000000', 0, 1, null, null, 41271, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (41357, '数据查询', 'fundsApply.do?actionMethod=query', 'A', 2, '060200000000', 0, 1, null, null, 41271, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42709, '创投信息', '#', 'A', 1, '100000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42713, '资金收入数据录入', 'iventureCapital.do?actionMethod=editQuery&subType=subIncome', 'A', 2, '100100000000', 0, 1, null, null, 42709, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42715, '数据查询', 'iventureCapital.do?actionMethod=query', 'A', 2, '100300000000', 0, 1, null, null, 42709, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (43373, '数据录入', 'entrustLoan.do?actionMethod=editQuery', 'A', 2, '110100000000', 0, 1, null, null, 43247, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (40384, '期初结转资金配置', 'initSettlement.do?actionMethod=editQuery', 'A', 2, '040200000000', 0, 1, null, null, 28565, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (41366, '报表审核', 'fundsOriginAudit.do?actionMethod=query&opType=audit', 'A', 2, '050400000000', 0, 1, null, null, 27688, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42041, '担保管理', '#', 'A', 1, '090000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42046, '数据录入', 'securityAuthorization.do?actionMethod=editQuery', 'A', 2, '090100000000', 0, 1, null, null, 42041, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42048, '数据查询', 'securityAuthorization.do?actionMethod=query', 'A', 2, '090200000000', 0, 1, null, null, 42041, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42547, '数据提交', 'orgInner.do?actionMethod=querySubmit', 'A', 2, '080300000000', 0, 1, null, null, 40781, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42551, '数据审核', 'orgInner.do?actionMethod=queryAudit', 'A', 2, '080400000000', 0, 1, null, null, 40781, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (45206, '首页', 'homePage.do?actionMethod=query', 'A', 1, '010000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (46423, '资产负债管理', 'assetDebt.do?actionMethod=query', 'A', 2, '040300000000', 0, 1, null, null, 28565, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (48909, '普通部门查询报表', 'fundsGatherView.do?actionMethod=queryLeader', 'A', 2, '120200000000', 0, 1, null, null, 48771, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (48920, '财务及领导查询报表', 'fundsGatherView.do?actionMethod=queryBoss', 'A', 2, '120300000000', 0, 1, null, null, 48771, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (40789, '数据录入', 'orgInner.do?actionMethod=editQuery', 'A', 2, '080100000000', 0, 1, null, null, 40781, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (40791, '数据查询', 'orgInner.do?actionMethod=query', 'A', 2, '080200000000', 0, 1, null, null, 40781, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42731, '报表提交', 'fundsApplyAudit.do?actionMethod=query&submitType=sbReport', 'A', 2, '060300000000', 0, 1, null, null, 41271, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (42733, '报表审核', 'fundsApplyAudit.do?actionMethod=query&submitType=sbAudit', 'A', 2, '060400000000', 0, 1, null, null, 41271, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (44364, '数据提交', 'entrustLoan.do?actionMethod=querySubmitAudit&opType=editSubmit', 'A', 2, '110300000000', 0, 1, null, null, 43247, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (44376, '数据审核', 'entrustLoan.do?actionMethod=querySubmitAudit&opType=audit', 'A', 2, '110400000000', 0, 1, null, null, 43247, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (43247, '委托贷款', '#', 'A', 1, '110000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (43611, '数据查询', 'entrustLoan.do?actionMethod=query', 'A', 2, '110200000000', 0, 1, null, null, 43247, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (48771, '报表汇总', '#', 'A', 1, '120000000000', 0, 1, null, null, null, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (48773, '报表汇总生成', 'fundsGatherSubmit.do?actionMethod=confirmSubmit', 'A', 2, '120100000000', 0, 1, null, null, 48771, 2);
insert into FW_SOURCE (SOURCE_ID, SOURCE_NAME, SOURCE_CODE, STATUS, SOURCE_LEVEL, SOURCE_STYLE, POSITION, IS_MENU, DESCRIPTION, ICON, PARENT_ID, SYS_ID)
values (53121, '资金支出数据录入', 'iventureCapital.do?actionMethod=editQuery&subType=subPay', 'A', 2, '100200000000', 0, 1, null, null, 42709, 2);
commit;
prompt 56 records loaded
prompt Loading FW_SRC_ACTION...
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44072, 27512, '导出融资付息明细', 'exportPaymentInterst', 0, 'query;payInterestDetail;exportPaymentInterst', 1, 'financing.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44226, 40791, '查看集团内部借款付息明细', 'payInterestDetail', 0, 'query;payInterestDetail', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44657, 42715, '导出创投信息', 'export', 0, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44773, 42713, '修改创投信息', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (40236, 27509, '查看融资历史', 'viewHistory', 0, 'editQuery;viewHistory', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42064, 42048, '查询担保数据', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41367, 41366, '资金来源报表审核', 'auditSubmit', 0, 'query;auditSubmit;auditPreview', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42054, 42046, '修改担保数据', 'edit', 1, 'editQuery;edit', 1, 'securityAuthorization.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42060, 42046, '删除担保数据', 'delete', 1, 'editQuery;delete', 1, 'securityAuthorization.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42067, 42048, '导出担保数据', 'export', 0, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42069, 42048, '修改担保数据', 'edit', 1, 'editQuery;edit', 1, 'securityAuthorization.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42548, 42547, '提交集团内部借款数据', 'querySubmit', 1, 'querySubmit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42552, 42551, '审核集团内部借款数据', 'audit', 1, 'audit;queryAudit;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42839, 42715, '查询创投信息', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44545, 40789, '查看集团内部借款付息明细', 'payInterestDetail', 0, 'payInterestDetail;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (45207, 45206, '预警展示', 'show', 0, 'query;viewDetail;queryEntrustLoan', 1, 'homePage.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (45615, 28127, '导出资金来源', 'export', 1, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (45621, 41357, '资金运用导出', 'export', 1, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (45623, 40791, '导出集团内部借款', 'export', 1, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (46424, 46423, '查询', 'query', 0, 'query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (47345, 27509, '导出融资付息明细', 'exportPaymentInterst', 0, 'editQuery;payInterestDetail;exportPaymentInterst', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48910, 48909, '查询', 'query', 0, 'queryLeader', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48913, 48909, '查询预览来源报表', 'originPreview', 0, 'originPreview;export', 2, 'fundsOriginGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48921, 48920, '查询', 'query', 0, 'queryBoss', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48923, 48920, '查询来源汇总报表', 'viewOriGather', 0, 'gatherOriginPreview', 3, 'fundsOriginGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48925, 48920, '查询运用汇总报表', 'applyGather', 0, 'gatherApplyPreview', 2, 'fundsApplyGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (49406, 48909, '查询预览运用报表', 'applyPreview', 0, 'applyPreview;export', 3, 'fundsApplyGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42739, 42731, '资金运用报表编辑提交', 'confirmSubmit', 1, 'confirmSubmit;query;auditPreview', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42742, 42733, '资金运用报表审核', 'auditSubmit', 1, 'query;auditSubmit;auditPreview', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43623, 43611, '修改委托贷款信息', 'edit', 1, 'edit;editQuery', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44369, 44364, '提交委托贷款信息', 'submit', 1, 'querySubmitAudit;auditSubmitPreview;confirmSubmit;query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44389, 44376, '审核委托贷款信息', 'audit', 1, 'querySubmitAudit;auditSubmitPreview;auditSubmit;query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41000, 40789, '录入集团内部借款数据', 'edit', 1, 'editQuery;edit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41002, 40791, '查询集团内部借款数据', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41622, 20682, '应用设置', 'assign', 0, 'query;assign', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41828, 40789, '修改集团内部借款', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42308, 27752, '删除资金来源', 'delete', 1, 'delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42311, 28127, '删除资金来源', 'delete', 1, 'delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43252, 41357, '资金运用删除', 'delete', 1, 'delete', 1, 'fundsApply.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43615, 43611, '查询委托贷款信息', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (48777, 48773, '汇总提交', 'confirmSubmit', 1, 'confirmSubmit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (50187, 48920, '资金来源汇总导出excle', 'excle导出', 1, 'gatherExport', 1, 'fundsOriginGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (50189, 48920, '资金运用汇总导出excle', '导出excle', 1, 'gatherExport', 2, 'fundsApplyGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (50995, 46423, '删除', 'delete', 1, 'delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41073, 27512, '导出融资数据', 'export', 0, 'query;export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43131, 42551, '确认审核', '确认审核', 0, 'audit;queryAudit;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42653, 27182, '修改', '修改', 0, 'query;edit;', 2, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42933, 42547, '提交信息详细', 'auditSubmit', 0, 'auditSubmit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43376, 41275, '删除资金运用', 'delete', 1, 'delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44926, 43373, '查看委托贷款付息明细', 'viewPayDetail', 0, 'payInterestDetail;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44928, 43373, '导出委托贷款付息明细', 'exportPaymentInterst', 0, 'exportPaymentInterst;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44930, 43611, '导出委托贷款付息明细', 'exportPaymentInterst', 0, 'exportPaymentInterst', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (44932, 43611, '查看委托贷款付息明细', 'viewPayDetail', 0, 'payInterestDetail', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (45085, 43611, '导出委托贷款信息', 'exportEntrust', 1, 'export', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (46251, 40791, '导出集团内部借款付息明细', 'exportPayInterest', 1, 'query;payInterestDetail;exportPaymentInterst', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (50837, 48920, '查询平衡分析报表', '平衡分析', 0, 'gatherBalancePreview', 1, 'fundsBalanceGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (50841, 48920, '平衡分析报表导出', 'balanceExport', 1, 'balanceExport', 1, 'fundsBalanceGather.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (51779, 42715, '创投信息修改', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (51914, 42715, '删除', 'delete', 1, 'delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (53122, 53121, '录入创投信息', 'add', 1, 'editQuery', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (53124, 53121, '删除创投信息', 'delete', 1, 'editQuery;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (53126, 53121, '修改创投信息', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28569, 28568, '查询', 'query', 0, 'init;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28571, 28568, '编辑', 'edit', 0, 'init;query;add;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28573, 28568, '删除', 'delete', 1, 'init;query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (548, 501, '查询角色', 'query', 0, 'init;query;condition', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (549, 501, '删除角色', 'delete', 2, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (562, 501, '编辑角色', 'edit', 2, 'init;query;add;edit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (566, 481, '查询用户', 'query', 0, 'init;query;condition;view', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (567, 481, '删除用户', 'delete', 2, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (569, 481, '编辑用户', 'edit', 2, 'init;query;add;edit;updateUser;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (586, 503, '编辑菜单', 'edit', 2, 'init;query;add;edit;condition', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (587, 503, '查询菜单', 'query', 0, 'init;query;condition', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (588, 503, '删除菜单', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (1343, 1342, '菜单调整', 'assign', 0, 'init;adjust;frame;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (6540, 481, '分配功能角色', 'assign', 0, 'init;query;assign', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (6541, 501, '分配操作权限', 'assignFunction', 0, 'init;assignFunction;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (6747, 9187, '编辑菜单操作', 'edit', 2, 'init;query;add;edit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (6748, 9187, '查询菜单操作', 'query', 0, 'init;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (6749, 9187, '删除菜单操作', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (9185, 503, '设置菜单操作', 'assign', 2, 'init;assign', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (9190, 9182, '查询日志', 'query', 0, 'init;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (10477, 9182, '备份日志', 'backup', 0, 'init;query;backup', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (10480, 9182, '删除日志', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20075, 20041, '查询', 'query', 0, 'int;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20077, 20041, '编辑', 'edit;', 0, 'init;query;add;edit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20079, 20041, '字典操作', 'assign', 0, 'init;query;assign;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20124, 20041, '删除', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20200, 20199, '查询', 'query', 0, 'init;query;condition;viewDataRole;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20202, 20199, '删除', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20204, 20199, '编辑', 'edit', 0, 'init;query;add;edit;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20206, 20199, '分配数据', 'assign', 0, 'init;query;assign;getModuleAuthority;assignDataAuthority;getFieldDataAuthority;queryDataEntity;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20239, 20238, '查询', 'query', 0, 'init;query;condition', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20242, 20238, '删除', 'delete', 2, 'init;query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20246, 20238, '编辑', 'edit', 2, 'init;edit;add', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (26454, 9187, '返回', 'query', 2, 'init;query;assign', 1, 'source.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27243, 27242, '查询', 'query', 0, 'init;query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27245, 27242, '编辑', 'edit', 2, 'init;query;add;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27247, 27242, '删除', 'delete', 2, 'init;query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27695, 20041, '添加字典', '添加字典', 2, 'add;query;delete;edit', 1, 'dictionary.do');
commit;
prompt 100 records committed...
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28192, 28127, '修改资金来源', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27514, 27512, '查询融资数据', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27520, 27509, '录入融资数据', 'editQuery', 1, 'editQuery;edit;add', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27522, 27509, '查看融资付息明细', 'payDetail', 0, 'editQuery;payInterestDetail', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27524, 27509, '修改融资数据', 'edit', 1, 'editQuery;edit', 1, 'financing.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27526, 27509, '删除融资数据', 'delete', 1, 'editQuery;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27578, 27512, '查看融资付息明细', 'payDetail', 0, 'query;payInterestDetail', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27580, 27512, '查看融资历史明细', 'viewHistory', 0, 'query;viewHistory', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28129, 28127, '查询资金来源', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (30453, 481, '分配数据角色', 'assignData', 0, 'assign', 1, 'userDataRole.do?actionMethod=assign');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27184, 27182, '查询', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27186, 27182, '新增', 'add', 0, 'query;add;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20137, 20136, '查询角色', 'query', 0, 'init;query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20139, 20136, '删除角色', 'delete', 2, 'init;query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20141, 20136, '编辑角色', 'edit', 2, 'init;query;add;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20685, 20682, '查询', 'query', 0, 'init;query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20691, 20682, '删除', 'delete', 2, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20694, 20682, '编辑', 'edit', 2, 'init;query;add;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20830, 20131, '删除', 'delete', 0, 'init;query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41369, 41357, '资金运用查询', 'query', 0, 'query', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20081, 20073, '查询', 'query', 0, 'init;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20083, 20073, '编辑', 'edit', 0, 'init;query;add;edit;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20127, 20073, '删除', 'delete', 0, 'init;query;delete;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20532, 20131, '编辑', 'edit', 0, 'init;edit;add;query', 2, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (20181, 20131, '查询角色', 'query', 0, 'init;query;', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (30370, 28274, '提交', 'confirmSubmit', 1, 'confirmSubmit;query;auditPreview', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41362, 41357, '资金运用修改', 'edit', 1, 'editQuery;edit', 1, 'fundsApply.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (28335, 27182, '删除', 'delete', 0, 'query;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (27762, 27752, '录入资金来源', 'editQuery', 0, 'editQuery;add;edit;copyOrigin', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41255, 40384, '删除', 'delete', 1, 'editQuery;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41257, 40384, '修改', 'edit', 1, 'editQuery;edit;add', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41352, 41275, '录入资金运用', 'editQuery', 1, 'editQuery;edit;add;copyApply', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41520, 27512, '修改融资信息', 'edit', 1, 'editQuery;edit', 1, 'financing.do');
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (41911, 40789, '删除集团内部借款', 'delete', 1, 'editQuery;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42717, 42713, '录入创投信息', '录入', 1, 'editQuery', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (42719, 42713, '删除创投信息', 'delete', 1, 'editQuery;delete', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43482, 43373, '录入委托贷款数据', 'edit', 1, 'editQuery;edit', 1, null);
insert into FW_SRC_ACTION (ACTION_ID, SOURCE_ID, ACTION_NAME, METHOD_NAME, LOG_LEVEL, ACTION_METHODS, ACTION_ORDER, ACTION_PATH)
values (43486, 43373, '删除委托贷款数据', 'delete', 1, 'delete;', 1, null);
commit;
prompt 138 records loaded
prompt Loading FW_DUTY_ACTION...
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73410, 27243, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73411, 27245, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73412, 27247, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73413, 566, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73414, 567, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73415, 569, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73416, 6540, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73417, 30453, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73418, 548, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73419, 549, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73420, 562, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73421, 6541, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73422, 20200, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73423, 20202, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73424, 20204, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73425, 20206, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73426, 6747, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73427, 6748, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73428, 6749, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73429, 26454, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73430, 586, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73431, 587, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73432, 588, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73433, 9185, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73434, 1343, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73435, 20081, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73436, 20083, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73437, 20127, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73438, 20075, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73439, 20077, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73440, 20079, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73441, 20124, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73442, 27695, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73443, 42653, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73444, 27184, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73445, 27186, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73446, 28335, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73447, 9190, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73448, 10477, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73449, 10480, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73450, 20830, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73451, 20532, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73452, 20181, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73453, 20137, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73454, 20139, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73455, 20141, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73456, 20239, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73457, 20242, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73458, 20246, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73459, 41622, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73460, 20685, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73461, 20691, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (73462, 20694, 1);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51589, 51779, 49926);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51590, 44657, 49926);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51591, 42839, 49926);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51623, 42717, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51624, 42719, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51625, 44773, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51626, 51779, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51627, 51914, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51628, 44657, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51629, 42839, 49922);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51606, 53122, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51607, 53124, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51608, 53126, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51609, 51779, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51610, 51914, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51611, 44657, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51612, 42839, 49924);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51270, 46424, 51269);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51271, 50995, 51269);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51868, 41255, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51869, 41257, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51870, 48777, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51871, 48910, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51872, 48913, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51873, 49406, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51874, 48921, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51875, 48923, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51876, 48925, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51877, 50187, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51878, 50189, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51879, 50837, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51880, 50841, 49933);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53430, 46251, 53428);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53431, 45623, 53428);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53794, 45207, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53795, 27243, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53796, 27245, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53797, 27247, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53798, 566, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53799, 567, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53800, 569, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53801, 6540, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53802, 30453, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53803, 548, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52062, 43615, 52060);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52063, 44930, 52060);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52064, 44932, 52060);
commit;
prompt 100 records committed...
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52065, 45085, 52060);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52096, 44926, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52097, 44928, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52098, 43482, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52099, 43486, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52100, 43623, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52101, 43615, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52102, 44930, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52103, 44932, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52104, 45085, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52105, 44369, 49928);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53804, 549, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53805, 562, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53806, 6541, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53807, 20200, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53808, 20202, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53809, 20204, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53810, 20206, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53811, 9190, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53812, 10477, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53813, 10480, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53814, 28569, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53815, 28571, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53816, 28573, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53817, 41255, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53818, 41257, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53819, 46424, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53820, 50995, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53821, 42308, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53822, 27762, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53823, 42311, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53824, 28192, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53825, 28129, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53826, 45615, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53827, 30370, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53828, 41367, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53829, 43376, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53830, 41352, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53831, 43252, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53832, 41369, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53833, 41362, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53834, 45621, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53835, 42739, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53836, 42742, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53837, 47345, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53838, 27520, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53839, 27522, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53840, 27524, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53841, 27526, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53842, 40236, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53843, 41073, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53844, 27514, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53845, 27578, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53846, 27580, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53847, 41520, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53848, 44072, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53849, 41000, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53850, 41828, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53851, 41911, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53852, 44545, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53853, 45623, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53854, 41002, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53855, 46251, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53856, 44226, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53857, 42933, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53858, 42548, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53859, 43131, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53860, 42552, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53861, 42054, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53862, 42060, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53863, 42064, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53864, 42067, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53865, 42069, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53866, 42717, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53867, 42719, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53868, 44773, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53869, 53122, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53870, 53124, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53871, 53126, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53872, 51779, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53873, 51914, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53874, 44657, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53875, 42839, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53876, 44926, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53877, 44928, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53878, 43482, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53879, 43486, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53880, 43623, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53881, 43615, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53882, 44930, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53883, 44932, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53884, 45085, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53885, 44369, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53886, 44389, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53887, 48777, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53888, 48910, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53889, 48913, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53890, 49406, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53891, 48921, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53892, 48923, 3);
commit;
prompt 200 records committed...
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53893, 48925, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53894, 50187, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53895, 50189, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53896, 50837, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53897, 50841, 3);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51993, 45207, 51984);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50013, 27762, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50014, 42308, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50015, 45615, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50016, 28192, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50017, 42311, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50018, 30370, 49860);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50019, 41352, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50020, 43376, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50021, 41362, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50022, 45621, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50023, 43252, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50024, 42739, 49862);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50033, 47345, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50034, 27524, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50035, 40236, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50036, 27520, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50037, 27526, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50038, 41520, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50039, 44072, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50040, 27580, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50041, 41073, 49909);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50042, 41520, 49911);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50043, 44072, 49911);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50044, 27580, 49911);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50045, 41073, 49911);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50056, 42054, 49918);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50057, 42060, 49918);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50058, 42069, 49918);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50059, 42067, 49918);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50060, 42069, 49920);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (50061, 42067, 49920);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51284, 41000, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51285, 41828, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51286, 41911, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51287, 44545, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51288, 45623, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51289, 46251, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51290, 42933, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (51291, 42548, 49913);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52345, 45623, 49915);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52346, 46251, 49915);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52347, 43131, 49915);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52348, 42552, 49915);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53722, 45207, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52321, 45207, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52322, 43252, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52323, 41369, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52324, 41362, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52325, 45621, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52326, 42742, 49866);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52327, 45207, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52328, 42311, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52329, 28192, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52330, 28129, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52331, 45615, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52332, 41367, 49864);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52333, 45207, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52334, 43623, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52335, 43615, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52336, 44930, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52337, 44932, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52338, 45085, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (52339, 44389, 49930);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53723, 44072, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53724, 27580, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53725, 41073, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53726, 46251, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53727, 45623, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53728, 42067, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53729, 44657, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53730, 51779, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53731, 43615, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53732, 44932, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53733, 44930, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53734, 45085, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53735, 49406, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53736, 48910, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53737, 48913, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53738, 50837, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53739, 50187, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53740, 48921, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53741, 50841, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53742, 48923, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53743, 48925, 49935);
insert into FW_DUTY_ACTION (DUTY_ACTION_ID, ACTION_ID, DUTY_ID)
values (53744, 50189, 49935);
commit;
prompt 291 records loaded
prompt Loading FW_LOGIN...
prompt Table is empty
prompt Loading FW_SYSTEM...
insert into FW_SYSTEM (SYS_ID, SYS_NAME, STATUS, DESCRIPTION, SYS_IP, SYS_CODE, SYS_PORT, CONTEXT_PATH)
values (2, '资金平台', 'A', '资金测试平台', 'localhost', 'fos', 8080, '/fos');
insert into FW_SYSTEM (SYS_ID, SYS_NAME, STATUS, DESCRIPTION, SYS_IP, SYS_CODE, SYS_PORT, CONTEXT_PATH)
values (1, '默认系统', 'A', '默认系统', 'localhost', 'default', 8080, '/template');
commit;
prompt 2 records loaded
prompt Enabling foreign key constraints for EFW_BUSINESS_MODULE_MAP...
alter table EFW_BUSINESS_MODULE_MAP enable constraint FK_EFW_BUSINESS_MAP;
alter table EFW_BUSINESS_MODULE_MAP enable constraint FK_EFW_ENTITY_SOURCE;
prompt Enabling foreign key constraints for EFW_APPLY_SCOPE...
alter table EFW_APPLY_SCOPE enable constraint FK_MODULE_MAP_REL_APPLY_SCOPE;
prompt Enabling foreign key constraints for EFW_DATA_ROLE_AUTHORITY...
alter table EFW_DATA_ROLE_AUTHORITY enable constraint FK_DATA_ROLE;
alter table EFW_DATA_ROLE_AUTHORITY enable constraint FK_ENTITY_R_DATA_AUTHORITY;
alter table EFW_DATA_ROLE_AUTHORITY enable constraint FK_MODULE_R_DATA_AUTHORITY;
prompt Enabling foreign key constraints for EFW_USER_DATA_ROLE...
alter table EFW_USER_DATA_ROLE enable constraint FK_USE_EFW_DATA_ROLE;
prompt Enabling foreign key constraints for FW_GROUP...
alter table FW_GROUP enable constraint FK_PARENT;
prompt Enabling foreign key constraints for FOS_AUDITING_REPORTS_RECORD...
alter table FOS_AUDITING_REPORTS_RECORD enable constraint FK_AUDIT_GROUP;
prompt Enabling foreign key constraints for FOS_ENTRUST_LOAN...
alter table FOS_ENTRUST_LOAN enable constraint FK_ENTRUST_LOAN_REF_GROUP;
prompt Enabling foreign key constraints for FOS_EXPORT_REPORTS_RECORD...
alter table FOS_EXPORT_REPORTS_RECORD enable constraint FK_EX_REPORTS_REF_GROUP;
prompt Enabling foreign key constraints for FOS_FINANCING_DETAILS...
alter table FOS_FINANCING_DETAILS enable constraint FK_FINANCING_DETAILS_REF_GROUP;
prompt Enabling foreign key constraints for FOS_INTERIOR_LOAN...
alter table FOS_INTERIOR_LOAN enable constraint FK_INTERIOR_LOAN_REF_GROUP;
prompt Enabling foreign key constraints for FOS_REJECT_REASON_RECORD...
alter table FOS_REJECT_REASON_RECORD enable constraint FK_RE_REF_AUDITING;
prompt Enabling foreign key constraints for FOS_REPORTS_DETAILS...
alter table FOS_REPORTS_DETAILS enable constraint FK_REPORTS_REF_GROUP;
prompt Enabling foreign key constraints for FOS_SECURITY_AUTHORIZATION...
alter table FOS_SECURITY_AUTHORIZATION enable constraint FK_SECURITY_REF_STAFF;
prompt Enabling foreign key constraints for FOS_SOURCE_USE_FUNDS...
alter table FOS_SOURCE_USE_FUNDS enable constraint FK_SOURCE_REF_STAFF;
prompt Enabling foreign key constraints for FOS_TEMP_SOURCE_USE_FUNDS...
alter table FOS_TEMP_SOURCE_USE_FUNDS enable constraint FK_TEMP_SOURCE_REF_STAFF;
prompt Enabling foreign key constraints for FW_ACCOUNT...
alter table FW_ACCOUNT enable constraint FK_ACCOUNT_GROUP;
prompt Enabling foreign key constraints for FW_DUTY...
alter table FW_DUTY enable constraint FK_DUTY_GRUOP;
prompt Enabling foreign key constraints for FW_ACCOUNT_DUTY...
alter table FW_ACCOUNT_DUTY enable constraint FK_AD_ACCOUNT;
alter table FW_ACCOUNT_DUTY enable constraint FK_AD_DUTY;
prompt Enabling foreign key constraints for FW_ACTION_CNT...
alter table FW_ACTION_CNT enable constraint FK_CNT_LOG;
prompt Enabling foreign key constraints for FW_DICTIONARY...
alter table FW_DICTIONARY enable constraint FK_DICTIONARY_CATEGORY;
prompt Enabling foreign key constraints for FW_SOURCE...
alter table FW_SOURCE enable constraint FK_SOURCE_PARENT;
prompt Enabling foreign key constraints for FW_SRC_ACTION...
alter table FW_SRC_ACTION enable constraint FK_ACTION_SOURCE;
prompt Enabling foreign key constraints for FW_DUTY_ACTION...
alter table FW_DUTY_ACTION enable constraint FK_DA_DUTY;
alter table FW_DUTY_ACTION enable constraint FK_FW_DUTY_SRC;
set feedback on
set define on
prompt Done.
