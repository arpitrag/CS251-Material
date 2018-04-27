<!DOCTYPE html>
<html>
<body>

<h2>Registration</h2>

<form name="form1" onsubmit="return validateForm()"" method="post" action="main.php">
  Name:
  <input type="text" name="name" maxlength="20" value="Someone">
  <br>
  Address:
  <input type="text" name="address" maxlength="100" required>
  <br>
  Email:
  <input type="text" name="email" value="someone@xyz.com">
  <br>
  Mobile:
  <input type="text" name="mobile" maxlength="10" value="9876543210">
  <br>
  Bank Account Number:
  <input type="text" name="accnum" maxlength="5" value="12345">
  <br>
  Bank Password:
  <input type="password" name="pass" maxlength="20">
  <br><br>
  <input type="submit" value="Submit" name="submit" >
</form> 
<a href="admin.php">Check registrations</a>
<!--<script src="form.js"></script> -->
<script >
function validateForm()
{
	var emailid=document.forms["form1"]["email"].value;
	var nameid=document.forms["form1"]["name"].value;
	var mobileid=document.forms["form1"]["mobile"].value;
	var accnumid=document.forms["form1"]["accnum"].value;
	var passid=document.forms["form1"]["pass"].value;
	var mailformat = /^[A-Za-z]+@.+([\.])com$/;
	var nameformat = /^([A-Za-z\s])+$/;
	var passformat = /^([A-Za-z0-9])+$/;
	var mobileformat = /^[^0]([0-9]){9}$/;
	var accnumformat = /^([0-9]){5}$/;
	if(emailid.match(mailformat))
		{
		}
	else
		{
		alert("You have entered an invalid email address!");
		return false;
		}
	if(nameid.match(nameformat))
		{
		}
	else
		{
		alert("You have entered an invalid Name!");
		return false;
		}
	if(mobileid.match(mobileformat))
		{
		}
	else
		{
		alert("You have entered an invalid Mobile Number!");
		return false;
		}
	if(accnumid.match(accnumformat))
		{
		}
	else
		{
		alert("You have entered an invalid Account Number!");
		return false;
		}
	if(passid.match(passformat))
		{
		}
	else
		{
		alert("You have entered an invalid Password!");
		return false;
		}

}
</script>
</body>
</html>