$("#btnShowResetPassword").click(function () {
    var allInputs = $("#txtResetPWD");

    if (allInputs.attr('type') == "password") {
        $('#txtResetPWD').prop("type", "text");
        $("#btnShowResetPassword").toggleClass("fa-eye fa-eye-slash")


    }
    else {
        $('#txtResetPWD').prop("type", "password");
        $("#btnShowResetPassword").toggleClass("fa-eye-slash fa-eye")
    }

});


$("#btnShowConfirmPassword").click(function () {
    var allInputs = $("#txtResetConfirmPWD");

    if (allInputs.attr('type') == "password") {
        $('#txtResetConfirmPWD').prop("type", "text");
        $("#btnShowConfirmPassword").toggleClass("fa-eye fa-eye-slash")


    }
    else {
        $('#txtResetConfirmPWD').prop("type", "password");
        $("#btnShowConfirmPassword").toggleClass("fa-eye-slash fa-eye")
    }

});