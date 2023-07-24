$(function () {
    function display(bool) {
        if (bool) {
            $("#container").show();
        } else {
            $("#container").hide();
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        var MIBmessage = item.message
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
                document.getElementById("body1").value = MIBmessage                     
            } else {
                display(false)
            }
        }
    })
    // if the person uses the escape key, it will exit the resource
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://gl-newfishing/exit', JSON.stringify({}));
            return
        }
    };
    $("#close").click(function () {
        $.post('https://gl-newfishing/exit', JSON.stringify({}));
        return
    })
})
