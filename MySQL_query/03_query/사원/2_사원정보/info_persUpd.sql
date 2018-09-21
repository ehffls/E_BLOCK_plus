UPDATE `emp`
   SET e_pw = 'aaa'#{e_pw}
	  ,e_ph = '010-0000-9890'#{e_ph}
      ,e_email = 'qwerqwer@asdf.com'#{e_email}
      ,e_addr = '어느시 어느구 어느동 어느도로'#{e_addr}
 WHERE e_no = 5#{e_no}