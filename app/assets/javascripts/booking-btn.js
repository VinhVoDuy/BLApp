var url_was;
var hr = {
    key: 'e74674ec9497ff0dad1e',
    widget_type: 'booknow',
    search_path: 'search',
    host: 'blue-river-hotel-3.hotelrunner.com',
    asset_host: location.protocol + '//app.hotelrunner.com',
    background_color: '#080808',
    text_color: '#ffffff',
    text: 'Book Now',
    align: 'Top',
    valign: 'Right',
    locale: 'en-US',
    current_url: 'blue-river-hotel-3.hotelrunner.com',
    widget_version: 2
};


var isMobile = {
    Android: function () {
        return navigator.userAgent.match(/Android/i);
    },
    BlackBerry: function () {
        return navigator.userAgent.match(/BlackBerry/i);
    },
    iOS: function () {
        return navigator.userAgent.match(/iPhone|iPad|iPod/i);
    },
    Opera: function () {
        return navigator.userAgent.match(/Opera Mini/i);
    },
    Windows: function () {
        return navigator.userAgent.match(/IEMobile/i);
    },
    any: function () {
        return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
    }
};


window.HotelRunnerLib = {
    compare_versions: function (a, b) {
        // Return 1 if a > b
        // Return -1 if a < b
        // Return 0 if a == b
        if (a === b) {
            return 0;
        }

        var a_components = a.split(".");
        var b_components = b.split(".");

        var len = Math.min(a_components.length, b_components.length);

        // loop while the components are equal
        for (var i = 0; i < len; i++) {
            // A bigger than B
            if (parseInt(a_components[i]) > parseInt(b_components[i])) {
                return 1;
            }

            // B bigger than A
            if (parseInt(a_components[i]) < parseInt(b_components[i])) {
                return -1;
            }
        }

        // If one's a prefix of the other, the longer one is greater.
        if (a_components.length > b_components.length) {
            return 1;
        }

        if (a_components.length < b_components.length) {
            return -1;
        }

        // Otherwise they are the same.
        return 0;
    },
    loadScript: function (url, callback) {

        var script = document.createElement("script")
        script.type = "text/javascript";

        if (script.readyState) { //IE
            script.onreadystatechange = function () {
                if (script.readyState == "loaded" || script.readyState == "complete") {
                    script.onreadystatechange = null;
                    callback();
                }
            };
        } else { //Others
            script.onload = function () {
                callback();
            };
        }

        script.src = url;
        document.getElementsByTagName("head")[0].appendChild(script);
    }
};


initialize_hr_widget = function () {
    if (window.hr_widget_initialized) {
        return true;
    }
    if (typeof(jQuery) == "undefined" || ((HotelRunnerLib.compare_versions('1.7.2', jQuery.fn.jquery) == '1') && (typeof(hjq) == 'undefined'))) {
        no_jquery = (typeof(jQuery) == "undefined")
        if (!no_jquery) {
            old_jquery = jQuery;
        }
        HotelRunnerLib.loadScript(hr['asset_host'] + "/assets/jquery.js", function () {
            hjq = jQuery.noConflict();
            if (!no_jquery) {
                jQuery = old_jquery;
            }
            initialize_hr_widget();
        });
    } else {
        window.hr_widget_initialized = true;
        if (typeof(hjq) == 'undefined') {
            if (typeof(jQuery.noConflict) == "function") {
                hjq = jQuery.noConflict();
            } else {
                hjq = $;
            }
        }

        (function ($) {
            open_with_popup = function (url) {
                var link = form = document.createElement("a");
                link.style.display = "none";
                link.href = url + "&popup=1";
                link.target = '_blank';
                link.click();
            };

            $(document).ready(function () {


                var hr_prepared = false;
                var hr_frame_overlay = document.createElement("div");
                var hr_frame_container = document.createElement("div");

                var hr_meta = document.createElement('meta');
                hr_meta.id = 'hr_meta_tag'
                hr_meta.setAttribute('name', 'viewport');
                hr_meta.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, height=device-height');

                if (typeof(window.HotelRunnerWidget == "undefined")) {
                    window.HotelRunnerWidget = {
                        prepare: function (custom_url) {
                            if (hr_prepared && custom_url == url_was) return;
                            url_was = custom_url;
                            $("#hr_frame, #hr_frame_overlay, #hr_frame_container").remove();
                            hr_prepared = true;
                            hr_frame_overlay.id = 'hr_frame_overlay';
                            hr_frame_overlay.className = 'hr_' + hr.search_path + '_overlay';
                            document.body.appendChild(hr_frame_overlay);
                            hr_frame_container.id = 'hr_frame_container';
                            hr_frame_container.className = 'hr_' + hr.search_path + '_container';
                            hr_frame_container.innerHTML = '<iframe id="hr_frame" frameborder="0" style="width: 100%; height: 100%; height: 100vh;"  allowtransparency="true" src="' + (custom_url || search_url) + '"></iframe>';
                            document.body.appendChild(hr_frame_container);

                        },

                        show: function (custom_url) {
                            if (isMobile.iOS()) {
                                open_with_popup(search_base_url);
                            } else {
                                if (!hr_prepared || (custom_url != url_was)) {
                                    HotelRunnerWidget.prepare(custom_url);
                                }
                                toggle_hr_viewport(true);
                                HotelRunnerWidget.set_dimensions();
                                hr_frame_overlay.style.display = "block";
                                hr_frame_container.style.display = "block"

                                if (isMobile.Android()) {
                                    $('#hr_frame').addClass('browser');
                                }

                            }
                        },
                        set_dimensions: function () {
                            var A = (typeof(window.innerWidth) !== "undefined" ? window.innerWidth : document.documentElement.clientWidth) || document.body.clientWidth,
                                    B = Math.max(document.body.scrollTop, document.documentElement.scrollTop),
                                    height = Math.max(document.body.scrollHeight, document.body.offsetHeight,
                                            document.documentElement.clientHeight, document.documentElement.scrollHeight, document.documentElement.offsetHeight),
                                    y = (A - 507) / 2,
                                    z = document.getElementById("hr_frame_container"),
                                    frame = document.getElementById("hr_frame");

//                B = 50;
//                z.style.top = (B + 10) + "px";
//                z.style.left = Math.max(0, y) + "px"
                            hr_frame_overlay.style.height = '100vh';
                            frame.style.width = "100%";
                            frame.style.height = '100vh';
                        }
                    }
                }


                if (typeof(window.booknow_button_id) == "undefined") {

                    var id = "booknow-hr-" + hr.align + hr.valign;

                    var hr_class = "booknowwidget booknowwidget-" + hr.align + " booknowwidget-" + hr.align + hr.valign;

                    var search_url = 'https://' + hr.host + "/widgets/" + hr.key + "/iframe/true?w=true&opener=" + document.location.host;
                    var search_base_url = 'https://' + hr.host + "/bv2/search?opener=" + document.location.host;

                    wrapper = $("<div onclick='HotelRunnerWidget.show(null);' id=\"" + id + "\"></div>");

                    if (hr.widget_type == 'booknow') {
                        if (hr.widget_version == 2) {
                            inner = $("<div id='cm_preview_button_free_text' style=\"background-color:" + hr.background_color + ";color:" + hr.text_color + "\" class=\"" + hr_class + "\">" +
                                    "<p>" + hr.text + "</p>");
                        } else {
                            var hr_image;

                            if (hr.align == "Left" || hr.align == "Right") {
                                hr_image = hr.text + "-side-" + hr.locale + ".png";
                            } else {
                                hr_image = hr.text + "-topbottom-" + hr.locale + ".png";
                            }
                            inner = $("<div id='cm_preview_button' style=\"background-color:" + hr.background_color + "\" class=\"" + hr_class + "\">" +
                                    "<img src=\"" + hr.asset_host + "/assets/button/" + hr_image + "\" alt=\"" + hr.text + "\" />");
                        }

                        wrapper.append(inner);
                        if (hr.align == 'Free') {
                            $('#hr_widget_script').after(wrapper);
                        } else {
                            $(document.body).append(wrapper);
                        }
                    }
                } else {
                    var id = window.booknow_button_id;
                    var search_url = window.booknow_button_url;
                    var search_base_url = window.booknow_button_base_url;
                    wrapper = $("#" + id);
                }

                $('#' + id).hover(function () {
                    HotelRunnerWidget.prepare(null);
                });


                handle_click = function (e) {
                    e.preventDefault();
                    HotelRunnerWidget.show(null);
                }

                if (document.getElementById(id) != null)
                    document.getElementById(id).addEventListener("click", handle_click, false);

                var elements = document.getElementsByClassName('initialize_hr_widget');
                for (var i = 0, j = elements.length; i < j; i++) {
                    elements[i].addEventListener("click", handle_click, false);
                }


                $(window).resize(function () {
                });



                toggle_hr_viewport = function (enable) {
                    if (enable) {
                        document.head.appendChild(hr_meta);
                        document.body.scrollTop = 0;
                    } else {
                        document.head.removeChild(hr_meta);
                        old_meta = $('meta[name=viewport]').clone();
                        $('meta[name=viewport]').remove();
                        $('head').append(old_meta);
                    }
                };

                closeFrame = function (event) {
                    if (event.data == "hr_close_frame") {
                        hr_frame_overlay.style.display = "none";
                        hr_frame_container.style.display = "none"
                        toggle_hr_viewport(false);
                    }
                };

                // For IE-8 compatibility -> attachevent
                var addEvent = window.attachEvent || window.addEventListener;
                var event = window.attachEvent ? 'onmessage' : 'message';
                addEvent(event, closeFrame, false);

                setTimeout(function () {
                    HotelRunnerWidget.prepare(null);
                }, 1000);

            });

        })(hjq);
    }
}

window.addEventListener("load", initialize_hr_widget());

if (window.loaded && !window.hr_widget_initialized) {
    initialize_hr_widget();
}
