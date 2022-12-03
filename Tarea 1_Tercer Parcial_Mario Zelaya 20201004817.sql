--Ejercicio 1

SELECT
  name, 
  gender,
  SUM(number) AS suma_total

FROM  `bigquery-public-data.usa_names.usa_1910_2013`

GROUP BY name, gender

ORDER BY suma_total DESC



--Ejercicio 2

SELECT 
  date,
  state,
  tests_total,
  cases_positive_total,
  SUM(tests_total) OVER (PARTITION BY state) AS suma_total

FROM `bigquery-public-data.covid19_covidtracking.summary` 

GROUP BY date, state, tests_total, cases_positive_total



--Ejercicio 3

SELECT 
  channelGrouping,
  SUM(total_pageviews) as pageviews,
  SUM(total_pageviews) / SUM(SUM(total_pageviews)) OVER() as porcentaje_del_total,
  AVG(SUM(total_pageviews)) OVER() as promedio

FROM (

  SELECT
    date,
    channelGrouping,
    SUM(totals.pageviews) as total_pageviews

  FROM `bigquery-public-data.google_analytics_sample.ga_sessions_20170801`

  GROUP BY date, channelGrouping

)

GROUP BY channelGrouping




--Ejercicio 4

SELECT 
  region,
  country,
  total_revenue,
  ROW_NUMBER() OVER (PARTITION BY region ORDER BY total_revenue DESC) AS rank

FROM `probable-drive-370203.ejercicio4.100_sales_records`

ORDER BY region, rank;