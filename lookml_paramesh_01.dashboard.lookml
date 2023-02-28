- dashboard: lookml_pratice
  title: lookml_pratice
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: MUGodWBA2XQxRjMzsOS99e
  elements:
  - title: lookml_pratice
    name: lookml_pratice
    model: ecommerce_paramesh
    explore: order_items
    type: looker_grid
    fields: [orders.created_date, orders.count, users.gender]
    pivots: [users.gender]
    fill_fields: [orders.created_date]
    filters: {}
    sorts: [orders.created_date desc, users.gender]
    limit: 500
    query_timezone: America/Chicago
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
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    hidden_series: []
    legend_position: center
    series_types: {}
    point_style: circle
    series_colors:
      m - orders.count: "#EA4335"
      f - orders.count: "#1A73E8"
    series_labels:
      f - orders.count: Female
      m - orders.count: Male
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Created Date: orders.created_date
    row: 0
    col: 0
    width: 24
    height: 12
  filters:
  - name: Created Date
    title: Created Date
    type: field_filter
    default_value: 2017/02/28 to 2018/02/28
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: ecommerce_paramesh
    explore: order_items
    listens_to_filters: []
    field: orders.created_date
