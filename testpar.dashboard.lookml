- dashboard: testpar
  title: Testpar
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

  elements:
  - name: add_a_unique_name_1678786435
    title: Untitled Visualization
    model: ecommerce_paramesh
    explore: products
    type: looker_grid
    fields: [products.brand, products.category, products.department, products.count,
      products.average_retail_price, products.total_retail_price]
    pivots: [products.category]
    filters:
      products.count: ">70"
    sorts: [products.count desc 0, products.category]
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
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    series_types: {}
    column_order: []
    defaults_version: 1

