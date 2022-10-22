-- Hive创建表
-- 商品SKU
CREATE TABLE goods_sku
(
    id        int,
    is_delete int,
    name      string, -- 商品名称
    desc      string, -- 商品描述
    price     float,  -- 商品价格
    unite     string, -- 商品单位
    image     string, -- 商品图片
    stock     int,    -- 商品库存
    sales     int,    -- 商品销量
    status    int,    -- 商品状态
    goods_id  int,    -- 商品SPU
    type_id   int     -- 商品种类
)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
-- 订单信息
CREATE TABLE order_info
(
    is_delete     int,
    order_id      string, -- 订单id
    pay_method    int,    -- 支付方式(1微信 2支付宝 3银行卡)
    total_count   int,    -- 商品数量
    total_price   float,  -- 商品价格
    transit_price float,  -- 运费
    order_status  int,    -- 订单状态(1待支付 2待发货 3待收货 4完成)
    trade_no      string, -- 支付编号
    addr_id       int,    -- 地址id
    user_id       int     -- 用户id
)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
-- 商品订单
CREATE TABLE order_goods
(
    id        int,
    is_delete int,
    count     int,    -- 商品数目
    price     float,
    comment   string, -- 评论
    order_id  string, -- 订单id
    sku_id    int     -- sku id
)
    ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
SET hive.auto.convert.join=false;-- 三表联查，统计出售商品的数量
SELECT sku.name, SUM(goods.count)
FROM order_info info,
     order_goods goods,
     goods_sku sku
WHERE sku.id = goods.sku_id
  AND info.order_id = goods.order_id
  AND info.order_status = 4
GROUP BY(sku.name);
-- 执行保存到HDFS的语句
INSERT OVERWRITE DIRECTORY "/goodsshop_tmp/20221018"
SELECT CONCAT(sku.name, '*', SUM(goods.count))
FROM order_info info,
     order_goods goods,
     goods_sku sku
WHERE sku.id = goods.sku_id
  AND info.order_id = goods.order_id
  AND info.order_status = 4
GROUP BY(sku.name);

SELECT *
FROM goods_sku;
SELECT *
FROM order_goods;
SELECT *
FROM order_info;
SET hive.exec.mode.local.auto=false;
-- 执行保存到hdfs的语句

drop TABLE goods_sku;
DROP TABLE order_info;
DROP TABLE order_goods