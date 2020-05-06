$(document).ready(function()
{
	if ($("#alertSuccess").text().trim() == "")
	 {
	 $("#alertSuccess").hide();
	 }
	 $("#alertError").hide();
});

$(document).on("click", "#btnSave", function(event)
		{
		
			 $("#alertSuccess").text("");
			 $("#alertSuccess").hide();
			 $("#alertError").text("");
			 $("#alertError").hide();
		
				var status = validateUserForm();
				if (status != true)
				 {
						$("#alertError").text(status);
						$("#alertError").show();
				 
				 
							return;
				 }
		
		var type = ($("#hidUserIDSave").val() == "") ? "POST" : "PUT";
		$.ajax(
				{
				 url : "UserAPI",
				 type : type,
				 data : $("#formUser").serialize(),
				 dataType : "text",
				 complete : function(response, status)
				 {
					 onUserSaveComplete(response.responseText, status);
				 }
				});

		});


function onUserSaveComplete(response, status)
{
	if (status == "success")
	{
		
		var resultSet = JSON.parse(response);
			if (resultSet.status.trim() == "success"){
				
					$("#alertSuccess").text("Successfully saved.");
				$("#alertSuccess").show();
				$("#divDoGrid").html(resultSet.data);
	} else if (resultSet.status.trim() == "error")
	{
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
	}
 	
	} else if (status == "error")
 	{
 			$("#alertError").text("Error while saving.");
 			$("#alertError").show();
 	} else
 	
 	{
 			$("#alertError").text("Unknown error while saving..");
 			$("#alertError").show();
 	}
			$("#hidUserIDSave").val("");
			$("#formUser")[0].reset();
}


$(document).on("click", ".btnUpdate", function(event)
{
	 $("#hidUserIDSave").val($(this).closest("tr").find('#hidUserIDUpdate').val());
	 $("#userID").val($(this).closest("tr").find('td:eq(0)').text());
	 $("#fName").val($(this).closest("tr").find('td:eq(1)').text());
	 $("#lName").val($(this).closest("tr").find('td:eq(2)').text());
	 $("#email").val($(this).closest("tr").find('td:eq(3)').text());
	 $("#nic").val($(this).closest("tr").find('td:eq(4)').text());
	 $("#phone").val($(this).closest("tr").find('td:eq(5)').text());
	 $("#password").val($(this).closest("tr").find('td:eq(6)').text());
	 
	 
	
});

$(document).on("click", ".btnRemove", function(event)
{
		 $.ajax(
		 {
				 url : "UserAPI",
				 type : "DELETE",
				 data : "userID=" + $(this).data("userid"),
				 dataType : "text",
				 complete : function(response, status)
				 {
					 onUserDeleteComplete(response.responseText, status);
				 }
		 });
});
function onUserDeleteComplete(response, status)
{
if (status == "success"){
		var resultSet = JSON.parse(response);
		if (resultSet.status.trim() == "success"){
			
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#divDoGrid").html(resultSet.data);
		} else if (resultSet.status.trim() == "error") {
				
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
		} else if (status == "error") {
			
			$("#alertError").text("Error while deleting.");
			$("#alertError").show();
		} else{
			$("#alertError").text("Unknown error while deleting..");
			$("#alertError").show();
 }
}



function validateUserForm()
{
	
	if ($("#fName").val().trim() == "")
 {
		return "Insert First Name.";
 }

if ($("#lName").val().trim() == "")
 {
	return "Insert Last Name.";
 } 

if ($("#email").val().trim() == "")
 {
	return "Insert Email.";
 }
if ($("#nic").val().trim() == "")
{
	return "Insert NIC Number.";
}

var phone = $("#phone").val().trim();
if (!$.isNumeric(phone))
 {
	return "Enter numerical value for Phone number.";
 }
if ($("#password").val().trim() == "")
{
	return "Enter a Password.";
}
var pwdSize = /^(?=.*[a-z])(?=.*[A-Z]).{4,8}$/;
var tmpPwd =  $("#password").val().trim();
if(!tmpPwd.match(pwdSize)){
	return "Insert a Password with 4 to 8 characters which contains Numerical value";
}



return true;
}