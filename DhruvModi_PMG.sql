SELECT date, SUM(impressions) AS sum_impressions
FROM mysql.marketing_performance
GROUP BY date;

SELECT state, SUM(revenue) AS sum_revenue
FROM mysql.website_revenue
GROUP BY state
ORDER BY sum_revenue DESC
LIMIT 3;
/* Ohio the third highest revenue generating state, generated $37,577
 */

SELECT campaign_info.name, SUM(marketing_performance.cost) AS sum_cost, SUM(marketing_performance.impressions) AS sum_impressions, SUM(marketing_performance.clicks) AS sum_clicks, SUM(website_revenue.revenue) AS sum_revenue
FROM mysql.campaign_info
LEFT JOIN mysql.marketing_performance ON campaign_info.id = marketing_performance.campaign_id
LEFT JOIN mysql.website_revenue ON marketing_performance.campaign_id = website_revenue.campaign_id AND marketing_performance.date = website_revenue.date
GROUP BY campaign_info.name;

SELECT RIGHT(geo, 2) AS state, sum(conversions) as sum_conversions
FROM mysql.marketing_performance
WHERE marketing_performance.campaign_id = '99058240'
GROUP BY state
ORDER BY sum_conversions DESC;
#Georgia generated the most total conversions

SELECT mysql.marketing_performance.campaign_id, SUM(mysql.marketing_performance.cost) AS total_cost, SUM(mysql.website_revenue.revenue) AS total_revenue
FROM mysql.marketing_performance
JOIN mysql.website_revenue ON marketing_performance.campaign_id = website_revenue.campaign_id
GROUP BY marketing_performance.campaign_id;
#Campaign 4 since it had the lowest cost to revenue proportion. Campaign 3 produced the most revenue.

SELECT DAYNAME(date) AS day_of_week, SUM(conversions) AS sum_conversions
FROM mysql.marketing_performance
GROUP BY day_of_week
ORDER BY sum_conversions DESC;

