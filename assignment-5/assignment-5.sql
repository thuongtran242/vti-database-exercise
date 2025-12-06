use testing_system;
-- Question 1: Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE VIEW sale_employee_view AS
    SELECT 
        account_id, full_name, department_name
    FROM
        `account`
            INNER JOIN
        department USING (department_id)
    WHERE
        department_name = 'Sale';
-- Question 2: Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE VIEW max_account_group_view AS
    SELECT 
        `account`.account_id,
        full_name,
        COUNT(group_account.group_id) AS total_group_of_account
    FROM
        `account`
            JOIN
        group_account USING (account_id)
    GROUP BY group_account.account_id
    HAVING COUNT(group_account.group_id) = (SELECT 
            MAX(total_group_of_account)
        FROM
            (SELECT 
                COUNT(group_account.group_id) AS total_group_of_account
            FROM
                group_account
            GROUP BY account_id) AS T);

-- Question 3: Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE VIEW question_length_300 AS
    SELECT 
        question_id, content
    FROM
        question
    WHERE
        CHAR_LENGTH(content) > 300;
drop view if exists question_length_300;

-- Question 4: Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE VIEW department_account AS
    SELECT 
        department.department_id,
        department_name,
        COUNT(`account`.account_id) AS account_in_dep
    FROM
        department
            JOIN
        `account` USING (department_id)
    GROUP BY department.department_id , department.department_name
    HAVING COUNT(`account`.account_id) = (SELECT 
            MAX(acc_in_dep)
        FROM
            (SELECT 
                COUNT(`account`.account_id) AS acc_in_dep
            FROM
                `account`
            GROUP BY `account`.department_id) AS T);
        
-- Question 5: Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo.
CREATE VIEW question_from_Nguyen AS
    SELECT 
        question_id, content, full_name
    FROM
        question q
            JOIN
        `account` a ON q.creator_id = a.account_id
    WHERE
        a.full_name LIKE N'NGUYỄN';