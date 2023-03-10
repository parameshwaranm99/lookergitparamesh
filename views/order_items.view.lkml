# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.


  dimension: id {
    primary_key: yes
    description: "Primary_key should be unique and not null"
    type: number
    sql: ${TABLE}.id ;;

  }






  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones ;;
    hidden: yes
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.returned_at ;;
  }

  dimension: sale_price {
    type: number
    #value_format: "$0.00"
    sql: ${TABLE}.sale_price ;;
    #html:
    #{% if value > 100 %}
    #<font color="darkgreen">{{ sale_price._rendered_value }}</font>
    #{% elsif value > 50 %}
    #<font color="goldenrod">{{ sale_price._rendered_value }}</font>
    #{% else %}
    #<font color="darkred">{{ sale_price._rendered_value }}</font>
    #{% endif %} ;;
  }





  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_sale_price {
    type: sum
    sql: ${sale_price} ;;
    html:
    <ul>
    <li> value: {{ value }} </li>
    <li> rendered_value: {{ rendered_value }} </li>
    <li> linked_value: {{ linked_value }} </li>
    <li> link: {{ link }} </li>
    <li> model: {{ _model._name }} </li>
    <li> view: {{ _view._name }} </li>
    <li> explore: {{ _explore._name }} </li>
    <li> field: {{ _field._name }} </li>
    <li> dialect: {{ _dialect._name }} </li>
    <li> query timezone: {{ _query._query_timezone }} </li>
    </ul> ;;

  }

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  measure: total_amountlarge {
    type: sum
    #filters: [sale_price: ">50"]
    value_format: "$0.00"
    sql: ${sale_price}>50 ;;
  }

  parameter: sale_price_metric_picker {
    description: "Use with the Sale Price Metric measure"
    type: unquoted
    allowed_value: {
      label: "Total Sale Price"
      value: "SUM"
    }
    allowed_value: {
      label: "Average Sale Price"
      value: "AVG"
    }
    allowed_value: {
      label: "Maximum Sale Price"
      value: "MAX"
    }
    allowed_value: {
      label: "Minimum Sale Price"
      value: "MIN"
    }
  }

  measure: sale_price_metric {
    description: "Use with the Sale Price Metric Picker filter-only field"
    type: number
    label_from_parameter: sale_price_metric_picker
    sql: {% parameter sale_price_metric_picker %}(${sale_price}) ;;
    value_format_name: usd
  }






  measure: count {
    type: count
    #drill_fields: [id, orders.id, inventory_items.id]
    drill_fields: [fields*]
  }

  set: fields {
    fields: [id,order_items.id,inventory_item_id]
  }
}
