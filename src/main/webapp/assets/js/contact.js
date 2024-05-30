$(document).ready(function() {
    (function($) {
        "use strict";

        // Custom method for validating the answer
        jQuery.validator.addMethod('answercheck', function(value, element) {
            return this.optional(element) || /^\bcat\b$/.test(value);
        }, "Please type the correct answer.");

        // Validate contactForm form
        $(function() {
            $('#contactForm').validate({
                rules: {
                    name: {
                        required: true,
                        minlength: 2
                    },
                    subject: {
                        required: true,
                        minlength: 4
                    },
                    number: {
                        required: true,
                        minlength: 5
                    },
                    email: {
                        required: true,
                        email: true
                    },
                    message: {
                        required: true,
                        minlength: 20
                    }
                },
                messages: {
                    name: {
                        required: "Please enter your name.",
                        minlength: "Your name must be at least 2 characters long."
                    },
                    subject: {
                        required: "Please enter a subject.",
                        minlength: "The subject must be at least 4 characters long."
                    },
                    number: {
                        required: "Please enter your number.",
                        minlength: "Your number must be at least 5 characters long."
                    },
                    email: {
                        required: "Please enter your email address.",
                        email: "Please enter a valid email address."
                    },
                    message: {
                        required: "Please write your message.",
                        minlength: "Your message must be at least 20 characters long."
                    }
                },
                errorClass: "error",
                errorPlacement: function(error, element) {
                    if (element.attr("name") === "name" || element.attr("name") === "subject" || element.attr("name") === "number" || element.attr("name") === "email") {
                        error.addClass("required");
                    } else if (element.attr("name") === "message") {
                        error.addClass("minlength");
                    }
                    error.insertAfter(element);
                }
            });
        });
    })(jQuery);
});
