-- CREATE TABLE `jc_abnormal_day` (
--  `db` varchar(20) DEFAULT NULL COMMENT '区分博圣和博圣以外',
--  `source` varchar(20) DEFAULT NULL COMMENT '表来源',
--  `tb_name` varchar(50) DEFAULT NULL COMMENT '表名',
--   `ddate` date DEFAULT NULL COMMENT '数据时间',
--  `err_col_id` varchar(50) DEFAULT NULL COMMENT '问题字段id',
--  `err_value` varchar(50) DEFAULT NULL COMMENT '问题值',
--  `err_value2` varchar(250) DEFAULT NULL COMMENT '问题值辅助',
--  `type` varchar(50) DEFAULT NULL COMMENT '问题类型',
--  `leve` int(2) DEFAULT NULL COMMENT '严重等级，1日常，2影响数据库，3影响bi',
--  `date` date DEFAULT NULL COMMENT '记录问题时间'
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='数据检测历史表';

-- u8相关模型
-- truncate table tracking.jc_abnormal_day;
insert into tracking.jc_abnormal_day
select distinct 'UFDATA_111'
      ,'edw' as source
      ,'ar_detail' as tb_name
      ,null
      ,'cinvcode' as err_col_id
      ,cinvcode as err_value
      ,null as err_value2
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.ar_detail where true_cinvcode = '请核查'
;

insert into tracking.jc_abnormal_day
select distinct 
       case when left(db,10) = 'UFDATA_889' then 'UFDATA_889' 
            when left(db,10) = 'UFDATA_222' then 'UFDATA_222' 
            when left(db,10) = 'UFDATA_588' then 'UFDATA_588' 
            when left(db,10) = 'UFDATA_555' then 'UFDATA_555' 
            when left(db,10) = 'UFDATA_170' then 'UFDATA_170'
            else 'UFDATA_111' end
      ,'edw' as source
      ,'dispatch_order' as tb_name
      ,ddate
      ,'cinvcode' as err_col
      ,cinvcode as err_value
      ,cinvname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from (select * from edw.dispatch_order where bi_cinvcode = '请核查' order by ddate asc) a
 where state <> '无效'
 group by cinvcode 
;

insert into tracking.jc_abnormal_day
select distinct 
       case when left(db,10) = 'UFDATA_889' then 'UFDATA_889' 
            when left(db,10) = 'UFDATA_222' then 'UFDATA_222' 
            when left(db,10) = 'UFDATA_588' then 'UFDATA_588' 
            when left(db,10) = 'UFDATA_555' then 'UFDATA_555' 
            when left(db,10) = 'UFDATA_170' then 'UFDATA_170'
            else 'UFDATA_111' end
      ,'edw' as source
      ,'invoice_order' as tb_name
      ,ddate
      ,'cinvcode' as err_col
      ,cinvcode as err_value
      ,cinvname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from (select * from edw.invoice_order where bi_cinvcode = '请核查' order by ddate asc) a
 where state <> '无效'
 group by cinvcode 
;

insert into tracking.jc_abnormal_day
select distinct 
       case when left(db,10) = 'UFDATA_889' then 'UFDATA_889' 
            when left(db,10) = 'UFDATA_222' then 'UFDATA_222' 
            when left(db,10) = 'UFDATA_588' then 'UFDATA_588' 
            when left(db,10) = 'UFDATA_555' then 'UFDATA_555' 
            when left(db,10) = 'UFDATA_170' then 'UFDATA_170'
            else 'UFDATA_111' end
      ,'edw' as source
      ,'outdepot_order' as tb_name
      ,ddate
      ,'cinvcode' as err_col
      ,cinvcode as err_value
      ,null as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from (select * from edw.outdepot_order where bi_cinvcode = '请核查' order by ddate asc) a
 where state <> '无效'
 group by cinvcode,db
;

insert into tracking.jc_abnormal_day
select distinct 
       case when left(db,10) = 'UFDATA_889' then 'UFDATA_889' 
            when left(db,10) = 'UFDATA_222' then 'UFDATA_222' 
            when left(db,10) = 'UFDATA_588' then 'UFDATA_588' 
            when left(db,10) = 'UFDATA_555' then 'UFDATA_555' 
            when left(db,10) = 'UFDATA_170' then 'UFDATA_170'
            else 'UFDATA_111' end
      ,'edw' as source
      ,'sales_order' as tb_name
      ,ddate
      ,'cinvcode' as err_col
      ,cinvcode as err_value
      ,null as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from (select * from edw.sales_order where bi_cinvcode = '请核查' order by ddate asc) a
 where state <> '无效'
 group by cinvcode 
;


insert into tracking.jc_abnormal_day
select distinct 
       'excel'
      ,'edw' as source
      ,'x_eq_launch' as tb_name
      ,null
      ,'cinvcode_oir' as err_col
      ,cinvcode_oir as err_value
      ,cinvname_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_eq_launch where cinvcode = '请核查'
;

insert into tracking.jc_abnormal_day
select distinct 
       'excel'
      ,'edw' as source
      ,'x_sales_bkgr' as tb_name
      ,null
      ,'true_product_code' as err_col
      ,true_product_code as err_value
      ,true_product_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_sales_bkgr where bi_cinvcode = '请核查'
;

insert into tracking.jc_abnormal_day
select distinct 
       'excel'
      ,'edw' as source
      ,'x_ldt_list_before' as tb_name
      ,null
      ,'true_product_code' as err_col
      ,true_product_code as err_value
      ,true_product_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_ldt_list_before where bi_cinvcode = '请核查'
;

-- 进行拆分
insert into tracking.jc_abnormal_day
select distinct 
       'BKJC'
      ,'edw' as source
      ,'x_sales_bk' as tb_name
      ,null
      ,'product_ori' as err_col
      ,null as err_value
      ,product_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_sales_bk where bi_cinvcode = '请核查' and (db = 'bk' or db = 'BK')
;
insert into tracking.jc_abnormal_day
select distinct 
       'ZYJC'
      ,'edw' as source
      ,'x_sales_bk' as tb_name
      ,null
      ,'product_ori' as err_col
      ,null as err_value
      ,product_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_sales_bk where bi_cinvcode = '请核查' and (db = 'ZYSY' or db = 'ZYJK')
;

insert into tracking.jc_abnormal_day
select distinct 
       'TEMP'
      ,'edw' as source
      ,'x_sales_bk' as tb_name
      ,null
      ,'product_ori' as err_col
      ,null as err_value
      ,product_ori as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_sales_bk where bi_cinvcode = '请核查' and (db = 'JYMT' or db = 'XJ')
;


insert into tracking.jc_abnormal_day
select distinct 
       'excel'
      ,'edw' as source
      ,'x_sales_hospital' as tb_name
      ,null
      ,'cinvname' as err_col
      ,null as err_value
      ,cinvname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_sales_hospital where bi_cinvcode = '请核查'
;

insert into tracking.jc_abnormal_day
select distinct 
       'BKJC'
      ,'edw' as source
      ,'x_ldt_bk' as tb_name
      ,null
      ,'cinvname' as err_col
      ,null as err_value
      ,cinvname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.x_ldt_bk where bi_cinvcode = '请核查'
;

-- 药监数据库相关的产品
insert into tracking.jc_abnormal_day
select distinct 
       'yj'
      ,'edw' as source
      ,'yj_outdepot' as tb_name
      ,null
      ,'sproductcode' as err_col
      ,left(sproductcode,7) as err_value
      ,sproductname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.yj_outdepot where bi_cinvcode = '请核查' and sproductcode is not null
;

insert into tracking.jc_abnormal_day
select distinct 
       'yj'
      ,'edw' as source
      ,'yj_invoince_stock' as tb_name
      ,null
      ,'sproductcode' as err_col
      ,left(sproductcode,7) as err_value
      ,sproductname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.yj_invoince_stock where bi_cinvcode = '请核查'
;

-- crm相关流程数据产品清洗
insert into tracking.jc_abnormal_day
select distinct 
       'crm'
      ,'edw' as source
      ,'crm_account_equipments' as tb_name
      ,null
      ,'new_product_code' as err_col
      ,new_product_code as err_value
      ,new_product_name as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.crm_account_equipments where bi_cinvcode = '请核查'
;
-- 合同的产品清洗是按照类型+编码，需要剥除出来
insert into tracking.jc_abnormal_day
select distinct 
       'crm'
      ,'edw' as source
      ,'cm_contract' as tb_name
      ,null
      ,'cinvcode' as err_col
      ,e.cinvcode as err_value
      ,e.cinvname as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from edw.cm_contract a 
  left join (select * from edw.inventory group by cinvcode,cinvccode) e
    on left(a.strCode,11) = concat(e.cinvccode,e.cinvcode)
 where a.bi_cinvcode = '请核查'
;
-- ao报价表
insert into tracking.jc_abnormal_day
select distinct 
       'oa'
      ,'edw' as source
      ,'oa_uf_shebeicpqd' as tb_name
      ,null
      ,'chanpinbh_cinvcode' as err_col
      ,a.chanpinbh as err_value
      ,a.chanpinmc as err_col_name
      ,'产品清洗' as type
      ,1 as leve
      ,CURDATE( ) as date
  from ufdata.oa_uf_shebeicpqd a
  left join (select * from edw.dic_inventory group by cinvcode) b
    on a.chanpinbh = b.cinvcode
 where b.cinvcode is null
;

-- 产品编号变动监控
insert into tracking.jc_abnormal_day
select distinct 
       'oa'
      ,'bidata' as source
      ,tab_name as tb_name
      ,null
      ,cloumn as err_col
      ,a.cinvcode as err_value
      ,null
      ,'产品编码变动' as type
      ,1 as leve
      ,CURDATE( ) as date
  from (select distinct 'bi_cinvcode' as cloumn,  'dt_14_inventory' as tab_name ,bi_cinvcode as cinvcode from bidata.dt_14_inventory where bi_cinvcode not in('老产品','请核查') union
        select distinct 'bi_cinvcode' as cloumn,  'ft_101_work_order' as tab_name ,bi_cinvcode as cinvcode from bidata.ft_101_work_order where bi_cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_111_sales_order' as tab_name ,cinvcode as cinvcode from bidata.ft_111_sales_order where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_11_sales' as tab_name ,cinvcode as cinvcode from bidata.ft_11_sales where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_121_marketprice' as tab_name ,cinvcode as cinvcode from bidata.ft_121_marketprice where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_12_sales_budget' as tab_name ,cinvcode as cinvcode from bidata.ft_12_sales_budget where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_13_sales_budget_new' as tab_name ,cinvcode as cinvcode from bidata.ft_13_sales_budget_new where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_14_sales_hzbs' as tab_name ,cinvcode as cinvcode from bidata.ft_14_sales_hzbs where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_21_outdepot' as tab_name ,cinvcode as cinvcode from bidata.ft_21_outdepot where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_23_outdepot_forecast' as tab_name ,cinvcode as cinvcode from bidata.ft_23_outdepot_forecast where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_25_outdepot_hzbs' as tab_name ,cinvcode as cinvcode from bidata.ft_25_outdepot_hzbs where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_26_outdepot_yj' as tab_name ,cinvcode as cinvcode from bidata.ft_26_outdepot_yj where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_31_checklist' as tab_name ,cinvcode as cinvcode from bidata.ft_31_checklist where cinvcode not in('老产品','请核查') union
        select distinct 'true_cinvcode' as cloumn,'ft_51_ar' as tab_name ,true_cinvcode as cinvcode from bidata.ft_51_ar where true_cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_61_dispatch' as tab_name ,cinvcode as cinvcode from bidata.ft_61_dispatch where cinvcode not in('老产品','请核查') union
        select distinct 'cinvcode' as cloumn,     'ft_111_sales_order' as tab_name ,cinvcode as cinvcode from bidata.ft_111_sales_order where cinvcode not in('老产品','请核查')
       ) a
  left join (select * from edw.dic_inventory group by bi_cinvcode) b
    on a.cinvcode = b.bi_cinvcode
 where b.cinvcode is null
   and a.cinvcode is not null
;


-- 更新只有编号没有名称的产品
update tracking.jc_abnormal_day a
 inner join (select * from ufdata.inventory where db = 'UFDATA_889_2019') b
    on a.err_value = b.cinvcode
   set a.err_value2 = b.cinvname
 where a.err_value2 is null
   and a.db = 'UFDATA_889'
;

update tracking.jc_abnormal_day a
 inner join (select * from ufdata.inventory where db = 'UFDATA_222_2019') b
    on a.err_value = b.cinvcode
   set a.err_value2 = b.cinvname
 where a.err_value2 is null
   and a.db = 'UFDATA_222'
;

update tracking.jc_abnormal_day a
 inner join (select * from ufdata.inventory where db = 'UFDATA_588_2019') b
    on a.err_value = b.cinvcode
   set a.err_value2 = b.cinvname
 where a.err_value2 is null
   and a.db = 'UFDATA_588'
;

update tracking.jc_abnormal_day a
 inner join (select * from ufdata.inventory where db = 'UFDATA_111_2018') b
    on a.err_value = b.cinvcode
   set a.err_value2 = b.cinvname
 where a.err_value2 is null
   and a.db = 'UFDATA_111'
;

update tracking.jc_abnormal_day a
 inner join (select * from ufdata.inventory where db = 'UFDATA_555_2018') b
    on a.err_value = b.cinvcode
   set a.err_value2 = b.cinvname
 where a.err_value2 is null
   and a.db = 'UFDATA_555'
;












