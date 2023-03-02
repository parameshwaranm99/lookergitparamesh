# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_paramesh.model.lkml"

view: nativepdt {
  derived_table: {
    datagroup_trigger: paramesh_01_datagroup
    explore_source: order_items {
      column: id { field: orders.id }
      column: count { field: orders.count }
      column: created_date { field: orders.created_date }
      column: sale_price {}
      column: status { field: orders.status }
      filters: {
        field: orders.status
        value: "complete"
      }
    }
    indexes: ["id"]
  }
  dimension: id {
    description: ""
    type: number
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: created_date {
    description: ""
    type: date
  }
  dimension: sale_price {
    description: ""
    value_format: "$0.00"
    type: number
  }
  dimension: status {
    description: ""
  }

}
