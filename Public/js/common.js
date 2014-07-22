/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function loadSpecialty(obj, cid, callback, flag) {
    if (!cid) {
        if (flag) {
            $(obj).html('<option value="">全部</option>');
        } else {
            $(obj).empty();
        }

        if (typeof (callback) === "function") {
            callback();
        }

        return;
    }

    var params = {
        id: cid,
        _: Math.random()
    };
    $.getJSON(
            "?s=Home/Specialty/getByCollegeId",
            params,
            function(data) {
                if (flag) {
                    $(obj).html('<option value="">全部</option>');
                } else {
                    $(obj).empty();
                }
                if (data.success) {
                    for (var i = 0; i < data.list.length; i++) {
                        var spec = data.list[i];
                        $(obj).append('<option value="' + spec.id + '">' + spec.Specialty_name + '</option>');
                    }
                    if (typeof (callback) === "function") {
                        callback();
                    }
                }
                else if (!flag) {
                    $(obj).html('<option value="">暂无</option>');
                }
            }
    );
}

function loadGrade(obj, sid, callback, flag) {
    if (!sid) {
        if (flag) {
            $(obj).html('<option value="">全部</option>');
        } else {
            $(obj).empty();
        }

        if (typeof (callback) === "function") {
            callback();
        }

        return;
    }

    var params = {
        id: sid,
        _: Math.random()
    };
    $.getJSON(
            "?s=Home/Grade/getBySpecialtyId",
            params,
            function(data) {
                if (flag) {
                    $(obj).html('<option value="">全部</option>');
                } else {
                    $(obj).empty();
                }

                if (data.success) {
                    for (var i = 0; i < data.list.length; i++) {
                        var grd = data.list[i];
                        $(obj).append('<option value="' + grd.id + '">' + grd.Grade_name + '</option>');
                    }
                    if (typeof (callback) === "function") {
                        callback();
                    }
                }
                else if (!flag) {
                    $(obj).html('<option value="">暂无</option>');
                }
            }
    );
}

function validator(form) {
    var $form = $(form);
    $form.find("input.required").each(function() {
        var $input = $(this);
        $input.unbind("onblur").blur(function() {
            if ($(this).val() === undefined || $(this).val() === "") {
                $(this).addClass("error");
            } else {
                $(this).removeClass("error");
            }
        });
        $form.submit(function(e) {
            var errors = 0;
            var $form = $(this);
            $form.find("input.required").each(function() {
                $(this).blur();
                if ($(this).val() === undefined || $(this).val() === "") {
                    errors++;
                }
            });
            if (errors) {
                var message = DWZ.msg("validateFormError", [errors]);
                alertMsg.error(message);
            }
        });
    });
}
