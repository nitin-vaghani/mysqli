#MySql_Update_records


UPDATE article_wishlist AS t2
LEFT JOIN article_category AS t1 ON (t1.id_article = t2.article_id)
SET t2.id_category = t1.id_category
WHERE 1


Track your progress with the calendar that ticks off each day when you have completed the workout

ALTER DATABASE `trk-zug1` DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;
UPDATE `reservators-name-fake` SET women_birthday=STR_TO_DATE(`women_birthday`, "%d/%m/%Y");
UPDATE `reservators-name-fake` SET men_birthday=STR_TO_DATE(`men_birthday`, "%d/%m/%Y");
UPDATE `reservators-name-fake` SET reserve_on_date=STR_TO_DATE(`reserve_on_date`, "%d/%m/%Y");
ALTER TABLE `reservators-name-fake` CHANGE `women_birthday` `women_birthday` DATE NULL DEFAULT NULL, CHANGE `men_birthday` `men_birthday` DATE NULL DEFAULT NULL, CHANGE `reserve_on_date` `reserve_on_date` DATE NULL DEFAULT NULL;


UPDATE 
`reservators-name-fake` as ch
SET 
ch.address = (select pr.address from reservators as pr where ch.id = pr.id),
ch.`women_country` = (select pr.`women_country` from reservators as pr where ch.id = pr.id),
ch.`men_country` = (select pr.`men_country` from reservators as pr where ch.id = pr.id),
ch.`city` = (select pr.`city` from reservators as pr where ch.id = pr.id),
ch.`appointment_memo` = (select pr.`appointment_memo` from reservators as pr where ch.id = pr.id);
