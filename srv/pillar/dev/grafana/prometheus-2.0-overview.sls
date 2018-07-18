__inputs:
- name: DS_PROM
  label: Prom
  description: ''
  type: datasource
  pluginId: prometheus
  pluginName: Prometheus
__requires:
- type: grafana
  id: grafana
  name: Grafana
  version: 5.2.1
- type: panel
  id: graph
  name: Graph
  version: 5.0.0
- type: datasource
  id: prometheus
  name: Prometheus
  version: 5.0.0
- type: panel
  id: singlestat
  name: Singlestat
  version: 5.0.0
- type: panel
  id: table
  name: Table
  version: 5.0.0
annotations:
  list:
  - builtIn: 1
    datasource: "-- Grafana --"
    enable: true
    hide: true
    iconColor: rgba(0, 211, 255, 1)
    name: Annotations & Alerts
    type: dashboard
  - datasource: "${DS_PROM}"
    enable: true
    expr: sum(changes(prometheus_config_last_reload_success_timestamp_seconds{instance=~"$instance"}[10m]))
      by (instance)
    hide: false
    iconColor: rgb(0, 96, 19)
    limit: 100
    name: reloads
    showIn: 0
    step: 5m
    type: alert
  - datasource: "${DS_PROM}"
    enable: true
    expr: count(sum(up{instance="$instance"}) by (instance) < 1)
    hide: false
    iconColor: rgba(255, 96, 96, 1)
    limit: 100
    name: down
    showIn: 0
    step: 5m
    type: alert
description: "Overview of metrics from Prometheus 2.0.  \r\nUseful for using prometheus
  to monitor your prometheus.\r\nRevisions welcome!"
editable: true
gnetId: 3662
graphTooltip: 0
id: 
iteration: 1531887065979
links: []
panels:
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 0
  id: 34
  panels: []
  repeat: 
  title: at a glance
  type: row
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(245, 54, 54, 0.9)
  - rgba(237, 129, 40, 0.89)
  - rgba(50, 172, 45, 0.97)
  datasource: "${DS_PROM}"
  decimals: 3
  description: Percentage of uptime during the most recent $interval period.  Change
    the period with the 'interval' dropdown above.
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: false
  gridPos:
    h: 7
    w: 6
    x: 0
    y: 1
  id: 2
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: "%"
  postfixFontSize: 100%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: true
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: avg(avg_over_time(up{instance=~"$instance",job=~"$job"}[$interval]) * 100)
    format: time_series
    intervalFactor: 2
    legendFormat: ''
    refId: A
    step: 40
  thresholds: 90, 99
  title: Uptime [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- columns: []
  datasource: "${DS_PROM}"
  description: "Servers which are DOWN RIGHT NOW! \nFIX THEM!!"
  fontSize: 100%
  gridPos:
    h: 7
    w: 6
    x: 6
    y: 1
  hideTimeOverride: true
  id: 25
  links: []
  pageSize: 
  scroll: true
  showHeader: true
  sort:
    col: 0
    desc: true
  styles:
  - alias: Time
    dateFormat: YYYY-MM-DD HH:mm:ss
    pattern: Time
    type: hidden
  - alias: ''
    colorMode: 
    colors:
    - rgba(245, 54, 54, 0.9)
    - rgba(237, 129, 40, 0.89)
    - rgba(50, 172, 45, 0.97)
    dateFormat: YYYY-MM-DD HH:mm:ss
    decimals: 2
    pattern: "/__name__|job|Value/"
    thresholds: []
    type: hidden
    unit: short
  - alias: "   "
    colorMode: cell
    colors:
    - rgba(255, 0, 0, 0.9)
    - rgba(237, 129, 40, 0.89)
    - rgba(255, 0, 0, 0.97)
    dateFormat: YYYY-MM-DD HH:mm:ss
    decimals: 2
    link: false
    pattern: instance
    thresholds:
    - ''
    - ''
    - ''
    type: string
    unit: short
  targets:
  - expr: up{instance=~"$instance",job=~"$job"} < 1
    format: table
    intervalFactor: 2
    refId: A
    step: 2
  timeFrom: 1s
  title: Currently Down
  transform: table
  type: table
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: Total number of time series in prometheus
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 7
    w: 6
    x: 12
    y: 1
  id: 12
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: true
    lineColor: rgb(31, 120, 193)
    show: true
  tableColumn: ''
  targets:
  - expr: sum(prometheus_tsdb_head_series{job=~"$job",instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    refId: B
    step: 40
  thresholds: '1000000,2000000'
  title: Total Series
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- cacheTimeout: 
  colorBackground: false
  colorValue: false
  colors:
  - rgba(245, 54, 54, 0.9)
  - rgba(237, 129, 40, 0.89)
  - rgba(50, 172, 45, 0.97)
  datasource: "${DS_PROM}"
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 7
    w: 6
    x: 18
    y: 1
  id: 14
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: true
    lineColor: rgb(31, 120, 193)
    show: true
  tableColumn: ''
  targets:
  - expr: sum(prometheus_tsdb_head_chunks{job=~"$job",instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    refId: B
    step: 40
  thresholds: ''
  title: Memory Chunks
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 8
  id: 35
  panels: []
  repeat: 
  title: quick numbers
  type: row
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: The total number of rule group evaluations missed due to slow rule
    group evaluation.
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 6
    w: 4
    x: 0
    y: 9
  id: 16
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: false
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: sum(sum_over_time(prometheus_evaluator_iterations_missed_total{job=~"$job",instance=~"$instance"}[$interval]))
    format: time_series
    intervalFactor: 2
    refId: A
    step: 40
  thresholds: '1,10'
  title: Missed Iterations [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: The total number of rule group evaluations skipped due to throttled
    metric storage.
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 6
    w: 4
    x: 4
    y: 9
  id: 18
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: false
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: sum(sum_over_time(prometheus_evaluator_iterations_skipped_total{job=~"$job",instance=~"$instance"}[$interval]))
    format: time_series
    intervalFactor: 2
    refId: A
    step: 40
  thresholds: '1,10'
  title: Skipped Iterations [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: Total number of scrapes that hit the sample limit and were rejected.
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 6
    w: 4
    x: 8
    y: 9
  id: 19
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: false
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: sum(sum_over_time(prometheus_target_scrapes_exceeded_sample_limit_total{job=~"$job",instance=~"$instance"}[$interval]))
    format: time_series
    intervalFactor: 2
    refId: A
    step: 40
  thresholds: '1,10'
  title: Tardy Scrapes [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: Number of times the database failed to reload block data from disk.
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 6
    w: 4
    x: 12
    y: 9
  id: 13
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: false
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: sum(sum_over_time(prometheus_tsdb_reloads_failures_total{job=~"$job",instance=~"$instance"}[$interval]))
    format: time_series
    intervalFactor: 2
    refId: A
    step: 40
  thresholds: '1,10'
  title: Reload Failures [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- cacheTimeout: 
  colorBackground: false
  colorValue: true
  colors:
  - rgba(50, 172, 45, 0.97)
  - rgba(237, 129, 40, 0.89)
  - rgba(245, 54, 54, 0.9)
  datasource: "${DS_PROM}"
  description: Sum of all skipped scrapes
  format: none
  gauge:
    maxValue: 100
    minValue: 0
    show: false
    thresholdLabels: false
    thresholdMarkers: true
  gridPos:
    h: 6
    w: 8
    x: 16
    y: 9
  id: 20
  interval: 
  links: []
  mappingType: 1
  mappingTypes:
  - name: value to text
    value: 1
  - name: range to text
    value: 2
  maxDataPoints: 100
  nullPointMode: connected
  nullText: 
  postfix: ''
  postfixFontSize: 50%
  prefix: ''
  prefixFontSize: 50%
  rangeMaps:
  - from: 'null'
    text: N/A
    to: 'null'
  sparkline:
    fillColor: rgba(31, 118, 189, 0.18)
    full: false
    lineColor: rgb(31, 120, 193)
    show: false
  tableColumn: ''
  targets:
  - expr: "sum(sum_over_time(prometheus_target_scrapes_exceeded_sample_limit_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))
      + \nsum(sum_over_time(prometheus_target_scrapes_sample_duplicate_timestamp_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))
      + \nsum(sum_over_time(prometheus_target_scrapes_sample_out_of_bounds_total{job=~\"$job\",instance=~\"$instance\"}[$interval]))
      + \nsum(sum_over_time(prometheus_target_scrapes_sample_out_of_order_total{job=~\"$job\",instance=~\"$instance\"}[$interval])) "
    format: time_series
    intervalFactor: 2
    refId: A
    step: 40
  thresholds: '1,10'
  title: Skipped Scrapes [$interval]
  type: singlestat
  valueFontSize: 100%
  valueMaps:
  - op: "="
    text: N/A
    value: 'null'
  valueName: current
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 15
  id: 36
  panels: []
  repeat: 
  title: errors
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: All non-zero failures and errors
  fill: 1
  gridPos:
    h: 7
    w: 24
    x: 0
    y: 16
  id: 33
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(increase(net_conntrack_dialer_conn_failed_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Failed Connections
    refId: A
    step: 2
  - expr: sum(increase(prometheus_evaluator_iterations_missed_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Missed Iterations
    refId: B
    step: 2
  - expr: sum(increase(prometheus_evaluator_iterations_skipped_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Skipped Iterations
    refId: C
    step: 2
  - expr: sum(increase(prometheus_rule_evaluation_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Evaluation
    refId: D
    step: 2
  - expr: sum(increase(prometheus_sd_azure_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Azure Refresh
    refId: E
    step: 2
  - expr: sum(increase(prometheus_sd_consul_rpc_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Consul RPC
    refId: F
    step: 2
  - expr: sum(increase(prometheus_sd_dns_lookup_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: DNS Lookup
    refId: G
    step: 2
  - expr: sum(increase(prometheus_sd_ec2_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: EC2 Refresh
    refId: H
    step: 2
  - expr: sum(increase(prometheus_sd_gce_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: GCE Refresh
    refId: I
    step: 2
  - expr: sum(increase(prometheus_sd_marathon_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Marathon Refresh
    refId: J
    step: 2
  - expr: sum(increase(prometheus_sd_openstack_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Openstack Refresh
    refId: K
    step: 2
  - expr: sum(increase(prometheus_sd_triton_refresh_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Triton Refresh
    refId: L
    step: 2
  - expr: sum(increase(prometheus_target_scrapes_exceeded_sample_limit_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Sample Limit
    refId: M
    step: 2
  - expr: sum(increase(prometheus_target_scrapes_sample_duplicate_timestamp_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Duplicate Timestamp
    refId: N
    step: 2
  - expr: sum(increase(prometheus_target_scrapes_sample_out_of_bounds_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Timestamp Out of Bounds
    refId: O
    step: 2
  - expr: sum(increase(prometheus_target_scrapes_sample_out_of_order_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Sample Out of Order
    refId: P
    step: 2
  - expr: sum(increase(prometheus_treecache_zookeeper_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Zookeeper
    refId: Q
    step: 2
  - expr: sum(increase(prometheus_tsdb_compactions_failed_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: TSDB Compactions
    refId: R
    step: 2
  - expr: sum(increase(prometheus_tsdb_head_series_not_found{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Series Not Found
    refId: S
    step: 2
  - expr: sum(increase(prometheus_tsdb_reloads_failures_total{instance=~"$instance"}[5m]))
      > 0
    format: time_series
    intervalFactor: 2
    legendFormat: Reload
    refId: T
    step: 2
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Failures and Errors
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Errors
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 23
  id: 37
  panels: []
  repeat: 
  title: up
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 24
  id: 1
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: true
  steppedLine: false
  targets:
  - expr: up{instance=~"$instance",job=~"$job"}
    format: time_series
    interval: ''
    intervalFactor: 1
    legendFormat: "{{instance}}"
    refId: A
    step: 2
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Upness (stacked)
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - decimals: 0
    format: none
    label: Up
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: false
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 24
  id: 5
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: prometheus_tsdb_head_chunks{job=~"$job",instance=~"$instance"}
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Storage Memory Chunks
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Chunks
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 31
  id: 38
  panels: []
  repeat: 
  title: series
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 32
  id: 3
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: prometheus_tsdb_head_series{job=~"$job",instance=~"$instance"}
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Series Count
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Series
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 32
  id: 32
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides:
  - alias: removed
    transform: negative-Y
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum( increase(prometheus_tsdb_head_series_created_total{instance=~"$instance"}[5m])
      )
    format: time_series
    intervalFactor: 2
    legendFormat: created
    refId: A
    step: 4
  - expr: sum( increase(prometheus_tsdb_head_series_removed_total{instance=~"$instance"}[5m])
      )
    format: time_series
    intervalFactor: 2
    legendFormat: removed
    refId: B
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Series Created / Removed
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Series Count
    logBase: 1
    max: 
    min: 
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 39
  id: 39
  panels: []
  repeat: 
  title: appended samples
  type: row
- aliasColors:
    10.58.3.10:80: "#BA43A9"
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: Rate of total number of appended samples
  fill: 1
  gridPos:
    h: 7
    w: 24
    x: 0
    y: 40
  id: 4
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: rate(prometheus_tsdb_head_samples_appended_total{job=~"$job",instance=~"$instance"}[1m])
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 2
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Appended Samples per Second
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Samples / Second
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 47
  id: 40
  panels: []
  repeat: 
  title: sync
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: Total number of syncs that were executed on a scrape pool.
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 48
  id: 6
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(prometheus_target_scrape_pool_sync_total{job=~"$job",instance=~"$instance"})
      by (scrape_job)
    format: time_series
    hide: false
    intervalFactor: 2
    legendFormat: "{{scrape_job}}"
    refId: B
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Scrape Sync Total
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Syncs
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: Actual interval to sync the scrape pool.
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 48
  id: 21
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(rate(prometheus_target_sync_length_seconds_sum{job=~"$job",instance=~"$instance"}[2m]))
      by (scrape_job) * 1000
    format: time_series
    intervalFactor: 2
    legendFormat: "{{scrape_job}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Target Sync
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Milliseconds
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 55
  id: 41
  panels: []
  repeat: 
  title: scrapes
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 56
  id: 29
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: scrape_duration_seconds{instance=~"$instance"}
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Scrape Duration
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Seconds
    logBase: 1
    max: 
    min: 
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: Total number of rejected scrapes
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 56
  id: 30
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(prometheus_target_scrapes_exceeded_sample_limit_total{job=~"$job",instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: exceeded sample limit
    refId: A
    step: 4
  - expr: sum(prometheus_target_scrapes_sample_duplicate_timestamp_total{job=~"$job",instance=~"$instance"})
    format: time_series
    hide: false
    intervalFactor: 2
    legendFormat: duplicate timestamp
    refId: B
    step: 4
  - expr: sum(prometheus_target_scrapes_sample_out_of_bounds_total{job=~"$job",instance=~"$instance"})
    format: time_series
    hide: false
    intervalFactor: 2
    legendFormat: out of bounds
    refId: C
    step: 4
  - expr: 'sum(prometheus_target_scrapes_sample_out_of_order_total{job=~"$job",instance=~"$instance"}) '
    format: time_series
    hide: false
    intervalFactor: 2
    legendFormat: out of order
    refId: D
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Rejected Scrapes
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - decimals: 0
    format: short
    label: Scrapes
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 63
  id: 42
  panels: []
  repeat: 
  title: durations
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: The duration of rule group evaluations
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 64
  id: 10
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: 1000 * rate(prometheus_evaluator_duration_seconds_sum{job=~"$job", instance=~"$instance"}[5m])
      / rate(prometheus_evaluator_duration_seconds_count{job=~"$job", instance=~"$instance"}[5m])
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: E
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Average Rule Evaluation Duration
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Milliseconds
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 64
  id: 11
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(rate(http_request_duration_microseconds_count{job=~"$job",instance=~"$instance"}[1m]))
      by (handler) > 0
    format: time_series
    intervalFactor: 2
    legendFormat: "{{handler}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: HTTP Request Duration
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Microseconds
    logBase: 1
    max: 
    min: 
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 71
  id: 15
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(prometheus_engine_query_duration_seconds_sum{job=~"$job",instance=~"$instance"})
      by (slice)
    format: time_series
    intervalFactor: 2
    legendFormat: "{{slice}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Prometheus Engine Query Duration Seconds
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Seconds
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: "Rule-group evaluations \n - total\n - missed due to slow rule group
    evaluation\n - skipped due to throttled metric storage"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 71
  id: 31
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(rate(prometheus_evaluator_iterations_total{job=~"$job", instance=~"$instance"}[5m]))
    format: time_series
    intervalFactor: 2
    legendFormat: Total
    refId: B
    step: 4
  - expr: sum(rate(prometheus_evaluator_iterations_missed_total{job=~"$job", instance=~"$instance"}[5m]))
    format: time_series
    intervalFactor: 2
    legendFormat: Missed
    refId: A
    step: 4
  - expr: sum(rate(prometheus_evaluator_iterations_skipped_total{job=~"$job", instance=~"$instance"}[5m]))
    format: time_series
    intervalFactor: 2
    legendFormat: Skipped
    refId: C
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Rule Evaluator Iterations
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: iterations
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 78
  id: 43
  panels: []
  repeat: 
  title: notifications
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 24
    x: 0
    y: 79
  id: 22
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: rate(prometheus_notifications_sent_total[5m])
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 2
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Notifications Sent
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Notifications
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 86
  id: 44
  panels: []
  repeat: 
  title: config
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 87
  id: 23
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: (time() - prometheus_config_last_reload_success_timestamp_seconds{job=~"$job",instance=~"$instance"})
      / 60
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Minutes Since Successful Config Reload
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Minutes
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 12
    y: 87
  id: 24
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: prometheus_config_last_reload_successful{job=~"$job",instance=~"$instance"}
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 4
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Successful Config Reload
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - decimals: 0
    format: short
    label: Success
    logBase: 1
    max: '1'
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 94
  id: 45
  panels: []
  repeat: 
  title: garbage collection
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: GC invocation durations
  fill: 1
  gridPos:
    h: 7
    w: 24
    x: 0
    y: 95
  id: 28
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(rate(go_gc_duration_seconds_sum{instance=~"$instance",job=~"$job"}[2m]))
      by (instance)
    format: time_series
    intervalFactor: 2
    legendFormat: "{{instance}}"
    refId: A
    step: 2
  thresholds: []
  timeFrom: 
  timeShift: 
  title: GC Rate / 2m
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- collapsed: false
  gridPos:
    h: 1
    w: 24
    x: 0
    y: 102
  id: 46
  panels: []
  repeat: 
  title: Broken, ignore
  type: row
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  description: This is probably wrong!  Please help.
  fill: 1
  gridPos:
    h: 7
    w: 12
    x: 0
    y: 103
  id: 26
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides:
  - alias: allocated
    stack: false
  spaceLength: 10
  stack: true
  steppedLine: false
  targets:
  - expr: sum(go_memstats_alloc_bytes_total{job=~"$job", instance=~"$instance"})
    format: time_series
    hide: true
    intervalFactor: 2
    legendFormat: alloc_bytes_total
    refId: A
    step: 10
  - expr: sum(go_memstats_alloc_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    hide: false
    intervalFactor: 2
    legendFormat: allocated
    refId: B
    step: 10
  - expr: sum(go_memstats_buck_hash_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: profiling bucket hash table
    refId: C
    step: 10
  - expr: sum(go_memstats_gc_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: GC metadata
    refId: D
    step: 10
  - expr: sum(go_memstats_heap_alloc_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap in-use
    refId: E
    step: 10
  - expr: sum(go_memstats_heap_idle_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap idle
    refId: F
    step: 10
  - expr: sum(go_memstats_heap_inuse_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap in use
    refId: G
    step: 10
  - expr: sum(go_memstats_heap_released_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap released
    refId: H
    step: 10
  - expr: sum(go_memstats_heap_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap system
    refId: I
    step: 10
  - expr: sum(go_memstats_mcache_inuse_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: mcache in use
    refId: J
    step: 10
  - expr: sum(go_memstats_mcache_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: mcache sys
    refId: K
    step: 10
  - expr: sum(go_memstats_mspan_inuse_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: mspan in use
    refId: L
    step: 10
  - expr: sum(go_memstats_mspan_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: mspan sys
    refId: M
    step: 10
  - expr: sum(go_memstats_next_gc_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: heap next gc
    refId: N
    step: 10
  - expr: sum(go_memstats_other_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: other sys
    refId: O
    step: 10
  - expr: sum(go_memstats_stack_inuse_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: stack in use
    refId: P
    step: 10
  - expr: sum(go_memstats_stack_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: stack sys
    refId: Q
    step: 10
  - expr: sum(go_memstats_sys_bytes{job=~"$job", instance=~"$instance"})
    format: time_series
    intervalFactor: 2
    legendFormat: sys
    refId: R
    step: 10
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Go Memory Usage (FIXME)
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: bytes
    label: 
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 6
    x: 12
    y: 103
  id: 9
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: prometheus_target_interval_length_seconds{instance=~"$instance", job=~"$job"}
    format: time_series
    intervalFactor: 2
    legendFormat: "{{quantile}} {{interval}}"
    refId: A
    step: 20
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Scrape Duration
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Seconds
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
- aliasColors: {}
  bars: false
  dashLength: 10
  dashes: false
  datasource: "${DS_PROM}"
  fill: 1
  gridPos:
    h: 7
    w: 6
    x: 18
    y: 103
  id: 7
  legend:
    avg: false
    current: false
    max: false
    min: false
    show: true
    total: false
    values: false
  lines: true
  linewidth: 1
  links: []
  nullPointMode: 'null'
  percentage: false
  pointradius: 5
  points: false
  renderer: flot
  seriesOverrides: []
  spaceLength: 10
  stack: false
  steppedLine: false
  targets:
  - expr: sum(rate(prometheus_target_interval_length_seconds_count{job=~"$job",instance=~"$instance"}[5m]))
      by (interval)
    format: time_series
    intervalFactor: 2
    legendFormat: "{{interval}}"
    refId: A
    step: 20
  thresholds: []
  timeFrom: 
  timeShift: 
  title: Target Scrapes / 5m
  tooltip:
    shared: true
    sort: 0
    value_type: individual
  type: graph
  xaxis:
    buckets: 
    mode: time
    name: 
    show: true
    values: []
  yaxes:
  - format: short
    label: Scrapes
    logBase: 1
    max: 
    min: '0'
    show: true
  - format: short
    label: 
    logBase: 1
    max: 
    min: 
    show: true
  yaxis:
    align: false
    alignLevel: 
refresh: 30s
schemaVersion: 16
style: dark
tags: []
templating:
  list:
  - allValue: 
    current: {}
    datasource: "${DS_PROM}"
    hide: 0
    includeAll: true
    label: 
    multi: true
    name: job
    options: []
    query: query_result(prometheus_tsdb_head_samples_appended_total)
    refresh: 2
    regex: /.*job="([^"]+)/
    sort: 1
    tagValuesQuery: ''
    tags: []
    tagsQuery: ''
    type: query
    useTags: false
  - allValue: 
    current: {}
    datasource: "${DS_PROM}"
    hide: 0
    includeAll: true
    label: 
    multi: true
    name: instance
    options: []
    query: query_result(up{job=~"$job"})
    refresh: 2
    regex: /.*instance="([^"]+).*/
    sort: 0
    tagValuesQuery: ''
    tags: []
    tagsQuery: ''
    type: query
    useTags: false
  - allValue: 
    current:
      selected: true
      text: 1h
      value: 1h
    hide: 0
    includeAll: false
    label: 
    multi: false
    name: interval
    options:
    - selected: true
      text: 1h
      value: 1h
    - selected: false
      text: 3h
      value: 3h
    - selected: false
      text: 6h
      value: 6h
    - selected: false
      text: 12h
      value: 12h
    - selected: false
      text: 1d
      value: 1d
    - selected: false
      text: 2d
      value: 2d
    - selected: false
      text: 7d
      value: 7d
    - selected: false
      text: 30d
      value: 30d
    - selected: false
      text: 90d
      value: 90d
    - selected: false
      text: 180d
      value: 180d
    query: 1h, 3h, 6h, 12h, 1d, 2d, 7d, 30d, 90d, 180d
    type: custom
time:
  from: now-2d
  to: now
timepicker:
  refresh_intervals:
  - 5s
  - 10s
  - 30s
  - 1m
  - 5m
  - 15m
  - 30m
  - 1h
  - 2h
  - 1d
  time_options:
  - 5m
  - 15m
  - 1h
  - 6h
  - 12h
  - 24h
  - 2d
  - 7d
  - 30d
timezone: ''
title: Prometheus 2.0 Overview
uid: mG6mkPOik
version: 1
