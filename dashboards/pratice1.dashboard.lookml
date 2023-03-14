- dashboard: pratice1
  title: Pratice1
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
  - name: add_a_unique_name_1678775502
    title: Untitled Visualization
    model: ecommerce_paramesh
    explore: products
    type: table
    fields: [products.brand, products.category, products.department, products.count,
      products.average_retail_price, products.total_retail_price]
    sorts: [products.count desc]
    limit: 500
    dynamic_fields:
    - category: table_calculation
      expression: length(${products.brand})
      label: brand length
      value_format:
      value_format_name:
      _kind_hint: dimension
      table_calculation: brand_length
      _type_hint: number
    - args:
      - products.count
      calculation_type: percent_difference_from_previous
      category: table_calculation
      based_on: products.count
      label: Percent change from previous - Products Count
      source_field: products.count
      table_calculation: percent_change_from_previous_products_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - args:
      - products.count
      calculation_type: percent_of_previous
      category: table_calculation
      based_on: products.count
      label: Percent of previous - Products Count
      source_field: products.count
      table_calculation: percent_of_previous_products_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
    - args:
      - products.count
      calculation_type: percent_of_column_sum
      category: table_calculation
      based_on: products.count
      label: Percent of Products Count
      source_field: products.count
      table_calculation: percent_of_products_count
      value_format:
      value_format_name: percent_0
      _kind_hint: measure
      _type_hint: number
