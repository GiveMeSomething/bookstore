// Example starter JavaScript for disabling form submissions if there are invalid fields
(function () {
    'use strict'

    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.querySelectorAll('.needs-validation')
    var messageDisplayers = document.querySelectorAll('.invalid-feedback')

    // Loop over them and prevent submission
    Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()

                        var ele = form.getElementsByTagName('input')
                        for (var i = 0; i < ele.length; i++) {
                            var reason = ele[i].validity;
                            if (reason.valueMissing) {
                                messageDisplayers[i].innerHTML = ele[i].getAttribute("data-value-missing");
                            } else if (reason.patternMismatch) {
                                messageDisplayers[i].innerHTML = ele[i].getAttribute("data-pattern-mismatch");
                            } else if (reason.tooLong) {
                                messageDisplayers[i].innerHTML = ele[i].getAttribute("data-too-long");
                            } else if (reason.tooShort) {
                                messageDisplayers[i].innerHTML = ele[i].getAttribute("data-too-short");
                            } else {

                            }
                        }
                    }
                    form.classList.add('was-validated')
                }, false)
            })
})()


