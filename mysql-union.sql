#MySql UNION



SELECT 
	`events`.id_events as id, 
	`events`.name as name, 
	`events`.event_date as created, 
	'events' as table_name 
FROM 
	events 
WHERE 
	`events`.state = 'enabled' 
GROUP BY 
	`events`.id_events 
UNION
SELECT 
	daily_deal.id_daily_deal as id, 
	daily_deal.name as name, 
	daily_deal.valid_from as created, 
	'daily_deal' as table_name 
FROM 
	daily_deal 
WHERE 
	daily_deal.state = 'enabled' 
GROUP BY 
	daily_deal.id_daily_deal 
ORDER BY 
	created ASC

#============================================

SELECT 
    `tour_id`,
    `tour_name`,
    `tour_user_id`,
    `tour_city_id`,
    `tour_category_id`,
    `tour_cover_image`,
    '' as rating_star,
    '' as rating_comment,
    ua_created_at as created_date
FROM 
	ropes_user_activities
    LEFT JOIN 
    ropes_tours
    ON 
    ropes_user_activities.ua_activity_id=ropes_tours.tour_id
WHERE 
	ua_u_id=2 AND ua_status=1
GROUP BY 
	ua_id
UNION ALL
SELECT 
    `tour_id`,
    `tour_name`,
    `tour_user_id`,
    `tour_city_id`,
    `tour_category_id`,
    `tour_cover_image`,
    tr_rating as rating_star,
    tr_comment as rating_comment,
    tr_created_at as created_date
FROM 
	ropes_tour_ratings
    LEFT JOIN 
    ropes_tours
    ON 
    ropes_tour_ratings.tr_tour_id=ropes_tours.tour_id
WHERE 
	tr_user_id=2 AND tr_status=1
GROUP BY 
	tr_id

#===========================

SELECT
    `tour_id`,
    `tour_name`,
    `tour_user_id`,
    `tour_city_id`,
    `tour_category_id`,
    `tour_cover_image`,
    ropes_categories.c_name AS category_name,
    city_name,
    ropes_countries.c_name AS country_name,
    u_user_name,
    u_image,
    '' AS rating_star,
    '' AS rating_comment,
    ua_created_at AS created_date,
    '1' AS activity_type
FROM
    ropes_user_activities
LEFT JOIN
    ropes_tours
ON
    ropes_user_activities.ua_activity_id = ropes_tours.tour_id
LEFT JOIN
    ropes_users
ON
    ropes_users.u_id = ropes_tours.tour_user_id
LEFT JOIN
    ropes_categories
ON
    ropes_categories.c_id = ropes_tours.tour_category_id
LEFT JOIN
    ropes_cities
ON
    ropes_cities.city_id = ropes_tours.tour_city_id
LEFT JOIN
    ropes_countries
ON
    ropes_countries.c_id = ropes_cities.city_country_id
WHERE
    ua_u_id = 2 AND ua_status = 1
GROUP BY
    ua_id
UNION ALL
SELECT
    `tour_id`,
    `tour_name`,
    `tour_user_id`,
    `tour_city_id`,
    `tour_category_id`,
    `tour_cover_image`,
    ropes_categories.c_name AS category_name,
    city_name,
    ropes_countries.c_name AS country_name,
    u_user_name,
    u_image,
    tr_rating AS rating_star,
    tr_comment AS rating_comment,
    tr_created_at AS created_date,
    '2' AS activity_type
FROM
    ropes_tour_ratings
LEFT JOIN
    ropes_tours
ON
    ropes_tour_ratings.tr_tour_id = ropes_tours.tour_id
LEFT JOIN
    ropes_users
ON
    ropes_users.u_id = ropes_tours.tour_user_id
LEFT JOIN
    ropes_categories
ON
    ropes_categories.c_id = ropes_tours.tour_category_id
LEFT JOIN
    ropes_cities
ON
    ropes_cities.city_id = ropes_tours.tour_city_id
LEFT JOIN
    ropes_countries
ON
    ropes_countries.c_id = ropes_cities.city_country_id
WHERE
    tr_user_id = 2 AND tr_status = 1
GROUP BY
    tr_id
LIMIT 0, 10

