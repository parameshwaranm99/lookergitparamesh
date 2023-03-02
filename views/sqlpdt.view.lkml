view: sqlpdt {
  derived_table: {
    datagroup_trigger: paramesh_01_datagroup
    sql: SELECT
          orders.id  AS `orders.id`,
          users.country  AS `users.country`,
          users.city  AS `users.city`,
          COUNT(*) AS `order_items.count`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      LEFT JOIN demo_db.users  AS users ON orders.user_id = users.id
      GROUP BY
          1,
          2,
          3
      ORDER BY
          COUNT(*) DESC
      LIMIT 500
       ;;
      indexes: ["orders.id"]
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: orders_id {
    type: number
    sql: ${TABLE}.`orders.id` ;;
  }

  dimension: users_country {
    type: string
    sql: ${TABLE}.`users.country` ;;
  }

  dimension: users_city {
    type: string
    sql: ${TABLE}.`users.city` ;;
  }

  dimension: order_items_count {
    type: number
    sql: ${TABLE}.`order_items.count` ;;
  }

  set: detail {
    fields: [orders_id, users_country, users_city, order_items_count]
  }
}
