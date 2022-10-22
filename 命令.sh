# Sqoop导入数据
# 商品SKU表
bin/sqoop import \
  --connect jdbc:mysql://81.69.56.215:3306/dailyfresh?zeroDateTimeBehavior=CONVERT_TO_NULL \
  --username root \
  --password 7464c98e135ccea2 \
  --table goods_sku \
  --hive-import \
  --hive-overwrite \
  --hive-table goods_sku \
  --fields-terminated-by "\t"
# 订单信息表
bin/sqoop import \
  --connect jdbc:mysql://81.69.56.215:3306/dailyfresh?zeroDateTimeBehavior=CONVERT_TO_NULL \
  --username root \
  --password 7464c98e135ccea2 \
  --table order_info \
  --hive-import \
  --hive-overwrite \
  --hive-table order_info \
  --fields-terminated-by "\t"
# 商品订单表
bin/sqoop import \
  --connect jdbc:mysql://81.69.56.215:3306/dailyfresh?zeroDateTimeBehavior=CONVERT_TO_NULL \
  --username root \
  --password 7464c98e135ccea2 \
  --table order_goods \
  --hive-import \
  --hive-overwrite \
  --hive-table order_goods \
  --fields-terminated-by "\t"
# 将hadoop的数据迁移到mysql表中
bin/sqoop export \
  --connect jdbc:mysql://81.69.56.215:3306/dailyfresh?useUnicode=true&characterEncoding=utf-8&zeroDateTimeBehavior=CONVERT_TO_NULL \
  --username root \
  --password 7464c98e135ccea2 \
  --export-dir '/goodsshop_tmp/20221018' \
  --table mr_result \
  --fields-terminated-by '*'

nvedln1002@sandbox.com