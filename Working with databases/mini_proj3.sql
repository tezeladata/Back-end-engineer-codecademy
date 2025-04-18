SELECT title, score FROM hacker_news ORDER BY 2 DESC LIMIT 5;

SELECT SUM(score) FROM hacker_news;

SELECT user, score FROM hacker_news GROUP BY 1 HAVING score > 200;

SELECT (517 + 309 + 304 + 282) / 6366.0;

SELECT COUNT(url) FROM hacker_news WHERE url='https://www.youtube.com/watch?v=dQw4w9WgXcQ';

SELECT CASE
   WHEN url LIKE '%github.com%' THEN 'GitHub'
   WHEN url LIKE '%medium.com%' THEN 'Medium'
   WHEN url LIKE '%nytimes.com%' THEN 'New York Times'
   ELSE 'Other'
  END AS 'Source', COUNT(*)
FROM hacker_news
GROUP BY 1;