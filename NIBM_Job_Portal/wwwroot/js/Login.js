$("#btnShowPassword").click(function () {
    var allInputs = $("#txtPWD");

    if (allInputs.attr('type') == "password") {
        $('#txtPWD').prop("type", "text");
        $("#btnShowPassword").toggleClass("fa-eye fa-eye-slash")


    }
    else
    {
        $('#txtPWD').prop("type", "password");
       $("#btnShowPassword").toggleClass("fa-eye-slash fa-eye")
    }
     
})