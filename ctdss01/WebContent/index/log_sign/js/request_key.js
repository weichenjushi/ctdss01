var patten= /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(.[a-zA-Z0-9_-])+/; 

function submit()
{
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var email = document.getElementById("email").value;
	var firstname = document.getElementById("firstname").value;
	var secondname = document.getElementById("secondname").value;
	var describe_textarea = document.getElementById("describe_textarea").value;
	var verification_code = document.getElementById("verification_code").value;
	
	if(username == "" || password == "" || email == "" || firstname == "" || secondname == "" || describe_textarea == "" || verification_code == "")
		{
			if(username == "")
				{
					alert("username is empty!");
				}
			else if(password == "")
				{
					alert("password is empty!");
				}			
			else if(email == "")
				{
					alert("email is empty!");
				}
			else if(!patten.test(email))
				{
					alert("Please enter the correct email format!");
				}
			else if(firstname == "")
				{
					alert("firstname is empty!");
				}
			else if(secondname == "")
				{
					alert("secondname is empty!");
				}			
			else if(describe_textarea == "")
				{
					alert("describe_textarea is empty!");
				}
			else if(verification_code == "")
			{
				alert("verification_code is empty!");
			}
		}	
}