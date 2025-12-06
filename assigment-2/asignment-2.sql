
INSERT INTO Department (department_id, department_name)
VALUES
    (1, N'Marketing'),
    (2, N'Sale'),
    (3, N'Bảo vệ'),
    (4, N'Nhân sự'),
    (5, N'Kỹ thuật'),
    (6, N'Tài chính'),
    (7, N'Phó giám đốc'),
    (8, N'Giám đốc'),
    (9, N'Thư kí'),
    (10, N'Bán hàng'),
    (11, N'Nghiên cứu');

INSERT INTO `Position` (position_id, position_name)
VALUES
    (1, 'Dev'),
    (2, 'Test'),
    (3, 'Scrum Master'),
    (4, 'PM');
    
INSERT INTO Type_Question (type_id, type_name)
VALUES
    (1, 'Essay'),
    (2, 'Multiple-Choice');
    
INSERT INTO Category_Question (category_id, category_name)
VALUES
    (1, N'Java'),
    (2, N'NET'),
    (3, N'SQL'),
    (4, N'Postman'),
    (5, N'Ruby'),
    (6, N'Python');
    
INSERT INTO `Account` (account_id, email, user_name, full_name, department_id, position_id, create_date)
VALUES
    (1, 'account1@example.com', 'user1', N'Trần Văn A', 5, 1, '2023-01-15'),
    (2, 'account2@example.com', 'user2', N'Lê Thị B', 4, 3, '2023-02-20'),
    (3, 'account3@example.com', 'user3', N'Phạm Văn C', 5, 2, '2023-03-10'),
    (4, 'account4@example.com', 'user4', N'Nguyễn Thị D', 8, 4, '2023-04-05'),
    (5, 'account5@example.com', 'user5', N'Hoàng Văn E', 1, 1, '2023-05-01'),
    (6, 'account6@example.com', 'user6', N'Đỗ Văn G', 5, 1, '2023-06-01');
    
INSERT INTO `Group` (group_id, group_name, creator_id, create_date)
VALUES
    (1, N'Nhóm Java Fresher', 1, '2024-01-01'),
    (2, N'Nhóm Testing', 3, '2024-01-05'),
    (3, N'Nhóm PM', 4, '2024-02-10'),
    (4, N'Nhóm Python', 5, '2024-03-15'),
    (5, N'Nhóm C#', 1, '2024-04-20'),
    (6, N'Nhóm Devops', 2, '2024-05-01');
    
INSERT INTO Group_Account (group_id, account_id, join_date)
VALUES
    (1, 1, '2024-01-02'),
    (1, 3, '2024-01-02'),
    (2, 2, '2024-01-06'),
    (3, 4, '2024-02-11'),
    (4, 5, '2024-03-16'),
    (5, 6, '2024-04-21');
    
INSERT INTO Question (question_id, content, category_id, type_id, creator_id, create_date)
VALUES
    (1, N'Câu hỏi Java cơ bản là gì?', 1, 1, 1, '2024-06-01'),
    (2, N'Cấu trúc của câu lệnh SELECT trong SQL?', 3, 1, 3, '2024-06-05'),
    (3, N'Trong Java, đâu là kiểu dữ liệu nguyên thủy? (Chọn nhiều đáp án)', 1, 2, 1, '2024-06-10'),
    (4, N'Python có phải là ngôn ngữ biên dịch không? (Chọn 1 đáp án)', 5, 2, 5, '2024-06-15'),
    (5, N'Định nghĩa về Testing?', 2, 1, 3, '2024-06-20'),
    (6, N'Thẻ Heading lớn nhất trong HTML là gì?', 4, 2, 6, '2024-06-25');
    
INSERT INTO Answer (answer_id, content, question_id, is_correct)
VALUES
    (1, N'Là ngôn ngữ lập trình hướng đối tượng.', 1, TRUE),
    (2, N'Là ngôn ngữ lập trình hàm.', 1, FALSE),
    (3, N'SELECT column1, column2 FROM table_name WHERE condition;', 2, TRUE),
    (4, N'int', 3, TRUE),
    (5, N'String', 3, FALSE),
    (6, N'boolean', 3, TRUE),
    (7, N'Có', 4, FALSE), -- Python là ngôn ngữ thông dịch (interpreted)
    (8, N'Không', 4, TRUE),
    (9, N'Thẻ <h1>', 6, TRUE),
    (10, N'Thẻ <h7>', 6, FALSE);
    
INSERT INTO Exam (exam_id, `code`, title, category_id, creator_id, duration, create_date)
VALUES
    (1, 'JV001', N'Bài thi Java cơ bản', 1, 1, 60, '2024-07-01'),
    (2, 'SQL02', N'Bài thi SQL nâng cao', 3, 3, 90, '2024-07-05'),
    (3, 'PYT03', N'Bài thi Python', 5, 5, 45, '2024-07-10'),
    (4, 'TEST04', N'Bài thi Test lý thuyết', 2, 2, 60, '2024-07-15'),
    (5, 'HR005', N'Bài thi Tuyển dụng', 4, 4, 30, '2024-07-20'),
    (6, 'SQL01', N'Bài thi SQL cơ bản', 3, 1, 60, '2024-07-25');
    
INSERT INTO Exam_Question (exam_id, question_id)
VALUES
    (1, 1),
    (1, 3),
    (2, 2),
    (2, 5),
    (3, 4),
    (4, 5),
    (5, 1),
    (6, 2),
    (6, 5);