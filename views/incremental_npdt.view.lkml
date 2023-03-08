
# If necessary, uncomment the line below to include explore_source.
# include: "ecommerce_paramesh.model.lkml"

  view: incremental_npdt {
    derived_table: {
      increment_key: "created_date"
      increment_offset: 3
      datagroup_trigger: paramesh_01_datagroup
      indexes: ["id"]
      explore_source: orders {
        column: created_date {}
        column: id {}
        column: status {}
        column: count {}
      }
    }
    dimension: created_date {
      description: ""
      type: date
    }
    dimension: id {
      description: ""
      type: number
    }
    dimension: status {
      description: ""
    }
    dimension: count {
      description: ""
      type: number
    }
  }
