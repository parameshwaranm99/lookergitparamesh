# view: incremental_sqlpdt{
#   derived_table: {

#     datagroup_trigger: paramesh_01_datagroup
#     increment_key: "orders_created_date"
#     increment_offset: 3
#     sql: SELECT
#           (DATE(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles'))) AS `orders.created_date`,
#           orders.id  AS `orders.id`,
#           COUNT(*) AS `orders.count`
#       FROM demo_db.orders  AS orders
#       WHERE {%incrementcondition} orders.created_at {%endincrementcondition%}
#       GROUP BY
#           1,
#           2
#       ORDER BY
#           (DATE(CONVERT_TZ(orders.created_at ,'UTC','America/Los_Angeles'))) DESC
#       LIMIT 500
#       ;;
#   }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   dimension: orders_created_date {
#     type: date
#     sql: ${TABLE}.`orders.created_date` ;;
#   }

#   dimension: orders_id {
#     type: number
#     sql: ${TABLE}.`orders.id` ;;
#     primary_key: yes
#   }


#   dimension: orders_count {
#     type: number
#     sql: ${TABLE}.`orders.count` ;;
#   }

#   set: detail {
#     fields: [orders_created_date, orders_id, orders_count]
#   }
# }
