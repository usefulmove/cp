SELECT teacher_id, COUNT(*) AS cnt
FROM (SELECT DISTINCT teacher_id, subject_id
      FROM Teacher) AS distincts
GROUP BY distincts.teacher_id