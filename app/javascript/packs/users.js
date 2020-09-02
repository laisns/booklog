require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")

import 'bootstrap'
import 'bootstrap/dist/js/bootstrap'

document.addEventListener("turbolinks:load", () => {
    $('[data-toggle="tooltip"]').tooltip()
});

import '../src/users.scss'
import '@fortawesome/fontawesome-free/js/all'

// require("admin-lte")

//
// import 'bootstrap/dist/css/bootstrap.css'
// import 'bootstrap/dist/js/bootstrap'
// import 'jquery.min'
// import 'admin-lte/dist/js/adminlte.min'

