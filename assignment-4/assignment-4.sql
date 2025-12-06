-- 1 JOIN
use testing_system;
-- 1
SELECT 
    *
FROM
    `account`
        INNER JOIN
    department ON department.department_id = `account`.department_id;
-- 2
SELECT 
    *
FROM
    `account`
WHERE
    create_date > 20 / 12 / 2010;
-- 3
SELECT 
    *
FROM
    `account`
        INNER JOIN
    position ON position.position_id = `account`.position_id
HAVING position_name = 'Dev';
-- 4
SELECT 
    department_id,
    department_name,
    COUNT(`account`.department_id)
FROM
    department
        INNER JOIN
    `account` USING (department_id)
GROUP BY department.department_id
HAVING COUNT(`account`.department_id) >= 3;
-- 5 
SELECT 
    question_id, COUNT(exam_question.question_id) AS q
FROM
    question
        INNER JOIN
    exam_question USING (question_id)
GROUP BY question.question_id
ORDER BY q DESC
LIMIT 1;
-- 6
SELECT 
    category_id, category_name, COUNT(question.category_id)
FROM
    category_question
        INNER JOIN
    question USING (category_id)
GROUP BY category_question.category_id;
-- 7
SELECT 
    question_id, COUNT(exam_question.question_id)
FROM
    question
        INNER JOIN
    exam_question USING (question_id)
GROUP BY question.question_id;
-- 8 
SELECT 
    question_id, COUNT(answer.question_id) AS a
FROM
    question
        INNER JOIN
    answer USING (question_id)
GROUP BY question.question_id
ORDER BY a DESC
LIMIT 1;
-- 9
SELECT 
    group_id, COUNT(group_account.account_id)
FROM
    group_account
GROUP BY group_id;
-- 10
SELECT 
    position_id,
    position_name,
    COUNT(`account`.position_id) AS p
FROM
    position
        INNER JOIN
    `account` USING (position_id)
GROUP BY position.position_id
ORDER BY p ASC
LIMIT 1;
-- 11
-- 12
SELECT 
    question_id, content, type_id, creator_id, create_date
FROM
    question;
-- 13
SELECT 
    type_id, type_name, COUNT(question.type_id)
FROM
    type_question
        INNER JOIN
    question USING (type_id)
GROUP BY type_question.type_id;
-- 14, 15
SELECT 
    group_id, group_name
FROM
    `group`
        LEFT JOIN
    group_account USING (group_id)
WHERE
    account_id IS NULL;
-- 16
SELECT 
    question_id, question.content
FROM
    question
        LEFT JOIN
    answer USING (question_id)
WHERE
    answer_id IS NULL;

-- 2 UNION
-- 17
SELECT 
    `account`.account_id, full_name, group_id
FROM
    `account`
        INNER JOIN
    group_account USING (account_id)
WHERE
    group_id = 1 
UNION SELECT 
    `account`.account_id, full_name, group_id
FROM
    `account`
        INNER JOIN
    group_account USING (account_id)
WHERE
    group_id = 2;

-- 18
SELECT 
    *
FROM
    (SELECT 
        g.group_id, g.group_name, COUNT(ga.account_id)
    FROM
        `Group` g
    INNER JOIN group_account ga USING (group_id)
    GROUP BY g.group_id , g.group_name
    HAVING COUNT(ga.account_id) > 5) AS Result_A 
UNION SELECT 
    *
FROM
    (SELECT 
        g.group_id, g.group_name, COUNT(ga.account_id)
    FROM
        `Group` g
    INNER JOIN group_account ga USING (group_id)
    GROUP BY g.group_id , g.group_name
    HAVING COUNT(ga.account_id) < 7)