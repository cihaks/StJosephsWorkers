
function validate_resource_type(value) {
	var result = true;
	if (document.getElementById('restrict_'+value)) {
		result = confirm("This is a restricted resource type.\n\nAre you sure you want to continue?");
	}
	return result;
}

function check_resource_form() {
	var item = document.getElementById("assigned_resource_resource_type_id");
	if (item.value != null) {
	  return validate_resource_type(item.value);
	} else {
		return true;
	}
}
	
