-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó.
delimiter $$
CREATE procedure get_department_detail_by_name (
in p_department_name varchar(50)
)
begin
select account_id from `account` join department d using (department_id) where d.department_name = p_department_name;
end $$
delimiter ;
Call get_department_detail_by_name('Sale');
-- Question 2: Tạo store để in ra số lượng account trong mỗi group.
delimiter $$
create procedure get_number_of_account_in_group() begin
select group_id, count(account_id) as number_of_account from group_account group by group_id;
end $$
delimiter ;
-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo trong tháng hiện tại.
delimiter $$
create procedure get_question_in_cur_month( in p_type_name enum('Essay', 'Multiple-Choice') ) begin
select q.type_id, count(question_id) from question q join type_question tq using(type_id) where type_name = p_type_name and month(q.create_date) = month(now()) group by tq.type_id ;
end $$
delimiter ;
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất.
drop procedure if exists get_number_of_question_in_type;
delimiter $$
create procedure get_number_of_question_in_type( out most_type_id int) begin
select type_id into most_type_id from question group by type_id
having count(question_id) = ( select max(T.number_question) from (
select count(question_id) as number_question from question group by type_id
) as T) limit 1;
end $$
delimiter ;
set @most_type_id=0;
call get_number_of_question_in_type(@most_type_id);
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question.
select type_id, type_name from `type_question` where type_id=@most_type_id
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào.
create procedure group_user (in `name` varchar(50)) begin 

end
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và trong store sẽ tự động gán: username sẽ giống email nhưng bỏ phần @..mail đi; positionID: sẽ có default là developer; departmentID: sẽ được cho vào 1 phòng chờ; Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
drop procedure if exists highest_type_question;
delimiter $$
create procedure highest_type_question(in type_of_question enum('Essay', 'Multiple-Choice') )
begin
select max(char_length(content)) from question join type_question using (type_id) where type_name = type_of_question;
end $$
delimiter ;
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa); Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
